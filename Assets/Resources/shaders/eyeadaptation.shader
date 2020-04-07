Shader "Hidden/Post FX/Eye Adaptation" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 43065
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 unity_DeltaTime;
					uniform 	vec4 _Params;
					uniform 	vec2 _Speed;
					uniform 	vec4 _ScaleOffsetRes;
					uniform 	float _ExposureCompensation;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					float u_xlat10_4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    u_xlat0 = _ExposureCompensation / u_xlat0;
					    u_xlat10_4 = texture(_MainTex, vec2(0.5, 0.5)).x;
					    u_xlat0 = (-u_xlat10_4) + u_xlat0;
					    u_xlatb8 = 0.0<u_xlat0;
					    u_xlat8 = (u_xlatb8) ? _Speed.x : _Speed.y;
					    u_xlat8 = u_xlat8 * (-unity_DeltaTime.x);
					    u_xlat8 = exp2(u_xlat8);
					    u_xlat8 = (-u_xlat8) + 1.0;
					    SV_Target0 = vec4(u_xlat0) * vec4(u_xlat8) + vec4(u_xlat10_4);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 258
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %245 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %23 ArrayStride 23 
					                                                      OpMemberDecorate %24 0 Offset 24 
					                                                      OpDecorate %25 ArrayStride 25 
					                                                      OpMemberDecorate %26 0 NonWritable 
					                                                      OpMemberDecorate %26 0 Offset 26 
					                                                      OpDecorate %26 BufferBlock 
					                                                      OpDecorate %28 DescriptorSet 28 
					                                                      OpDecorate %28 Binding 28 
					                                                      OpMemberDecorate %79 0 Offset 79 
					                                                      OpMemberDecorate %79 1 Offset 79 
					                                                      OpMemberDecorate %79 2 Offset 79 
					                                                      OpMemberDecorate %79 3 Offset 79 
					                                                      OpMemberDecorate %79 4 Offset 79 
					                                                      OpDecorate %79 Block 
					                                                      OpDecorate %81 DescriptorSet 81 
					                                                      OpDecorate %81 Binding 81 
					                                                      OpDecorate %199 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %202 DescriptorSet 202 
					                                                      OpDecorate %202 Binding 202 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %206 RelaxedPrecision 
					                                                      OpDecorate %206 DescriptorSet 206 
					                                                      OpDecorate %206 Binding 206 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %212 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %245 Location 245 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeInt 32 0 
					                                               %7 = OpTypePointer Private %6 
					                                  Private u32* %8 = OpVariable Private 
					                                           u32 %9 = OpConstant 0 
					                                              %10 = OpTypePointer Function %6 
					                                          u32 %18 = OpConstant 64 
					                                              %19 = OpTypeBool 
					                                 Private u32* %21 = OpVariable Private 
					                                          u32 %22 = OpConstant 1 
					                                              %23 = OpTypeArray %6 %22 
					                                              %24 = OpTypeStruct %23 
					                                              %25 = OpTypeRuntimeArray %24 
					                                              %26 = OpTypeStruct %25 
					                                              %27 = OpTypePointer Uniform %26 
					                          Uniform struct {;}* %28 = OpVariable Uniform 
					                                              %29 = OpTypeInt 32 1 
					                                          i32 %30 = OpConstant 0 
					                                              %32 = OpTypePointer Uniform %6 
					                                          i32 %39 = OpConstant 1 
					                                              %41 = OpTypeFloat 32 
					                                              %42 = OpTypePointer Private %41 
					                                 Private f32* %43 = OpVariable Private 
					                                          f32 %46 = OpConstant 3,674022E-40 
					                                 Private f32* %49 = OpVariable Private 
					                                          f32 %50 = OpConstant 3,674022E-40 
					                                 Private u32* %59 = OpVariable Private 
					                                 Private f32* %63 = OpVariable Private 
					                                              %73 = OpTypeVector %41 2 
					                                              %74 = OpTypePointer Private %73 
					                               Private f32_2* %75 = OpVariable Private 
					                                              %78 = OpTypeVector %41 4 
					                                              %79 = OpTypeStruct %78 %78 %73 %78 %41 
					                                              %80 = OpTypePointer Uniform %79 
					Uniform struct {f32_4; f32_4; f32_2; f32_4; f32;}* %81 = OpVariable Uniform 
					                                              %82 = OpTypePointer Uniform %78 
					                                              %87 = OpTypeVector %41 3 
					                                              %88 = OpTypePointer Private %87 
					                               Private f32_3* %89 = OpVariable Private 
					                               Private f32_2* %93 = OpVariable Private 
					                                Private u32* %104 = OpVariable Private 
					                                Private f32* %108 = OpVariable Private 
					                                Private f32* %111 = OpVariable Private 
					                              Private f32_2* %133 = OpVariable Private 
					                                         u32 %135 = OpConstant 2 
					                                Private f32* %147 = OpVariable Private 
					                                         f32 %151 = OpConstant 3,674022E-40 
					                                         i32 %153 = OpConstant 3 
					                                             %154 = OpTypePointer Uniform %41 
					                                         f32 %177 = OpConstant 3,674022E-40 
					                                         u32 %188 = OpConstant 3 
					                                         i32 %194 = OpConstant 4 
					                                Private f32* %199 = OpVariable Private 
					                                             %200 = OpTypeImage %41 Dim2D 0 0 0 1 Unknown 
					                                             %201 = OpTypePointer UniformConstant %200 
					        UniformConstant read_only Texture2D* %202 = OpVariable UniformConstant 
					                                             %204 = OpTypeSampler 
					                                             %205 = OpTypePointer UniformConstant %204 
					                    UniformConstant sampler* %206 = OpVariable UniformConstant 
					                                             %208 = OpTypeSampledImage %200 
					                                         f32 %210 = OpConstant 3,674022E-40 
					                                       f32_2 %211 = OpConstantComposite %210 %210 
					                                             %218 = OpTypePointer Private %19 
					                               Private bool* %219 = OpVariable Private 
					                                             %223 = OpTypePointer Function %41 
					                                         i32 %227 = OpConstant 2 
					                                             %244 = OpTypePointer Output %78 
					                               Output f32_4* %245 = OpVariable Output 
					                                Private u32* %255 = OpVariable Private 
					                               Private bool* %256 = OpVariable Private 
					                               Private bool* %257 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function u32* %11 = OpVariable Function 
					                                Function u32* %51 = OpVariable Function 
					                                Function u32* %96 = OpVariable Function 
					                               Function f32* %224 = OpVariable Function 
					                                                      OpStore %8 %9 
					                                                      OpStore %11 %9 
					                                                      OpBranch %12 
					                                              %12 = OpLabel 
					                                                      OpLoopMerge %14 %15 None 
					                                                      OpBranch %16 
					                                              %16 = OpLabel 
					                                          u32 %17 = OpLoad %11 
					                                         bool %20 = OpULessThan %17 %18 
					                                                      OpBranchConditional %20 %13 %14 
					                                              %13 = OpLabel 
					                                          u32 %31 = OpLoad %11 
					                                 Uniform u32* %33 = OpAccessChain %28 %30 %31 %30 %30 
					                                          u32 %34 = OpLoad %33 
					                                                      OpStore %21 %34 
					                                          u32 %35 = OpLoad %21 
					                                          u32 %36 = OpLoad %8 
					                                          u32 %37 = OpExtInst %1 41 %35 %36 
					                                                      OpStore %8 %37 
					                                                      OpBranch %15 
					                                              %15 = OpLabel 
					                                          u32 %38 = OpLoad %11 
					                                          u32 %40 = OpIAdd %38 %39 
					                                                      OpStore %11 %40 
					                                                      OpBranch %12 
					                                              %14 = OpLabel 
					                                          u32 %44 = OpLoad %8 
					                                          f32 %45 = OpConvertUToF %44 
					                                                      OpStore %43 %45 
					                                          f32 %47 = OpLoad %43 
					                                          f32 %48 = OpFDiv %46 %47 
					                                                      OpStore %43 %48 
					                                                      OpStore %49 %50 
					                                                      OpStore %51 %9 
					                                                      OpBranch %52 
					                                              %52 = OpLabel 
					                                                      OpLoopMerge %54 %55 None 
					                                                      OpBranch %56 
					                                              %56 = OpLabel 
					                                          u32 %57 = OpLoad %51 
					                                         bool %58 = OpULessThan %57 %18 
					                                                      OpBranchConditional %58 %53 %54 
					                                              %53 = OpLabel 
					                                          u32 %60 = OpLoad %51 
					                                 Uniform u32* %61 = OpAccessChain %28 %30 %60 %30 %30 
					                                          u32 %62 = OpLoad %61 
					                                                      OpStore %59 %62 
					                                          u32 %64 = OpLoad %59 
					                                          f32 %65 = OpConvertUToF %64 
					                                                      OpStore %63 %65 
					                                          f32 %66 = OpLoad %63 
					                                          f32 %67 = OpLoad %43 
					                                          f32 %68 = OpFMul %66 %67 
					                                          f32 %69 = OpLoad %49 
					                                          f32 %70 = OpFAdd %68 %69 
					                                                      OpStore %49 %70 
					                                                      OpBranch %55 
					                                              %55 = OpLabel 
					                                          u32 %71 = OpLoad %51 
					                                          u32 %72 = OpIAdd %71 %39 
					                                                      OpStore %51 %72 
					                                                      OpBranch %52 
					                                              %54 = OpLabel 
					                                          f32 %76 = OpLoad %49 
					                                        f32_2 %77 = OpCompositeConstruct %76 %76 
					                               Uniform f32_4* %83 = OpAccessChain %81 %39 
					                                        f32_4 %84 = OpLoad %83 
					                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                        f32_2 %86 = OpFMul %77 %85 
					                                                      OpStore %75 %86 
					                                        f32_2 %90 = OpLoad %75 
					                                        f32_3 %91 = OpLoad %89 
					                                        f32_3 %92 = OpVectorShuffle %91 %90 3 4 2 
					                                                      OpStore %89 %92 
					                                 Private f32* %94 = OpAccessChain %93 %9 
					                                                      OpStore %94 %50 
					                                 Private f32* %95 = OpAccessChain %93 %22 
					                                                      OpStore %95 %50 
					                                                      OpStore %96 %9 
					                                                      OpBranch %97 
					                                              %97 = OpLabel 
					                                                      OpLoopMerge %99 %100 None 
					                                                      OpBranch %101 
					                                             %101 = OpLabel 
					                                         u32 %102 = OpLoad %96 
					                                        bool %103 = OpULessThan %102 %18 
					                                                      OpBranchConditional %103 %98 %99 
					                                              %98 = OpLabel 
					                                         u32 %105 = OpLoad %96 
					                                Uniform u32* %106 = OpAccessChain %28 %30 %105 %30 %30 
					                                         u32 %107 = OpLoad %106 
					                                                      OpStore %104 %107 
					                                         u32 %109 = OpLoad %104 
					                                         f32 %110 = OpConvertUToF %109 
					                                                      OpStore %108 %110 
					                                         f32 %112 = OpLoad %43 
					                                         f32 %113 = OpLoad %108 
					                                         f32 %114 = OpFMul %112 %113 
					                                                      OpStore %111 %114 
					                                Private f32* %115 = OpAccessChain %89 %9 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpLoad %111 
					                                         f32 %118 = OpExtInst %1 37 %116 %117 
					                                                      OpStore %111 %118 
					                                         f32 %119 = OpLoad %108 
					                                         f32 %120 = OpLoad %43 
					                                         f32 %121 = OpFMul %119 %120 
					                                         f32 %122 = OpLoad %111 
					                                         f32 %123 = OpFNegate %122 
					                                         f32 %124 = OpFAdd %121 %123 
					                                                      OpStore %108 %124 
					                                       f32_3 %125 = OpLoad %89 
					                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                                         f32 %127 = OpLoad %111 
					                                       f32_2 %128 = OpCompositeConstruct %127 %127 
					                                       f32_2 %129 = OpFNegate %128 
					                                       f32_2 %130 = OpFAdd %126 %129 
					                                       f32_3 %131 = OpLoad %89 
					                                       f32_3 %132 = OpVectorShuffle %131 %130 3 1 4 
					                                                      OpStore %89 %132 
					                                         f32 %134 = OpLoad %108 
					                                Private f32* %136 = OpAccessChain %89 %135 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpExtInst %1 37 %134 %137 
					                                Private f32* %139 = OpAccessChain %133 %22 
					                                                      OpStore %139 %138 
					                                Private f32* %140 = OpAccessChain %89 %135 
					                                         f32 %141 = OpLoad %140 
					                                Private f32* %142 = OpAccessChain %133 %22 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpFNegate %143 
					                                         f32 %145 = OpFAdd %141 %144 
					                                Private f32* %146 = OpAccessChain %89 %22 
					                                                      OpStore %146 %145 
					                                         u32 %148 = OpLoad %96 
					                                         f32 %149 = OpConvertUToF %148 
					                                                      OpStore %147 %149 
					                                         f32 %150 = OpLoad %147 
					                                         f32 %152 = OpFMul %150 %151 
					                                Uniform f32* %155 = OpAccessChain %81 %153 %22 
					                                         f32 %156 = OpLoad %155 
					                                         f32 %157 = OpFNegate %156 
					                                         f32 %158 = OpFAdd %152 %157 
					                                                      OpStore %147 %158 
					                                         f32 %159 = OpLoad %147 
					                                Uniform f32* %160 = OpAccessChain %81 %153 %9 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %162 = OpFDiv %159 %161 
					                                                      OpStore %147 %162 
					                                         f32 %163 = OpLoad %147 
					                                         f32 %164 = OpExtInst %1 29 %163 
					                                                      OpStore %147 %164 
					                                Private f32* %165 = OpAccessChain %133 %22 
					                                         f32 %166 = OpLoad %165 
					                                         f32 %167 = OpLoad %147 
					                                         f32 %168 = OpFMul %166 %167 
					                                Private f32* %169 = OpAccessChain %133 %9 
					                                                      OpStore %169 %168 
					                                       f32_2 %170 = OpLoad %133 
					                                       f32_2 %171 = OpLoad %93 
					                                       f32_2 %172 = OpFAdd %170 %171 
					                                                      OpStore %93 %172 
					                                                      OpBranch %100 
					                                             %100 = OpLabel 
					                                         u32 %173 = OpLoad %96 
					                                         u32 %174 = OpIAdd %173 %39 
					                                                      OpStore %96 %174 
					                                                      OpBranch %97 
					                                              %99 = OpLabel 
					                                Private f32* %175 = OpAccessChain %93 %22 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %178 = OpExtInst %1 40 %176 %177 
					                                                      OpStore %43 %178 
					                                Private f32* %179 = OpAccessChain %93 %9 
					                                         f32 %180 = OpLoad %179 
					                                         f32 %181 = OpLoad %43 
					                                         f32 %182 = OpFDiv %180 %181 
					                                                      OpStore %43 %182 
					                                         f32 %183 = OpLoad %43 
					                                Uniform f32* %184 = OpAccessChain %81 %39 %135 
					                                         f32 %185 = OpLoad %184 
					                                         f32 %186 = OpExtInst %1 40 %183 %185 
					                                                      OpStore %43 %186 
					                                         f32 %187 = OpLoad %43 
					                                Uniform f32* %189 = OpAccessChain %81 %39 %188 
					                                         f32 %190 = OpLoad %189 
					                                         f32 %191 = OpExtInst %1 37 %187 %190 
					                                                      OpStore %43 %191 
					                                         f32 %192 = OpLoad %43 
					                                         f32 %193 = OpExtInst %1 40 %192 %177 
					                                                      OpStore %43 %193 
					                                Uniform f32* %195 = OpAccessChain %81 %194 
					                                         f32 %196 = OpLoad %195 
					                                         f32 %197 = OpLoad %43 
					                                         f32 %198 = OpFDiv %196 %197 
					                                                      OpStore %43 %198 
					                         read_only Texture2D %203 = OpLoad %202 
					                                     sampler %207 = OpLoad %206 
					                  read_only Texture2DSampled %209 = OpSampledImage %203 %207 
					                                       f32_4 %212 = OpImageSampleImplicitLod %209 %211 
					                                         f32 %213 = OpCompositeExtract %212 0 
					                                                      OpStore %199 %213 
					                                         f32 %214 = OpLoad %199 
					                                         f32 %215 = OpFNegate %214 
					                                         f32 %216 = OpLoad %43 
					                                         f32 %217 = OpFAdd %215 %216 
					                                                      OpStore %43 %217 
					                                         f32 %220 = OpLoad %43 
					                                        bool %221 = OpFOrdLessThan %50 %220 
					                                                      OpStore %219 %221 
					                                        bool %222 = OpLoad %219 
					                                                      OpSelectionMerge %226 None 
					                                                      OpBranchConditional %222 %225 %230 
					                                             %225 = OpLabel 
					                                Uniform f32* %228 = OpAccessChain %81 %227 %9 
					                                         f32 %229 = OpLoad %228 
					                                                      OpStore %224 %229 
					                                                      OpBranch %226 
					                                             %230 = OpLabel 
					                                Uniform f32* %231 = OpAccessChain %81 %227 %22 
					                                         f32 %232 = OpLoad %231 
					                                                      OpStore %224 %232 
					                                                      OpBranch %226 
					                                             %226 = OpLabel 
					                                         f32 %233 = OpLoad %224 
					                                                      OpStore %49 %233 
					                                         f32 %234 = OpLoad %49 
					                                Uniform f32* %235 = OpAccessChain %81 %30 %9 
					                                         f32 %236 = OpLoad %235 
					                                         f32 %237 = OpFNegate %236 
					                                         f32 %238 = OpFMul %234 %237 
					                                                      OpStore %49 %238 
					                                         f32 %239 = OpLoad %49 
					                                         f32 %240 = OpExtInst %1 29 %239 
					                                                      OpStore %49 %240 
					                                         f32 %241 = OpLoad %49 
					                                         f32 %242 = OpFNegate %241 
					                                         f32 %243 = OpFAdd %242 %46 
					                                                      OpStore %49 %243 
					                                         f32 %246 = OpLoad %43 
					                                       f32_4 %247 = OpCompositeConstruct %246 %246 %246 %246 
					                                         f32 %248 = OpLoad %49 
					                                       f32_4 %249 = OpCompositeConstruct %248 %248 %248 %248 
					                                       f32_4 %250 = OpFMul %247 %249 
					                                         f32 %251 = OpLoad %199 
					                                       f32_4 %252 = OpCompositeConstruct %251 %251 %251 %251 
					                                       f32_4 %253 = OpFAdd %250 %252 
					                                                      OpStore %245 %253 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 unity_DeltaTime;
					uniform 	vec4 _Params;
					uniform 	vec2 _Speed;
					uniform 	vec4 _ScaleOffsetRes;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					float u_xlat10_4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    u_xlat4.x = u_xlat0 + 1.0;
					    u_xlat4.x = log2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 2.0;
					    u_xlat4.x = 2.0 / u_xlat4.x;
					    u_xlat4.x = (-u_xlat4.x) + 1.02999997;
					    u_xlat0 = u_xlat4.x / u_xlat0;
					    u_xlat10_4 = texture(_MainTex, vec2(0.5, 0.5)).x;
					    u_xlat0 = (-u_xlat10_4) + u_xlat0;
					    u_xlatb8 = 0.0<u_xlat0;
					    u_xlat8 = (u_xlatb8) ? _Speed.x : _Speed.y;
					    u_xlat8 = u_xlat8 * (-unity_DeltaTime.x);
					    u_xlat8 = exp2(u_xlat8);
					    u_xlat8 = (-u_xlat8) + 1.0;
					    SV_Target0 = vec4(u_xlat0) * vec4(u_xlat8) + vec4(u_xlat10_4);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 279
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %266 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpDecorate %23 ArrayStride 23 
					                                                      OpMemberDecorate %24 0 Offset 24 
					                                                      OpDecorate %25 ArrayStride 25 
					                                                      OpMemberDecorate %26 0 NonWritable 
					                                                      OpMemberDecorate %26 0 Offset 26 
					                                                      OpDecorate %26 BufferBlock 
					                                                      OpDecorate %28 DescriptorSet 28 
					                                                      OpDecorate %28 Binding 28 
					                                                      OpMemberDecorate %79 0 Offset 79 
					                                                      OpMemberDecorate %79 1 Offset 79 
					                                                      OpMemberDecorate %79 2 Offset 79 
					                                                      OpMemberDecorate %79 3 Offset 79 
					                                                      OpDecorate %79 Block 
					                                                      OpDecorate %81 DescriptorSet 81 
					                                                      OpDecorate %81 Binding 81 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %223 DescriptorSet 223 
					                                                      OpDecorate %223 Binding 223 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %227 DescriptorSet 227 
					                                                      OpDecorate %227 Binding 227 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %266 Location 266 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeInt 32 0 
					                                               %7 = OpTypePointer Private %6 
					                                  Private u32* %8 = OpVariable Private 
					                                           u32 %9 = OpConstant 0 
					                                              %10 = OpTypePointer Function %6 
					                                          u32 %18 = OpConstant 64 
					                                              %19 = OpTypeBool 
					                                 Private u32* %21 = OpVariable Private 
					                                          u32 %22 = OpConstant 1 
					                                              %23 = OpTypeArray %6 %22 
					                                              %24 = OpTypeStruct %23 
					                                              %25 = OpTypeRuntimeArray %24 
					                                              %26 = OpTypeStruct %25 
					                                              %27 = OpTypePointer Uniform %26 
					                          Uniform struct {;}* %28 = OpVariable Uniform 
					                                              %29 = OpTypeInt 32 1 
					                                          i32 %30 = OpConstant 0 
					                                              %32 = OpTypePointer Uniform %6 
					                                          i32 %39 = OpConstant 1 
					                                              %41 = OpTypeFloat 32 
					                                              %42 = OpTypePointer Private %41 
					                                 Private f32* %43 = OpVariable Private 
					                                          f32 %46 = OpConstant 3,674022E-40 
					                                 Private f32* %49 = OpVariable Private 
					                                          f32 %50 = OpConstant 3,674022E-40 
					                                 Private u32* %59 = OpVariable Private 
					                                 Private f32* %63 = OpVariable Private 
					                                              %73 = OpTypeVector %41 2 
					                                              %74 = OpTypePointer Private %73 
					                               Private f32_2* %75 = OpVariable Private 
					                                              %78 = OpTypeVector %41 4 
					                                              %79 = OpTypeStruct %78 %78 %73 %78 
					                                              %80 = OpTypePointer Uniform %79 
					Uniform struct {f32_4; f32_4; f32_2; f32_4;}* %81 = OpVariable Uniform 
					                                              %82 = OpTypePointer Uniform %78 
					                                              %87 = OpTypeVector %41 3 
					                                              %88 = OpTypePointer Private %87 
					                               Private f32_3* %89 = OpVariable Private 
					                               Private f32_2* %93 = OpVariable Private 
					                                Private u32* %104 = OpVariable Private 
					                                Private f32* %108 = OpVariable Private 
					                                Private f32* %111 = OpVariable Private 
					                              Private f32_2* %133 = OpVariable Private 
					                                         u32 %135 = OpConstant 2 
					                                Private f32* %147 = OpVariable Private 
					                                         f32 %151 = OpConstant 3,674022E-40 
					                                         i32 %153 = OpConstant 3 
					                                             %154 = OpTypePointer Uniform %41 
					                                         f32 %177 = OpConstant 3,674022E-40 
					                                         u32 %188 = OpConstant 3 
					                                         f32 %203 = OpConstant 3,674022E-40 
					                                         f32 %213 = OpConstant 3,674022E-40 
					                                Private f32* %220 = OpVariable Private 
					                                             %221 = OpTypeImage %41 Dim2D 0 0 0 1 Unknown 
					                                             %222 = OpTypePointer UniformConstant %221 
					        UniformConstant read_only Texture2D* %223 = OpVariable UniformConstant 
					                                             %225 = OpTypeSampler 
					                                             %226 = OpTypePointer UniformConstant %225 
					                    UniformConstant sampler* %227 = OpVariable UniformConstant 
					                                             %229 = OpTypeSampledImage %221 
					                                         f32 %231 = OpConstant 3,674022E-40 
					                                       f32_2 %232 = OpConstantComposite %231 %231 
					                                             %239 = OpTypePointer Private %19 
					                               Private bool* %240 = OpVariable Private 
					                                             %244 = OpTypePointer Function %41 
					                                         i32 %248 = OpConstant 2 
					                                             %265 = OpTypePointer Output %78 
					                               Output f32_4* %266 = OpVariable Output 
					                                Private u32* %276 = OpVariable Private 
					                               Private bool* %277 = OpVariable Private 
					                               Private bool* %278 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function u32* %11 = OpVariable Function 
					                                Function u32* %51 = OpVariable Function 
					                                Function u32* %96 = OpVariable Function 
					                               Function f32* %245 = OpVariable Function 
					                                                      OpStore %8 %9 
					                                                      OpStore %11 %9 
					                                                      OpBranch %12 
					                                              %12 = OpLabel 
					                                                      OpLoopMerge %14 %15 None 
					                                                      OpBranch %16 
					                                              %16 = OpLabel 
					                                          u32 %17 = OpLoad %11 
					                                         bool %20 = OpULessThan %17 %18 
					                                                      OpBranchConditional %20 %13 %14 
					                                              %13 = OpLabel 
					                                          u32 %31 = OpLoad %11 
					                                 Uniform u32* %33 = OpAccessChain %28 %30 %31 %30 %30 
					                                          u32 %34 = OpLoad %33 
					                                                      OpStore %21 %34 
					                                          u32 %35 = OpLoad %21 
					                                          u32 %36 = OpLoad %8 
					                                          u32 %37 = OpExtInst %1 41 %35 %36 
					                                                      OpStore %8 %37 
					                                                      OpBranch %15 
					                                              %15 = OpLabel 
					                                          u32 %38 = OpLoad %11 
					                                          u32 %40 = OpIAdd %38 %39 
					                                                      OpStore %11 %40 
					                                                      OpBranch %12 
					                                              %14 = OpLabel 
					                                          u32 %44 = OpLoad %8 
					                                          f32 %45 = OpConvertUToF %44 
					                                                      OpStore %43 %45 
					                                          f32 %47 = OpLoad %43 
					                                          f32 %48 = OpFDiv %46 %47 
					                                                      OpStore %43 %48 
					                                                      OpStore %49 %50 
					                                                      OpStore %51 %9 
					                                                      OpBranch %52 
					                                              %52 = OpLabel 
					                                                      OpLoopMerge %54 %55 None 
					                                                      OpBranch %56 
					                                              %56 = OpLabel 
					                                          u32 %57 = OpLoad %51 
					                                         bool %58 = OpULessThan %57 %18 
					                                                      OpBranchConditional %58 %53 %54 
					                                              %53 = OpLabel 
					                                          u32 %60 = OpLoad %51 
					                                 Uniform u32* %61 = OpAccessChain %28 %30 %60 %30 %30 
					                                          u32 %62 = OpLoad %61 
					                                                      OpStore %59 %62 
					                                          u32 %64 = OpLoad %59 
					                                          f32 %65 = OpConvertUToF %64 
					                                                      OpStore %63 %65 
					                                          f32 %66 = OpLoad %63 
					                                          f32 %67 = OpLoad %43 
					                                          f32 %68 = OpFMul %66 %67 
					                                          f32 %69 = OpLoad %49 
					                                          f32 %70 = OpFAdd %68 %69 
					                                                      OpStore %49 %70 
					                                                      OpBranch %55 
					                                              %55 = OpLabel 
					                                          u32 %71 = OpLoad %51 
					                                          u32 %72 = OpIAdd %71 %39 
					                                                      OpStore %51 %72 
					                                                      OpBranch %52 
					                                              %54 = OpLabel 
					                                          f32 %76 = OpLoad %49 
					                                        f32_2 %77 = OpCompositeConstruct %76 %76 
					                               Uniform f32_4* %83 = OpAccessChain %81 %39 
					                                        f32_4 %84 = OpLoad %83 
					                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                                        f32_2 %86 = OpFMul %77 %85 
					                                                      OpStore %75 %86 
					                                        f32_2 %90 = OpLoad %75 
					                                        f32_3 %91 = OpLoad %89 
					                                        f32_3 %92 = OpVectorShuffle %91 %90 3 4 2 
					                                                      OpStore %89 %92 
					                                 Private f32* %94 = OpAccessChain %93 %9 
					                                                      OpStore %94 %50 
					                                 Private f32* %95 = OpAccessChain %93 %22 
					                                                      OpStore %95 %50 
					                                                      OpStore %96 %9 
					                                                      OpBranch %97 
					                                              %97 = OpLabel 
					                                                      OpLoopMerge %99 %100 None 
					                                                      OpBranch %101 
					                                             %101 = OpLabel 
					                                         u32 %102 = OpLoad %96 
					                                        bool %103 = OpULessThan %102 %18 
					                                                      OpBranchConditional %103 %98 %99 
					                                              %98 = OpLabel 
					                                         u32 %105 = OpLoad %96 
					                                Uniform u32* %106 = OpAccessChain %28 %30 %105 %30 %30 
					                                         u32 %107 = OpLoad %106 
					                                                      OpStore %104 %107 
					                                         u32 %109 = OpLoad %104 
					                                         f32 %110 = OpConvertUToF %109 
					                                                      OpStore %108 %110 
					                                         f32 %112 = OpLoad %43 
					                                         f32 %113 = OpLoad %108 
					                                         f32 %114 = OpFMul %112 %113 
					                                                      OpStore %111 %114 
					                                Private f32* %115 = OpAccessChain %89 %9 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpLoad %111 
					                                         f32 %118 = OpExtInst %1 37 %116 %117 
					                                                      OpStore %111 %118 
					                                         f32 %119 = OpLoad %108 
					                                         f32 %120 = OpLoad %43 
					                                         f32 %121 = OpFMul %119 %120 
					                                         f32 %122 = OpLoad %111 
					                                         f32 %123 = OpFNegate %122 
					                                         f32 %124 = OpFAdd %121 %123 
					                                                      OpStore %108 %124 
					                                       f32_3 %125 = OpLoad %89 
					                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                                         f32 %127 = OpLoad %111 
					                                       f32_2 %128 = OpCompositeConstruct %127 %127 
					                                       f32_2 %129 = OpFNegate %128 
					                                       f32_2 %130 = OpFAdd %126 %129 
					                                       f32_3 %131 = OpLoad %89 
					                                       f32_3 %132 = OpVectorShuffle %131 %130 3 1 4 
					                                                      OpStore %89 %132 
					                                         f32 %134 = OpLoad %108 
					                                Private f32* %136 = OpAccessChain %89 %135 
					                                         f32 %137 = OpLoad %136 
					                                         f32 %138 = OpExtInst %1 37 %134 %137 
					                                Private f32* %139 = OpAccessChain %133 %22 
					                                                      OpStore %139 %138 
					                                Private f32* %140 = OpAccessChain %89 %135 
					                                         f32 %141 = OpLoad %140 
					                                Private f32* %142 = OpAccessChain %133 %22 
					                                         f32 %143 = OpLoad %142 
					                                         f32 %144 = OpFNegate %143 
					                                         f32 %145 = OpFAdd %141 %144 
					                                Private f32* %146 = OpAccessChain %89 %22 
					                                                      OpStore %146 %145 
					                                         u32 %148 = OpLoad %96 
					                                         f32 %149 = OpConvertUToF %148 
					                                                      OpStore %147 %149 
					                                         f32 %150 = OpLoad %147 
					                                         f32 %152 = OpFMul %150 %151 
					                                Uniform f32* %155 = OpAccessChain %81 %153 %22 
					                                         f32 %156 = OpLoad %155 
					                                         f32 %157 = OpFNegate %156 
					                                         f32 %158 = OpFAdd %152 %157 
					                                                      OpStore %147 %158 
					                                         f32 %159 = OpLoad %147 
					                                Uniform f32* %160 = OpAccessChain %81 %153 %9 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %162 = OpFDiv %159 %161 
					                                                      OpStore %147 %162 
					                                         f32 %163 = OpLoad %147 
					                                         f32 %164 = OpExtInst %1 29 %163 
					                                                      OpStore %147 %164 
					                                Private f32* %165 = OpAccessChain %133 %22 
					                                         f32 %166 = OpLoad %165 
					                                         f32 %167 = OpLoad %147 
					                                         f32 %168 = OpFMul %166 %167 
					                                Private f32* %169 = OpAccessChain %133 %9 
					                                                      OpStore %169 %168 
					                                       f32_2 %170 = OpLoad %133 
					                                       f32_2 %171 = OpLoad %93 
					                                       f32_2 %172 = OpFAdd %170 %171 
					                                                      OpStore %93 %172 
					                                                      OpBranch %100 
					                                             %100 = OpLabel 
					                                         u32 %173 = OpLoad %96 
					                                         u32 %174 = OpIAdd %173 %39 
					                                                      OpStore %96 %174 
					                                                      OpBranch %97 
					                                              %99 = OpLabel 
					                                Private f32* %175 = OpAccessChain %93 %22 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %178 = OpExtInst %1 40 %176 %177 
					                                                      OpStore %43 %178 
					                                Private f32* %179 = OpAccessChain %93 %9 
					                                         f32 %180 = OpLoad %179 
					                                         f32 %181 = OpLoad %43 
					                                         f32 %182 = OpFDiv %180 %181 
					                                                      OpStore %43 %182 
					                                         f32 %183 = OpLoad %43 
					                                Uniform f32* %184 = OpAccessChain %81 %39 %135 
					                                         f32 %185 = OpLoad %184 
					                                         f32 %186 = OpExtInst %1 40 %183 %185 
					                                                      OpStore %43 %186 
					                                         f32 %187 = OpLoad %43 
					                                Uniform f32* %189 = OpAccessChain %81 %39 %188 
					                                         f32 %190 = OpLoad %189 
					                                         f32 %191 = OpExtInst %1 37 %187 %190 
					                                                      OpStore %43 %191 
					                                         f32 %192 = OpLoad %43 
					                                         f32 %193 = OpExtInst %1 40 %192 %177 
					                                                      OpStore %43 %193 
					                                         f32 %194 = OpLoad %43 
					                                         f32 %195 = OpFAdd %194 %46 
					                                Private f32* %196 = OpAccessChain %75 %9 
					                                                      OpStore %196 %195 
					                                Private f32* %197 = OpAccessChain %75 %9 
					                                         f32 %198 = OpLoad %197 
					                                         f32 %199 = OpExtInst %1 30 %198 
					                                Private f32* %200 = OpAccessChain %75 %9 
					                                                      OpStore %200 %199 
					                                Private f32* %201 = OpAccessChain %75 %9 
					                                         f32 %202 = OpLoad %201 
					                                         f32 %204 = OpFAdd %202 %203 
					                                Private f32* %205 = OpAccessChain %75 %9 
					                                                      OpStore %205 %204 
					                                Private f32* %206 = OpAccessChain %75 %9 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFDiv %203 %207 
					                                Private f32* %209 = OpAccessChain %75 %9 
					                                                      OpStore %209 %208 
					                                Private f32* %210 = OpAccessChain %75 %9 
					                                         f32 %211 = OpLoad %210 
					                                         f32 %212 = OpFNegate %211 
					                                         f32 %214 = OpFAdd %212 %213 
					                                Private f32* %215 = OpAccessChain %75 %9 
					                                                      OpStore %215 %214 
					                                Private f32* %216 = OpAccessChain %75 %9 
					                                         f32 %217 = OpLoad %216 
					                                         f32 %218 = OpLoad %43 
					                                         f32 %219 = OpFDiv %217 %218 
					                                                      OpStore %43 %219 
					                         read_only Texture2D %224 = OpLoad %223 
					                                     sampler %228 = OpLoad %227 
					                  read_only Texture2DSampled %230 = OpSampledImage %224 %228 
					                                       f32_4 %233 = OpImageSampleImplicitLod %230 %232 
					                                         f32 %234 = OpCompositeExtract %233 0 
					                                                      OpStore %220 %234 
					                                         f32 %235 = OpLoad %220 
					                                         f32 %236 = OpFNegate %235 
					                                         f32 %237 = OpLoad %43 
					                                         f32 %238 = OpFAdd %236 %237 
					                                                      OpStore %43 %238 
					                                         f32 %241 = OpLoad %43 
					                                        bool %242 = OpFOrdLessThan %50 %241 
					                                                      OpStore %240 %242 
					                                        bool %243 = OpLoad %240 
					                                                      OpSelectionMerge %247 None 
					                                                      OpBranchConditional %243 %246 %251 
					                                             %246 = OpLabel 
					                                Uniform f32* %249 = OpAccessChain %81 %248 %9 
					                                         f32 %250 = OpLoad %249 
					                                                      OpStore %245 %250 
					                                                      OpBranch %247 
					                                             %251 = OpLabel 
					                                Uniform f32* %252 = OpAccessChain %81 %248 %22 
					                                         f32 %253 = OpLoad %252 
					                                                      OpStore %245 %253 
					                                                      OpBranch %247 
					                                             %247 = OpLabel 
					                                         f32 %254 = OpLoad %245 
					                                                      OpStore %49 %254 
					                                         f32 %255 = OpLoad %49 
					                                Uniform f32* %256 = OpAccessChain %81 %30 %9 
					                                         f32 %257 = OpLoad %256 
					                                         f32 %258 = OpFNegate %257 
					                                         f32 %259 = OpFMul %255 %258 
					                                                      OpStore %49 %259 
					                                         f32 %260 = OpLoad %49 
					                                         f32 %261 = OpExtInst %1 29 %260 
					                                                      OpStore %49 %261 
					                                         f32 %262 = OpLoad %49 
					                                         f32 %263 = OpFNegate %262 
					                                         f32 %264 = OpFAdd %263 %46 
					                                                      OpStore %49 %264 
					                                         f32 %267 = OpLoad %43 
					                                       f32_4 %268 = OpCompositeConstruct %267 %267 %267 %267 
					                                         f32 %269 = OpLoad %49 
					                                       f32_4 %270 = OpCompositeConstruct %269 %269 %269 %269 
					                                       f32_4 %271 = OpFMul %268 %270 
					                                         f32 %272 = OpLoad %220 
					                                       f32_4 %273 = OpCompositeConstruct %272 %272 %272 %272 
					                                       f32_4 %274 = OpFAdd %271 %273 
					                                                      OpStore %266 %274 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec2 _Speed;
						vec4 _ScaleOffsetRes;
						float _ExposureCompensation;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[3];
						vec4 unity_DeltaTime;
						vec4 unused_1_2[5];
					};
					layout(location = 3) uniform  sampler2D _MainTex;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					float u_xlat10_4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    u_xlat0 = _ExposureCompensation / u_xlat0;
					    u_xlat10_4 = texture(_MainTex, vec2(0.5, 0.5)).x;
					    u_xlat0 = (-u_xlat10_4) + u_xlat0;
					    u_xlatb8 = 0.0<u_xlat0;
					    u_xlat8 = (u_xlatb8) ? _Speed.x : _Speed.y;
					    u_xlat8 = u_xlat8 * (-unity_DeltaTime.x);
					    u_xlat8 = exp2(u_xlat8);
					    u_xlat8 = (-u_xlat8) + 1.0;
					    SV_Target0 = vec4(u_xlat0) * vec4(u_xlat8) + vec4(u_xlat10_4);
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec2 _Speed;
						vec4 _ScaleOffsetRes;
						vec4 unused_0_4;
					};
					layout(binding = 1, std140) uniform UnityPerCamera {
						vec4 unused_1_0[3];
						vec4 unity_DeltaTime;
						vec4 unused_1_2[5];
					};
					layout(location = 3) uniform  sampler2D _MainTex;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					float u_xlat10_4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    u_xlat4.x = u_xlat0 + 1.0;
					    u_xlat4.x = log2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 2.0;
					    u_xlat4.x = 2.0 / u_xlat4.x;
					    u_xlat4.x = (-u_xlat4.x) + 1.02999997;
					    u_xlat0 = u_xlat4.x / u_xlat0;
					    u_xlat10_4 = texture(_MainTex, vec2(0.5, 0.5)).x;
					    u_xlat0 = (-u_xlat10_4) + u_xlat0;
					    u_xlatb8 = 0.0<u_xlat0;
					    u_xlat8 = (u_xlatb8) ? _Speed.x : _Speed.y;
					    u_xlat8 = u_xlat8 * (-unity_DeltaTime.x);
					    u_xlat8 = exp2(u_xlat8);
					    u_xlat8 = (-u_xlat8) + 1.0;
					    SV_Target0 = vec4(u_xlat0) * vec4(u_xlat8) + vec4(u_xlat10_4);
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 73179
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 _Params;
					uniform 	vec4 _ScaleOffsetRes;
					uniform 	float _ExposureCompensation;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    SV_Target0 = vec4(_ExposureCompensation) / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 208
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %194 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpDecorate %23 ArrayStride 23 
					                                             OpMemberDecorate %24 0 Offset 24 
					                                             OpDecorate %25 ArrayStride 25 
					                                             OpMemberDecorate %26 0 NonWritable 
					                                             OpMemberDecorate %26 0 Offset 26 
					                                             OpDecorate %26 BufferBlock 
					                                             OpDecorate %28 DescriptorSet 28 
					                                             OpDecorate %28 Binding 28 
					                                             OpMemberDecorate %79 0 Offset 79 
					                                             OpMemberDecorate %79 1 Offset 79 
					                                             OpMemberDecorate %79 2 Offset 79 
					                                             OpDecorate %79 Block 
					                                             OpDecorate %81 DescriptorSet 81 
					                                             OpDecorate %81 Binding 81 
					                                             OpDecorate %194 Location 194 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeInt 32 0 
					                                      %7 = OpTypePointer Private %6 
					                         Private u32* %8 = OpVariable Private 
					                                  u32 %9 = OpConstant 0 
					                                     %10 = OpTypePointer Function %6 
					                                 u32 %18 = OpConstant 64 
					                                     %19 = OpTypeBool 
					                        Private u32* %21 = OpVariable Private 
					                                 u32 %22 = OpConstant 1 
					                                     %23 = OpTypeArray %6 %22 
					                                     %24 = OpTypeStruct %23 
					                                     %25 = OpTypeRuntimeArray %24 
					                                     %26 = OpTypeStruct %25 
					                                     %27 = OpTypePointer Uniform %26 
					                 Uniform struct {;}* %28 = OpVariable Uniform 
					                                     %29 = OpTypeInt 32 1 
					                                 i32 %30 = OpConstant 0 
					                                     %32 = OpTypePointer Uniform %6 
					                                 i32 %39 = OpConstant 1 
					                                     %41 = OpTypeFloat 32 
					                                     %42 = OpTypePointer Private %41 
					                        Private f32* %43 = OpVariable Private 
					                                 f32 %46 = OpConstant 3,674022E-40 
					                        Private f32* %49 = OpVariable Private 
					                                 f32 %50 = OpConstant 3,674022E-40 
					                        Private u32* %59 = OpVariable Private 
					                        Private f32* %63 = OpVariable Private 
					                                     %73 = OpTypeVector %41 2 
					                                     %74 = OpTypePointer Private %73 
					                      Private f32_2* %75 = OpVariable Private 
					                                     %78 = OpTypeVector %41 4 
					                                     %79 = OpTypeStruct %78 %78 %41 
					                                     %80 = OpTypePointer Uniform %79 
					Uniform struct {f32_4; f32_4; f32;}* %81 = OpVariable Uniform 
					                                     %82 = OpTypePointer Uniform %78 
					                                     %87 = OpTypeVector %41 3 
					                                     %88 = OpTypePointer Private %87 
					                      Private f32_3* %89 = OpVariable Private 
					                      Private f32_2* %93 = OpVariable Private 
					                       Private u32* %104 = OpVariable Private 
					                       Private f32* %108 = OpVariable Private 
					                       Private f32* %111 = OpVariable Private 
					                     Private f32_2* %133 = OpVariable Private 
					                                u32 %135 = OpConstant 2 
					                       Private f32* %147 = OpVariable Private 
					                                f32 %151 = OpConstant 3,674022E-40 
					                                    %153 = OpTypePointer Uniform %41 
					                                f32 %176 = OpConstant 3,674022E-40 
					                                u32 %187 = OpConstant 3 
					                                    %193 = OpTypePointer Output %78 
					                      Output f32_4* %194 = OpVariable Output 
					                                i32 %195 = OpConstant 2 
					                       Private u32* %203 = OpVariable Private 
					                                    %204 = OpTypePointer Private %19 
					                      Private bool* %205 = OpVariable Private 
					                      Private bool* %206 = OpVariable Private 
					                      Private bool* %207 = OpVariable Private 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                       Function u32* %11 = OpVariable Function 
					                       Function u32* %51 = OpVariable Function 
					                       Function u32* %96 = OpVariable Function 
					                                             OpStore %8 %9 
					                                             OpStore %11 %9 
					                                             OpBranch %12 
					                                     %12 = OpLabel 
					                                             OpLoopMerge %14 %15 None 
					                                             OpBranch %16 
					                                     %16 = OpLabel 
					                                 u32 %17 = OpLoad %11 
					                                bool %20 = OpULessThan %17 %18 
					                                             OpBranchConditional %20 %13 %14 
					                                     %13 = OpLabel 
					                                 u32 %31 = OpLoad %11 
					                        Uniform u32* %33 = OpAccessChain %28 %30 %31 %30 %30 
					                                 u32 %34 = OpLoad %33 
					                                             OpStore %21 %34 
					                                 u32 %35 = OpLoad %21 
					                                 u32 %36 = OpLoad %8 
					                                 u32 %37 = OpExtInst %1 41 %35 %36 
					                                             OpStore %8 %37 
					                                             OpBranch %15 
					                                     %15 = OpLabel 
					                                 u32 %38 = OpLoad %11 
					                                 u32 %40 = OpIAdd %38 %39 
					                                             OpStore %11 %40 
					                                             OpBranch %12 
					                                     %14 = OpLabel 
					                                 u32 %44 = OpLoad %8 
					                                 f32 %45 = OpConvertUToF %44 
					                                             OpStore %43 %45 
					                                 f32 %47 = OpLoad %43 
					                                 f32 %48 = OpFDiv %46 %47 
					                                             OpStore %43 %48 
					                                             OpStore %49 %50 
					                                             OpStore %51 %9 
					                                             OpBranch %52 
					                                     %52 = OpLabel 
					                                             OpLoopMerge %54 %55 None 
					                                             OpBranch %56 
					                                     %56 = OpLabel 
					                                 u32 %57 = OpLoad %51 
					                                bool %58 = OpULessThan %57 %18 
					                                             OpBranchConditional %58 %53 %54 
					                                     %53 = OpLabel 
					                                 u32 %60 = OpLoad %51 
					                        Uniform u32* %61 = OpAccessChain %28 %30 %60 %30 %30 
					                                 u32 %62 = OpLoad %61 
					                                             OpStore %59 %62 
					                                 u32 %64 = OpLoad %59 
					                                 f32 %65 = OpConvertUToF %64 
					                                             OpStore %63 %65 
					                                 f32 %66 = OpLoad %63 
					                                 f32 %67 = OpLoad %43 
					                                 f32 %68 = OpFMul %66 %67 
					                                 f32 %69 = OpLoad %49 
					                                 f32 %70 = OpFAdd %68 %69 
					                                             OpStore %49 %70 
					                                             OpBranch %55 
					                                     %55 = OpLabel 
					                                 u32 %71 = OpLoad %51 
					                                 u32 %72 = OpIAdd %71 %39 
					                                             OpStore %51 %72 
					                                             OpBranch %52 
					                                     %54 = OpLabel 
					                                 f32 %76 = OpLoad %49 
					                               f32_2 %77 = OpCompositeConstruct %76 %76 
					                      Uniform f32_4* %83 = OpAccessChain %81 %30 
					                               f32_4 %84 = OpLoad %83 
					                               f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                               f32_2 %86 = OpFMul %77 %85 
					                                             OpStore %75 %86 
					                               f32_2 %90 = OpLoad %75 
					                               f32_3 %91 = OpLoad %89 
					                               f32_3 %92 = OpVectorShuffle %91 %90 3 4 2 
					                                             OpStore %89 %92 
					                        Private f32* %94 = OpAccessChain %93 %9 
					                                             OpStore %94 %50 
					                        Private f32* %95 = OpAccessChain %93 %22 
					                                             OpStore %95 %50 
					                                             OpStore %96 %9 
					                                             OpBranch %97 
					                                     %97 = OpLabel 
					                                             OpLoopMerge %99 %100 None 
					                                             OpBranch %101 
					                                    %101 = OpLabel 
					                                u32 %102 = OpLoad %96 
					                               bool %103 = OpULessThan %102 %18 
					                                             OpBranchConditional %103 %98 %99 
					                                     %98 = OpLabel 
					                                u32 %105 = OpLoad %96 
					                       Uniform u32* %106 = OpAccessChain %28 %30 %105 %30 %30 
					                                u32 %107 = OpLoad %106 
					                                             OpStore %104 %107 
					                                u32 %109 = OpLoad %104 
					                                f32 %110 = OpConvertUToF %109 
					                                             OpStore %108 %110 
					                                f32 %112 = OpLoad %43 
					                                f32 %113 = OpLoad %108 
					                                f32 %114 = OpFMul %112 %113 
					                                             OpStore %111 %114 
					                       Private f32* %115 = OpAccessChain %89 %9 
					                                f32 %116 = OpLoad %115 
					                                f32 %117 = OpLoad %111 
					                                f32 %118 = OpExtInst %1 37 %116 %117 
					                                             OpStore %111 %118 
					                                f32 %119 = OpLoad %108 
					                                f32 %120 = OpLoad %43 
					                                f32 %121 = OpFMul %119 %120 
					                                f32 %122 = OpLoad %111 
					                                f32 %123 = OpFNegate %122 
					                                f32 %124 = OpFAdd %121 %123 
					                                             OpStore %108 %124 
					                              f32_3 %125 = OpLoad %89 
					                              f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                                f32 %127 = OpLoad %111 
					                              f32_2 %128 = OpCompositeConstruct %127 %127 
					                              f32_2 %129 = OpFNegate %128 
					                              f32_2 %130 = OpFAdd %126 %129 
					                              f32_3 %131 = OpLoad %89 
					                              f32_3 %132 = OpVectorShuffle %131 %130 3 1 4 
					                                             OpStore %89 %132 
					                                f32 %134 = OpLoad %108 
					                       Private f32* %136 = OpAccessChain %89 %135 
					                                f32 %137 = OpLoad %136 
					                                f32 %138 = OpExtInst %1 37 %134 %137 
					                       Private f32* %139 = OpAccessChain %133 %22 
					                                             OpStore %139 %138 
					                       Private f32* %140 = OpAccessChain %89 %135 
					                                f32 %141 = OpLoad %140 
					                       Private f32* %142 = OpAccessChain %133 %22 
					                                f32 %143 = OpLoad %142 
					                                f32 %144 = OpFNegate %143 
					                                f32 %145 = OpFAdd %141 %144 
					                       Private f32* %146 = OpAccessChain %89 %22 
					                                             OpStore %146 %145 
					                                u32 %148 = OpLoad %96 
					                                f32 %149 = OpConvertUToF %148 
					                                             OpStore %147 %149 
					                                f32 %150 = OpLoad %147 
					                                f32 %152 = OpFMul %150 %151 
					                       Uniform f32* %154 = OpAccessChain %81 %39 %22 
					                                f32 %155 = OpLoad %154 
					                                f32 %156 = OpFNegate %155 
					                                f32 %157 = OpFAdd %152 %156 
					                                             OpStore %147 %157 
					                                f32 %158 = OpLoad %147 
					                       Uniform f32* %159 = OpAccessChain %81 %39 %9 
					                                f32 %160 = OpLoad %159 
					                                f32 %161 = OpFDiv %158 %160 
					                                             OpStore %147 %161 
					                                f32 %162 = OpLoad %147 
					                                f32 %163 = OpExtInst %1 29 %162 
					                                             OpStore %147 %163 
					                       Private f32* %164 = OpAccessChain %133 %22 
					                                f32 %165 = OpLoad %164 
					                                f32 %166 = OpLoad %147 
					                                f32 %167 = OpFMul %165 %166 
					                       Private f32* %168 = OpAccessChain %133 %9 
					                                             OpStore %168 %167 
					                              f32_2 %169 = OpLoad %133 
					                              f32_2 %170 = OpLoad %93 
					                              f32_2 %171 = OpFAdd %169 %170 
					                                             OpStore %93 %171 
					                                             OpBranch %100 
					                                    %100 = OpLabel 
					                                u32 %172 = OpLoad %96 
					                                u32 %173 = OpIAdd %172 %39 
					                                             OpStore %96 %173 
					                                             OpBranch %97 
					                                     %99 = OpLabel 
					                       Private f32* %174 = OpAccessChain %93 %22 
					                                f32 %175 = OpLoad %174 
					                                f32 %177 = OpExtInst %1 40 %175 %176 
					                                             OpStore %43 %177 
					                       Private f32* %178 = OpAccessChain %93 %9 
					                                f32 %179 = OpLoad %178 
					                                f32 %180 = OpLoad %43 
					                                f32 %181 = OpFDiv %179 %180 
					                                             OpStore %43 %181 
					                                f32 %182 = OpLoad %43 
					                       Uniform f32* %183 = OpAccessChain %81 %30 %135 
					                                f32 %184 = OpLoad %183 
					                                f32 %185 = OpExtInst %1 40 %182 %184 
					                                             OpStore %43 %185 
					                                f32 %186 = OpLoad %43 
					                       Uniform f32* %188 = OpAccessChain %81 %30 %187 
					                                f32 %189 = OpLoad %188 
					                                f32 %190 = OpExtInst %1 37 %186 %189 
					                                             OpStore %43 %190 
					                                f32 %191 = OpLoad %43 
					                                f32 %192 = OpExtInst %1 40 %191 %176 
					                                             OpStore %43 %192 
					                       Uniform f32* %196 = OpAccessChain %81 %195 
					                                f32 %197 = OpLoad %196 
					                              f32_4 %198 = OpCompositeConstruct %197 %197 %197 %197 
					                                f32 %199 = OpLoad %43 
					                              f32_4 %200 = OpCompositeConstruct %199 %199 %199 %199 
					                              f32_4 %201 = OpFDiv %198 %200 
					                                             OpStore %194 %201 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_ST;
						vec4 unused_0_2[4];
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					uniform 	vec4 _MainTex_ST;
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 _Params;
					uniform 	vec4 _ScaleOffsetRes;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    u_xlat4.x = u_xlat0 + 1.0;
					    u_xlat4.x = log2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 2.0;
					    u_xlat4.x = 2.0 / u_xlat4.x;
					    u_xlat4.x = (-u_xlat4.x) + 1.02999997;
					    SV_Target0 = u_xlat4.xxxx / vec4(u_xlat0);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 105
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %96 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate vs_TEXCOORD1 Location 84 
					                                                     OpDecorate %85 Location 85 
					                                                     OpDecorate vs_TEXCOORD0 Location 96 
					                                              %2 = OpTypeVoid 
					                                              %3 = OpTypeFunction %2 
					                                              %6 = OpTypeFloat 32 
					                                              %7 = OpTypeVector %6 4 
					                                              %8 = OpTypePointer Private %7 
					                               Private f32_4* %9 = OpVariable Private 
					                                             %10 = OpTypePointer Input %7 
					                                Input f32_4* %11 = OpVariable Input 
					                                             %14 = OpTypeInt 32 0 
					                                         u32 %15 = OpConstant 4 
					                                             %16 = OpTypeArray %7 %15 
					                                             %17 = OpTypeArray %7 %15 
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
					                                             %21 = OpTypeInt 32 1 
					                                         i32 %22 = OpConstant 0 
					                                         i32 %23 = OpConstant 1 
					                                             %24 = OpTypePointer Uniform %7 
					                                         i32 %35 = OpConstant 2 
					                                         i32 %44 = OpConstant 3 
					                              Private f32_4* %48 = OpVariable Private 
					                                         u32 %68 = OpConstant 1 
					                                             %69 = OpTypeArray %6 %68 
					                                             %70 = OpTypeStruct %7 %6 %69 
					                                             %71 = OpTypePointer Output %70 
					        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                             %80 = OpTypePointer Output %7 
					                                             %82 = OpTypeVector %6 2 
					                                             %83 = OpTypePointer Output %82 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                Input f32_4* %85 = OpVariable Input 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                             %99 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_4 %12 = OpLoad %11 
					                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                       f32_4 %26 = OpLoad %25 
					                                       f32_4 %27 = OpFMul %13 %26 
					                                                     OpStore %9 %27 
					                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                       f32_4 %29 = OpLoad %28 
					                                       f32_4 %30 = OpLoad %11 
					                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                       f32_4 %32 = OpFMul %29 %31 
					                                       f32_4 %33 = OpLoad %9 
					                                       f32_4 %34 = OpFAdd %32 %33 
					                                                     OpStore %9 %34 
					                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                       f32_4 %37 = OpLoad %36 
					                                       f32_4 %38 = OpLoad %11 
					                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                       f32_4 %40 = OpFMul %37 %39 
					                                       f32_4 %41 = OpLoad %9 
					                                       f32_4 %42 = OpFAdd %40 %41 
					                                                     OpStore %9 %42 
					                                       f32_4 %43 = OpLoad %9 
					                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                       f32_4 %46 = OpLoad %45 
					                                       f32_4 %47 = OpFAdd %43 %46 
					                                                     OpStore %9 %47 
					                                       f32_4 %49 = OpLoad %9 
					                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                       f32_4 %52 = OpLoad %51 
					                                       f32_4 %53 = OpFMul %50 %52 
					                                                     OpStore %48 %53 
					                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                       f32_4 %55 = OpLoad %54 
					                                       f32_4 %56 = OpLoad %9 
					                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                       f32_4 %58 = OpFMul %55 %57 
					                                       f32_4 %59 = OpLoad %48 
					                                       f32_4 %60 = OpFAdd %58 %59 
					                                                     OpStore %48 %60 
					                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                       f32_4 %62 = OpLoad %61 
					                                       f32_4 %63 = OpLoad %9 
					                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                       f32_4 %65 = OpFMul %62 %64 
					                                       f32_4 %66 = OpLoad %48 
					                                       f32_4 %67 = OpFAdd %65 %66 
					                                                     OpStore %48 %67 
					                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                       f32_4 %74 = OpLoad %73 
					                                       f32_4 %75 = OpLoad %9 
					                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                       f32_4 %77 = OpFMul %74 %76 
					                                       f32_4 %78 = OpLoad %48 
					                                       f32_4 %79 = OpFAdd %77 %78 
					                               Output f32_4* %81 = OpAccessChain %72 %22 
					                                                     OpStore %81 %79 
					                                       f32_4 %86 = OpLoad %85 
					                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
					                              Uniform f32_4* %88 = OpAccessChain %20 %35 
					                                       f32_4 %89 = OpLoad %88 
					                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
					                                       f32_2 %91 = OpFMul %87 %90 
					                              Uniform f32_4* %92 = OpAccessChain %20 %35 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
					                                       f32_2 %95 = OpFAdd %91 %94 
					                                                     OpStore vs_TEXCOORD1 %95 
					                                       f32_4 %97 = OpLoad %85 
					                                       f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                                     OpStore vs_TEXCOORD0 %98 
					                                Output f32* %100 = OpAccessChain %72 %22 %68 
					                                        f32 %101 = OpLoad %100 
					                                        f32 %102 = OpFNegate %101 
					                                Output f32* %103 = OpAccessChain %72 %22 %68 
					                                                     OpStore %103 %102 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 228
					; Schema: 0
					                                        OpCapability Shader 
					                                 %1 = OpExtInstImport "GLSL.std.450" 
					                                        OpMemoryModel Logical GLSL450 
					                                        OpEntryPoint Fragment %4 "main" %216 
					                                        OpExecutionMode %4 OriginUpperLeft 
					                                        OpDecorate %23 ArrayStride 23 
					                                        OpMemberDecorate %24 0 Offset 24 
					                                        OpDecorate %25 ArrayStride 25 
					                                        OpMemberDecorate %26 0 NonWritable 
					                                        OpMemberDecorate %26 0 Offset 26 
					                                        OpDecorate %26 BufferBlock 
					                                        OpDecorate %28 DescriptorSet 28 
					                                        OpDecorate %28 Binding 28 
					                                        OpMemberDecorate %79 0 Offset 79 
					                                        OpMemberDecorate %79 1 Offset 79 
					                                        OpDecorate %79 Block 
					                                        OpDecorate %81 DescriptorSet 81 
					                                        OpDecorate %81 Binding 81 
					                                        OpDecorate %216 Location 216 
					                                 %2 = OpTypeVoid 
					                                 %3 = OpTypeFunction %2 
					                                 %6 = OpTypeInt 32 0 
					                                 %7 = OpTypePointer Private %6 
					                    Private u32* %8 = OpVariable Private 
					                             u32 %9 = OpConstant 0 
					                                %10 = OpTypePointer Function %6 
					                            u32 %18 = OpConstant 64 
					                                %19 = OpTypeBool 
					                   Private u32* %21 = OpVariable Private 
					                            u32 %22 = OpConstant 1 
					                                %23 = OpTypeArray %6 %22 
					                                %24 = OpTypeStruct %23 
					                                %25 = OpTypeRuntimeArray %24 
					                                %26 = OpTypeStruct %25 
					                                %27 = OpTypePointer Uniform %26 
					            Uniform struct {;}* %28 = OpVariable Uniform 
					                                %29 = OpTypeInt 32 1 
					                            i32 %30 = OpConstant 0 
					                                %32 = OpTypePointer Uniform %6 
					                            i32 %39 = OpConstant 1 
					                                %41 = OpTypeFloat 32 
					                                %42 = OpTypePointer Private %41 
					                   Private f32* %43 = OpVariable Private 
					                            f32 %46 = OpConstant 3,674022E-40 
					                   Private f32* %49 = OpVariable Private 
					                            f32 %50 = OpConstant 3,674022E-40 
					                   Private u32* %59 = OpVariable Private 
					                   Private f32* %63 = OpVariable Private 
					                                %73 = OpTypeVector %41 2 
					                                %74 = OpTypePointer Private %73 
					                 Private f32_2* %75 = OpVariable Private 
					                                %78 = OpTypeVector %41 4 
					                                %79 = OpTypeStruct %78 %78 
					                                %80 = OpTypePointer Uniform %79 
					Uniform struct {f32_4; f32_4;}* %81 = OpVariable Uniform 
					                                %82 = OpTypePointer Uniform %78 
					                                %87 = OpTypeVector %41 3 
					                                %88 = OpTypePointer Private %87 
					                 Private f32_3* %89 = OpVariable Private 
					                 Private f32_2* %93 = OpVariable Private 
					                  Private u32* %104 = OpVariable Private 
					                  Private f32* %108 = OpVariable Private 
					                  Private f32* %111 = OpVariable Private 
					                Private f32_2* %133 = OpVariable Private 
					                           u32 %135 = OpConstant 2 
					                  Private f32* %147 = OpVariable Private 
					                           f32 %151 = OpConstant 3,674022E-40 
					                               %153 = OpTypePointer Uniform %41 
					                           f32 %176 = OpConstant 3,674022E-40 
					                           u32 %187 = OpConstant 3 
					                           f32 %202 = OpConstant 3,674022E-40 
					                           f32 %212 = OpConstant 3,674022E-40 
					                               %215 = OpTypePointer Output %78 
					                 Output f32_4* %216 = OpVariable Output 
					                  Private u32* %223 = OpVariable Private 
					                               %224 = OpTypePointer Private %19 
					                 Private bool* %225 = OpVariable Private 
					                 Private bool* %226 = OpVariable Private 
					                 Private bool* %227 = OpVariable Private 
					                            void %4 = OpFunction None %3 
					                                 %5 = OpLabel 
					                  Function u32* %11 = OpVariable Function 
					                  Function u32* %51 = OpVariable Function 
					                  Function u32* %96 = OpVariable Function 
					                                        OpStore %8 %9 
					                                        OpStore %11 %9 
					                                        OpBranch %12 
					                                %12 = OpLabel 
					                                        OpLoopMerge %14 %15 None 
					                                        OpBranch %16 
					                                %16 = OpLabel 
					                            u32 %17 = OpLoad %11 
					                           bool %20 = OpULessThan %17 %18 
					                                        OpBranchConditional %20 %13 %14 
					                                %13 = OpLabel 
					                            u32 %31 = OpLoad %11 
					                   Uniform u32* %33 = OpAccessChain %28 %30 %31 %30 %30 
					                            u32 %34 = OpLoad %33 
					                                        OpStore %21 %34 
					                            u32 %35 = OpLoad %21 
					                            u32 %36 = OpLoad %8 
					                            u32 %37 = OpExtInst %1 41 %35 %36 
					                                        OpStore %8 %37 
					                                        OpBranch %15 
					                                %15 = OpLabel 
					                            u32 %38 = OpLoad %11 
					                            u32 %40 = OpIAdd %38 %39 
					                                        OpStore %11 %40 
					                                        OpBranch %12 
					                                %14 = OpLabel 
					                            u32 %44 = OpLoad %8 
					                            f32 %45 = OpConvertUToF %44 
					                                        OpStore %43 %45 
					                            f32 %47 = OpLoad %43 
					                            f32 %48 = OpFDiv %46 %47 
					                                        OpStore %43 %48 
					                                        OpStore %49 %50 
					                                        OpStore %51 %9 
					                                        OpBranch %52 
					                                %52 = OpLabel 
					                                        OpLoopMerge %54 %55 None 
					                                        OpBranch %56 
					                                %56 = OpLabel 
					                            u32 %57 = OpLoad %51 
					                           bool %58 = OpULessThan %57 %18 
					                                        OpBranchConditional %58 %53 %54 
					                                %53 = OpLabel 
					                            u32 %60 = OpLoad %51 
					                   Uniform u32* %61 = OpAccessChain %28 %30 %60 %30 %30 
					                            u32 %62 = OpLoad %61 
					                                        OpStore %59 %62 
					                            u32 %64 = OpLoad %59 
					                            f32 %65 = OpConvertUToF %64 
					                                        OpStore %63 %65 
					                            f32 %66 = OpLoad %63 
					                            f32 %67 = OpLoad %43 
					                            f32 %68 = OpFMul %66 %67 
					                            f32 %69 = OpLoad %49 
					                            f32 %70 = OpFAdd %68 %69 
					                                        OpStore %49 %70 
					                                        OpBranch %55 
					                                %55 = OpLabel 
					                            u32 %71 = OpLoad %51 
					                            u32 %72 = OpIAdd %71 %39 
					                                        OpStore %51 %72 
					                                        OpBranch %52 
					                                %54 = OpLabel 
					                            f32 %76 = OpLoad %49 
					                          f32_2 %77 = OpCompositeConstruct %76 %76 
					                 Uniform f32_4* %83 = OpAccessChain %81 %30 
					                          f32_4 %84 = OpLoad %83 
					                          f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                          f32_2 %86 = OpFMul %77 %85 
					                                        OpStore %75 %86 
					                          f32_2 %90 = OpLoad %75 
					                          f32_3 %91 = OpLoad %89 
					                          f32_3 %92 = OpVectorShuffle %91 %90 3 4 2 
					                                        OpStore %89 %92 
					                   Private f32* %94 = OpAccessChain %93 %9 
					                                        OpStore %94 %50 
					                   Private f32* %95 = OpAccessChain %93 %22 
					                                        OpStore %95 %50 
					                                        OpStore %96 %9 
					                                        OpBranch %97 
					                                %97 = OpLabel 
					                                        OpLoopMerge %99 %100 None 
					                                        OpBranch %101 
					                               %101 = OpLabel 
					                           u32 %102 = OpLoad %96 
					                          bool %103 = OpULessThan %102 %18 
					                                        OpBranchConditional %103 %98 %99 
					                                %98 = OpLabel 
					                           u32 %105 = OpLoad %96 
					                  Uniform u32* %106 = OpAccessChain %28 %30 %105 %30 %30 
					                           u32 %107 = OpLoad %106 
					                                        OpStore %104 %107 
					                           u32 %109 = OpLoad %104 
					                           f32 %110 = OpConvertUToF %109 
					                                        OpStore %108 %110 
					                           f32 %112 = OpLoad %43 
					                           f32 %113 = OpLoad %108 
					                           f32 %114 = OpFMul %112 %113 
					                                        OpStore %111 %114 
					                  Private f32* %115 = OpAccessChain %89 %9 
					                           f32 %116 = OpLoad %115 
					                           f32 %117 = OpLoad %111 
					                           f32 %118 = OpExtInst %1 37 %116 %117 
					                                        OpStore %111 %118 
					                           f32 %119 = OpLoad %108 
					                           f32 %120 = OpLoad %43 
					                           f32 %121 = OpFMul %119 %120 
					                           f32 %122 = OpLoad %111 
					                           f32 %123 = OpFNegate %122 
					                           f32 %124 = OpFAdd %121 %123 
					                                        OpStore %108 %124 
					                         f32_3 %125 = OpLoad %89 
					                         f32_2 %126 = OpVectorShuffle %125 %125 0 1 
					                           f32 %127 = OpLoad %111 
					                         f32_2 %128 = OpCompositeConstruct %127 %127 
					                         f32_2 %129 = OpFNegate %128 
					                         f32_2 %130 = OpFAdd %126 %129 
					                         f32_3 %131 = OpLoad %89 
					                         f32_3 %132 = OpVectorShuffle %131 %130 3 1 4 
					                                        OpStore %89 %132 
					                           f32 %134 = OpLoad %108 
					                  Private f32* %136 = OpAccessChain %89 %135 
					                           f32 %137 = OpLoad %136 
					                           f32 %138 = OpExtInst %1 37 %134 %137 
					                  Private f32* %139 = OpAccessChain %133 %22 
					                                        OpStore %139 %138 
					                  Private f32* %140 = OpAccessChain %89 %135 
					                           f32 %141 = OpLoad %140 
					                  Private f32* %142 = OpAccessChain %133 %22 
					                           f32 %143 = OpLoad %142 
					                           f32 %144 = OpFNegate %143 
					                           f32 %145 = OpFAdd %141 %144 
					                  Private f32* %146 = OpAccessChain %89 %22 
					                                        OpStore %146 %145 
					                           u32 %148 = OpLoad %96 
					                           f32 %149 = OpConvertUToF %148 
					                                        OpStore %147 %149 
					                           f32 %150 = OpLoad %147 
					                           f32 %152 = OpFMul %150 %151 
					                  Uniform f32* %154 = OpAccessChain %81 %39 %22 
					                           f32 %155 = OpLoad %154 
					                           f32 %156 = OpFNegate %155 
					                           f32 %157 = OpFAdd %152 %156 
					                                        OpStore %147 %157 
					                           f32 %158 = OpLoad %147 
					                  Uniform f32* %159 = OpAccessChain %81 %39 %9 
					                           f32 %160 = OpLoad %159 
					                           f32 %161 = OpFDiv %158 %160 
					                                        OpStore %147 %161 
					                           f32 %162 = OpLoad %147 
					                           f32 %163 = OpExtInst %1 29 %162 
					                                        OpStore %147 %163 
					                  Private f32* %164 = OpAccessChain %133 %22 
					                           f32 %165 = OpLoad %164 
					                           f32 %166 = OpLoad %147 
					                           f32 %167 = OpFMul %165 %166 
					                  Private f32* %168 = OpAccessChain %133 %9 
					                                        OpStore %168 %167 
					                         f32_2 %169 = OpLoad %133 
					                         f32_2 %170 = OpLoad %93 
					                         f32_2 %171 = OpFAdd %169 %170 
					                                        OpStore %93 %171 
					                                        OpBranch %100 
					                               %100 = OpLabel 
					                           u32 %172 = OpLoad %96 
					                           u32 %173 = OpIAdd %172 %39 
					                                        OpStore %96 %173 
					                                        OpBranch %97 
					                                %99 = OpLabel 
					                  Private f32* %174 = OpAccessChain %93 %22 
					                           f32 %175 = OpLoad %174 
					                           f32 %177 = OpExtInst %1 40 %175 %176 
					                                        OpStore %43 %177 
					                  Private f32* %178 = OpAccessChain %93 %9 
					                           f32 %179 = OpLoad %178 
					                           f32 %180 = OpLoad %43 
					                           f32 %181 = OpFDiv %179 %180 
					                                        OpStore %43 %181 
					                           f32 %182 = OpLoad %43 
					                  Uniform f32* %183 = OpAccessChain %81 %30 %135 
					                           f32 %184 = OpLoad %183 
					                           f32 %185 = OpExtInst %1 40 %182 %184 
					                                        OpStore %43 %185 
					                           f32 %186 = OpLoad %43 
					                  Uniform f32* %188 = OpAccessChain %81 %30 %187 
					                           f32 %189 = OpLoad %188 
					                           f32 %190 = OpExtInst %1 37 %186 %189 
					                                        OpStore %43 %190 
					                           f32 %191 = OpLoad %43 
					                           f32 %192 = OpExtInst %1 40 %191 %176 
					                                        OpStore %43 %192 
					                           f32 %193 = OpLoad %43 
					                           f32 %194 = OpFAdd %193 %46 
					                  Private f32* %195 = OpAccessChain %75 %9 
					                                        OpStore %195 %194 
					                  Private f32* %196 = OpAccessChain %75 %9 
					                           f32 %197 = OpLoad %196 
					                           f32 %198 = OpExtInst %1 30 %197 
					                  Private f32* %199 = OpAccessChain %75 %9 
					                                        OpStore %199 %198 
					                  Private f32* %200 = OpAccessChain %75 %9 
					                           f32 %201 = OpLoad %200 
					                           f32 %203 = OpFAdd %201 %202 
					                  Private f32* %204 = OpAccessChain %75 %9 
					                                        OpStore %204 %203 
					                  Private f32* %205 = OpAccessChain %75 %9 
					                           f32 %206 = OpLoad %205 
					                           f32 %207 = OpFDiv %202 %206 
					                  Private f32* %208 = OpAccessChain %75 %9 
					                                        OpStore %208 %207 
					                  Private f32* %209 = OpAccessChain %75 %9 
					                           f32 %210 = OpLoad %209 
					                           f32 %211 = OpFNegate %210 
					                           f32 %213 = OpFAdd %211 %212 
					                  Private f32* %214 = OpAccessChain %75 %9 
					                                        OpStore %214 %213 
					                         f32_2 %217 = OpLoad %75 
					                         f32_4 %218 = OpVectorShuffle %217 %217 0 0 0 0 
					                           f32 %219 = OpLoad %43 
					                         f32_4 %220 = OpCompositeConstruct %219 %219 %219 %219 
					                         f32_4 %221 = OpFDiv %218 %220 
					                                        OpStore %216 %221 
					                                        OpReturn
					                                        OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec4 unused_0_2;
						vec4 _ScaleOffsetRes;
						float _ExposureCompensation;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    SV_Target0 = vec4(_ExposureCompensation) / vec4(u_xlat0);
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec4 unused_0_2;
						vec4 _ScaleOffsetRes;
						vec4 unused_0_4;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					uint u_xlatu0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0 = float(u_xlatu0);
					    u_xlat0 = float(1.0) / u_xlat0;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0 + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0 * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0 + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat0 = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat0 = u_xlat2.x / u_xlat0;
					    u_xlat0 = max(u_xlat0, _Params.z);
					    u_xlat0 = min(u_xlat0, _Params.w);
					    u_xlat0 = max(u_xlat0, 9.99999975e-05);
					    u_xlat4.x = u_xlat0 + 1.0;
					    u_xlat4.x = log2(u_xlat4.x);
					    u_xlat4.x = u_xlat4.x + 2.0;
					    u_xlat4.x = 2.0 / u_xlat4.x;
					    u_xlat4.x = (-u_xlat4.x) + 1.02999997;
					    SV_Target0 = u_xlat4.xxxx / vec4(u_xlat0);
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 176548
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec4 unused_0_2;
						vec4 _ScaleOffsetRes;
						vec4 unused_0_4;
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out float vs_TEXCOORD1;
					layout(location = 2) out float vs_TEXCOORD2;
					vec4 u_xlat0;
					uint u_xlatu0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0.x = float(u_xlatu0);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0.x + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0.x * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0.x + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat4.x = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat4.x = u_xlat2.x / u_xlat4.x;
					    u_xlat4.x = max(u_xlat4.x, _Params.z);
					    vs_TEXCOORD2 = min(u_xlat4.x, _Params.w);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0.x;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 _Params;
					uniform 	vec4 _ScaleOffsetRes;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out float vs_TEXCOORD1;
					layout(location = 2) out float vs_TEXCOORD2;
					vec4 u_xlat0;
					uint u_xlatu0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0.x = float(u_xlatu0);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0.x + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0.x * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0.x + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat4.x = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat4.x = u_xlat2.x / u_xlat4.x;
					    u_xlat4.x = max(u_xlat4.x, _Params.z);
					    vs_TEXCOORD2 = min(u_xlat4.x, _Params.w);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0.x;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 _Params;
					uniform 	vec4 _ScaleOffsetRes;
					uniform 	int _DebugWidth;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 1) in  float vs_TEXCOORD1;
					layout(location = 2) in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					float u_xlat2;
					uint u_xlatu2;
					bool u_xlatb2;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = log2(_Params.zw);
					    u_xlat0.xy = u_xlat0.xy * _ScaleOffsetRes.xx + _ScaleOffsetRes.yy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlatb0 = u_xlat0.x<vs_TEXCOORD0.x;
					    u_xlatb2 = vs_TEXCOORD0.x<u_xlat0.y;
					    u_xlatb0 = u_xlatb2 && u_xlatb0;
					    u_xlat2 = vs_TEXCOORD0.x * 64.0;
					    u_xlat2 = roundEven(u_xlat2);
					    u_xlatu2 = uint(u_xlat2);
					    u_xlatu2 = _Histogram_buf[u_xlatu2].value[(0 >> 2) + 0];
					    u_xlat2 = float(u_xlatu2);
					    u_xlat2 = u_xlat2 * vs_TEXCOORD1;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlatb2 = u_xlat2>=vs_TEXCOORD0.y;
					    u_xlat4 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat1.xyz = (bool(u_xlatb2)) ? vec3(0.100000001, 0.800000012, 1.20000005) : vec3(0.0500000007, 0.400000006, 0.600000024);
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(u_xlat4);
					    u_xlat6 = log2(vs_TEXCOORD2);
					    u_xlat6 = u_xlat6 * _ScaleOffsetRes.x + _ScaleOffsetRes.y;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat1.x = float(_DebugWidth);
					    u_xlat6 = (-u_xlat6) * u_xlat1.x + hlslcc_FragCoord.x;
					    u_xlatb6 = abs(u_xlat6)<2.0;
					    SV_Target0.xyz = (bool(u_xlatb6)) ? vec3(0.800000012, 0.300000012, 0.0500000007) : u_xlat0.xyz;
					    SV_Target0.w = 0.699999988;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 284
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %72 %259 %267 %268 %271 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %70 0 BuiltIn 70 
					                                                      OpMemberDecorate %70 1 BuiltIn 70 
					                                                      OpMemberDecorate %70 2 BuiltIn 70 
					                                                      OpDecorate %70 Block 
					                                                      OpDecorate %97 ArrayStride 97 
					                                                      OpMemberDecorate %98 0 Offset 98 
					                                                      OpDecorate %99 ArrayStride 99 
					                                                      OpMemberDecorate %100 0 NonWritable 
					                                                      OpMemberDecorate %100 0 Offset 100 
					                                                      OpDecorate %100 BufferBlock 
					                                                      OpDecorate %102 DescriptorSet 102 
					                                                      OpDecorate %102 Binding 102 
					                                                      OpDecorate vs_TEXCOORD2 Location 259 
					                                                      OpDecorate vs_TEXCOORD0 Location 267 
					                                                      OpDecorate %268 Location 268 
					                                                      OpDecorate vs_TEXCOORD1 Location 271 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %14 = OpTypeInt 32 0 
					                                          u32 %15 = OpConstant 4 
					                                              %16 = OpTypeArray %7 %15 
					                                              %17 = OpTypeArray %7 %15 
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %68 = OpConstant 1 
					                                              %69 = OpTypeArray %6 %68 
					                                              %70 = OpTypeStruct %7 %6 %69 
					                                              %71 = OpTypePointer Output %70 
					         Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                              %80 = OpTypePointer Output %7 
					                                              %82 = OpTypePointer Private %14 
					                                 Private u32* %83 = OpVariable Private 
					                                          u32 %84 = OpConstant 0 
					                                              %85 = OpTypePointer Function %14 
					                                          u32 %93 = OpConstant 64 
					                                              %94 = OpTypeBool 
					                                 Private u32* %96 = OpVariable Private 
					                                              %97 = OpTypeArray %14 %68 
					                                              %98 = OpTypeStruct %97 
					                                              %99 = OpTypeRuntimeArray %98 
					                                             %100 = OpTypeStruct %99 
					                                             %101 = OpTypePointer Uniform %100 
					                         Uniform struct {;}* %102 = OpVariable Uniform 
					                                             %104 = OpTypePointer Uniform %14 
					                                             %114 = OpTypePointer Private %6 
					                                         f32 %116 = OpConstant 3,674022E-40 
					                                Private f32* %121 = OpVariable Private 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                Private u32* %131 = OpVariable Private 
					                                Private f32* %135 = OpVariable Private 
					                                             %146 = OpTypeVector %6 2 
					                                             %147 = OpTypePointer Private %146 
					                              Private f32_2* %148 = OpVariable Private 
					                              Private f32_2* %158 = OpVariable Private 
					                                Private u32* %169 = OpVariable Private 
					                                Private f32* %173 = OpVariable Private 
					                                Private f32* %176 = OpVariable Private 
					                              Private f32_2* %200 = OpVariable Private 
					                                         u32 %202 = OpConstant 2 
					                                Private f32* %214 = OpVariable Private 
					                                         f32 %218 = OpConstant 3,674022E-40 
					                                             %220 = OpTypePointer Uniform %6 
					                                         f32 %243 = OpConstant 3,674022E-40 
					                                             %258 = OpTypePointer Output %6 
					                         Output f32* vs_TEXCOORD2 = OpVariable Output 
					                                         u32 %262 = OpConstant 3 
					                                             %266 = OpTypePointer Output %146 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                Input f32_4* %268 = OpVariable Input 
					                         Output f32* vs_TEXCOORD1 = OpVariable Output 
					                                Private u32* %279 = OpVariable Private 
					                                             %280 = OpTypePointer Private %94 
					                               Private bool* %281 = OpVariable Private 
					                               Private bool* %282 = OpVariable Private 
					                               Private bool* %283 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function u32* %86 = OpVariable Function 
					                               Function u32* %123 = OpVariable Function 
					                               Function u32* %161 = OpVariable Function 
					                                        f32_4 %12 = OpLoad %11 
					                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                               Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                        f32_4 %26 = OpLoad %25 
					                                        f32_4 %27 = OpFMul %13 %26 
					                                                      OpStore %9 %27 
					                               Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_4 %30 = OpLoad %11 
					                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                        f32_4 %32 = OpFMul %29 %31 
					                                        f32_4 %33 = OpLoad %9 
					                                        f32_4 %34 = OpFAdd %32 %33 
					                                                      OpStore %9 %34 
					                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_4 %38 = OpLoad %11 
					                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                        f32_4 %40 = OpFMul %37 %39 
					                                        f32_4 %41 = OpLoad %9 
					                                        f32_4 %42 = OpFAdd %40 %41 
					                                                      OpStore %9 %42 
					                                        f32_4 %43 = OpLoad %9 
					                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFAdd %43 %46 
					                                                      OpStore %9 %47 
					                                        f32_4 %49 = OpLoad %9 
					                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                               Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                                      OpStore %48 %53 
					                               Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                        f32_4 %55 = OpLoad %54 
					                                        f32_4 %56 = OpLoad %9 
					                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                        f32_4 %58 = OpFMul %55 %57 
					                                        f32_4 %59 = OpLoad %48 
					                                        f32_4 %60 = OpFAdd %58 %59 
					                                                      OpStore %48 %60 
					                               Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_4 %63 = OpLoad %9 
					                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                        f32_4 %65 = OpFMul %62 %64 
					                                        f32_4 %66 = OpLoad %48 
					                                        f32_4 %67 = OpFAdd %65 %66 
					                                                      OpStore %48 %67 
					                               Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                        f32_4 %74 = OpLoad %73 
					                                        f32_4 %75 = OpLoad %9 
					                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                        f32_4 %77 = OpFMul %74 %76 
					                                        f32_4 %78 = OpLoad %48 
					                                        f32_4 %79 = OpFAdd %77 %78 
					                                Output f32_4* %81 = OpAccessChain %72 %22 
					                                                      OpStore %81 %79 
					                                                      OpStore %83 %84 
					                                                      OpStore %86 %84 
					                                                      OpBranch %87 
					                                              %87 = OpLabel 
					                                                      OpLoopMerge %89 %90 None 
					                                                      OpBranch %91 
					                                              %91 = OpLabel 
					                                          u32 %92 = OpLoad %86 
					                                         bool %95 = OpULessThan %92 %93 
					                                                      OpBranchConditional %95 %88 %89 
					                                              %88 = OpLabel 
					                                         u32 %103 = OpLoad %86 
					                                Uniform u32* %105 = OpAccessChain %102 %22 %103 %22 %22 
					                                         u32 %106 = OpLoad %105 
					                                                      OpStore %96 %106 
					                                         u32 %107 = OpLoad %96 
					                                         u32 %108 = OpLoad %83 
					                                         u32 %109 = OpExtInst %1 41 %107 %108 
					                                                      OpStore %83 %109 
					                                                      OpBranch %90 
					                                              %90 = OpLabel 
					                                         u32 %110 = OpLoad %86 
					                                         u32 %111 = OpIAdd %110 %23 
					                                                      OpStore %86 %111 
					                                                      OpBranch %87 
					                                              %89 = OpLabel 
					                                         u32 %112 = OpLoad %83 
					                                         f32 %113 = OpConvertUToF %112 
					                                Private f32* %115 = OpAccessChain %9 %84 
					                                                      OpStore %115 %113 
					                                Private f32* %117 = OpAccessChain %9 %84 
					                                         f32 %118 = OpLoad %117 
					                                         f32 %119 = OpFDiv %116 %118 
					                                Private f32* %120 = OpAccessChain %9 %84 
					                                                      OpStore %120 %119 
					                                                      OpStore %121 %122 
					                                                      OpStore %123 %84 
					                                                      OpBranch %124 
					                                             %124 = OpLabel 
					                                                      OpLoopMerge %126 %127 None 
					                                                      OpBranch %128 
					                                             %128 = OpLabel 
					                                         u32 %129 = OpLoad %123 
					                                        bool %130 = OpULessThan %129 %93 
					                                                      OpBranchConditional %130 %125 %126 
					                                             %125 = OpLabel 
					                                         u32 %132 = OpLoad %123 
					                                Uniform u32* %133 = OpAccessChain %102 %22 %132 %22 %22 
					                                         u32 %134 = OpLoad %133 
					                                                      OpStore %131 %134 
					                                         u32 %136 = OpLoad %131 
					                                         f32 %137 = OpConvertUToF %136 
					                                                      OpStore %135 %137 
					                                         f32 %138 = OpLoad %135 
					                                Private f32* %139 = OpAccessChain %9 %84 
					                                         f32 %140 = OpLoad %139 
					                                         f32 %141 = OpFMul %138 %140 
					                                         f32 %142 = OpLoad %121 
					                                         f32 %143 = OpFAdd %141 %142 
					                                                      OpStore %121 %143 
					                                                      OpBranch %127 
					                                             %127 = OpLabel 
					                                         u32 %144 = OpLoad %123 
					                                         u32 %145 = OpIAdd %144 %23 
					                                                      OpStore %123 %145 
					                                                      OpBranch %124 
					                                             %126 = OpLabel 
					                                         f32 %149 = OpLoad %121 
					                                       f32_2 %150 = OpCompositeConstruct %149 %149 
					                              Uniform f32_4* %151 = OpAccessChain %20 %35 
					                                       f32_4 %152 = OpLoad %151 
					                                       f32_2 %153 = OpVectorShuffle %152 %152 0 1 
					                                       f32_2 %154 = OpFMul %150 %153 
					                                                      OpStore %148 %154 
					                                       f32_2 %155 = OpLoad %148 
					                                       f32_4 %156 = OpLoad %48 
					                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 2 3 
					                                                      OpStore %48 %157 
					                                Private f32* %159 = OpAccessChain %158 %84 
					                                                      OpStore %159 %122 
					                                Private f32* %160 = OpAccessChain %158 %68 
					                                                      OpStore %160 %122 
					                                                      OpStore %161 %84 
					                                                      OpBranch %162 
					                                             %162 = OpLabel 
					                                                      OpLoopMerge %164 %165 None 
					                                                      OpBranch %166 
					                                             %166 = OpLabel 
					                                         u32 %167 = OpLoad %161 
					                                        bool %168 = OpULessThan %167 %93 
					                                                      OpBranchConditional %168 %163 %164 
					                                             %163 = OpLabel 
					                                         u32 %170 = OpLoad %161 
					                                Uniform u32* %171 = OpAccessChain %102 %22 %170 %22 %22 
					                                         u32 %172 = OpLoad %171 
					                                                      OpStore %169 %172 
					                                         u32 %174 = OpLoad %169 
					                                         f32 %175 = OpConvertUToF %174 
					                                                      OpStore %173 %175 
					                                Private f32* %177 = OpAccessChain %9 %84 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpLoad %173 
					                                         f32 %180 = OpFMul %178 %179 
					                                                      OpStore %176 %180 
					                                Private f32* %181 = OpAccessChain %48 %84 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpLoad %176 
					                                         f32 %184 = OpExtInst %1 37 %182 %183 
					                                                      OpStore %176 %184 
					                                         f32 %185 = OpLoad %173 
					                                Private f32* %186 = OpAccessChain %9 %84 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                         f32 %189 = OpLoad %176 
					                                         f32 %190 = OpFNegate %189 
					                                         f32 %191 = OpFAdd %188 %190 
					                                                      OpStore %173 %191 
					                                       f32_4 %192 = OpLoad %48 
					                                       f32_2 %193 = OpVectorShuffle %192 %192 0 1 
					                                         f32 %194 = OpLoad %176 
					                                       f32_2 %195 = OpCompositeConstruct %194 %194 
					                                       f32_2 %196 = OpFNegate %195 
					                                       f32_2 %197 = OpFAdd %193 %196 
					                                       f32_4 %198 = OpLoad %48 
					                                       f32_4 %199 = OpVectorShuffle %198 %197 4 1 5 3 
					                                                      OpStore %48 %199 
					                                         f32 %201 = OpLoad %173 
					                                Private f32* %203 = OpAccessChain %48 %202 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %205 = OpExtInst %1 37 %201 %204 
					                                Private f32* %206 = OpAccessChain %200 %68 
					                                                      OpStore %206 %205 
					                                Private f32* %207 = OpAccessChain %48 %202 
					                                         f32 %208 = OpLoad %207 
					                                Private f32* %209 = OpAccessChain %200 %68 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %211 = OpFNegate %210 
					                                         f32 %212 = OpFAdd %208 %211 
					                                Private f32* %213 = OpAccessChain %48 %68 
					                                                      OpStore %213 %212 
					                                         u32 %215 = OpLoad %161 
					                                         f32 %216 = OpConvertUToF %215 
					                                                      OpStore %214 %216 
					                                         f32 %217 = OpLoad %214 
					                                         f32 %219 = OpFMul %217 %218 
					                                Uniform f32* %221 = OpAccessChain %20 %44 %68 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpFNegate %222 
					                                         f32 %224 = OpFAdd %219 %223 
					                                                      OpStore %214 %224 
					                                         f32 %225 = OpLoad %214 
					                                Uniform f32* %226 = OpAccessChain %20 %44 %84 
					                                         f32 %227 = OpLoad %226 
					                                         f32 %228 = OpFDiv %225 %227 
					                                                      OpStore %214 %228 
					                                         f32 %229 = OpLoad %214 
					                                         f32 %230 = OpExtInst %1 29 %229 
					                                                      OpStore %214 %230 
					                                Private f32* %231 = OpAccessChain %200 %68 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpLoad %214 
					                                         f32 %234 = OpFMul %232 %233 
					                                Private f32* %235 = OpAccessChain %200 %84 
					                                                      OpStore %235 %234 
					                                       f32_2 %236 = OpLoad %200 
					                                       f32_2 %237 = OpLoad %158 
					                                       f32_2 %238 = OpFAdd %236 %237 
					                                                      OpStore %158 %238 
					                                                      OpBranch %165 
					                                             %165 = OpLabel 
					                                         u32 %239 = OpLoad %161 
					                                         u32 %240 = OpIAdd %239 %23 
					                                                      OpStore %161 %240 
					                                                      OpBranch %162 
					                                             %164 = OpLabel 
					                                Private f32* %241 = OpAccessChain %158 %68 
					                                         f32 %242 = OpLoad %241 
					                                         f32 %244 = OpExtInst %1 40 %242 %243 
					                                Private f32* %245 = OpAccessChain %148 %84 
					                                                      OpStore %245 %244 
					                                Private f32* %246 = OpAccessChain %158 %84 
					                                         f32 %247 = OpLoad %246 
					                                Private f32* %248 = OpAccessChain %148 %84 
					                                         f32 %249 = OpLoad %248 
					                                         f32 %250 = OpFDiv %247 %249 
					                                Private f32* %251 = OpAccessChain %148 %84 
					                                                      OpStore %251 %250 
					                                Private f32* %252 = OpAccessChain %148 %84 
					                                         f32 %253 = OpLoad %252 
					                                Uniform f32* %254 = OpAccessChain %20 %35 %202 
					                                         f32 %255 = OpLoad %254 
					                                         f32 %256 = OpExtInst %1 40 %253 %255 
					                                Private f32* %257 = OpAccessChain %148 %84 
					                                                      OpStore %257 %256 
					                                Private f32* %260 = OpAccessChain %148 %84 
					                                         f32 %261 = OpLoad %260 
					                                Uniform f32* %263 = OpAccessChain %20 %35 %262 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpExtInst %1 37 %261 %264 
					                                                      OpStore vs_TEXCOORD2 %265 
					                                       f32_4 %269 = OpLoad %268 
					                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
					                                                      OpStore vs_TEXCOORD0 %270 
					                                Private f32* %272 = OpAccessChain %9 %84 
					                                         f32 %273 = OpLoad %272 
					                                                      OpStore vs_TEXCOORD1 %273 
					                                 Output f32* %274 = OpAccessChain %72 %22 %68 
					                                         f32 %275 = OpLoad %274 
					                                         f32 %276 = OpFNegate %275 
					                                 Output f32* %277 = OpAccessChain %72 %22 %68 
					                                                      OpStore %277 %276 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 194
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %70 %108 %144 %178 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                             OpDecorate %11 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %29 0 Offset 29 
					                                             OpMemberDecorate %29 1 Offset 29 
					                                             OpMemberDecorate %29 2 Offset 29 
					                                             OpDecorate %29 Block 
					                                             OpDecorate %31 DescriptorSet 31 
					                                             OpDecorate %31 Binding 31 
					                                             OpDecorate vs_TEXCOORD0 Location 70 
					                                             OpDecorate %95 ArrayStride 95 
					                                             OpMemberDecorate %96 0 Offset 96 
					                                             OpDecorate %97 ArrayStride 97 
					                                             OpMemberDecorate %98 0 NonWritable 
					                                             OpMemberDecorate %98 0 Offset 98 
					                                             OpDecorate %98 BufferBlock 
					                                             OpDecorate %100 DescriptorSet 100 
					                                             OpDecorate %100 Binding 100 
					                                             OpDecorate vs_TEXCOORD1 Location 108 
					                                             OpDecorate vs_TEXCOORD2 Location 144 
					                                             OpDecorate %178 Location 178 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Function %7 
					                                     %10 = OpTypePointer Input %7 
					                        Input f32_4* %11 = OpVariable Input 
					                                     %12 = OpTypeVector %6 3 
					                                 f32 %15 = OpConstant 3,674022E-40 
					                                     %16 = OpTypeInt 32 0 
					                                 u32 %17 = OpConstant 3 
					                                     %18 = OpTypePointer Input %6 
					                                     %26 = OpTypePointer Private %12 
					                      Private f32_3* %27 = OpVariable Private 
					                                     %28 = OpTypeInt 32 1 
					                                     %29 = OpTypeStruct %7 %7 %28 
					                                     %30 = OpTypePointer Uniform %29 
					Uniform struct {f32_4; f32_4; i32;}* %31 = OpVariable Uniform 
					                                 i32 %32 = OpConstant 0 
					                                     %33 = OpTypeVector %6 2 
					                                     %34 = OpTypePointer Uniform %7 
					                                 i32 %43 = OpConstant 1 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                                     %62 = OpTypeBool 
					                                     %63 = OpTypePointer Private %62 
					                       Private bool* %64 = OpVariable Private 
					                                 u32 %65 = OpConstant 0 
					                                     %66 = OpTypePointer Private %6 
					                                     %69 = OpTypePointer Input %33 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                       Private bool* %74 = OpVariable Private 
					                                 u32 %77 = OpConstant 1 
					                        Private f32* %84 = OpVariable Private 
					                                 f32 %87 = OpConstant 3,674022E-40 
					                                     %91 = OpTypePointer Private %16 
					                        Private u32* %92 = OpVariable Private 
					                                     %95 = OpTypeArray %16 %77 
					                                     %96 = OpTypeStruct %95 
					                                     %97 = OpTypeRuntimeArray %96 
					                                     %98 = OpTypeStruct %97 
					                                     %99 = OpTypePointer Uniform %98 
					                Uniform struct {;}* %100 = OpVariable Uniform 
					                                    %102 = OpTypePointer Uniform %16 
					                 Input f32* vs_TEXCOORD1 = OpVariable Input 
					                       Private f32* %117 = OpVariable Private 
					                     Private f32_3* %120 = OpVariable Private 
					                                f32 %122 = OpConstant 3,674022E-40 
					                                f32 %123 = OpConstant 3,674022E-40 
					                                f32 %124 = OpConstant 3,674022E-40 
					                              f32_3 %125 = OpConstantComposite %122 %123 %124 
					                                f32 %126 = OpConstant 3,674022E-40 
					                                f32 %127 = OpConstant 3,674022E-40 
					                                f32 %128 = OpConstant 3,674022E-40 
					                              f32_3 %129 = OpConstantComposite %126 %127 %128 
					                                    %130 = OpTypeVector %62 3 
					                                    %134 = OpTypePointer Function %12 
					                       Private f32* %143 = OpVariable Private 
					                 Input f32* vs_TEXCOORD2 = OpVariable Input 
					                                    %148 = OpTypePointer Uniform %6 
					                                i32 %157 = OpConstant 2 
					                                    %158 = OpTypePointer Uniform %28 
					                                    %168 = OpTypePointer Function %6 
					                      Private bool* %172 = OpVariable Private 
					                                f32 %175 = OpConstant 3,674022E-40 
					                                    %177 = OpTypePointer Output %7 
					                      Output f32_4* %178 = OpVariable Output 
					                                f32 %183 = OpConstant 3,674022E-40 
					                              f32_3 %184 = OpConstantComposite %123 %183 %126 
					                                f32 %190 = OpConstant 3,674022E-40 
					                                    %191 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32_4* %9 = OpVariable Function 
					                    Function f32_3* %135 = OpVariable Function 
					                    Function f32_3* %180 = OpVariable Function 
					                               f32_4 %13 = OpLoad %11 
					                               f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
					                          Input f32* %19 = OpAccessChain %11 %17 
					                                 f32 %20 = OpLoad %19 
					                                 f32 %21 = OpFDiv %15 %20 
					                                 f32 %22 = OpCompositeExtract %14 0 
					                                 f32 %23 = OpCompositeExtract %14 1 
					                                 f32 %24 = OpCompositeExtract %14 2 
					                               f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
					                                             OpStore %9 %25 
					                      Uniform f32_4* %35 = OpAccessChain %31 %32 
					                               f32_4 %36 = OpLoad %35 
					                               f32_2 %37 = OpVectorShuffle %36 %36 2 3 
					                               f32_2 %38 = OpExtInst %1 30 %37 
					                               f32_3 %39 = OpLoad %27 
					                               f32_3 %40 = OpVectorShuffle %39 %38 3 4 2 
					                                             OpStore %27 %40 
					                               f32_3 %41 = OpLoad %27 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                      Uniform f32_4* %44 = OpAccessChain %31 %43 
					                               f32_4 %45 = OpLoad %44 
					                               f32_2 %46 = OpVectorShuffle %45 %45 0 0 
					                               f32_2 %47 = OpFMul %42 %46 
					                      Uniform f32_4* %48 = OpAccessChain %31 %43 
					                               f32_4 %49 = OpLoad %48 
					                               f32_2 %50 = OpVectorShuffle %49 %49 1 1 
					                               f32_2 %51 = OpFAdd %47 %50 
					                               f32_3 %52 = OpLoad %27 
					                               f32_3 %53 = OpVectorShuffle %52 %51 3 4 2 
					                                             OpStore %27 %53 
					                               f32_3 %54 = OpLoad %27 
					                               f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                               f32_2 %57 = OpCompositeConstruct %56 %56 
					                               f32_2 %58 = OpCompositeConstruct %15 %15 
					                               f32_2 %59 = OpExtInst %1 43 %55 %57 %58 
					                               f32_3 %60 = OpLoad %27 
					                               f32_3 %61 = OpVectorShuffle %60 %59 3 4 2 
					                                             OpStore %27 %61 
					                        Private f32* %67 = OpAccessChain %27 %65 
					                                 f32 %68 = OpLoad %67 
					                          Input f32* %71 = OpAccessChain vs_TEXCOORD0 %65 
					                                 f32 %72 = OpLoad %71 
					                                bool %73 = OpFOrdLessThan %68 %72 
					                                             OpStore %64 %73 
					                          Input f32* %75 = OpAccessChain vs_TEXCOORD0 %65 
					                                 f32 %76 = OpLoad %75 
					                        Private f32* %78 = OpAccessChain %27 %77 
					                                 f32 %79 = OpLoad %78 
					                                bool %80 = OpFOrdLessThan %76 %79 
					                                             OpStore %74 %80 
					                                bool %81 = OpLoad %74 
					                                bool %82 = OpLoad %64 
					                                bool %83 = OpLogicalAnd %81 %82 
					                                             OpStore %64 %83 
					                          Input f32* %85 = OpAccessChain vs_TEXCOORD0 %65 
					                                 f32 %86 = OpLoad %85 
					                                 f32 %88 = OpFMul %86 %87 
					                                             OpStore %84 %88 
					                                 f32 %89 = OpLoad %84 
					                                 f32 %90 = OpExtInst %1 2 %89 
					                                             OpStore %84 %90 
					                                 f32 %93 = OpLoad %84 
					                                 u32 %94 = OpConvertFToU %93 
					                                             OpStore %92 %94 
					                                u32 %101 = OpLoad %92 
					                       Uniform u32* %103 = OpAccessChain %100 %32 %101 %32 %32 
					                                u32 %104 = OpLoad %103 
					                                             OpStore %92 %104 
					                                u32 %105 = OpLoad %92 
					                                f32 %106 = OpConvertUToF %105 
					                                             OpStore %84 %106 
					                                f32 %107 = OpLoad %84 
					                                f32 %109 = OpLoad vs_TEXCOORD1 
					                                f32 %110 = OpFMul %107 %109 
					                                             OpStore %84 %110 
					                                f32 %111 = OpLoad %84 
					                                f32 %112 = OpExtInst %1 43 %111 %56 %15 
					                                             OpStore %84 %112 
					                                f32 %113 = OpLoad %84 
					                         Input f32* %114 = OpAccessChain vs_TEXCOORD0 %77 
					                                f32 %115 = OpLoad %114 
					                               bool %116 = OpFOrdGreaterThanEqual %113 %115 
					                                             OpStore %74 %116 
					                               bool %118 = OpLoad %74 
					                                f32 %119 = OpSelect %118 %15 %56 
					                                             OpStore %117 %119 
					                               bool %121 = OpLoad %74 
					                             bool_3 %131 = OpCompositeConstruct %121 %121 %121 
					                              f32_3 %132 = OpSelect %131 %125 %129 
					                                             OpStore %120 %132 
					                               bool %133 = OpLoad %64 
					                                             OpSelectionMerge %137 None 
					                                             OpBranchConditional %133 %136 %139 
					                                    %136 = OpLabel 
					                              f32_3 %138 = OpLoad %120 
					                                             OpStore %135 %138 
					                                             OpBranch %137 
					                                    %139 = OpLabel 
					                                f32 %140 = OpLoad %117 
					                              f32_3 %141 = OpCompositeConstruct %140 %140 %140 
					                                             OpStore %135 %141 
					                                             OpBranch %137 
					                                    %137 = OpLabel 
					                              f32_3 %142 = OpLoad %135 
					                                             OpStore %27 %142 
					                                f32 %145 = OpLoad vs_TEXCOORD2 
					                                f32 %146 = OpExtInst %1 30 %145 
					                                             OpStore %143 %146 
					                                f32 %147 = OpLoad %143 
					                       Uniform f32* %149 = OpAccessChain %31 %43 %65 
					                                f32 %150 = OpLoad %149 
					                                f32 %151 = OpFMul %147 %150 
					                       Uniform f32* %152 = OpAccessChain %31 %43 %77 
					                                f32 %153 = OpLoad %152 
					                                f32 %154 = OpFAdd %151 %153 
					                                             OpStore %143 %154 
					                                f32 %155 = OpLoad %143 
					                                f32 %156 = OpExtInst %1 43 %155 %56 %15 
					                                             OpStore %143 %156 
					                       Uniform i32* %159 = OpAccessChain %31 %157 
					                                i32 %160 = OpLoad %159 
					                                f32 %161 = OpConvertSToF %160 
					                       Private f32* %162 = OpAccessChain %120 %65 
					                                             OpStore %162 %161 
					                                f32 %163 = OpLoad %143 
					                                f32 %164 = OpFNegate %163 
					                       Private f32* %165 = OpAccessChain %120 %65 
					                                f32 %166 = OpLoad %165 
					                                f32 %167 = OpFMul %164 %166 
					                      Function f32* %169 = OpAccessChain %9 %65 
					                                f32 %170 = OpLoad %169 
					                                f32 %171 = OpFAdd %167 %170 
					                                             OpStore %143 %171 
					                                f32 %173 = OpLoad %143 
					                                f32 %174 = OpExtInst %1 4 %173 
					                               bool %176 = OpFOrdLessThan %174 %175 
					                                             OpStore %172 %176 
					                               bool %179 = OpLoad %172 
					                                             OpSelectionMerge %182 None 
					                                             OpBranchConditional %179 %181 %185 
					                                    %181 = OpLabel 
					                                             OpStore %180 %184 
					                                             OpBranch %182 
					                                    %185 = OpLabel 
					                              f32_3 %186 = OpLoad %27 
					                                             OpStore %180 %186 
					                                             OpBranch %182 
					                                    %182 = OpLabel 
					                              f32_3 %187 = OpLoad %180 
					                              f32_4 %188 = OpLoad %178 
					                              f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
					                                             OpStore %178 %189 
					                        Output f32* %192 = OpAccessChain %178 %17 
					                                             OpStore %192 %190 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
				SubProgram "d3d11 " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec4 unused_0_2;
						vec4 _ScaleOffsetRes;
						vec4 unused_0_4;
					};
					layout(binding = 1, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(binding = 2, std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out float vs_TEXCOORD1;
					layout(location = 2) out float vs_TEXCOORD2;
					vec4 u_xlat0;
					uint u_xlatu0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0.x = float(u_xlatu0);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0.x + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0.x * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0.x + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat4.x = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat4.x = u_xlat2.x / u_xlat4.x;
					    u_xlat4.x = max(u_xlat4.x, _Params.z);
					    vs_TEXCOORD2 = min(u_xlat4.x, _Params.w);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0.x;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 _Params;
					uniform 	vec4 _ScaleOffsetRes;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					layout(location = 1) out float vs_TEXCOORD1;
					layout(location = 2) out float vs_TEXCOORD2;
					vec4 u_xlat0;
					uint u_xlatu0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					vec2 u_xlat4;
					uint u_xlatu4;
					float u_xlat8;
					uint u_xlatu8;
					bool u_xlatb8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					uint u_xlatu12;
					bool u_xlatb12;
					float u_xlat13;
					uint u_xlatu13;
					bool u_xlatb13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    u_xlatu0 = uint(0u);
					    u_xlatu4 = uint(0u);
					    while(true){
					        u_xlatb8 = u_xlatu4>=64u;
					        if(u_xlatb8){break;}
					        u_xlatu8 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlatu0 = max(u_xlatu8, u_xlatu0);
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat0.x = float(u_xlatu0);
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlatu4 = uint(0u);
					    u_xlat8 = float(0.0);
					    while(true){
					        u_xlatb12 = u_xlatu4>=64u;
					        if(u_xlatb12){break;}
					        u_xlatu12 = _Histogram_buf[u_xlatu4].value[(0 >> 2) + 0];
					        u_xlat12 = float(u_xlatu12);
					        u_xlat8 = u_xlat12 * u_xlat0.x + u_xlat8;
					        u_xlatu4 = u_xlatu4 + 1u;
					    }
					    u_xlat4.xy = vec2(u_xlat8) * _Params.xy;
					    u_xlat1.xy = u_xlat4.xy;
					    u_xlatu12 = 0u;
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    while(true){
					        u_xlatb13 = u_xlatu12>=64u;
					        if(u_xlatb13){break;}
					        u_xlatu13 = _Histogram_buf[u_xlatu12].value[(0 >> 2) + 0];
					        u_xlat13 = float(u_xlatu13);
					        u_xlat10 = u_xlat0.x * u_xlat13;
					        u_xlat10 = min(u_xlat1.x, u_xlat10);
					        u_xlat13 = u_xlat13 * u_xlat0.x + (-u_xlat10);
					        u_xlat1.xz = u_xlat1.xy + (-vec2(u_xlat10));
					        u_xlat3.y = min(u_xlat13, u_xlat1.z);
					        u_xlat1.y = u_xlat1.z + (-u_xlat3.y);
					        u_xlat9 = float(u_xlatu12);
					        u_xlat9 = u_xlat9 * 0.015625 + (-_ScaleOffsetRes.y);
					        u_xlat9 = u_xlat9 / _ScaleOffsetRes.x;
					        u_xlat9 = exp2(u_xlat9);
					        u_xlat3.x = u_xlat3.y * u_xlat9;
					        u_xlat2.xy = u_xlat3.xy + u_xlat2.xy;
					        u_xlatu12 = u_xlatu12 + 1u;
					    }
					    u_xlat4.x = max(u_xlat2.y, 9.99999975e-05);
					    u_xlat4.x = u_xlat2.x / u_xlat4.x;
					    u_xlat4.x = max(u_xlat4.x, _Params.z);
					    vs_TEXCOORD2 = min(u_xlat4.x, _Params.w);
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0.x;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec4 _Params;
					uniform 	vec4 _ScaleOffsetRes;
					uniform 	int _DebugWidth;
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 1) in  float vs_TEXCOORD1;
					layout(location = 2) in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					float u_xlat2;
					uint u_xlatu2;
					bool u_xlatb2;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = log2(_Params.zw);
					    u_xlat0.xy = u_xlat0.xy * _ScaleOffsetRes.xx + _ScaleOffsetRes.yy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlatb0 = u_xlat0.x<vs_TEXCOORD0.x;
					    u_xlatb2 = vs_TEXCOORD0.x<u_xlat0.y;
					    u_xlatb0 = u_xlatb2 && u_xlatb0;
					    u_xlat2 = vs_TEXCOORD0.x * 64.0;
					    u_xlat2 = roundEven(u_xlat2);
					    u_xlatu2 = uint(u_xlat2);
					    u_xlatu2 = _Histogram_buf[u_xlatu2].value[(0 >> 2) + 0];
					    u_xlat2 = float(u_xlatu2);
					    u_xlat2 = u_xlat2 * vs_TEXCOORD1;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlatb2 = u_xlat2>=vs_TEXCOORD0.y;
					    u_xlat4 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat1.xyz = (bool(u_xlatb2)) ? vec3(0.100000001, 0.800000012, 1.20000005) : vec3(0.0500000007, 0.400000006, 0.600000024);
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(u_xlat4);
					    u_xlat6 = log2(vs_TEXCOORD2);
					    u_xlat6 = u_xlat6 * _ScaleOffsetRes.x + _ScaleOffsetRes.y;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat1.x = float(_DebugWidth);
					    u_xlat6 = (-u_xlat6) * u_xlat1.x + hlslcc_FragCoord.x;
					    u_xlatb6 = abs(u_xlat6)<2.0;
					    SV_Target0.xyz = (bool(u_xlatb6)) ? vec3(0.800000012, 0.300000012, 0.0500000007) : u_xlat0.xyz;
					    SV_Target0.w = 0.699999988;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 284
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %11 %72 %259 %267 %268 %271 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %11 Location 11 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpDecorate %17 ArrayStride 17 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpMemberDecorate %70 0 BuiltIn 70 
					                                                      OpMemberDecorate %70 1 BuiltIn 70 
					                                                      OpMemberDecorate %70 2 BuiltIn 70 
					                                                      OpDecorate %70 Block 
					                                                      OpDecorate %97 ArrayStride 97 
					                                                      OpMemberDecorate %98 0 Offset 98 
					                                                      OpDecorate %99 ArrayStride 99 
					                                                      OpMemberDecorate %100 0 NonWritable 
					                                                      OpMemberDecorate %100 0 Offset 100 
					                                                      OpDecorate %100 BufferBlock 
					                                                      OpDecorate %102 DescriptorSet 102 
					                                                      OpDecorate %102 Binding 102 
					                                                      OpDecorate vs_TEXCOORD2 Location 259 
					                                                      OpDecorate vs_TEXCOORD0 Location 267 
					                                                      OpDecorate %268 Location 268 
					                                                      OpDecorate vs_TEXCOORD1 Location 271 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                                 Input f32_4* %11 = OpVariable Input 
					                                              %14 = OpTypeInt 32 0 
					                                          u32 %15 = OpConstant 4 
					                                              %16 = OpTypeArray %7 %15 
					                                              %17 = OpTypeArray %7 %15 
					                                              %18 = OpTypeStruct %16 %17 %7 %7 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %20 = OpVariable Uniform 
					                                              %21 = OpTypeInt 32 1 
					                                          i32 %22 = OpConstant 0 
					                                          i32 %23 = OpConstant 1 
					                                              %24 = OpTypePointer Uniform %7 
					                                          i32 %35 = OpConstant 2 
					                                          i32 %44 = OpConstant 3 
					                               Private f32_4* %48 = OpVariable Private 
					                                          u32 %68 = OpConstant 1 
					                                              %69 = OpTypeArray %6 %68 
					                                              %70 = OpTypeStruct %7 %6 %69 
					                                              %71 = OpTypePointer Output %70 
					         Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                              %80 = OpTypePointer Output %7 
					                                              %82 = OpTypePointer Private %14 
					                                 Private u32* %83 = OpVariable Private 
					                                          u32 %84 = OpConstant 0 
					                                              %85 = OpTypePointer Function %14 
					                                          u32 %93 = OpConstant 64 
					                                              %94 = OpTypeBool 
					                                 Private u32* %96 = OpVariable Private 
					                                              %97 = OpTypeArray %14 %68 
					                                              %98 = OpTypeStruct %97 
					                                              %99 = OpTypeRuntimeArray %98 
					                                             %100 = OpTypeStruct %99 
					                                             %101 = OpTypePointer Uniform %100 
					                         Uniform struct {;}* %102 = OpVariable Uniform 
					                                             %104 = OpTypePointer Uniform %14 
					                                             %114 = OpTypePointer Private %6 
					                                         f32 %116 = OpConstant 3,674022E-40 
					                                Private f32* %121 = OpVariable Private 
					                                         f32 %122 = OpConstant 3,674022E-40 
					                                Private u32* %131 = OpVariable Private 
					                                Private f32* %135 = OpVariable Private 
					                                             %146 = OpTypeVector %6 2 
					                                             %147 = OpTypePointer Private %146 
					                              Private f32_2* %148 = OpVariable Private 
					                              Private f32_2* %158 = OpVariable Private 
					                                Private u32* %169 = OpVariable Private 
					                                Private f32* %173 = OpVariable Private 
					                                Private f32* %176 = OpVariable Private 
					                              Private f32_2* %200 = OpVariable Private 
					                                         u32 %202 = OpConstant 2 
					                                Private f32* %214 = OpVariable Private 
					                                         f32 %218 = OpConstant 3,674022E-40 
					                                             %220 = OpTypePointer Uniform %6 
					                                         f32 %243 = OpConstant 3,674022E-40 
					                                             %258 = OpTypePointer Output %6 
					                         Output f32* vs_TEXCOORD2 = OpVariable Output 
					                                         u32 %262 = OpConstant 3 
					                                             %266 = OpTypePointer Output %146 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                Input f32_4* %268 = OpVariable Input 
					                         Output f32* vs_TEXCOORD1 = OpVariable Output 
					                                Private u32* %279 = OpVariable Private 
					                                             %280 = OpTypePointer Private %94 
					                               Private bool* %281 = OpVariable Private 
					                               Private bool* %282 = OpVariable Private 
					                               Private bool* %283 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function u32* %86 = OpVariable Function 
					                               Function u32* %123 = OpVariable Function 
					                               Function u32* %161 = OpVariable Function 
					                                        f32_4 %12 = OpLoad %11 
					                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                               Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                        f32_4 %26 = OpLoad %25 
					                                        f32_4 %27 = OpFMul %13 %26 
					                                                      OpStore %9 %27 
					                               Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                        f32_4 %29 = OpLoad %28 
					                                        f32_4 %30 = OpLoad %11 
					                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                        f32_4 %32 = OpFMul %29 %31 
					                                        f32_4 %33 = OpLoad %9 
					                                        f32_4 %34 = OpFAdd %32 %33 
					                                                      OpStore %9 %34 
					                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_4 %38 = OpLoad %11 
					                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                        f32_4 %40 = OpFMul %37 %39 
					                                        f32_4 %41 = OpLoad %9 
					                                        f32_4 %42 = OpFAdd %40 %41 
					                                                      OpStore %9 %42 
					                                        f32_4 %43 = OpLoad %9 
					                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                        f32_4 %46 = OpLoad %45 
					                                        f32_4 %47 = OpFAdd %43 %46 
					                                                      OpStore %9 %47 
					                                        f32_4 %49 = OpLoad %9 
					                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                               Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                        f32_4 %52 = OpLoad %51 
					                                        f32_4 %53 = OpFMul %50 %52 
					                                                      OpStore %48 %53 
					                               Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                        f32_4 %55 = OpLoad %54 
					                                        f32_4 %56 = OpLoad %9 
					                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                        f32_4 %58 = OpFMul %55 %57 
					                                        f32_4 %59 = OpLoad %48 
					                                        f32_4 %60 = OpFAdd %58 %59 
					                                                      OpStore %48 %60 
					                               Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                        f32_4 %62 = OpLoad %61 
					                                        f32_4 %63 = OpLoad %9 
					                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                        f32_4 %65 = OpFMul %62 %64 
					                                        f32_4 %66 = OpLoad %48 
					                                        f32_4 %67 = OpFAdd %65 %66 
					                                                      OpStore %48 %67 
					                               Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                        f32_4 %74 = OpLoad %73 
					                                        f32_4 %75 = OpLoad %9 
					                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                        f32_4 %77 = OpFMul %74 %76 
					                                        f32_4 %78 = OpLoad %48 
					                                        f32_4 %79 = OpFAdd %77 %78 
					                                Output f32_4* %81 = OpAccessChain %72 %22 
					                                                      OpStore %81 %79 
					                                                      OpStore %83 %84 
					                                                      OpStore %86 %84 
					                                                      OpBranch %87 
					                                              %87 = OpLabel 
					                                                      OpLoopMerge %89 %90 None 
					                                                      OpBranch %91 
					                                              %91 = OpLabel 
					                                          u32 %92 = OpLoad %86 
					                                         bool %95 = OpULessThan %92 %93 
					                                                      OpBranchConditional %95 %88 %89 
					                                              %88 = OpLabel 
					                                         u32 %103 = OpLoad %86 
					                                Uniform u32* %105 = OpAccessChain %102 %22 %103 %22 %22 
					                                         u32 %106 = OpLoad %105 
					                                                      OpStore %96 %106 
					                                         u32 %107 = OpLoad %96 
					                                         u32 %108 = OpLoad %83 
					                                         u32 %109 = OpExtInst %1 41 %107 %108 
					                                                      OpStore %83 %109 
					                                                      OpBranch %90 
					                                              %90 = OpLabel 
					                                         u32 %110 = OpLoad %86 
					                                         u32 %111 = OpIAdd %110 %23 
					                                                      OpStore %86 %111 
					                                                      OpBranch %87 
					                                              %89 = OpLabel 
					                                         u32 %112 = OpLoad %83 
					                                         f32 %113 = OpConvertUToF %112 
					                                Private f32* %115 = OpAccessChain %9 %84 
					                                                      OpStore %115 %113 
					                                Private f32* %117 = OpAccessChain %9 %84 
					                                         f32 %118 = OpLoad %117 
					                                         f32 %119 = OpFDiv %116 %118 
					                                Private f32* %120 = OpAccessChain %9 %84 
					                                                      OpStore %120 %119 
					                                                      OpStore %121 %122 
					                                                      OpStore %123 %84 
					                                                      OpBranch %124 
					                                             %124 = OpLabel 
					                                                      OpLoopMerge %126 %127 None 
					                                                      OpBranch %128 
					                                             %128 = OpLabel 
					                                         u32 %129 = OpLoad %123 
					                                        bool %130 = OpULessThan %129 %93 
					                                                      OpBranchConditional %130 %125 %126 
					                                             %125 = OpLabel 
					                                         u32 %132 = OpLoad %123 
					                                Uniform u32* %133 = OpAccessChain %102 %22 %132 %22 %22 
					                                         u32 %134 = OpLoad %133 
					                                                      OpStore %131 %134 
					                                         u32 %136 = OpLoad %131 
					                                         f32 %137 = OpConvertUToF %136 
					                                                      OpStore %135 %137 
					                                         f32 %138 = OpLoad %135 
					                                Private f32* %139 = OpAccessChain %9 %84 
					                                         f32 %140 = OpLoad %139 
					                                         f32 %141 = OpFMul %138 %140 
					                                         f32 %142 = OpLoad %121 
					                                         f32 %143 = OpFAdd %141 %142 
					                                                      OpStore %121 %143 
					                                                      OpBranch %127 
					                                             %127 = OpLabel 
					                                         u32 %144 = OpLoad %123 
					                                         u32 %145 = OpIAdd %144 %23 
					                                                      OpStore %123 %145 
					                                                      OpBranch %124 
					                                             %126 = OpLabel 
					                                         f32 %149 = OpLoad %121 
					                                       f32_2 %150 = OpCompositeConstruct %149 %149 
					                              Uniform f32_4* %151 = OpAccessChain %20 %35 
					                                       f32_4 %152 = OpLoad %151 
					                                       f32_2 %153 = OpVectorShuffle %152 %152 0 1 
					                                       f32_2 %154 = OpFMul %150 %153 
					                                                      OpStore %148 %154 
					                                       f32_2 %155 = OpLoad %148 
					                                       f32_4 %156 = OpLoad %48 
					                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 2 3 
					                                                      OpStore %48 %157 
					                                Private f32* %159 = OpAccessChain %158 %84 
					                                                      OpStore %159 %122 
					                                Private f32* %160 = OpAccessChain %158 %68 
					                                                      OpStore %160 %122 
					                                                      OpStore %161 %84 
					                                                      OpBranch %162 
					                                             %162 = OpLabel 
					                                                      OpLoopMerge %164 %165 None 
					                                                      OpBranch %166 
					                                             %166 = OpLabel 
					                                         u32 %167 = OpLoad %161 
					                                        bool %168 = OpULessThan %167 %93 
					                                                      OpBranchConditional %168 %163 %164 
					                                             %163 = OpLabel 
					                                         u32 %170 = OpLoad %161 
					                                Uniform u32* %171 = OpAccessChain %102 %22 %170 %22 %22 
					                                         u32 %172 = OpLoad %171 
					                                                      OpStore %169 %172 
					                                         u32 %174 = OpLoad %169 
					                                         f32 %175 = OpConvertUToF %174 
					                                                      OpStore %173 %175 
					                                Private f32* %177 = OpAccessChain %9 %84 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpLoad %173 
					                                         f32 %180 = OpFMul %178 %179 
					                                                      OpStore %176 %180 
					                                Private f32* %181 = OpAccessChain %48 %84 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpLoad %176 
					                                         f32 %184 = OpExtInst %1 37 %182 %183 
					                                                      OpStore %176 %184 
					                                         f32 %185 = OpLoad %173 
					                                Private f32* %186 = OpAccessChain %9 %84 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %185 %187 
					                                         f32 %189 = OpLoad %176 
					                                         f32 %190 = OpFNegate %189 
					                                         f32 %191 = OpFAdd %188 %190 
					                                                      OpStore %173 %191 
					                                       f32_4 %192 = OpLoad %48 
					                                       f32_2 %193 = OpVectorShuffle %192 %192 0 1 
					                                         f32 %194 = OpLoad %176 
					                                       f32_2 %195 = OpCompositeConstruct %194 %194 
					                                       f32_2 %196 = OpFNegate %195 
					                                       f32_2 %197 = OpFAdd %193 %196 
					                                       f32_4 %198 = OpLoad %48 
					                                       f32_4 %199 = OpVectorShuffle %198 %197 4 1 5 3 
					                                                      OpStore %48 %199 
					                                         f32 %201 = OpLoad %173 
					                                Private f32* %203 = OpAccessChain %48 %202 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %205 = OpExtInst %1 37 %201 %204 
					                                Private f32* %206 = OpAccessChain %200 %68 
					                                                      OpStore %206 %205 
					                                Private f32* %207 = OpAccessChain %48 %202 
					                                         f32 %208 = OpLoad %207 
					                                Private f32* %209 = OpAccessChain %200 %68 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %211 = OpFNegate %210 
					                                         f32 %212 = OpFAdd %208 %211 
					                                Private f32* %213 = OpAccessChain %48 %68 
					                                                      OpStore %213 %212 
					                                         u32 %215 = OpLoad %161 
					                                         f32 %216 = OpConvertUToF %215 
					                                                      OpStore %214 %216 
					                                         f32 %217 = OpLoad %214 
					                                         f32 %219 = OpFMul %217 %218 
					                                Uniform f32* %221 = OpAccessChain %20 %44 %68 
					                                         f32 %222 = OpLoad %221 
					                                         f32 %223 = OpFNegate %222 
					                                         f32 %224 = OpFAdd %219 %223 
					                                                      OpStore %214 %224 
					                                         f32 %225 = OpLoad %214 
					                                Uniform f32* %226 = OpAccessChain %20 %44 %84 
					                                         f32 %227 = OpLoad %226 
					                                         f32 %228 = OpFDiv %225 %227 
					                                                      OpStore %214 %228 
					                                         f32 %229 = OpLoad %214 
					                                         f32 %230 = OpExtInst %1 29 %229 
					                                                      OpStore %214 %230 
					                                Private f32* %231 = OpAccessChain %200 %68 
					                                         f32 %232 = OpLoad %231 
					                                         f32 %233 = OpLoad %214 
					                                         f32 %234 = OpFMul %232 %233 
					                                Private f32* %235 = OpAccessChain %200 %84 
					                                                      OpStore %235 %234 
					                                       f32_2 %236 = OpLoad %200 
					                                       f32_2 %237 = OpLoad %158 
					                                       f32_2 %238 = OpFAdd %236 %237 
					                                                      OpStore %158 %238 
					                                                      OpBranch %165 
					                                             %165 = OpLabel 
					                                         u32 %239 = OpLoad %161 
					                                         u32 %240 = OpIAdd %239 %23 
					                                                      OpStore %161 %240 
					                                                      OpBranch %162 
					                                             %164 = OpLabel 
					                                Private f32* %241 = OpAccessChain %158 %68 
					                                         f32 %242 = OpLoad %241 
					                                         f32 %244 = OpExtInst %1 40 %242 %243 
					                                Private f32* %245 = OpAccessChain %148 %84 
					                                                      OpStore %245 %244 
					                                Private f32* %246 = OpAccessChain %158 %84 
					                                         f32 %247 = OpLoad %246 
					                                Private f32* %248 = OpAccessChain %148 %84 
					                                         f32 %249 = OpLoad %248 
					                                         f32 %250 = OpFDiv %247 %249 
					                                Private f32* %251 = OpAccessChain %148 %84 
					                                                      OpStore %251 %250 
					                                Private f32* %252 = OpAccessChain %148 %84 
					                                         f32 %253 = OpLoad %252 
					                                Uniform f32* %254 = OpAccessChain %20 %35 %202 
					                                         f32 %255 = OpLoad %254 
					                                         f32 %256 = OpExtInst %1 40 %253 %255 
					                                Private f32* %257 = OpAccessChain %148 %84 
					                                                      OpStore %257 %256 
					                                Private f32* %260 = OpAccessChain %148 %84 
					                                         f32 %261 = OpLoad %260 
					                                Uniform f32* %263 = OpAccessChain %20 %35 %262 
					                                         f32 %264 = OpLoad %263 
					                                         f32 %265 = OpExtInst %1 37 %261 %264 
					                                                      OpStore vs_TEXCOORD2 %265 
					                                       f32_4 %269 = OpLoad %268 
					                                       f32_2 %270 = OpVectorShuffle %269 %269 0 1 
					                                                      OpStore vs_TEXCOORD0 %270 
					                                Private f32* %272 = OpAccessChain %9 %84 
					                                         f32 %273 = OpLoad %272 
					                                                      OpStore vs_TEXCOORD1 %273 
					                                 Output f32* %274 = OpAccessChain %72 %22 %68 
					                                         f32 %275 = OpLoad %274 
					                                         f32 %276 = OpFNegate %275 
					                                 Output f32* %277 = OpAccessChain %72 %22 %68 
					                                                      OpStore %277 %276 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 194
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %11 %70 %108 %144 %178 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                             OpDecorate %11 BuiltIn TessLevelOuter 
					                                             OpMemberDecorate %29 0 Offset 29 
					                                             OpMemberDecorate %29 1 Offset 29 
					                                             OpMemberDecorate %29 2 Offset 29 
					                                             OpDecorate %29 Block 
					                                             OpDecorate %31 DescriptorSet 31 
					                                             OpDecorate %31 Binding 31 
					                                             OpDecorate vs_TEXCOORD0 Location 70 
					                                             OpDecorate %95 ArrayStride 95 
					                                             OpMemberDecorate %96 0 Offset 96 
					                                             OpDecorate %97 ArrayStride 97 
					                                             OpMemberDecorate %98 0 NonWritable 
					                                             OpMemberDecorate %98 0 Offset 98 
					                                             OpDecorate %98 BufferBlock 
					                                             OpDecorate %100 DescriptorSet 100 
					                                             OpDecorate %100 Binding 100 
					                                             OpDecorate vs_TEXCOORD1 Location 108 
					                                             OpDecorate vs_TEXCOORD2 Location 144 
					                                             OpDecorate %178 Location 178 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Function %7 
					                                     %10 = OpTypePointer Input %7 
					                        Input f32_4* %11 = OpVariable Input 
					                                     %12 = OpTypeVector %6 3 
					                                 f32 %15 = OpConstant 3,674022E-40 
					                                     %16 = OpTypeInt 32 0 
					                                 u32 %17 = OpConstant 3 
					                                     %18 = OpTypePointer Input %6 
					                                     %26 = OpTypePointer Private %12 
					                      Private f32_3* %27 = OpVariable Private 
					                                     %28 = OpTypeInt 32 1 
					                                     %29 = OpTypeStruct %7 %7 %28 
					                                     %30 = OpTypePointer Uniform %29 
					Uniform struct {f32_4; f32_4; i32;}* %31 = OpVariable Uniform 
					                                 i32 %32 = OpConstant 0 
					                                     %33 = OpTypeVector %6 2 
					                                     %34 = OpTypePointer Uniform %7 
					                                 i32 %43 = OpConstant 1 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                                     %62 = OpTypeBool 
					                                     %63 = OpTypePointer Private %62 
					                       Private bool* %64 = OpVariable Private 
					                                 u32 %65 = OpConstant 0 
					                                     %66 = OpTypePointer Private %6 
					                                     %69 = OpTypePointer Input %33 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                       Private bool* %74 = OpVariable Private 
					                                 u32 %77 = OpConstant 1 
					                        Private f32* %84 = OpVariable Private 
					                                 f32 %87 = OpConstant 3,674022E-40 
					                                     %91 = OpTypePointer Private %16 
					                        Private u32* %92 = OpVariable Private 
					                                     %95 = OpTypeArray %16 %77 
					                                     %96 = OpTypeStruct %95 
					                                     %97 = OpTypeRuntimeArray %96 
					                                     %98 = OpTypeStruct %97 
					                                     %99 = OpTypePointer Uniform %98 
					                Uniform struct {;}* %100 = OpVariable Uniform 
					                                    %102 = OpTypePointer Uniform %16 
					                 Input f32* vs_TEXCOORD1 = OpVariable Input 
					                       Private f32* %117 = OpVariable Private 
					                     Private f32_3* %120 = OpVariable Private 
					                                f32 %122 = OpConstant 3,674022E-40 
					                                f32 %123 = OpConstant 3,674022E-40 
					                                f32 %124 = OpConstant 3,674022E-40 
					                              f32_3 %125 = OpConstantComposite %122 %123 %124 
					                                f32 %126 = OpConstant 3,674022E-40 
					                                f32 %127 = OpConstant 3,674022E-40 
					                                f32 %128 = OpConstant 3,674022E-40 
					                              f32_3 %129 = OpConstantComposite %126 %127 %128 
					                                    %130 = OpTypeVector %62 3 
					                                    %134 = OpTypePointer Function %12 
					                       Private f32* %143 = OpVariable Private 
					                 Input f32* vs_TEXCOORD2 = OpVariable Input 
					                                    %148 = OpTypePointer Uniform %6 
					                                i32 %157 = OpConstant 2 
					                                    %158 = OpTypePointer Uniform %28 
					                                    %168 = OpTypePointer Function %6 
					                      Private bool* %172 = OpVariable Private 
					                                f32 %175 = OpConstant 3,674022E-40 
					                                    %177 = OpTypePointer Output %7 
					                      Output f32_4* %178 = OpVariable Output 
					                                f32 %183 = OpConstant 3,674022E-40 
					                              f32_3 %184 = OpConstantComposite %123 %183 %126 
					                                f32 %190 = OpConstant 3,674022E-40 
					                                    %191 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                      Function f32_4* %9 = OpVariable Function 
					                    Function f32_3* %135 = OpVariable Function 
					                    Function f32_3* %180 = OpVariable Function 
					                               f32_4 %13 = OpLoad %11 
					                               f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
					                          Input f32* %19 = OpAccessChain %11 %17 
					                                 f32 %20 = OpLoad %19 
					                                 f32 %21 = OpFDiv %15 %20 
					                                 f32 %22 = OpCompositeExtract %14 0 
					                                 f32 %23 = OpCompositeExtract %14 1 
					                                 f32 %24 = OpCompositeExtract %14 2 
					                               f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
					                                             OpStore %9 %25 
					                      Uniform f32_4* %35 = OpAccessChain %31 %32 
					                               f32_4 %36 = OpLoad %35 
					                               f32_2 %37 = OpVectorShuffle %36 %36 2 3 
					                               f32_2 %38 = OpExtInst %1 30 %37 
					                               f32_3 %39 = OpLoad %27 
					                               f32_3 %40 = OpVectorShuffle %39 %38 3 4 2 
					                                             OpStore %27 %40 
					                               f32_3 %41 = OpLoad %27 
					                               f32_2 %42 = OpVectorShuffle %41 %41 0 1 
					                      Uniform f32_4* %44 = OpAccessChain %31 %43 
					                               f32_4 %45 = OpLoad %44 
					                               f32_2 %46 = OpVectorShuffle %45 %45 0 0 
					                               f32_2 %47 = OpFMul %42 %46 
					                      Uniform f32_4* %48 = OpAccessChain %31 %43 
					                               f32_4 %49 = OpLoad %48 
					                               f32_2 %50 = OpVectorShuffle %49 %49 1 1 
					                               f32_2 %51 = OpFAdd %47 %50 
					                               f32_3 %52 = OpLoad %27 
					                               f32_3 %53 = OpVectorShuffle %52 %51 3 4 2 
					                                             OpStore %27 %53 
					                               f32_3 %54 = OpLoad %27 
					                               f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                               f32_2 %57 = OpCompositeConstruct %56 %56 
					                               f32_2 %58 = OpCompositeConstruct %15 %15 
					                               f32_2 %59 = OpExtInst %1 43 %55 %57 %58 
					                               f32_3 %60 = OpLoad %27 
					                               f32_3 %61 = OpVectorShuffle %60 %59 3 4 2 
					                                             OpStore %27 %61 
					                        Private f32* %67 = OpAccessChain %27 %65 
					                                 f32 %68 = OpLoad %67 
					                          Input f32* %71 = OpAccessChain vs_TEXCOORD0 %65 
					                                 f32 %72 = OpLoad %71 
					                                bool %73 = OpFOrdLessThan %68 %72 
					                                             OpStore %64 %73 
					                          Input f32* %75 = OpAccessChain vs_TEXCOORD0 %65 
					                                 f32 %76 = OpLoad %75 
					                        Private f32* %78 = OpAccessChain %27 %77 
					                                 f32 %79 = OpLoad %78 
					                                bool %80 = OpFOrdLessThan %76 %79 
					                                             OpStore %74 %80 
					                                bool %81 = OpLoad %74 
					                                bool %82 = OpLoad %64 
					                                bool %83 = OpLogicalAnd %81 %82 
					                                             OpStore %64 %83 
					                          Input f32* %85 = OpAccessChain vs_TEXCOORD0 %65 
					                                 f32 %86 = OpLoad %85 
					                                 f32 %88 = OpFMul %86 %87 
					                                             OpStore %84 %88 
					                                 f32 %89 = OpLoad %84 
					                                 f32 %90 = OpExtInst %1 2 %89 
					                                             OpStore %84 %90 
					                                 f32 %93 = OpLoad %84 
					                                 u32 %94 = OpConvertFToU %93 
					                                             OpStore %92 %94 
					                                u32 %101 = OpLoad %92 
					                       Uniform u32* %103 = OpAccessChain %100 %32 %101 %32 %32 
					                                u32 %104 = OpLoad %103 
					                                             OpStore %92 %104 
					                                u32 %105 = OpLoad %92 
					                                f32 %106 = OpConvertUToF %105 
					                                             OpStore %84 %106 
					                                f32 %107 = OpLoad %84 
					                                f32 %109 = OpLoad vs_TEXCOORD1 
					                                f32 %110 = OpFMul %107 %109 
					                                             OpStore %84 %110 
					                                f32 %111 = OpLoad %84 
					                                f32 %112 = OpExtInst %1 43 %111 %56 %15 
					                                             OpStore %84 %112 
					                                f32 %113 = OpLoad %84 
					                         Input f32* %114 = OpAccessChain vs_TEXCOORD0 %77 
					                                f32 %115 = OpLoad %114 
					                               bool %116 = OpFOrdGreaterThanEqual %113 %115 
					                                             OpStore %74 %116 
					                               bool %118 = OpLoad %74 
					                                f32 %119 = OpSelect %118 %15 %56 
					                                             OpStore %117 %119 
					                               bool %121 = OpLoad %74 
					                             bool_3 %131 = OpCompositeConstruct %121 %121 %121 
					                              f32_3 %132 = OpSelect %131 %125 %129 
					                                             OpStore %120 %132 
					                               bool %133 = OpLoad %64 
					                                             OpSelectionMerge %137 None 
					                                             OpBranchConditional %133 %136 %139 
					                                    %136 = OpLabel 
					                              f32_3 %138 = OpLoad %120 
					                                             OpStore %135 %138 
					                                             OpBranch %137 
					                                    %139 = OpLabel 
					                                f32 %140 = OpLoad %117 
					                              f32_3 %141 = OpCompositeConstruct %140 %140 %140 
					                                             OpStore %135 %141 
					                                             OpBranch %137 
					                                    %137 = OpLabel 
					                              f32_3 %142 = OpLoad %135 
					                                             OpStore %27 %142 
					                                f32 %145 = OpLoad vs_TEXCOORD2 
					                                f32 %146 = OpExtInst %1 30 %145 
					                                             OpStore %143 %146 
					                                f32 %147 = OpLoad %143 
					                       Uniform f32* %149 = OpAccessChain %31 %43 %65 
					                                f32 %150 = OpLoad %149 
					                                f32 %151 = OpFMul %147 %150 
					                       Uniform f32* %152 = OpAccessChain %31 %43 %77 
					                                f32 %153 = OpLoad %152 
					                                f32 %154 = OpFAdd %151 %153 
					                                             OpStore %143 %154 
					                                f32 %155 = OpLoad %143 
					                                f32 %156 = OpExtInst %1 43 %155 %56 %15 
					                                             OpStore %143 %156 
					                       Uniform i32* %159 = OpAccessChain %31 %157 
					                                i32 %160 = OpLoad %159 
					                                f32 %161 = OpConvertSToF %160 
					                       Private f32* %162 = OpAccessChain %120 %65 
					                                             OpStore %162 %161 
					                                f32 %163 = OpLoad %143 
					                                f32 %164 = OpFNegate %163 
					                       Private f32* %165 = OpAccessChain %120 %65 
					                                f32 %166 = OpLoad %165 
					                                f32 %167 = OpFMul %164 %166 
					                      Function f32* %169 = OpAccessChain %9 %65 
					                                f32 %170 = OpLoad %169 
					                                f32 %171 = OpFAdd %167 %170 
					                                             OpStore %143 %171 
					                                f32 %173 = OpLoad %143 
					                                f32 %174 = OpExtInst %1 4 %173 
					                               bool %176 = OpFOrdLessThan %174 %175 
					                                             OpStore %172 %176 
					                               bool %179 = OpLoad %172 
					                                             OpSelectionMerge %182 None 
					                                             OpBranchConditional %179 %181 %185 
					                                    %181 = OpLabel 
					                                             OpStore %180 %184 
					                                             OpBranch %182 
					                                    %185 = OpLabel 
					                              f32_3 %186 = OpLoad %27 
					                                             OpStore %180 %186 
					                                             OpBranch %182 
					                                    %182 = OpLabel 
					                              f32_3 %187 = OpLoad %180 
					                              f32_4 %188 = OpLoad %178 
					                              f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
					                                             OpStore %178 %189 
					                        Output f32* %192 = OpAccessChain %178 %17 
					                                             OpStore %192 %190 
					                                             OpReturn
					                                             OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec4 unused_0_2;
						vec4 _ScaleOffsetRes;
						int _DebugWidth;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 1) in  float vs_TEXCOORD1;
					layout(location = 2) in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					float u_xlat2;
					uint u_xlatu2;
					bool u_xlatb2;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = log2(_Params.zw);
					    u_xlat0.xy = u_xlat0.xy * _ScaleOffsetRes.xx + _ScaleOffsetRes.yy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlatb0 = u_xlat0.x<vs_TEXCOORD0.x;
					    u_xlatb2 = vs_TEXCOORD0.x<u_xlat0.y;
					    u_xlatb0 = u_xlatb2 && u_xlatb0;
					    u_xlat2 = vs_TEXCOORD0.x * 64.0;
					    u_xlat2 = roundEven(u_xlat2);
					    u_xlatu2 = uint(u_xlat2);
					    u_xlatu2 = _Histogram_buf[u_xlatu2].value[(0 >> 2) + 0];
					    u_xlat2 = float(u_xlatu2);
					    u_xlat2 = u_xlat2 * vs_TEXCOORD1;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlatb2 = u_xlat2>=vs_TEXCOORD0.y;
					    u_xlat4 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat1.xyz = (bool(u_xlatb2)) ? vec3(0.100000001, 0.800000012, 1.20000005) : vec3(0.0500000007, 0.400000006, 0.600000024);
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(u_xlat4);
					    u_xlat6 = log2(vs_TEXCOORD2);
					    u_xlat6 = u_xlat6 * _ScaleOffsetRes.x + _ScaleOffsetRes.y;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat1.x = float(_DebugWidth);
					    u_xlat6 = (-u_xlat6) * u_xlat1.x + hlslcc_FragCoord.x;
					    u_xlatb6 = abs(u_xlat6)<2.0;
					    SV_Target0.xyz = (bool(u_xlatb6)) ? vec3(0.800000012, 0.300000012, 0.0500000007) : u_xlat0.xyz;
					    SV_Target0.w = 0.699999988;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
				SubProgram "d3d11 " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _Params;
						vec4 unused_0_2;
						vec4 _ScaleOffsetRes;
						int _DebugWidth;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 1) in  float vs_TEXCOORD1;
					layout(location = 2) in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					float u_xlat2;
					uint u_xlatu2;
					bool u_xlatb2;
					float u_xlat4;
					float u_xlat6;
					bool u_xlatb6;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0.xy = log2(_Params.zw);
					    u_xlat0.xy = u_xlat0.xy * _ScaleOffsetRes.xx + _ScaleOffsetRes.yy;
					    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
					    u_xlatb0 = u_xlat0.x<vs_TEXCOORD0.x;
					    u_xlatb2 = vs_TEXCOORD0.x<u_xlat0.y;
					    u_xlatb0 = u_xlatb2 && u_xlatb0;
					    u_xlat2 = vs_TEXCOORD0.x * 64.0;
					    u_xlat2 = roundEven(u_xlat2);
					    u_xlatu2 = uint(u_xlat2);
					    u_xlatu2 = _Histogram_buf[u_xlatu2].value[(0 >> 2) + 0];
					    u_xlat2 = float(u_xlatu2);
					    u_xlat2 = u_xlat2 * vs_TEXCOORD1;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlatb2 = u_xlat2>=vs_TEXCOORD0.y;
					    u_xlat4 = u_xlatb2 ? 1.0 : float(0.0);
					    u_xlat1.xyz = (bool(u_xlatb2)) ? vec3(0.100000001, 0.800000012, 1.20000005) : vec3(0.0500000007, 0.400000006, 0.600000024);
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : vec3(u_xlat4);
					    u_xlat6 = log2(vs_TEXCOORD2);
					    u_xlat6 = u_xlat6 * _ScaleOffsetRes.x + _ScaleOffsetRes.y;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat1.x = float(_DebugWidth);
					    u_xlat6 = (-u_xlat6) * u_xlat1.x + hlslcc_FragCoord.x;
					    u_xlatb6 = abs(u_xlat6)<2.0;
					    SV_Target0.xyz = (bool(u_xlatb6)) ? vec3(0.800000012, 0.300000012, 0.0500000007) : u_xlat0.xyz;
					    SV_Target0.w = 0.699999988;
					    return;
					}"
				}
				SubProgram "glcore " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					Keywords { "AUTO_KEY_VALUE" }
					"!!vulkan"
				}
			}
		}
	}
}