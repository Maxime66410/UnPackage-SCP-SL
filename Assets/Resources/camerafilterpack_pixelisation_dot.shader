Shader "CameraFilterPack/Pixelisation_Dot" {
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
			GpuProgramID 57907
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec2 u_xlat6;
					float u_xlat16_6;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat6.xy = floor(u_xlat6.xy);
					    u_xlat1.xy = u_xlat6.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = (-u_xlat6.xy) * vec2(vec2(_Value, _Value)) + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = log2(abs(u_xlat0.xy));
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-0.0, -1.0, -0.0);
					    u_xlat1.xyz = u_xlat10_1.xyz + (-vec3(vec3(_Value2, _Value2, _Value2)));
					    u_xlat16_6 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * 0.666666687;
					    u_xlat16_6 = min(u_xlat16_6, 1.0);
					    u_xlat16_9 = u_xlat16_6 * -2.0 + 3.0;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_9;
					    u_xlat1.xyz = vec3(u_xlat16_6) * u_xlat1.xyz + vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat6.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat6.xy = u_xlat6.xx * vec2(16.0, -16.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat6.xx;
					    u_xlat6.x = exp2(u_xlat6.y);
					    u_xlat0.xy = exp2(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlatb0 = u_xlat0.x<u_xlat6.x;
					    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(vec4(_Value2, _Value2, _Value2, _Value2));
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
					; Bound: 244
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %216 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 11 
					                                             OpMemberDecorate %14 0 Offset 14 
					                                             OpMemberDecorate %14 1 Offset 14 
					                                             OpMemberDecorate %14 2 RelaxedPrecision 
					                                             OpMemberDecorate %14 2 Offset 14 
					                                             OpDecorate %14 Block 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %21 RelaxedPrecision 
					                                             OpDecorate %22 RelaxedPrecision 
					                                             OpDecorate %25 RelaxedPrecision 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %91 DescriptorSet 91 
					                                             OpDecorate %91 Binding 91 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %95 DescriptorSet 95 
					                                             OpDecorate %95 Binding 95 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %121 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %129 RelaxedPrecision 
					                                             OpDecorate %130 RelaxedPrecision 
					                                             OpDecorate %131 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %135 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %141 RelaxedPrecision 
					                                             OpDecorate %142 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %216 Location 216 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %6 %6 %13 
					                                     %15 = OpTypePointer Uniform %14 
					  Uniform struct {f32; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %13 
					                      Private f32_2* %28 = OpVariable Private 
					                                 i32 %30 = OpConstant 0 
					                                     %31 = OpTypePointer Uniform %6 
					                                     %43 = OpTypeVector %6 3 
					                                     %44 = OpTypePointer Private %43 
					                      Private f32_3* %45 = OpVariable Private 
					                                 f32 %82 = OpConstant 3,674022E-40 
					                               f32_2 %83 = OpConstantComposite %82 %82 
					                      Private f32_3* %88 = OpVariable Private 
					                                     %89 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %90 = OpTypePointer UniformConstant %89 
					UniformConstant read_only Texture2D* %91 = OpVariable UniformConstant 
					                                     %93 = OpTypeSampler 
					                                     %94 = OpTypePointer UniformConstant %93 
					            UniformConstant sampler* %95 = OpVariable UniformConstant 
					                                     %97 = OpTypeSampledImage %89 
					                     Private f32_3* %103 = OpVariable Private 
					                                f32 %105 = OpConstant 3,674022E-40 
					                                f32 %106 = OpConstant 3,674022E-40 
					                              f32_3 %107 = OpConstantComposite %105 %106 %105 
					                                i32 %110 = OpConstant 1 
					                                    %124 = OpTypePointer Private %6 
					                       Private f32* %125 = OpVariable Private 
					                                f32 %136 = OpConstant 3,674022E-40 
					                                f32 %139 = OpConstant 3,674022E-40 
					                       Private f32* %141 = OpVariable Private 
					                                f32 %143 = OpConstant 3,674022E-40 
					                                f32 %145 = OpConstant 3,674022E-40 
					                                f32 %169 = OpConstant 3,674022E-40 
					                                f32 %170 = OpConstant 3,674022E-40 
					                                f32 %171 = OpConstant 3,674022E-40 
					                              f32_3 %172 = OpConstantComposite %169 %170 %171 
					                                    %175 = OpTypeInt 32 0 
					                                u32 %176 = OpConstant 0 
					                                f32 %186 = OpConstant 3,674022E-40 
					                                f32 %187 = OpConstant 3,674022E-40 
					                              f32_2 %188 = OpConstantComposite %186 %187 
					                                u32 %194 = OpConstant 1 
					                                    %207 = OpTypeBool 
					                                    %208 = OpTypePointer Private %207 
					                      Private bool* %209 = OpVariable Private 
					                                    %215 = OpTypePointer Output %13 
					                      Output f32_4* %216 = OpVariable Output 
					                                    %218 = OpTypePointer Function %43 
					                                u32 %240 = OpConstant 3 
					                                    %241 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_3* %219 = OpVariable Function 
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
					                        Uniform f32* %32 = OpAccessChain %16 %30 
					                                 f32 %33 = OpLoad %32 
					                        Uniform f32* %34 = OpAccessChain %16 %30 
					                                 f32 %35 = OpLoad %34 
					                               f32_2 %36 = OpCompositeConstruct %33 %35 
					                                 f32 %37 = OpCompositeExtract %36 0 
					                                 f32 %38 = OpCompositeExtract %36 1 
					                               f32_2 %39 = OpCompositeConstruct %37 %38 
					                               f32_2 %40 = OpFDiv %29 %39 
					                                             OpStore %28 %40 
					                               f32_2 %41 = OpLoad %28 
					                               f32_2 %42 = OpExtInst %1 8 %41 
					                                             OpStore %28 %42 
					                               f32_2 %46 = OpLoad %28 
					                        Uniform f32* %47 = OpAccessChain %16 %30 
					                                 f32 %48 = OpLoad %47 
					                        Uniform f32* %49 = OpAccessChain %16 %30 
					                                 f32 %50 = OpLoad %49 
					                               f32_2 %51 = OpCompositeConstruct %48 %50 
					                                 f32 %52 = OpCompositeExtract %51 0 
					                                 f32 %53 = OpCompositeExtract %51 1 
					                               f32_2 %54 = OpCompositeConstruct %52 %53 
					                               f32_2 %55 = OpFMul %46 %54 
					                               f32_3 %56 = OpLoad %45 
					                               f32_3 %57 = OpVectorShuffle %56 %55 3 4 2 
					                                             OpStore %45 %57 
					                               f32_2 %58 = OpLoad %28 
					                               f32_2 %59 = OpFNegate %58 
					                        Uniform f32* %60 = OpAccessChain %16 %30 
					                                 f32 %61 = OpLoad %60 
					                        Uniform f32* %62 = OpAccessChain %16 %30 
					                                 f32 %63 = OpLoad %62 
					                               f32_2 %64 = OpCompositeConstruct %61 %63 
					                                 f32 %65 = OpCompositeExtract %64 0 
					                                 f32 %66 = OpCompositeExtract %64 1 
					                               f32_2 %67 = OpCompositeConstruct %65 %66 
					                               f32_2 %68 = OpFMul %59 %67 
					                               f32_2 %69 = OpLoad %9 
					                               f32_2 %70 = OpFAdd %68 %69 
					                                             OpStore %9 %70 
					                               f32_2 %71 = OpLoad %9 
					                        Uniform f32* %72 = OpAccessChain %16 %30 
					                                 f32 %73 = OpLoad %72 
					                        Uniform f32* %74 = OpAccessChain %16 %30 
					                                 f32 %75 = OpLoad %74 
					                               f32_2 %76 = OpCompositeConstruct %73 %75 
					                                 f32 %77 = OpCompositeExtract %76 0 
					                                 f32 %78 = OpCompositeExtract %76 1 
					                               f32_2 %79 = OpCompositeConstruct %77 %78 
					                               f32_2 %80 = OpFDiv %71 %79 
					                                             OpStore %9 %80 
					                               f32_2 %81 = OpLoad %9 
					                               f32_2 %84 = OpFAdd %81 %83 
					                                             OpStore %9 %84 
					                               f32_2 %85 = OpLoad %9 
					                               f32_2 %86 = OpExtInst %1 4 %85 
					                               f32_2 %87 = OpExtInst %1 30 %86 
					                                             OpStore %9 %87 
					                 read_only Texture2D %92 = OpLoad %91 
					                             sampler %96 = OpLoad %95 
					          read_only Texture2DSampled %98 = OpSampledImage %92 %96 
					                               f32_3 %99 = OpLoad %45 
					                              f32_2 %100 = OpVectorShuffle %99 %99 0 1 
					                              f32_4 %101 = OpImageSampleImplicitLod %98 %100 
					                              f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
					                                             OpStore %88 %102 
					                              f32_3 %104 = OpLoad %88 
					                              f32_3 %108 = OpFAdd %104 %107 
					                                             OpStore %103 %108 
					                              f32_3 %109 = OpLoad %88 
					                       Uniform f32* %111 = OpAccessChain %16 %110 
					                                f32 %112 = OpLoad %111 
					                       Uniform f32* %113 = OpAccessChain %16 %110 
					                                f32 %114 = OpLoad %113 
					                       Uniform f32* %115 = OpAccessChain %16 %110 
					                                f32 %116 = OpLoad %115 
					                              f32_3 %117 = OpCompositeConstruct %112 %114 %116 
					                                f32 %118 = OpCompositeExtract %117 0 
					                                f32 %119 = OpCompositeExtract %117 1 
					                                f32 %120 = OpCompositeExtract %117 2 
					                              f32_3 %121 = OpCompositeConstruct %118 %119 %120 
					                              f32_3 %122 = OpFNegate %121 
					                              f32_3 %123 = OpFAdd %109 %122 
					                                             OpStore %45 %123 
					                              f32_3 %126 = OpLoad %103 
					                              f32_3 %127 = OpLoad %103 
					                                f32 %128 = OpDot %126 %127 
					                                             OpStore %125 %128 
					                                f32 %129 = OpLoad %125 
					                                f32 %130 = OpLoad %125 
					                                f32 %131 = OpFMul %129 %130 
					                                             OpStore %125 %131 
					                                f32 %132 = OpLoad %125 
					                                f32 %133 = OpLoad %125 
					                                f32 %134 = OpFMul %132 %133 
					                                             OpStore %125 %134 
					                                f32 %135 = OpLoad %125 
					                                f32 %137 = OpFMul %135 %136 
					                                             OpStore %125 %137 
					                                f32 %138 = OpLoad %125 
					                                f32 %140 = OpExtInst %1 37 %138 %139 
					                                             OpStore %125 %140 
					                                f32 %142 = OpLoad %125 
					                                f32 %144 = OpFMul %142 %143 
					                                f32 %146 = OpFAdd %144 %145 
					                                             OpStore %141 %146 
					                                f32 %147 = OpLoad %125 
					                                f32 %148 = OpLoad %125 
					                                f32 %149 = OpFMul %147 %148 
					                                             OpStore %125 %149 
					                                f32 %150 = OpLoad %125 
					                                f32 %151 = OpLoad %141 
					                                f32 %152 = OpFMul %150 %151 
					                                             OpStore %125 %152 
					                                f32 %153 = OpLoad %125 
					                              f32_3 %154 = OpCompositeConstruct %153 %153 %153 
					                              f32_3 %155 = OpLoad %45 
					                              f32_3 %156 = OpFMul %154 %155 
					                       Uniform f32* %157 = OpAccessChain %16 %110 
					                                f32 %158 = OpLoad %157 
					                       Uniform f32* %159 = OpAccessChain %16 %110 
					                                f32 %160 = OpLoad %159 
					                       Uniform f32* %161 = OpAccessChain %16 %110 
					                                f32 %162 = OpLoad %161 
					                              f32_3 %163 = OpCompositeConstruct %158 %160 %162 
					                                f32 %164 = OpCompositeExtract %163 0 
					                                f32 %165 = OpCompositeExtract %163 1 
					                                f32 %166 = OpCompositeExtract %163 2 
					                              f32_3 %167 = OpCompositeConstruct %164 %165 %166 
					                              f32_3 %168 = OpFAdd %156 %167 
					                                             OpStore %45 %168 
					                              f32_3 %173 = OpLoad %45 
					                                f32 %174 = OpDot %172 %173 
					                       Private f32* %177 = OpAccessChain %28 %176 
					                                             OpStore %177 %174 
					                       Private f32* %178 = OpAccessChain %28 %176 
					                                f32 %179 = OpLoad %178 
					                       Private f32* %180 = OpAccessChain %28 %176 
					                                f32 %181 = OpLoad %180 
					                                f32 %182 = OpFMul %179 %181 
					                       Private f32* %183 = OpAccessChain %28 %176 
					                                             OpStore %183 %182 
					                              f32_2 %184 = OpLoad %28 
					                              f32_2 %185 = OpVectorShuffle %184 %184 0 0 
					                              f32_2 %189 = OpFMul %185 %188 
					                                             OpStore %28 %189 
					                              f32_2 %190 = OpLoad %9 
					                              f32_2 %191 = OpLoad %28 
					                              f32_2 %192 = OpVectorShuffle %191 %191 0 0 
					                              f32_2 %193 = OpFMul %190 %192 
					                                             OpStore %9 %193 
					                       Private f32* %195 = OpAccessChain %28 %194 
					                                f32 %196 = OpLoad %195 
					                                f32 %197 = OpExtInst %1 29 %196 
					                       Private f32* %198 = OpAccessChain %28 %176 
					                                             OpStore %198 %197 
					                              f32_2 %199 = OpLoad %9 
					                              f32_2 %200 = OpExtInst %1 29 %199 
					                                             OpStore %9 %200 
					                       Private f32* %201 = OpAccessChain %9 %194 
					                                f32 %202 = OpLoad %201 
					                       Private f32* %203 = OpAccessChain %9 %176 
					                                f32 %204 = OpLoad %203 
					                                f32 %205 = OpFAdd %202 %204 
					                       Private f32* %206 = OpAccessChain %9 %176 
					                                             OpStore %206 %205 
					                       Private f32* %210 = OpAccessChain %9 %176 
					                                f32 %211 = OpLoad %210 
					                       Private f32* %212 = OpAccessChain %28 %176 
					                                f32 %213 = OpLoad %212 
					                               bool %214 = OpFOrdLessThan %211 %213 
					                                             OpStore %209 %214 
					                               bool %217 = OpLoad %209 
					                                             OpSelectionMerge %221 None 
					                                             OpBranchConditional %217 %220 %223 
					                                    %220 = OpLabel 
					                              f32_3 %222 = OpLoad %45 
					                                             OpStore %219 %222 
					                                             OpBranch %221 
					                                    %223 = OpLabel 
					                       Uniform f32* %224 = OpAccessChain %16 %110 
					                                f32 %225 = OpLoad %224 
					                       Uniform f32* %226 = OpAccessChain %16 %110 
					                                f32 %227 = OpLoad %226 
					                       Uniform f32* %228 = OpAccessChain %16 %110 
					                                f32 %229 = OpLoad %228 
					                       Uniform f32* %230 = OpAccessChain %16 %110 
					                                f32 %231 = OpLoad %230 
					                              f32_4 %232 = OpCompositeConstruct %225 %227 %229 %231 
					                                f32 %233 = OpCompositeExtract %232 0 
					                                f32 %234 = OpCompositeExtract %232 1 
					                                f32 %235 = OpCompositeExtract %232 2 
					                              f32_3 %236 = OpCompositeConstruct %233 %234 %235 
					                                             OpStore %219 %236 
					                                             OpBranch %221 
					                                    %221 = OpLabel 
					                              f32_3 %237 = OpLoad %219 
					                              f32_4 %238 = OpLoad %216 
					                              f32_4 %239 = OpVectorShuffle %238 %237 4 5 6 3 
					                                             OpStore %216 %239 
					                        Output f32* %242 = OpAccessChain %216 %240 
					                                             OpStore %242 %139 
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
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat16_2;
					vec2 u_xlat6;
					float u_xlat16_6;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat6.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat6.xy = floor(u_xlat6.xy);
					    u_xlat1.xy = u_xlat6.xy * vec2(vec2(_Value, _Value));
					    u_xlat0.xy = (-u_xlat6.xy) * vec2(vec2(_Value, _Value)) + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / vec2(vec2(_Value, _Value));
					    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = log2(abs(u_xlat0.xy));
					    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-0.0, -1.0, -0.0);
					    u_xlat1.xyz = u_xlat10_1.xyz + (-vec3(vec3(_Value2, _Value2, _Value2)));
					    u_xlat16_6 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * 0.666666687;
					    u_xlat16_6 = min(u_xlat16_6, 1.0);
					    u_xlat16_9 = u_xlat16_6 * -2.0 + 3.0;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
					    u_xlat16_6 = u_xlat16_6 * u_xlat16_9;
					    u_xlat1.xyz = vec3(u_xlat16_6) * u_xlat1.xyz + vec3(vec3(_Value2, _Value2, _Value2));
					    u_xlat6.x = dot(vec3(0.212599993, 0.715200007, 0.0722000003), u_xlat1.xyz);
					    u_xlat6.x = u_xlat6.x * u_xlat6.x;
					    u_xlat6.xy = u_xlat6.xx * vec2(16.0, -16.0);
					    u_xlat0.xy = u_xlat0.xy * u_xlat6.xx;
					    u_xlat6.x = exp2(u_xlat6.y);
					    u_xlat0.xy = exp2(u_xlat0.xy);
					    u_xlat0.x = u_xlat0.y + u_xlat0.x;
					    u_xlatb0 = u_xlat0.x<u_xlat6.x;
					    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(vec4(_Value2, _Value2, _Value2, _Value2));
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