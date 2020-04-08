Shader "CameraFilterPack/Edge_Neon" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_EdgeWeight ("_EdgeWeight", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 12228
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
					uniform 	float _EdgeWeight;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat16_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec2 u_xlat17;
					void main()
					{
					    u_xlat0.x = _EdgeWeight * 100.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat17.xy = (-u_xlat0.xx) + u_xlat1.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat17.xy);
					    u_xlat0.yz = (-u_xlat0.xx);
					    u_xlat3 = u_xlat0.yxxx + u_xlat1.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_5 = (-u_xlat10_2) + u_xlat10_4;
					    u_xlat0.w = 0.0;
					    u_xlat6 = u_xlat0.zwwx + u_xlat1.xyxy;
					    u_xlat7 = u_xlat0.xwxz + u_xlat1.xyxy;
					    u_xlat0.xy = u_xlat0.wx * vec2(1.0, -1.0) + u_xlat1.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat6.zw);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_4 = u_xlat10_6 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat10_4;
					    u_xlat16_2 = u_xlat10_2 + u_xlat16_4;
					    u_xlat16_2 = (-u_xlat10_3) + u_xlat16_2;
					    u_xlat16_1 = u_xlat10_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_5;
					    u_xlat16_0 = (-u_xlat10_0) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, u_xlat7.zw);
					    u_xlat10_3 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_2 = (-u_xlat10_3) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_1) + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_1);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
					    u_xlat16_0 = u_xlat16_2 * u_xlat16_2 + u_xlat16_0;
					    SV_Target0 = sqrt(u_xlat16_0);
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
					; Bound: 206
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %33 %202 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %10 0 Offset 10 
					                                             OpMemberDecorate %10 1 RelaxedPrecision 
					                                             OpMemberDecorate %10 1 Offset 10 
					                                             OpDecorate %10 Block 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate vs_TEXCOORD0 Location 33 
					                                             OpDecorate %38 RelaxedPrecision 
					                                             OpDecorate %39 RelaxedPrecision 
					                                             OpDecorate %42 RelaxedPrecision 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %54 RelaxedPrecision 
					                                             OpDecorate %54 DescriptorSet 54 
					                                             OpDecorate %54 Binding 54 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %58 DescriptorSet 58 
					                                             OpDecorate %58 Binding 58 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %76 RelaxedPrecision 
					                                             OpDecorate %77 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %84 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %132 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %140 RelaxedPrecision 
					                                             OpDecorate %143 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %161 RelaxedPrecision 
					                                             OpDecorate %162 RelaxedPrecision 
					                                             OpDecorate %163 RelaxedPrecision 
					                                             OpDecorate %164 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %167 RelaxedPrecision 
					                                             OpDecorate %168 RelaxedPrecision 
					                                             OpDecorate %169 RelaxedPrecision 
					                                             OpDecorate %174 RelaxedPrecision 
					                                             OpDecorate %175 RelaxedPrecision 
					                                             OpDecorate %180 RelaxedPrecision 
					                                             OpDecorate %181 RelaxedPrecision 
					                                             OpDecorate %182 RelaxedPrecision 
					                                             OpDecorate %183 RelaxedPrecision 
					                                             OpDecorate %184 RelaxedPrecision 
					                                             OpDecorate %185 RelaxedPrecision 
					                                             OpDecorate %186 RelaxedPrecision 
					                                             OpDecorate %187 RelaxedPrecision 
					                                             OpDecorate %188 RelaxedPrecision 
					                                             OpDecorate %189 RelaxedPrecision 
					                                             OpDecorate %190 RelaxedPrecision 
					                                             OpDecorate %191 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %195 RelaxedPrecision 
					                                             OpDecorate %196 RelaxedPrecision 
					                                             OpDecorate %197 RelaxedPrecision 
					                                             OpDecorate %198 RelaxedPrecision 
					                                             OpDecorate %199 RelaxedPrecision 
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %202 Location 202 
					                                             OpDecorate %203 RelaxedPrecision 
					                                             OpDecorate %204 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeStruct %6 %7 
					                                     %11 = OpTypePointer Uniform %10 
					       Uniform struct {f32; f32_4;}* %12 = OpVariable Uniform 
					                                     %13 = OpTypeInt 32 1 
					                                 i32 %14 = OpConstant 0 
					                                     %15 = OpTypePointer Uniform %6 
					                                 f32 %18 = OpConstant 3,674022E-40 
					                                     %20 = OpTypeInt 32 0 
					                                 u32 %21 = OpConstant 0 
					                                     %22 = OpTypePointer Private %6 
					                                 f32 %24 = OpConstant 3,674022E-40 
					                                     %29 = OpTypeVector %6 2 
					                                     %30 = OpTypePointer Private %29 
					                      Private f32_2* %31 = OpVariable Private 
					                                     %32 = OpTypePointer Input %29 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %35 = OpConstant 1 
					                                     %36 = OpTypePointer Uniform %7 
					                      Private f32_2* %45 = OpVariable Private 
					                      Private f32_4* %51 = OpVariable Private 
					                                     %52 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %53 = OpTypePointer UniformConstant %52 
					UniformConstant read_only Texture2D* %54 = OpVariable UniformConstant 
					                                     %56 = OpTypeSampler 
					                                     %57 = OpTypePointer UniformConstant %56 
					            UniformConstant sampler* %58 = OpVariable UniformConstant 
					                                     %60 = OpTypeSampledImage %52 
					                      Private f32_4* %69 = OpVariable Private 
					                      Private f32_4* %75 = OpVariable Private 
					                      Private f32_4* %82 = OpVariable Private 
					                      Private f32_4* %89 = OpVariable Private 
					                                 f32 %94 = OpConstant 3,674022E-40 
					                                 u32 %95 = OpConstant 3 
					                      Private f32_4* %97 = OpVariable Private 
					                     Private f32_4* %103 = OpVariable Private 
					                                f32 %111 = OpConstant 3,674022E-40 
					                              f32_2 %112 = OpConstantComposite %24 %111 
					                     Private f32_4* %118 = OpVariable Private 
					                     Private f32_4* %125 = OpVariable Private 
					                     Private f32_4* %132 = OpVariable Private 
					                     Private f32_4* %139 = OpVariable Private 
					                                f32 %141 = OpConstant 3,674022E-40 
					                              f32_4 %142 = OpConstantComposite %141 %141 %141 %141 
					                     Private f32_4* %146 = OpVariable Private 
					                     Private f32_4* %154 = OpVariable Private 
					                     Private f32_4* %159 = OpVariable Private 
					                                    %201 = OpTypePointer Output %7 
					                      Output f32_4* %202 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform f32* %16 = OpAccessChain %12 %14 
					                                 f32 %17 = OpLoad %16 
					                                 f32 %19 = OpFMul %17 %18 
					                        Private f32* %23 = OpAccessChain %9 %21 
					                                             OpStore %23 %19 
					                        Private f32* %25 = OpAccessChain %9 %21 
					                                 f32 %26 = OpLoad %25 
					                                 f32 %27 = OpFDiv %24 %26 
					                        Private f32* %28 = OpAccessChain %9 %21 
					                                             OpStore %28 %27 
					                               f32_2 %34 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %37 = OpAccessChain %12 %35 
					                               f32_4 %38 = OpLoad %37 
					                               f32_2 %39 = OpVectorShuffle %38 %38 0 1 
					                               f32_2 %40 = OpFMul %34 %39 
					                      Uniform f32_4* %41 = OpAccessChain %12 %35 
					                               f32_4 %42 = OpLoad %41 
					                               f32_2 %43 = OpVectorShuffle %42 %42 2 3 
					                               f32_2 %44 = OpFAdd %40 %43 
					                                             OpStore %31 %44 
					                               f32_4 %46 = OpLoad %9 
					                               f32_2 %47 = OpVectorShuffle %46 %46 0 0 
					                               f32_2 %48 = OpFNegate %47 
					                               f32_2 %49 = OpLoad %31 
					                               f32_2 %50 = OpFAdd %48 %49 
					                                             OpStore %45 %50 
					                 read_only Texture2D %55 = OpLoad %54 
					                             sampler %59 = OpLoad %58 
					          read_only Texture2DSampled %61 = OpSampledImage %55 %59 
					                               f32_2 %62 = OpLoad %45 
					                               f32_4 %63 = OpImageSampleImplicitLod %61 %62 
					                                             OpStore %51 %63 
					                               f32_4 %64 = OpLoad %9 
					                               f32_2 %65 = OpVectorShuffle %64 %64 0 0 
					                               f32_2 %66 = OpFNegate %65 
					                               f32_4 %67 = OpLoad %9 
					                               f32_4 %68 = OpVectorShuffle %67 %66 0 4 5 3 
					                                             OpStore %9 %68 
					                               f32_4 %70 = OpLoad %9 
					                               f32_4 %71 = OpVectorShuffle %70 %70 1 0 0 0 
					                               f32_2 %72 = OpLoad %31 
					                               f32_4 %73 = OpVectorShuffle %72 %72 0 1 0 1 
					                               f32_4 %74 = OpFAdd %71 %73 
					                                             OpStore %69 %74 
					                 read_only Texture2D %76 = OpLoad %54 
					                             sampler %77 = OpLoad %58 
					          read_only Texture2DSampled %78 = OpSampledImage %76 %77 
					                               f32_4 %79 = OpLoad %69 
					                               f32_2 %80 = OpVectorShuffle %79 %79 0 1 
					                               f32_4 %81 = OpImageSampleImplicitLod %78 %80 
					                                             OpStore %75 %81 
					                 read_only Texture2D %83 = OpLoad %54 
					                             sampler %84 = OpLoad %58 
					          read_only Texture2DSampled %85 = OpSampledImage %83 %84 
					                               f32_4 %86 = OpLoad %69 
					                               f32_2 %87 = OpVectorShuffle %86 %86 2 3 
					                               f32_4 %88 = OpImageSampleImplicitLod %85 %87 
					                                             OpStore %82 %88 
					                               f32_4 %90 = OpLoad %51 
					                               f32_4 %91 = OpFNegate %90 
					                               f32_4 %92 = OpLoad %75 
					                               f32_4 %93 = OpFAdd %91 %92 
					                                             OpStore %89 %93 
					                        Private f32* %96 = OpAccessChain %9 %95 
					                                             OpStore %96 %94 
					                               f32_4 %98 = OpLoad %9 
					                               f32_4 %99 = OpVectorShuffle %98 %98 2 3 3 0 
					                              f32_2 %100 = OpLoad %31 
					                              f32_4 %101 = OpVectorShuffle %100 %100 0 1 0 1 
					                              f32_4 %102 = OpFAdd %99 %101 
					                                             OpStore %97 %102 
					                              f32_4 %104 = OpLoad %9 
					                              f32_4 %105 = OpVectorShuffle %104 %104 0 3 0 2 
					                              f32_2 %106 = OpLoad %31 
					                              f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
					                              f32_4 %108 = OpFAdd %105 %107 
					                                             OpStore %103 %108 
					                              f32_4 %109 = OpLoad %9 
					                              f32_2 %110 = OpVectorShuffle %109 %109 3 0 
					                              f32_2 %113 = OpFMul %110 %112 
					                              f32_2 %114 = OpLoad %31 
					                              f32_2 %115 = OpFAdd %113 %114 
					                              f32_4 %116 = OpLoad %9 
					                              f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
					                                             OpStore %9 %117 
					                read_only Texture2D %119 = OpLoad %54 
					                            sampler %120 = OpLoad %58 
					         read_only Texture2DSampled %121 = OpSampledImage %119 %120 
					                              f32_4 %122 = OpLoad %9 
					                              f32_2 %123 = OpVectorShuffle %122 %122 0 1 
					                              f32_4 %124 = OpImageSampleImplicitLod %121 %123 
					                                             OpStore %118 %124 
					                read_only Texture2D %126 = OpLoad %54 
					                            sampler %127 = OpLoad %58 
					         read_only Texture2DSampled %128 = OpSampledImage %126 %127 
					                              f32_4 %129 = OpLoad %97 
					                              f32_2 %130 = OpVectorShuffle %129 %129 2 3 
					                              f32_4 %131 = OpImageSampleImplicitLod %128 %130 
					                                             OpStore %125 %131 
					                read_only Texture2D %133 = OpLoad %54 
					                            sampler %134 = OpLoad %58 
					         read_only Texture2DSampled %135 = OpSampledImage %133 %134 
					                              f32_4 %136 = OpLoad %97 
					                              f32_2 %137 = OpVectorShuffle %136 %136 0 1 
					                              f32_4 %138 = OpImageSampleImplicitLod %135 %137 
					                                             OpStore %132 %138 
					                              f32_4 %140 = OpLoad %132 
					                              f32_4 %143 = OpFMul %140 %142 
					                              f32_4 %144 = OpLoad %75 
					                              f32_4 %145 = OpFAdd %143 %144 
					                                             OpStore %139 %145 
					                              f32_4 %147 = OpLoad %51 
					                              f32_4 %148 = OpLoad %139 
					                              f32_4 %149 = OpFAdd %147 %148 
					                                             OpStore %146 %149 
					                              f32_4 %150 = OpLoad %82 
					                              f32_4 %151 = OpFNegate %150 
					                              f32_4 %152 = OpLoad %146 
					                              f32_4 %153 = OpFAdd %151 %152 
					                                             OpStore %146 %153 
					                              f32_4 %155 = OpLoad %125 
					                              f32_4 %156 = OpFMul %155 %142 
					                              f32_4 %157 = OpLoad %89 
					                              f32_4 %158 = OpFAdd %156 %157 
					                                             OpStore %154 %158 
					                              f32_4 %160 = OpLoad %118 
					                              f32_4 %161 = OpFNegate %160 
					                              f32_4 %162 = OpFMul %161 %142 
					                              f32_4 %163 = OpLoad %154 
					                              f32_4 %164 = OpFAdd %162 %163 
					                                             OpStore %159 %164 
					                              f32_4 %165 = OpLoad %82 
					                              f32_4 %166 = OpLoad %159 
					                              f32_4 %167 = OpFAdd %165 %166 
					                                             OpStore %159 %167 
					                read_only Texture2D %168 = OpLoad %54 
					                            sampler %169 = OpLoad %58 
					         read_only Texture2DSampled %170 = OpSampledImage %168 %169 
					                              f32_4 %171 = OpLoad %103 
					                              f32_2 %172 = OpVectorShuffle %171 %171 2 3 
					                              f32_4 %173 = OpImageSampleImplicitLod %170 %172 
					                                             OpStore %125 %173 
					                read_only Texture2D %174 = OpLoad %54 
					                            sampler %175 = OpLoad %58 
					         read_only Texture2DSampled %176 = OpSampledImage %174 %175 
					                              f32_4 %177 = OpLoad %103 
					                              f32_2 %178 = OpVectorShuffle %177 %177 0 1 
					                              f32_4 %179 = OpImageSampleImplicitLod %176 %178 
					                                             OpStore %82 %179 
					                              f32_4 %180 = OpLoad %82 
					                              f32_4 %181 = OpFNegate %180 
					                              f32_4 %182 = OpFMul %181 %142 
					                              f32_4 %183 = OpLoad %146 
					                              f32_4 %184 = OpFAdd %182 %183 
					                                             OpStore %146 %184 
					                              f32_4 %185 = OpLoad %125 
					                              f32_4 %186 = OpFNegate %185 
					                              f32_4 %187 = OpLoad %146 
					                              f32_4 %188 = OpFAdd %186 %187 
					                                             OpStore %146 %188 
					                              f32_4 %189 = OpLoad %159 
					                              f32_4 %190 = OpLoad %125 
					                              f32_4 %191 = OpFNegate %190 
					                              f32_4 %192 = OpFAdd %189 %191 
					                                             OpStore %159 %192 
					                              f32_4 %193 = OpLoad %159 
					                              f32_4 %194 = OpLoad %159 
					                              f32_4 %195 = OpFMul %193 %194 
					                                             OpStore %159 %195 
					                              f32_4 %196 = OpLoad %146 
					                              f32_4 %197 = OpLoad %146 
					                              f32_4 %198 = OpFMul %196 %197 
					                              f32_4 %199 = OpLoad %159 
					                              f32_4 %200 = OpFAdd %198 %199 
					                                             OpStore %159 %200 
					                              f32_4 %203 = OpLoad %159 
					                              f32_4 %204 = OpExtInst %1 31 %203 
					                                             OpStore %202 %204 
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
						float _EdgeWeight;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec2 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat16_2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat16_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec2 u_xlat17;
					void main()
					{
					    u_xlat0.x = _EdgeWeight * 100.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat17.xy = (-u_xlat0.xx) + u_xlat1.xy;
					    u_xlat10_2 = texture(_MainTex, u_xlat17.xy);
					    u_xlat0.yz = (-u_xlat0.xx);
					    u_xlat3 = u_xlat0.yxxx + u_xlat1.xyxy;
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_5 = (-u_xlat10_2) + u_xlat10_4;
					    u_xlat0.w = 0.0;
					    u_xlat6 = u_xlat0.zwwx + u_xlat1.xyxy;
					    u_xlat7 = u_xlat0.xwxz + u_xlat1.xyxy;
					    u_xlat0.xy = u_xlat0.wx * vec2(1.0, -1.0) + u_xlat1.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat6.zw);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.xy);
					    u_xlat16_4 = u_xlat10_6 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat10_4;
					    u_xlat16_2 = u_xlat10_2 + u_xlat16_4;
					    u_xlat16_2 = (-u_xlat10_3) + u_xlat16_2;
					    u_xlat16_1 = u_xlat10_1 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_5;
					    u_xlat16_0 = (-u_xlat10_0) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_1;
					    u_xlat16_0 = u_xlat10_3 + u_xlat16_0;
					    u_xlat10_1 = texture(_MainTex, u_xlat7.zw);
					    u_xlat10_3 = texture(_MainTex, u_xlat7.xy);
					    u_xlat16_2 = (-u_xlat10_3) * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat16_2;
					    u_xlat16_2 = (-u_xlat10_1) + u_xlat16_2;
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_1);
					    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
					    u_xlat16_0 = u_xlat16_2 * u_xlat16_2 + u_xlat16_0;
					    SV_Target0 = sqrt(u_xlat16_0);
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