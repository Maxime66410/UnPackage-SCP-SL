Shader "CameraFilterPack/Drawing_Laplacian" {
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
			GpuProgramID 33871
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
					uniform 	vec4 _ScreenResolution;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					vec4 u_xlat10_8;
					vec2 u_xlat10;
					vec2 u_xlat19;
					vec2 u_xlat20;
					void main()
					{
					    u_xlat0.y = 0.0;
					    u_xlat1.xy = vec2(2.0, 2.0) / _ScreenResolution.xy;
					    u_xlat0.xz = (-u_xlat1.xy);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat20.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat20.xy);
					    u_xlat4.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.w = u_xlat4.y;
					    u_xlat5 = u_xlat0.xwyw + u_xlat2.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3 = (-u_xlat10_3) + (-u_xlat10_6);
					    u_xlat1.z = (-u_xlat1.x);
					    u_xlat20.xy = u_xlat1.zy + u_xlat2.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat20.xy);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_6);
					    u_xlat0.xy = (-u_xlat4.xy);
					    u_xlat6 = u_xlat0.xzxy + u_xlat2.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_7);
					    u_xlat16_3 = (-u_xlat10_6) + u_xlat16_3;
					    u_xlat0.w = 0.0;
					    u_xlat6 = u_xlat0.xwwz + u_xlat2.xyxy;
					    u_xlat0.xy = u_xlat0.wy + u_xlat2.xy;
					    u_xlat10_7 = texture(_MainTex, u_xlat0.xy);
					    u_xlat4.z = u_xlat0.z;
					    u_xlat0.xy = u_xlat2.xy + u_xlat4.xz;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_8 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_8);
					    u_xlat16_3 = (-u_xlat10_6) + u_xlat16_3;
					    u_xlat16_3 = (-u_xlat10_7) + u_xlat16_3;
					    u_xlat10_6 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_3 = u_xlat10_6 * vec4(16.0, 16.0, 16.0, 16.0) + u_xlat16_3;
					    u_xlat16_3 = (-u_xlat10_5) + u_xlat16_3;
					    u_xlat1.w = 0.0;
					    u_xlat5 = u_xlat1.wyxw + u_xlat2.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_6);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat16_3;
					    u_xlat4.w = (-u_xlat4.y);
					    u_xlat19.xy = u_xlat2.xy + u_xlat4.xw;
					    u_xlat10_3 = texture(_MainTex, u_xlat19.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_3);
					    u_xlat3.z = (-u_xlat4.y);
					    u_xlat4.y = 0.0;
					    u_xlat19.xy = u_xlat2.xy + u_xlat4.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat19.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_4);
					    u_xlat10.xy = u_xlat1.xy * vec2(1.0, -1.0) + u_xlat2.xy;
					    u_xlat3.x = u_xlat1.x * 1.0;
					    u_xlat1.xw = u_xlat2.xy + u_xlat3.xz;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_1 = texture(_MainTex, u_xlat10.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_1);
					    u_xlat16_0 = (-u_xlat10_2) + u_xlat16_0;
					    u_xlat0 = (-u_xlat10_5) + u_xlat16_0;
					    u_xlat1.x = u_xlat0.y + u_xlat0.x;
					    u_xlat1.x = u_xlat0.z + u_xlat1.x;
					    u_xlatb1 = u_xlat1.x<2.39999986;
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat0;
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
					; Bound: 370
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %39 %362 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpMemberDecorate %19 0 Offset 19 
					                                             OpMemberDecorate %19 1 RelaxedPrecision 
					                                             OpMemberDecorate %19 1 Offset 19 
					                                             OpDecorate %19 Block 
					                                             OpDecorate %21 DescriptorSet 21 
					                                             OpDecorate %21 Binding 21 
					                                             OpDecorate vs_TEXCOORD0 Location 39 
					                                             OpDecorate %43 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %47 RelaxedPrecision 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %55 RelaxedPrecision 
					                                             OpDecorate %58 RelaxedPrecision 
					                                             OpDecorate %58 DescriptorSet 58 
					                                             OpDecorate %58 Binding 58 
					                                             OpDecorate %59 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %62 DescriptorSet 62 
					                                             OpDecorate %62 Binding 62 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                             OpDecorate %123 RelaxedPrecision 
					                                             OpDecorate %124 RelaxedPrecision 
					                                             OpDecorate %125 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %151 RelaxedPrecision 
					                                             OpDecorate %152 RelaxedPrecision 
					                                             OpDecorate %153 RelaxedPrecision 
					                                             OpDecorate %154 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %170 RelaxedPrecision 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %185 RelaxedPrecision 
					                                             OpDecorate %186 RelaxedPrecision 
					                                             OpDecorate %187 RelaxedPrecision 
					                                             OpDecorate %192 RelaxedPrecision 
					                                             OpDecorate %193 RelaxedPrecision 
					                                             OpDecorate %194 RelaxedPrecision 
					                                             OpDecorate %199 RelaxedPrecision 
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %205 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %208 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %210 RelaxedPrecision 
					                                             OpDecorate %211 RelaxedPrecision 
					                                             OpDecorate %212 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %214 RelaxedPrecision 
					                                             OpDecorate %215 RelaxedPrecision 
					                                             OpDecorate %216 RelaxedPrecision 
					                                             OpDecorate %217 RelaxedPrecision 
					                                             OpDecorate %218 RelaxedPrecision 
					                                             OpDecorate %222 RelaxedPrecision 
					                                             OpDecorate %225 RelaxedPrecision 
					                                             OpDecorate %226 RelaxedPrecision 
					                                             OpDecorate %227 RelaxedPrecision 
					                                             OpDecorate %228 RelaxedPrecision 
					                                             OpDecorate %229 RelaxedPrecision 
					                                             OpDecorate %230 RelaxedPrecision 
					                                             OpDecorate %231 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %239 RelaxedPrecision 
					                                             OpDecorate %244 RelaxedPrecision 
					                                             OpDecorate %245 RelaxedPrecision 
					                                             OpDecorate %250 RelaxedPrecision 
					                                             OpDecorate %251 RelaxedPrecision 
					                                             OpDecorate %252 RelaxedPrecision 
					                                             OpDecorate %253 RelaxedPrecision 
					                                             OpDecorate %254 RelaxedPrecision 
					                                             OpDecorate %255 RelaxedPrecision 
					                                             OpDecorate %256 RelaxedPrecision 
					                                             OpDecorate %257 RelaxedPrecision 
					                                             OpDecorate %258 RelaxedPrecision 
					                                             OpDecorate %268 RelaxedPrecision 
					                                             OpDecorate %269 RelaxedPrecision 
					                                             OpDecorate %273 RelaxedPrecision 
					                                             OpDecorate %274 RelaxedPrecision 
					                                             OpDecorate %275 RelaxedPrecision 
					                                             OpDecorate %276 RelaxedPrecision 
					                                             OpDecorate %289 RelaxedPrecision 
					                                             OpDecorate %290 RelaxedPrecision 
					                                             OpDecorate %291 RelaxedPrecision 
					                                             OpDecorate %295 RelaxedPrecision 
					                                             OpDecorate %296 RelaxedPrecision 
					                                             OpDecorate %297 RelaxedPrecision 
					                                             OpDecorate %298 RelaxedPrecision 
					                                             OpDecorate %317 RelaxedPrecision 
					                                             OpDecorate %318 RelaxedPrecision 
					                                             OpDecorate %319 RelaxedPrecision 
					                                             OpDecorate %324 RelaxedPrecision 
					                                             OpDecorate %325 RelaxedPrecision 
					                                             OpDecorate %326 RelaxedPrecision 
					                                             OpDecorate %330 RelaxedPrecision 
					                                             OpDecorate %331 RelaxedPrecision 
					                                             OpDecorate %332 RelaxedPrecision 
					                                             OpDecorate %333 RelaxedPrecision 
					                                             OpDecorate %334 RelaxedPrecision 
					                                             OpDecorate %335 RelaxedPrecision 
					                                             OpDecorate %336 RelaxedPrecision 
					                                             OpDecorate %337 RelaxedPrecision 
					                                             OpDecorate %338 RelaxedPrecision 
					                                             OpDecorate %339 RelaxedPrecision 
					                                             OpDecorate %340 RelaxedPrecision 
					                                             OpDecorate %341 RelaxedPrecision 
					                                             OpDecorate %362 Location 362 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                 f32 %10 = OpConstant 3,674022E-40 
					                                     %11 = OpTypeInt 32 0 
					                                 u32 %12 = OpConstant 1 
					                                     %13 = OpTypePointer Private %6 
					                      Private f32_4* %15 = OpVariable Private 
					                                     %16 = OpTypeVector %6 2 
					                                 f32 %17 = OpConstant 3,674022E-40 
					                               f32_2 %18 = OpConstantComposite %17 %17 
					                                     %19 = OpTypeStruct %7 %7 
					                                     %20 = OpTypePointer Uniform %19 
					     Uniform struct {f32_4; f32_4;}* %21 = OpVariable Uniform 
					                                     %22 = OpTypeInt 32 1 
					                                 i32 %23 = OpConstant 0 
					                                     %24 = OpTypePointer Uniform %7 
					                                     %36 = OpTypePointer Private %16 
					                      Private f32_2* %37 = OpVariable Private 
					                                     %38 = OpTypePointer Input %16 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %41 = OpConstant 1 
					                      Private f32_2* %50 = OpVariable Private 
					                      Private f32_4* %55 = OpVariable Private 
					                                     %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %57 = OpTypePointer UniformConstant %56 
					UniformConstant read_only Texture2D* %58 = OpVariable UniformConstant 
					                                     %60 = OpTypeSampler 
					                                     %61 = OpTypePointer UniformConstant %60 
					            UniformConstant sampler* %62 = OpVariable UniformConstant 
					                                     %64 = OpTypeSampledImage %56 
					                      Private f32_4* %68 = OpVariable Private 
					                                 f32 %69 = OpConstant 3,674022E-40 
					                               f32_2 %70 = OpConstantComposite %69 %69 
					                                 u32 %79 = OpConstant 3 
					                      Private f32_4* %81 = OpVariable Private 
					                      Private f32_4* %87 = OpVariable Private 
					                      Private f32_4* %94 = OpVariable Private 
					                     Private f32_4* %101 = OpVariable Private 
					                                u32 %107 = OpConstant 0 
					                                u32 %111 = OpConstant 2 
					                     Private f32_4* %131 = OpVariable Private 
					                     Private f32_4* %137 = OpVariable Private 
					                     Private f32_4* %185 = OpVariable Private 
					                     Private f32_4* %192 = OpVariable Private 
					                                f32 %223 = OpConstant 3,674022E-40 
					                              f32_4 %224 = OpConstantComposite %223 %223 %223 %223 
					                     Private f32_4* %254 = OpVariable Private 
					                     Private f32_2* %263 = OpVariable Private 
					                                    %277 = OpTypeVector %6 3 
					                                    %278 = OpTypePointer Private %277 
					                     Private f32_3* %279 = OpVariable Private 
					                     Private f32_4* %289 = OpVariable Private 
					                     Private f32_2* %299 = OpVariable Private 
					                                f32 %302 = OpConstant 3,674022E-40 
					                              f32_2 %303 = OpConstantComposite %69 %302 
					                     Private f32_4* %317 = OpVariable Private 
					                     Private f32_4* %324 = OpVariable Private 
					                                    %354 = OpTypeBool 
					                                    %355 = OpTypePointer Private %354 
					                      Private bool* %356 = OpVariable Private 
					                                f32 %359 = OpConstant 3,674022E-40 
					                                    %361 = OpTypePointer Output %7 
					                      Output f32_4* %362 = OpVariable Output 
					                              f32_4 %364 = OpConstantComposite %10 %10 %10 %10 
					                                    %366 = OpTypeVector %354 4 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Private f32* %14 = OpAccessChain %9 %12 
					                                             OpStore %14 %10 
					                      Uniform f32_4* %25 = OpAccessChain %21 %23 
					                               f32_4 %26 = OpLoad %25 
					                               f32_2 %27 = OpVectorShuffle %26 %26 0 1 
					                               f32_2 %28 = OpFDiv %18 %27 
					                               f32_4 %29 = OpLoad %15 
					                               f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
					                                             OpStore %15 %30 
					                               f32_4 %31 = OpLoad %15 
					                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
					                               f32_2 %33 = OpFNegate %32 
					                               f32_4 %34 = OpLoad %9 
					                               f32_4 %35 = OpVectorShuffle %34 %33 4 1 5 3 
					                                             OpStore %9 %35 
					                               f32_2 %40 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %42 = OpAccessChain %21 %41 
					                               f32_4 %43 = OpLoad %42 
					                               f32_2 %44 = OpVectorShuffle %43 %43 0 1 
					                               f32_2 %45 = OpFMul %40 %44 
					                      Uniform f32_4* %46 = OpAccessChain %21 %41 
					                               f32_4 %47 = OpLoad %46 
					                               f32_2 %48 = OpVectorShuffle %47 %47 2 3 
					                               f32_2 %49 = OpFAdd %45 %48 
					                                             OpStore %37 %49 
					                               f32_4 %51 = OpLoad %9 
					                               f32_2 %52 = OpVectorShuffle %51 %51 0 1 
					                               f32_2 %53 = OpLoad %37 
					                               f32_2 %54 = OpFAdd %52 %53 
					                                             OpStore %50 %54 
					                 read_only Texture2D %59 = OpLoad %58 
					                             sampler %63 = OpLoad %62 
					          read_only Texture2DSampled %65 = OpSampledImage %59 %63 
					                               f32_2 %66 = OpLoad %50 
					                               f32_4 %67 = OpImageSampleImplicitLod %65 %66 
					                                             OpStore %55 %67 
					                      Uniform f32_4* %71 = OpAccessChain %21 %23 
					                               f32_4 %72 = OpLoad %71 
					                               f32_2 %73 = OpVectorShuffle %72 %72 0 1 
					                               f32_2 %74 = OpFDiv %70 %73 
					                               f32_4 %75 = OpLoad %68 
					                               f32_4 %76 = OpVectorShuffle %75 %74 4 5 2 3 
					                                             OpStore %68 %76 
					                        Private f32* %77 = OpAccessChain %68 %12 
					                                 f32 %78 = OpLoad %77 
					                        Private f32* %80 = OpAccessChain %9 %79 
					                                             OpStore %80 %78 
					                               f32_4 %82 = OpLoad %9 
					                               f32_4 %83 = OpVectorShuffle %82 %82 0 3 1 3 
					                               f32_2 %84 = OpLoad %37 
					                               f32_4 %85 = OpVectorShuffle %84 %84 0 1 0 1 
					                               f32_4 %86 = OpFAdd %83 %85 
					                                             OpStore %81 %86 
					                 read_only Texture2D %88 = OpLoad %58 
					                             sampler %89 = OpLoad %62 
					          read_only Texture2DSampled %90 = OpSampledImage %88 %89 
					                               f32_4 %91 = OpLoad %81 
					                               f32_2 %92 = OpVectorShuffle %91 %91 0 1 
					                               f32_4 %93 = OpImageSampleImplicitLod %90 %92 
					                                             OpStore %87 %93 
					                 read_only Texture2D %95 = OpLoad %58 
					                             sampler %96 = OpLoad %62 
					          read_only Texture2DSampled %97 = OpSampledImage %95 %96 
					                               f32_4 %98 = OpLoad %81 
					                               f32_2 %99 = OpVectorShuffle %98 %98 2 3 
					                              f32_4 %100 = OpImageSampleImplicitLod %97 %99 
					                                             OpStore %94 %100 
					                              f32_4 %102 = OpLoad %55 
					                              f32_4 %103 = OpFNegate %102 
					                              f32_4 %104 = OpLoad %87 
					                              f32_4 %105 = OpFNegate %104 
					                              f32_4 %106 = OpFAdd %103 %105 
					                                             OpStore %101 %106 
					                       Private f32* %108 = OpAccessChain %15 %107 
					                                f32 %109 = OpLoad %108 
					                                f32 %110 = OpFNegate %109 
					                       Private f32* %112 = OpAccessChain %15 %111 
					                                             OpStore %112 %110 
					                              f32_4 %113 = OpLoad %15 
					                              f32_2 %114 = OpVectorShuffle %113 %113 2 1 
					                              f32_2 %115 = OpLoad %37 
					                              f32_2 %116 = OpFAdd %114 %115 
					                                             OpStore %50 %116 
					                read_only Texture2D %117 = OpLoad %58 
					                            sampler %118 = OpLoad %62 
					         read_only Texture2DSampled %119 = OpSampledImage %117 %118 
					                              f32_2 %120 = OpLoad %50 
					                              f32_4 %121 = OpImageSampleImplicitLod %119 %120 
					                                             OpStore %87 %121 
					                              f32_4 %122 = OpLoad %101 
					                              f32_4 %123 = OpLoad %87 
					                              f32_4 %124 = OpFNegate %123 
					                              f32_4 %125 = OpFAdd %122 %124 
					                                             OpStore %101 %125 
					                              f32_4 %126 = OpLoad %68 
					                              f32_2 %127 = OpVectorShuffle %126 %126 0 1 
					                              f32_2 %128 = OpFNegate %127 
					                              f32_4 %129 = OpLoad %9 
					                              f32_4 %130 = OpVectorShuffle %129 %128 4 5 2 3 
					                                             OpStore %9 %130 
					                              f32_4 %132 = OpLoad %9 
					                              f32_4 %133 = OpVectorShuffle %132 %132 0 2 0 1 
					                              f32_2 %134 = OpLoad %37 
					                              f32_4 %135 = OpVectorShuffle %134 %134 0 1 0 1 
					                              f32_4 %136 = OpFAdd %133 %135 
					                                             OpStore %131 %136 
					                read_only Texture2D %138 = OpLoad %58 
					                            sampler %139 = OpLoad %62 
					         read_only Texture2DSampled %140 = OpSampledImage %138 %139 
					                              f32_4 %141 = OpLoad %131 
					                              f32_2 %142 = OpVectorShuffle %141 %141 0 1 
					                              f32_4 %143 = OpImageSampleImplicitLod %140 %142 
					                                             OpStore %137 %143 
					                read_only Texture2D %144 = OpLoad %58 
					                            sampler %145 = OpLoad %62 
					         read_only Texture2DSampled %146 = OpSampledImage %144 %145 
					                              f32_4 %147 = OpLoad %131 
					                              f32_2 %148 = OpVectorShuffle %147 %147 2 3 
					                              f32_4 %149 = OpImageSampleImplicitLod %146 %148 
					                                             OpStore %87 %149 
					                              f32_4 %150 = OpLoad %101 
					                              f32_4 %151 = OpLoad %137 
					                              f32_4 %152 = OpFNegate %151 
					                              f32_4 %153 = OpFAdd %150 %152 
					                                             OpStore %101 %153 
					                              f32_4 %154 = OpLoad %87 
					                              f32_4 %155 = OpFNegate %154 
					                              f32_4 %156 = OpLoad %101 
					                              f32_4 %157 = OpFAdd %155 %156 
					                                             OpStore %101 %157 
					                       Private f32* %158 = OpAccessChain %9 %79 
					                                             OpStore %158 %10 
					                              f32_4 %159 = OpLoad %9 
					                              f32_4 %160 = OpVectorShuffle %159 %159 0 3 3 2 
					                              f32_2 %161 = OpLoad %37 
					                              f32_4 %162 = OpVectorShuffle %161 %161 0 1 0 1 
					                              f32_4 %163 = OpFAdd %160 %162 
					                                             OpStore %131 %163 
					                              f32_4 %164 = OpLoad %9 
					                              f32_2 %165 = OpVectorShuffle %164 %164 3 1 
					                              f32_2 %166 = OpLoad %37 
					                              f32_2 %167 = OpFAdd %165 %166 
					                              f32_4 %168 = OpLoad %9 
					                              f32_4 %169 = OpVectorShuffle %168 %167 4 5 2 3 
					                                             OpStore %9 %169 
					                read_only Texture2D %170 = OpLoad %58 
					                            sampler %171 = OpLoad %62 
					         read_only Texture2DSampled %172 = OpSampledImage %170 %171 
					                              f32_4 %173 = OpLoad %9 
					                              f32_2 %174 = OpVectorShuffle %173 %173 0 1 
					                              f32_4 %175 = OpImageSampleImplicitLod %172 %174 
					                                             OpStore %137 %175 
					                       Private f32* %176 = OpAccessChain %9 %111 
					                                f32 %177 = OpLoad %176 
					                       Private f32* %178 = OpAccessChain %68 %111 
					                                             OpStore %178 %177 
					                              f32_2 %179 = OpLoad %37 
					                              f32_4 %180 = OpLoad %68 
					                              f32_2 %181 = OpVectorShuffle %180 %180 0 2 
					                              f32_2 %182 = OpFAdd %179 %181 
					                              f32_4 %183 = OpLoad %9 
					                              f32_4 %184 = OpVectorShuffle %183 %182 4 5 2 3 
					                                             OpStore %9 %184 
					                read_only Texture2D %186 = OpLoad %58 
					                            sampler %187 = OpLoad %62 
					         read_only Texture2DSampled %188 = OpSampledImage %186 %187 
					                              f32_4 %189 = OpLoad %9 
					                              f32_2 %190 = OpVectorShuffle %189 %189 0 1 
					                              f32_4 %191 = OpImageSampleImplicitLod %188 %190 
					                                             OpStore %185 %191 
					                read_only Texture2D %193 = OpLoad %58 
					                            sampler %194 = OpLoad %62 
					         read_only Texture2DSampled %195 = OpSampledImage %193 %194 
					                              f32_4 %196 = OpLoad %131 
					                              f32_2 %197 = OpVectorShuffle %196 %196 0 1 
					                              f32_4 %198 = OpImageSampleImplicitLod %195 %197 
					                                             OpStore %192 %198 
					                read_only Texture2D %199 = OpLoad %58 
					                            sampler %200 = OpLoad %62 
					         read_only Texture2DSampled %201 = OpSampledImage %199 %200 
					                              f32_4 %202 = OpLoad %131 
					                              f32_2 %203 = OpVectorShuffle %202 %202 2 3 
					                              f32_4 %204 = OpImageSampleImplicitLod %201 %203 
					                                             OpStore %87 %204 
					                              f32_4 %205 = OpLoad %101 
					                              f32_4 %206 = OpLoad %192 
					                              f32_4 %207 = OpFNegate %206 
					                              f32_4 %208 = OpFAdd %205 %207 
					                                             OpStore %101 %208 
					                              f32_4 %209 = OpLoad %87 
					                              f32_4 %210 = OpFNegate %209 
					                              f32_4 %211 = OpLoad %101 
					                              f32_4 %212 = OpFAdd %210 %211 
					                                             OpStore %101 %212 
					                              f32_4 %213 = OpLoad %137 
					                              f32_4 %214 = OpFNegate %213 
					                              f32_4 %215 = OpLoad %101 
					                              f32_4 %216 = OpFAdd %214 %215 
					                                             OpStore %101 %216 
					                read_only Texture2D %217 = OpLoad %58 
					                            sampler %218 = OpLoad %62 
					         read_only Texture2DSampled %219 = OpSampledImage %217 %218 
					                              f32_2 %220 = OpLoad %37 
					                              f32_4 %221 = OpImageSampleImplicitLod %219 %220 
					                                             OpStore %87 %221 
					                              f32_4 %222 = OpLoad %87 
					                              f32_4 %225 = OpFMul %222 %224 
					                              f32_4 %226 = OpLoad %101 
					                              f32_4 %227 = OpFAdd %225 %226 
					                                             OpStore %101 %227 
					                              f32_4 %228 = OpLoad %94 
					                              f32_4 %229 = OpFNegate %228 
					                              f32_4 %230 = OpLoad %101 
					                              f32_4 %231 = OpFAdd %229 %230 
					                                             OpStore %101 %231 
					                       Private f32* %232 = OpAccessChain %15 %79 
					                                             OpStore %232 %10 
					                              f32_4 %233 = OpLoad %15 
					                              f32_4 %234 = OpVectorShuffle %233 %233 3 1 0 3 
					                              f32_2 %235 = OpLoad %37 
					                              f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 1 
					                              f32_4 %237 = OpFAdd %234 %236 
					                                             OpStore %81 %237 
					                read_only Texture2D %238 = OpLoad %58 
					                            sampler %239 = OpLoad %62 
					         read_only Texture2DSampled %240 = OpSampledImage %238 %239 
					                              f32_4 %241 = OpLoad %81 
					                              f32_2 %242 = OpVectorShuffle %241 %241 0 1 
					                              f32_4 %243 = OpImageSampleImplicitLod %240 %242 
					                                             OpStore %87 %243 
					                read_only Texture2D %244 = OpLoad %58 
					                            sampler %245 = OpLoad %62 
					         read_only Texture2DSampled %246 = OpSampledImage %244 %245 
					                              f32_4 %247 = OpLoad %81 
					                              f32_2 %248 = OpVectorShuffle %247 %247 2 3 
					                              f32_4 %249 = OpImageSampleImplicitLod %246 %248 
					                                             OpStore %94 %249 
					                              f32_4 %250 = OpLoad %101 
					                              f32_4 %251 = OpLoad %87 
					                              f32_4 %252 = OpFNegate %251 
					                              f32_4 %253 = OpFAdd %250 %252 
					                                             OpStore %101 %253 
					                              f32_4 %255 = OpLoad %185 
					                              f32_4 %256 = OpFNegate %255 
					                              f32_4 %257 = OpLoad %101 
					                              f32_4 %258 = OpFAdd %256 %257 
					                                             OpStore %254 %258 
					                       Private f32* %259 = OpAccessChain %68 %12 
					                                f32 %260 = OpLoad %259 
					                                f32 %261 = OpFNegate %260 
					                       Private f32* %262 = OpAccessChain %68 %79 
					                                             OpStore %262 %261 
					                              f32_2 %264 = OpLoad %37 
					                              f32_4 %265 = OpLoad %68 
					                              f32_2 %266 = OpVectorShuffle %265 %265 0 3 
					                              f32_2 %267 = OpFAdd %264 %266 
					                                             OpStore %263 %267 
					                read_only Texture2D %268 = OpLoad %58 
					                            sampler %269 = OpLoad %62 
					         read_only Texture2DSampled %270 = OpSampledImage %268 %269 
					                              f32_2 %271 = OpLoad %263 
					                              f32_4 %272 = OpImageSampleImplicitLod %270 %271 
					                                             OpStore %55 %272 
					                              f32_4 %273 = OpLoad %254 
					                              f32_4 %274 = OpLoad %55 
					                              f32_4 %275 = OpFNegate %274 
					                              f32_4 %276 = OpFAdd %273 %275 
					                                             OpStore %254 %276 
					                       Private f32* %280 = OpAccessChain %68 %12 
					                                f32 %281 = OpLoad %280 
					                                f32 %282 = OpFNegate %281 
					                       Private f32* %283 = OpAccessChain %279 %111 
					                                             OpStore %283 %282 
					                       Private f32* %284 = OpAccessChain %68 %12 
					                                             OpStore %284 %10 
					                              f32_2 %285 = OpLoad %37 
					                              f32_4 %286 = OpLoad %68 
					                              f32_2 %287 = OpVectorShuffle %286 %286 0 1 
					                              f32_2 %288 = OpFAdd %285 %287 
					                                             OpStore %263 %288 
					                read_only Texture2D %290 = OpLoad %58 
					                            sampler %291 = OpLoad %62 
					         read_only Texture2DSampled %292 = OpSampledImage %290 %291 
					                              f32_2 %293 = OpLoad %263 
					                              f32_4 %294 = OpImageSampleImplicitLod %292 %293 
					                                             OpStore %289 %294 
					                              f32_4 %295 = OpLoad %254 
					                              f32_4 %296 = OpLoad %289 
					                              f32_4 %297 = OpFNegate %296 
					                              f32_4 %298 = OpFAdd %295 %297 
					                                             OpStore %254 %298 
					                              f32_4 %300 = OpLoad %15 
					                              f32_2 %301 = OpVectorShuffle %300 %300 0 1 
					                              f32_2 %304 = OpFMul %301 %303 
					                              f32_2 %305 = OpLoad %37 
					                              f32_2 %306 = OpFAdd %304 %305 
					                                             OpStore %299 %306 
					                       Private f32* %307 = OpAccessChain %15 %107 
					                                f32 %308 = OpLoad %307 
					                                f32 %309 = OpFMul %308 %69 
					                       Private f32* %310 = OpAccessChain %279 %107 
					                                             OpStore %310 %309 
					                              f32_2 %311 = OpLoad %37 
					                              f32_3 %312 = OpLoad %279 
					                              f32_2 %313 = OpVectorShuffle %312 %312 0 2 
					                              f32_2 %314 = OpFAdd %311 %313 
					                              f32_4 %315 = OpLoad %15 
					                              f32_4 %316 = OpVectorShuffle %315 %314 4 1 2 5 
					                                             OpStore %15 %316 
					                read_only Texture2D %318 = OpLoad %58 
					                            sampler %319 = OpLoad %62 
					         read_only Texture2DSampled %320 = OpSampledImage %318 %319 
					                              f32_4 %321 = OpLoad %15 
					                              f32_2 %322 = OpVectorShuffle %321 %321 0 3 
					                              f32_4 %323 = OpImageSampleImplicitLod %320 %322 
					                                             OpStore %317 %323 
					                read_only Texture2D %325 = OpLoad %58 
					                            sampler %326 = OpLoad %62 
					         read_only Texture2DSampled %327 = OpSampledImage %325 %326 
					                              f32_2 %328 = OpLoad %299 
					                              f32_4 %329 = OpImageSampleImplicitLod %327 %328 
					                                             OpStore %324 %329 
					                              f32_4 %330 = OpLoad %254 
					                              f32_4 %331 = OpLoad %324 
					                              f32_4 %332 = OpFNegate %331 
					                              f32_4 %333 = OpFAdd %330 %332 
					                                             OpStore %254 %333 
					                              f32_4 %334 = OpLoad %317 
					                              f32_4 %335 = OpFNegate %334 
					                              f32_4 %336 = OpLoad %254 
					                              f32_4 %337 = OpFAdd %335 %336 
					                                             OpStore %254 %337 
					                              f32_4 %338 = OpLoad %94 
					                              f32_4 %339 = OpFNegate %338 
					                              f32_4 %340 = OpLoad %254 
					                              f32_4 %341 = OpFAdd %339 %340 
					                                             OpStore %9 %341 
					                       Private f32* %342 = OpAccessChain %9 %12 
					                                f32 %343 = OpLoad %342 
					                       Private f32* %344 = OpAccessChain %9 %107 
					                                f32 %345 = OpLoad %344 
					                                f32 %346 = OpFAdd %343 %345 
					                       Private f32* %347 = OpAccessChain %15 %107 
					                                             OpStore %347 %346 
					                       Private f32* %348 = OpAccessChain %9 %111 
					                                f32 %349 = OpLoad %348 
					                       Private f32* %350 = OpAccessChain %15 %107 
					                                f32 %351 = OpLoad %350 
					                                f32 %352 = OpFAdd %349 %351 
					                       Private f32* %353 = OpAccessChain %15 %107 
					                                             OpStore %353 %352 
					                       Private f32* %357 = OpAccessChain %15 %107 
					                                f32 %358 = OpLoad %357 
					                               bool %360 = OpFOrdLessThan %358 %359 
					                                             OpStore %356 %360 
					                               bool %363 = OpLoad %356 
					                              f32_4 %365 = OpLoad %9 
					                             bool_4 %367 = OpCompositeConstruct %363 %363 %363 %363 
					                              f32_4 %368 = OpSelect %367 %364 %365 
					                                             OpStore %362 %368 
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
						vec4 unused_0_0[3];
						vec4 _ScreenResolution;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec4 u_xlat16_3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					vec4 u_xlat10_8;
					vec2 u_xlat10;
					vec2 u_xlat19;
					vec2 u_xlat20;
					void main()
					{
					    u_xlat0.y = 0.0;
					    u_xlat1.xy = vec2(2.0, 2.0) / _ScreenResolution.xy;
					    u_xlat0.xz = (-u_xlat1.xy);
					    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat20.xy = u_xlat0.xy + u_xlat2.xy;
					    u_xlat10_3 = texture(_MainTex, u_xlat20.xy);
					    u_xlat4.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat0.w = u_xlat4.y;
					    u_xlat5 = u_xlat0.xwyw + u_xlat2.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3 = (-u_xlat10_3) + (-u_xlat10_6);
					    u_xlat1.z = (-u_xlat1.x);
					    u_xlat20.xy = u_xlat1.zy + u_xlat2.xy;
					    u_xlat10_6 = texture(_MainTex, u_xlat20.xy);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_6);
					    u_xlat0.xy = (-u_xlat4.xy);
					    u_xlat6 = u_xlat0.xzxy + u_xlat2.xyxy;
					    u_xlat10_7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_7);
					    u_xlat16_3 = (-u_xlat10_6) + u_xlat16_3;
					    u_xlat0.w = 0.0;
					    u_xlat6 = u_xlat0.xwwz + u_xlat2.xyxy;
					    u_xlat0.xy = u_xlat0.wy + u_xlat2.xy;
					    u_xlat10_7 = texture(_MainTex, u_xlat0.xy);
					    u_xlat4.z = u_xlat0.z;
					    u_xlat0.xy = u_xlat2.xy + u_xlat4.xz;
					    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat10_8 = texture(_MainTex, u_xlat6.xy);
					    u_xlat10_6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_8);
					    u_xlat16_3 = (-u_xlat10_6) + u_xlat16_3;
					    u_xlat16_3 = (-u_xlat10_7) + u_xlat16_3;
					    u_xlat10_6 = texture(_MainTex, u_xlat2.xy);
					    u_xlat16_3 = u_xlat10_6 * vec4(16.0, 16.0, 16.0, 16.0) + u_xlat16_3;
					    u_xlat16_3 = (-u_xlat10_5) + u_xlat16_3;
					    u_xlat1.w = 0.0;
					    u_xlat5 = u_xlat1.wyxw + u_xlat2.xyxy;
					    u_xlat10_6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat10_5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat16_3 = u_xlat16_3 + (-u_xlat10_6);
					    u_xlat16_0 = (-u_xlat10_0) + u_xlat16_3;
					    u_xlat4.w = (-u_xlat4.y);
					    u_xlat19.xy = u_xlat2.xy + u_xlat4.xw;
					    u_xlat10_3 = texture(_MainTex, u_xlat19.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_3);
					    u_xlat3.z = (-u_xlat4.y);
					    u_xlat4.y = 0.0;
					    u_xlat19.xy = u_xlat2.xy + u_xlat4.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat19.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_4);
					    u_xlat10.xy = u_xlat1.xy * vec2(1.0, -1.0) + u_xlat2.xy;
					    u_xlat3.x = u_xlat1.x * 1.0;
					    u_xlat1.xw = u_xlat2.xy + u_xlat3.xz;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_1 = texture(_MainTex, u_xlat10.xy);
					    u_xlat16_0 = u_xlat16_0 + (-u_xlat10_1);
					    u_xlat16_0 = (-u_xlat10_2) + u_xlat16_0;
					    u_xlat0 = (-u_xlat10_5) + u_xlat16_0;
					    u_xlat1.x = u_xlat0.y + u_xlat0.x;
					    u_xlat1.x = u_xlat0.z + u_xlat1.x;
					    u_xlatb1 = u_xlat1.x<2.39999986;
					    SV_Target0 = (bool(u_xlatb1)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat0;
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