Shader "CameraFilterPack/Drawing_NewCellShading" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Threshold ("_Threshold", Range(0, 1)) = 0
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 19780
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
					uniform 	float _Threshold;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat2 = u_xlat0.xyyx * _ScreenResolution.xyyx + vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxz / _ScreenResolution.xyxy;
					    u_xlat10_4 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					    u_xlat1.zw = u_xlat0.xx * _ScreenResolution.xx + vec2(-1.0, 1.0);
					    u_xlat5 = u_xlat1.zywy / _ScreenResolution.xyxy;
					    u_xlat10_6 = textureLod(_MainTex, u_xlat5.xy, 0.0);
					    u_xlat16_16 = (-u_xlat10_6.x) * 2.0 + (-u_xlat10_4.x);
					    u_xlat10_3 = textureLod(_MainTex, u_xlat3.zw, 0.0);
					    u_xlat16_16 = u_xlat16_16 + (-u_xlat10_3.x);
					    u_xlat2 = u_xlat2.wywz / _ScreenResolution.xyxy;
					    u_xlat10_6 = textureLod(_MainTex, u_xlat2.xy, 0.0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_6.x;
					    u_xlat10_5 = textureLod(_MainTex, u_xlat5.zw, 0.0);
					    u_xlat16_16 = u_xlat10_5.x * 2.0 + u_xlat16_16;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat2.zw, 0.0);
					    u_xlat5.x = u_xlat16_16 + u_xlat10_2.x;
					    u_xlat0 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(0.0, -1.0, 0.0, 1.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat10_7 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    u_xlat16_0 = u_xlat10_7.x * 2.0 + u_xlat10_4.x;
					    u_xlat16_0 = u_xlat10_6.x + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat10_3.x) + u_xlat16_0;
					    u_xlat10_3 = textureLod(_MainTex, u_xlat0.zw, 0.0);
					    u_xlat16_0 = (-u_xlat10_3.x) * 2.0 + u_xlat16_0;
					    u_xlat5.y = (-u_xlat10_2.x) + u_xlat16_0;
					    u_xlat0.x = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb0 = _Threshold<u_xlat0.x;
					    if(u_xlatb0){
					        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    } else {
					        u_xlat0.xy = u_xlat1.xy / _ScreenResolution.xy;
					        SV_Target0 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    }
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
					; Bound: 251
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %236 
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
					                                             OpDecorate %57 RelaxedPrecision 
					                                             OpDecorate %60 RelaxedPrecision 
					                                             OpDecorate %60 DescriptorSet 60 
					                                             OpDecorate %60 Binding 60 
					                                             OpDecorate %61 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %64 DescriptorSet 64 
					                                             OpDecorate %64 Binding 64 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %74 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %100 RelaxedPrecision 
					                                             OpDecorate %101 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %106 RelaxedPrecision 
					                                             OpDecorate %107 RelaxedPrecision 
					                                             OpDecorate %108 RelaxedPrecision 
					                                             OpDecorate %109 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %118 RelaxedPrecision 
					                                             OpDecorate %119 RelaxedPrecision 
					                                             OpDecorate %126 RelaxedPrecision 
					                                             OpDecorate %127 RelaxedPrecision 
					                                             OpDecorate %128 RelaxedPrecision 
					                                             OpDecorate %133 RelaxedPrecision 
					                                             OpDecorate %134 RelaxedPrecision 
					                                             OpDecorate %135 RelaxedPrecision 
					                                             OpDecorate %136 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %138 RelaxedPrecision 
					                                             OpDecorate %139 RelaxedPrecision 
					                                             OpDecorate %144 RelaxedPrecision 
					                                             OpDecorate %145 RelaxedPrecision 
					                                             OpDecorate %146 RelaxedPrecision 
					                                             OpDecorate %147 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %173 RelaxedPrecision 
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
					                                             OpDecorate %200 RelaxedPrecision 
					                                             OpDecorate %201 RelaxedPrecision 
					                                             OpDecorate %202 RelaxedPrecision 
					                                             OpDecorate %203 RelaxedPrecision 
					                                             OpDecorate %204 RelaxedPrecision 
					                                             OpDecorate %205 RelaxedPrecision 
					                                             OpDecorate %206 RelaxedPrecision 
					                                             OpDecorate %207 RelaxedPrecision 
					                                             OpDecorate %208 RelaxedPrecision 
					                                             OpDecorate %209 RelaxedPrecision 
					                                             OpDecorate %236 Location 236 
					                                             OpDecorate %245 RelaxedPrecision 
					                                             OpDecorate %246 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %13 = OpTypeVector %6 4 
					                                     %14 = OpTypeStruct %13 %6 %13 
					                                     %15 = OpTypePointer Uniform %14 
					Uniform struct {f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
					                                     %17 = OpTypeInt 32 1 
					                                 i32 %18 = OpConstant 2 
					                                     %19 = OpTypePointer Uniform %13 
					                                     %28 = OpTypePointer Private %13 
					                      Private f32_4* %29 = OpVariable Private 
					                                 i32 %31 = OpConstant 0 
					                      Private f32_4* %38 = OpVariable Private 
					                                 f32 %45 = OpConstant 3,674022E-40 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                               f32_4 %47 = OpConstantComposite %45 %45 %46 %46 
					                      Private f32_4* %49 = OpVariable Private 
					                                     %56 = OpTypePointer Private %6 
					                        Private f32* %57 = OpVariable Private 
					                                     %58 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %59 = OpTypePointer UniformConstant %58 
					UniformConstant read_only Texture2D* %60 = OpVariable UniformConstant 
					                                     %62 = OpTypeSampler 
					                                     %63 = OpTypePointer UniformConstant %62 
					            UniformConstant sampler* %64 = OpVariable UniformConstant 
					                                     %66 = OpTypeSampledImage %58 
					                                 f32 %70 = OpConstant 3,674022E-40 
					                                     %72 = OpTypeInt 32 0 
					                                 u32 %73 = OpConstant 0 
					                               f32_2 %81 = OpConstantComposite %45 %46 
					                      Private f32_4* %85 = OpVariable Private 
					                        Private f32* %92 = OpVariable Private 
					                       Private f32* %100 = OpVariable Private 
					                                f32 %103 = OpConstant 3,674022E-40 
					                       Private f32* %108 = OpVariable Private 
					                       Private f32* %126 = OpVariable Private 
					                       Private f32* %137 = OpVariable Private 
					                              f32_4 %166 = OpConstantComposite %70 %45 %70 %46 
					                       Private f32* %173 = OpVariable Private 
					                       Private f32* %181 = OpVariable Private 
					                       Private f32* %193 = OpVariable Private 
					                                u32 %210 = OpConstant 1 
					                                    %222 = OpTypeBool 
					                                    %223 = OpTypePointer Private %222 
					                      Private bool* %224 = OpVariable Private 
					                                i32 %225 = OpConstant 1 
					                                    %226 = OpTypePointer Uniform %6 
					                                    %235 = OpTypePointer Output %13 
					                      Output f32_4* %236 = OpVariable Output 
					                              f32_4 %237 = OpConstantComposite %70 %70 %70 %70 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
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
					                               f32_2 %30 = OpLoad %9 
					                      Uniform f32_4* %32 = OpAccessChain %16 %31 
					                               f32_4 %33 = OpLoad %32 
					                               f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                               f32_2 %35 = OpFMul %30 %34 
					                               f32_4 %36 = OpLoad %29 
					                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
					                                             OpStore %29 %37 
					                               f32_2 %39 = OpLoad %9 
					                               f32_4 %40 = OpVectorShuffle %39 %39 0 1 1 0 
					                      Uniform f32_4* %41 = OpAccessChain %16 %31 
					                               f32_4 %42 = OpLoad %41 
					                               f32_4 %43 = OpVectorShuffle %42 %42 0 1 1 0 
					                               f32_4 %44 = OpFMul %40 %43 
					                               f32_4 %48 = OpFAdd %44 %47 
					                                             OpStore %38 %48 
					                               f32_4 %50 = OpLoad %38 
					                               f32_4 %51 = OpVectorShuffle %50 %50 0 1 0 2 
					                      Uniform f32_4* %52 = OpAccessChain %16 %31 
					                               f32_4 %53 = OpLoad %52 
					                               f32_4 %54 = OpVectorShuffle %53 %53 0 1 0 1 
					                               f32_4 %55 = OpFDiv %51 %54 
					                                             OpStore %49 %55 
					                 read_only Texture2D %61 = OpLoad %60 
					                             sampler %65 = OpLoad %64 
					          read_only Texture2DSampled %67 = OpSampledImage %61 %65 
					                               f32_4 %68 = OpLoad %49 
					                               f32_2 %69 = OpVectorShuffle %68 %68 0 1 
					                               f32_4 %71 = OpImageSampleExplicitLod %67 %69 Lod %13 
					                                 f32 %74 = OpCompositeExtract %71 0 
					                                             OpStore %57 %74 
					                               f32_2 %75 = OpLoad %9 
					                               f32_2 %76 = OpVectorShuffle %75 %75 0 0 
					                      Uniform f32_4* %77 = OpAccessChain %16 %31 
					                               f32_4 %78 = OpLoad %77 
					                               f32_2 %79 = OpVectorShuffle %78 %78 0 0 
					                               f32_2 %80 = OpFMul %76 %79 
					                               f32_2 %82 = OpFAdd %80 %81 
					                               f32_4 %83 = OpLoad %29 
					                               f32_4 %84 = OpVectorShuffle %83 %82 0 1 4 5 
					                                             OpStore %29 %84 
					                               f32_4 %86 = OpLoad %29 
					                               f32_4 %87 = OpVectorShuffle %86 %86 2 1 3 1 
					                      Uniform f32_4* %88 = OpAccessChain %16 %31 
					                               f32_4 %89 = OpLoad %88 
					                               f32_4 %90 = OpVectorShuffle %89 %89 0 1 0 1 
					                               f32_4 %91 = OpFDiv %87 %90 
					                                             OpStore %85 %91 
					                 read_only Texture2D %93 = OpLoad %60 
					                             sampler %94 = OpLoad %64 
					          read_only Texture2DSampled %95 = OpSampledImage %93 %94 
					                               f32_4 %96 = OpLoad %85 
					                               f32_2 %97 = OpVectorShuffle %96 %96 0 1 
					                               f32_4 %98 = OpImageSampleExplicitLod %95 %97 Lod %13 
					                                 f32 %99 = OpCompositeExtract %98 0 
					                                             OpStore %92 %99 
					                                f32 %101 = OpLoad %92 
					                                f32 %102 = OpFNegate %101 
					                                f32 %104 = OpFMul %102 %103 
					                                f32 %105 = OpLoad %57 
					                                f32 %106 = OpFNegate %105 
					                                f32 %107 = OpFAdd %104 %106 
					                                             OpStore %100 %107 
					                read_only Texture2D %109 = OpLoad %60 
					                            sampler %110 = OpLoad %64 
					         read_only Texture2DSampled %111 = OpSampledImage %109 %110 
					                              f32_4 %112 = OpLoad %49 
					                              f32_2 %113 = OpVectorShuffle %112 %112 2 3 
					                              f32_4 %114 = OpImageSampleExplicitLod %111 %113 Lod %13 
					                                f32 %115 = OpCompositeExtract %114 0 
					                                             OpStore %108 %115 
					                                f32 %116 = OpLoad %100 
					                                f32 %117 = OpLoad %108 
					                                f32 %118 = OpFNegate %117 
					                                f32 %119 = OpFAdd %116 %118 
					                                             OpStore %100 %119 
					                              f32_4 %120 = OpLoad %38 
					                              f32_4 %121 = OpVectorShuffle %120 %120 3 1 3 2 
					                     Uniform f32_4* %122 = OpAccessChain %16 %31 
					                              f32_4 %123 = OpLoad %122 
					                              f32_4 %124 = OpVectorShuffle %123 %123 0 1 0 1 
					                              f32_4 %125 = OpFDiv %121 %124 
					                                             OpStore %38 %125 
					                read_only Texture2D %127 = OpLoad %60 
					                            sampler %128 = OpLoad %64 
					         read_only Texture2DSampled %129 = OpSampledImage %127 %128 
					                              f32_4 %130 = OpLoad %38 
					                              f32_2 %131 = OpVectorShuffle %130 %130 0 1 
					                              f32_4 %132 = OpImageSampleExplicitLod %129 %131 Lod %13 
					                                f32 %133 = OpCompositeExtract %132 0 
					                                             OpStore %126 %133 
					                                f32 %134 = OpLoad %100 
					                                f32 %135 = OpLoad %126 
					                                f32 %136 = OpFAdd %134 %135 
					                                             OpStore %100 %136 
					                read_only Texture2D %138 = OpLoad %60 
					                            sampler %139 = OpLoad %64 
					         read_only Texture2DSampled %140 = OpSampledImage %138 %139 
					                              f32_4 %141 = OpLoad %85 
					                              f32_2 %142 = OpVectorShuffle %141 %141 2 3 
					                              f32_4 %143 = OpImageSampleExplicitLod %140 %142 Lod %13 
					                                f32 %144 = OpCompositeExtract %143 0 
					                                             OpStore %137 %144 
					                                f32 %145 = OpLoad %137 
					                                f32 %146 = OpFMul %145 %103 
					                                f32 %147 = OpLoad %100 
					                                f32 %148 = OpFAdd %146 %147 
					                                             OpStore %100 %148 
					                read_only Texture2D %149 = OpLoad %60 
					                            sampler %150 = OpLoad %64 
					         read_only Texture2DSampled %151 = OpSampledImage %149 %150 
					                              f32_4 %152 = OpLoad %38 
					                              f32_2 %153 = OpVectorShuffle %152 %152 2 3 
					                              f32_4 %154 = OpImageSampleExplicitLod %151 %153 Lod %13 
					                                f32 %155 = OpCompositeExtract %154 0 
					                                             OpStore %137 %155 
					                                f32 %156 = OpLoad %100 
					                                f32 %157 = OpLoad %137 
					                                f32 %158 = OpFAdd %156 %157 
					                       Private f32* %159 = OpAccessChain %49 %73 
					                                             OpStore %159 %158 
					                              f32_2 %160 = OpLoad %9 
					                              f32_4 %161 = OpVectorShuffle %160 %160 0 1 0 1 
					                     Uniform f32_4* %162 = OpAccessChain %16 %31 
					                              f32_4 %163 = OpLoad %162 
					                              f32_4 %164 = OpVectorShuffle %163 %163 0 1 0 1 
					                              f32_4 %165 = OpFMul %161 %164 
					                              f32_4 %167 = OpFAdd %165 %166 
					                                             OpStore %85 %167 
					                              f32_4 %168 = OpLoad %85 
					                     Uniform f32_4* %169 = OpAccessChain %16 %31 
					                              f32_4 %170 = OpLoad %169 
					                              f32_4 %171 = OpVectorShuffle %170 %170 0 1 0 1 
					                              f32_4 %172 = OpFDiv %168 %171 
					                                             OpStore %85 %172 
					                read_only Texture2D %174 = OpLoad %60 
					                            sampler %175 = OpLoad %64 
					         read_only Texture2DSampled %176 = OpSampledImage %174 %175 
					                              f32_4 %177 = OpLoad %85 
					                              f32_2 %178 = OpVectorShuffle %177 %177 0 1 
					                              f32_4 %179 = OpImageSampleExplicitLod %176 %178 Lod %13 
					                                f32 %180 = OpCompositeExtract %179 0 
					                                             OpStore %173 %180 
					                                f32 %182 = OpLoad %173 
					                                f32 %183 = OpFMul %182 %103 
					                                f32 %184 = OpLoad %57 
					                                f32 %185 = OpFAdd %183 %184 
					                                             OpStore %181 %185 
					                                f32 %186 = OpLoad %126 
					                                f32 %187 = OpLoad %181 
					                                f32 %188 = OpFAdd %186 %187 
					                                             OpStore %181 %188 
					                                f32 %189 = OpLoad %108 
					                                f32 %190 = OpFNegate %189 
					                                f32 %191 = OpLoad %181 
					                                f32 %192 = OpFAdd %190 %191 
					                                             OpStore %181 %192 
					                read_only Texture2D %194 = OpLoad %60 
					                            sampler %195 = OpLoad %64 
					         read_only Texture2DSampled %196 = OpSampledImage %194 %195 
					                              f32_4 %197 = OpLoad %85 
					                              f32_2 %198 = OpVectorShuffle %197 %197 2 3 
					                              f32_4 %199 = OpImageSampleExplicitLod %196 %198 Lod %13 
					                                f32 %200 = OpCompositeExtract %199 0 
					                                             OpStore %193 %200 
					                                f32 %201 = OpLoad %193 
					                                f32 %202 = OpFNegate %201 
					                                f32 %203 = OpFMul %202 %103 
					                                f32 %204 = OpLoad %181 
					                                f32 %205 = OpFAdd %203 %204 
					                                             OpStore %181 %205 
					                                f32 %206 = OpLoad %137 
					                                f32 %207 = OpFNegate %206 
					                                f32 %208 = OpLoad %181 
					                                f32 %209 = OpFAdd %207 %208 
					                       Private f32* %211 = OpAccessChain %49 %210 
					                                             OpStore %211 %209 
					                              f32_4 %212 = OpLoad %49 
					                              f32_2 %213 = OpVectorShuffle %212 %212 0 1 
					                              f32_4 %214 = OpLoad %49 
					                              f32_2 %215 = OpVectorShuffle %214 %214 0 1 
					                                f32 %216 = OpDot %213 %215 
					                       Private f32* %217 = OpAccessChain %9 %73 
					                                             OpStore %217 %216 
					                       Private f32* %218 = OpAccessChain %9 %73 
					                                f32 %219 = OpLoad %218 
					                                f32 %220 = OpExtInst %1 31 %219 
					                       Private f32* %221 = OpAccessChain %9 %73 
					                                             OpStore %221 %220 
					                       Uniform f32* %227 = OpAccessChain %16 %225 
					                                f32 %228 = OpLoad %227 
					                       Private f32* %229 = OpAccessChain %9 %73 
					                                f32 %230 = OpLoad %229 
					                               bool %231 = OpFOrdLessThan %228 %230 
					                                             OpStore %224 %231 
					                               bool %232 = OpLoad %224 
					                                             OpSelectionMerge %234 None 
					                                             OpBranchConditional %232 %233 %238 
					                                    %233 = OpLabel 
					                                             OpStore %236 %237 
					                                             OpBranch %234 
					                                    %238 = OpLabel 
					                              f32_4 %239 = OpLoad %29 
					                              f32_2 %240 = OpVectorShuffle %239 %239 0 1 
					                     Uniform f32_4* %241 = OpAccessChain %16 %31 
					                              f32_4 %242 = OpLoad %241 
					                              f32_2 %243 = OpVectorShuffle %242 %242 0 1 
					                              f32_2 %244 = OpFDiv %240 %243 
					                                             OpStore %9 %244 
					                read_only Texture2D %245 = OpLoad %60 
					                            sampler %246 = OpLoad %64 
					         read_only Texture2DSampled %247 = OpSampledImage %245 %246 
					                              f32_2 %248 = OpLoad %9 
					                              f32_4 %249 = OpImageSampleExplicitLod %247 %248 Lod %13 
					                                             OpStore %236 %249 
					                                             OpBranch %234 
					                                    %234 = OpLabel 
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
						float _Threshold;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat10_6;
					vec4 u_xlat10_7;
					float u_xlat16_16;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xy = u_xlat0.xy * _ScreenResolution.xy;
					    u_xlat2 = u_xlat0.xyyx * _ScreenResolution.xyyx + vec4(-1.0, -1.0, 1.0, 1.0);
					    u_xlat3 = u_xlat2.xyxz / _ScreenResolution.xyxy;
					    u_xlat10_4 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					    u_xlat1.zw = u_xlat0.xx * _ScreenResolution.xx + vec2(-1.0, 1.0);
					    u_xlat5 = u_xlat1.zywy / _ScreenResolution.xyxy;
					    u_xlat10_6 = textureLod(_MainTex, u_xlat5.xy, 0.0);
					    u_xlat16_16 = (-u_xlat10_6.x) * 2.0 + (-u_xlat10_4.x);
					    u_xlat10_3 = textureLod(_MainTex, u_xlat3.zw, 0.0);
					    u_xlat16_16 = u_xlat16_16 + (-u_xlat10_3.x);
					    u_xlat2 = u_xlat2.wywz / _ScreenResolution.xyxy;
					    u_xlat10_6 = textureLod(_MainTex, u_xlat2.xy, 0.0);
					    u_xlat16_16 = u_xlat16_16 + u_xlat10_6.x;
					    u_xlat10_5 = textureLod(_MainTex, u_xlat5.zw, 0.0);
					    u_xlat16_16 = u_xlat10_5.x * 2.0 + u_xlat16_16;
					    u_xlat10_2 = textureLod(_MainTex, u_xlat2.zw, 0.0);
					    u_xlat5.x = u_xlat16_16 + u_xlat10_2.x;
					    u_xlat0 = u_xlat0.xyxy * _ScreenResolution.xyxy + vec4(0.0, -1.0, 0.0, 1.0);
					    u_xlat0 = u_xlat0 / _ScreenResolution.xyxy;
					    u_xlat10_7 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    u_xlat16_0 = u_xlat10_7.x * 2.0 + u_xlat10_4.x;
					    u_xlat16_0 = u_xlat10_6.x + u_xlat16_0;
					    u_xlat16_0 = (-u_xlat10_3.x) + u_xlat16_0;
					    u_xlat10_3 = textureLod(_MainTex, u_xlat0.zw, 0.0);
					    u_xlat16_0 = (-u_xlat10_3.x) * 2.0 + u_xlat16_0;
					    u_xlat5.y = (-u_xlat10_2.x) + u_xlat16_0;
					    u_xlat0.x = dot(u_xlat5.xy, u_xlat5.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb0 = _Threshold<u_xlat0.x;
					    if(u_xlatb0){
					        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    } else {
					        u_xlat0.xy = u_xlat1.xy / _ScreenResolution.xy;
					        SV_Target0 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    //ENDIF
					    }
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