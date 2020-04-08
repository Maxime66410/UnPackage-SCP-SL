Shader "CameraFilterPack/VHS_Tracking" {
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
			GpuProgramID 15937
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					ivec2 u_xlati0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec2 u_xlat6;
					float u_xlat7;
					void main()
					{
					    u_xlat0.x = dot(vec2(_TimeX), vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.y = sin(u_xlat0.x);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat2.x = cos(_TimeX);
					    u_xlat0.x = u_xlat0.x * abs(u_xlat2.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(100.0, 0.100000001);
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.x = u_xlat6.y * 32.0 + (-u_xlat0.x);
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat4.x = u_xlat4.x * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * -0.0601122938;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat7 = (-u_xlat0.y) * u_xlat4.x + u_xlat6.x;
					    u_xlat2.x = u_xlat0.y * u_xlat4.x;
					    u_xlat2.x = (-u_xlat2.x);
					    u_xlat4.xy = vec2(u_xlat7) * vec2(100.0, 10.0);
					    u_xlat3.x = floor(u_xlat4.y);
					    u_xlat3.x = (-u_xlat3.x) * 10.0 + u_xlat4.x;
					    u_xlat1.x = u_xlat1.x * u_xlat3.x;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9799995, 78.1299973));
					    u_xlat0.y = sin(u_xlat3.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 43858.5547);
					    u_xlat3.x = fract(u_xlat0.y);
					    u_xlatb3 = 0.400000006<u_xlat3.x;
					    u_xlat4.x = cos(u_xlat0.x);
					    u_xlat4.x = u_xlat4.x * 36.0;
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlatb1 = u_xlat4.x<u_xlat1.x;
					    u_xlati0.y = int((uint(u_xlatb3) * 0xffffffffu) | (uint(u_xlatb1) * 0xffffffffu));
					    u_xlat1.x = _TimeX * 0.600000024;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat7 = dot(u_xlat1.xx, vec2(12.9799995, 78.1299973));
					    u_xlat7 = sin(u_xlat7);
					    u_xlat7 = u_xlat7 * 43858.5547;
					    u_xlat7 = fract(u_xlat7);
					    u_xlat1.z = u_xlat7 * _Value;
					    u_xlat1.y = _TimeX;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9799995, 78.1299973));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43858.5547;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.25 + u_xlat0.x;
					    u_xlati0.x = int((u_xlat0.x<u_xlat6.y) ? 0xFFFFFFFFu : uint(0));
					    u_xlat1.x = uintBitsToFloat((u_xlat6.y<u_xlat1.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0.xy = ivec2(uvec2(u_xlati0.xy) & floatBitsToUint(u_xlat1.xz));
					    u_xlat0.x = uintBitsToFloat(uint(u_xlati0.y) & uint(u_xlati0.x));
					    u_xlat2.y = 0.0;
					    u_xlat3.xy = vec2(vec2(_Value, _Value)) * u_xlat2.xy + u_xlat6.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat10_1.xyz;
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
					; Bound: 339
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %72 %327 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpMemberDecorate %11 2 RelaxedPrecision 
					                                              OpMemberDecorate %11 2 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD0 Location 72 
					                                              OpDecorate %77 RelaxedPrecision 
					                                              OpDecorate %78 RelaxedPrecision 
					                                              OpDecorate %81 RelaxedPrecision 
					                                              OpDecorate %82 RelaxedPrecision 
					                                              OpDecorate %312 RelaxedPrecision 
					                                              OpDecorate %315 RelaxedPrecision 
					                                              OpDecorate %315 DescriptorSet 315 
					                                              OpDecorate %315 Binding 315 
					                                              OpDecorate %316 RelaxedPrecision 
					                                              OpDecorate %319 RelaxedPrecision 
					                                              OpDecorate %319 DescriptorSet 319 
					                                              OpDecorate %319 Binding 319 
					                                              OpDecorate %320 RelaxedPrecision 
					                                              OpDecorate %325 RelaxedPrecision 
					                                              OpDecorate %327 Location 327 
					                                              OpDecorate %330 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 4 
					                                      %11 = OpTypeStruct %6 %6 %10 
					                                      %12 = OpTypePointer Uniform %11 
					   Uniform struct {f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                      %14 = OpTypeInt 32 1 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %6 
					                                  f32 %20 = OpConstant 3,674022E-40 
					                                  f32 %21 = OpConstant 3,674022E-40 
					                                f32_2 %22 = OpConstantComposite %20 %21 
					                                      %24 = OpTypeInt 32 0 
					                                  u32 %25 = OpConstant 0 
					                                      %26 = OpTypePointer Private %6 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                  u32 %44 = OpConstant 1 
					                                      %46 = OpTypeVector %6 3 
					                                      %47 = OpTypePointer Private %46 
					                       Private f32_3* %48 = OpVariable Private 
					                       Private f32_2* %53 = OpVariable Private 
					                                  f32 %66 = OpConstant 3,674022E-40 
					                                  f32 %67 = OpConstant 3,674022E-40 
					                                f32_2 %68 = OpConstantComposite %66 %67 
					                       Private f32_2* %70 = OpVariable Private 
					                                      %71 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  i32 %74 = OpConstant 2 
					                                      %75 = OpTypePointer Uniform %10 
					                       Private f32_2* %84 = OpVariable Private 
					                                  f32 %87 = OpConstant 3,674022E-40 
					                                 f32 %106 = OpConstant 3,674022E-40 
					                        Private f32* %113 = OpVariable Private 
					                                 f32 %135 = OpConstant 3,674022E-40 
					                               f32_2 %136 = OpConstantComposite %66 %135 
					                      Private f32_2* %138 = OpVariable Private 
					                                 f32 %166 = OpConstant 3,674022E-40 
					                               f32_2 %167 = OpConstantComposite %166 %34 
					                                     %173 = OpTypeBool 
					                                     %174 = OpTypePointer Private %173 
					                       Private bool* %175 = OpVariable Private 
					                                 f32 %176 = OpConstant 3,674022E-40 
					                                 f32 %186 = OpConstant 3,674022E-40 
					                       Private bool* %193 = OpVariable Private 
					                                     %199 = OpTypeVector %14 2 
					                                     %200 = OpTypePointer Private %199 
					                      Private i32_2* %201 = OpVariable Private 
					                                 u32 %204 = OpConstant 4294967295 
					                                     %211 = OpTypePointer Private %14 
					                                 f32 %215 = OpConstant 3,674022E-40 
					                                 i32 %232 = OpConstant 1 
					                                 u32 %236 = OpConstant 2 
					                                 f32 %259 = OpConstant 3,674022E-40 
					                                     %282 = OpTypeVector %24 2 
					                                 f32 %298 = OpConstant 3,674022E-40 
					                      Private f32_3* %312 = OpVariable Private 
					                                     %313 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %314 = OpTypePointer UniformConstant %313 
					UniformConstant read_only Texture2D* %315 = OpVariable UniformConstant 
					                                     %317 = OpTypeSampler 
					                                     %318 = OpTypePointer UniformConstant %317 
					            UniformConstant sampler* %319 = OpVariable UniformConstant 
					                                     %321 = OpTypeSampledImage %313 
					                                     %326 = OpTypePointer Output %10 
					                       Output f32_4* %327 = OpVariable Output 
					                                 f32 %334 = OpConstant 3,674022E-40 
					                                 u32 %335 = OpConstant 3 
					                                     %336 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                         Uniform f32* %17 = OpAccessChain %13 %15 
					                                  f32 %18 = OpLoad %17 
					                                f32_2 %19 = OpCompositeConstruct %18 %18 
					                                  f32 %23 = OpDot %19 %22 
					                         Private f32* %27 = OpAccessChain %9 %25 
					                                              OpStore %27 %23 
					                         Private f32* %28 = OpAccessChain %9 %25 
					                                  f32 %29 = OpLoad %28 
					                                  f32 %30 = OpExtInst %1 13 %29 
					                         Private f32* %31 = OpAccessChain %9 %25 
					                                              OpStore %31 %30 
					                         Private f32* %32 = OpAccessChain %9 %25 
					                                  f32 %33 = OpLoad %32 
					                                  f32 %35 = OpFMul %33 %34 
					                         Private f32* %36 = OpAccessChain %9 %25 
					                                              OpStore %36 %35 
					                         Private f32* %37 = OpAccessChain %9 %25 
					                                  f32 %38 = OpLoad %37 
					                                  f32 %39 = OpExtInst %1 10 %38 
					                         Private f32* %40 = OpAccessChain %9 %25 
					                                              OpStore %40 %39 
					                         Private f32* %41 = OpAccessChain %9 %25 
					                                  f32 %42 = OpLoad %41 
					                                  f32 %43 = OpExtInst %1 13 %42 
					                         Private f32* %45 = OpAccessChain %9 %44 
					                                              OpStore %45 %43 
					                         Uniform f32* %49 = OpAccessChain %13 %15 
					                                  f32 %50 = OpLoad %49 
					                                  f32 %51 = OpExtInst %1 13 %50 
					                         Private f32* %52 = OpAccessChain %48 %25 
					                                              OpStore %52 %51 
					                         Uniform f32* %54 = OpAccessChain %13 %15 
					                                  f32 %55 = OpLoad %54 
					                                  f32 %56 = OpExtInst %1 14 %55 
					                         Private f32* %57 = OpAccessChain %53 %25 
					                                              OpStore %57 %56 
					                         Private f32* %58 = OpAccessChain %9 %25 
					                                  f32 %59 = OpLoad %58 
					                         Private f32* %60 = OpAccessChain %53 %25 
					                                  f32 %61 = OpLoad %60 
					                                  f32 %62 = OpExtInst %1 4 %61 
					                                  f32 %63 = OpFMul %59 %62 
					                         Private f32* %64 = OpAccessChain %9 %25 
					                                              OpStore %64 %63 
					                                f32_2 %65 = OpLoad %9 
					                                f32_2 %69 = OpFMul %65 %68 
					                                              OpStore %9 %69 
					                                f32_2 %73 = OpLoad vs_TEXCOORD0 
					                       Uniform f32_4* %76 = OpAccessChain %13 %74 
					                                f32_4 %77 = OpLoad %76 
					                                f32_2 %78 = OpVectorShuffle %77 %77 0 1 
					                                f32_2 %79 = OpFMul %73 %78 
					                       Uniform f32_4* %80 = OpAccessChain %13 %74 
					                                f32_4 %81 = OpLoad %80 
					                                f32_2 %82 = OpVectorShuffle %81 %81 2 3 
					                                f32_2 %83 = OpFAdd %79 %82 
					                                              OpStore %70 %83 
					                         Private f32* %85 = OpAccessChain %70 %44 
					                                  f32 %86 = OpLoad %85 
					                                  f32 %88 = OpFMul %86 %87 
					                         Private f32* %89 = OpAccessChain %9 %25 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                                  f32 %92 = OpFAdd %88 %91 
					                         Private f32* %93 = OpAccessChain %84 %25 
					                                              OpStore %93 %92 
					                         Private f32* %94 = OpAccessChain %9 %25 
					                                  f32 %95 = OpLoad %94 
					                                  f32 %96 = OpExtInst %1 14 %95 
					                         Private f32* %97 = OpAccessChain %9 %25 
					                                              OpStore %97 %96 
					                         Private f32* %98 = OpAccessChain %84 %25 
					                                  f32 %99 = OpLoad %98 
					                        Private f32* %100 = OpAccessChain %84 %25 
					                                 f32 %101 = OpLoad %100 
					                                 f32 %102 = OpFMul %99 %101 
					                        Private f32* %103 = OpAccessChain %84 %25 
					                                              OpStore %103 %102 
					                        Private f32* %104 = OpAccessChain %84 %25 
					                                 f32 %105 = OpLoad %104 
					                                 f32 %107 = OpFMul %105 %106 
					                        Private f32* %108 = OpAccessChain %84 %25 
					                                              OpStore %108 %107 
					                        Private f32* %109 = OpAccessChain %84 %25 
					                                 f32 %110 = OpLoad %109 
					                                 f32 %111 = OpExtInst %1 29 %110 
					                        Private f32* %112 = OpAccessChain %84 %25 
					                                              OpStore %112 %111 
					                        Private f32* %114 = OpAccessChain %9 %44 
					                                 f32 %115 = OpLoad %114 
					                                 f32 %116 = OpFNegate %115 
					                        Private f32* %117 = OpAccessChain %84 %25 
					                                 f32 %118 = OpLoad %117 
					                                 f32 %119 = OpFMul %116 %118 
					                        Private f32* %120 = OpAccessChain %70 %25 
					                                 f32 %121 = OpLoad %120 
					                                 f32 %122 = OpFAdd %119 %121 
					                                              OpStore %113 %122 
					                        Private f32* %123 = OpAccessChain %9 %44 
					                                 f32 %124 = OpLoad %123 
					                        Private f32* %125 = OpAccessChain %84 %25 
					                                 f32 %126 = OpLoad %125 
					                                 f32 %127 = OpFMul %124 %126 
					                        Private f32* %128 = OpAccessChain %53 %25 
					                                              OpStore %128 %127 
					                        Private f32* %129 = OpAccessChain %53 %25 
					                                 f32 %130 = OpLoad %129 
					                                 f32 %131 = OpFNegate %130 
					                        Private f32* %132 = OpAccessChain %53 %25 
					                                              OpStore %132 %131 
					                                 f32 %133 = OpLoad %113 
					                               f32_2 %134 = OpCompositeConstruct %133 %133 
					                               f32_2 %137 = OpFMul %134 %136 
					                                              OpStore %84 %137 
					                        Private f32* %139 = OpAccessChain %84 %44 
					                                 f32 %140 = OpLoad %139 
					                                 f32 %141 = OpExtInst %1 8 %140 
					                        Private f32* %142 = OpAccessChain %138 %25 
					                                              OpStore %142 %141 
					                        Private f32* %143 = OpAccessChain %138 %25 
					                                 f32 %144 = OpLoad %143 
					                                 f32 %145 = OpFNegate %144 
					                                 f32 %146 = OpFMul %145 %135 
					                        Private f32* %147 = OpAccessChain %84 %25 
					                                 f32 %148 = OpLoad %147 
					                                 f32 %149 = OpFAdd %146 %148 
					                        Private f32* %150 = OpAccessChain %138 %25 
					                                              OpStore %150 %149 
					                        Private f32* %151 = OpAccessChain %48 %25 
					                                 f32 %152 = OpLoad %151 
					                        Private f32* %153 = OpAccessChain %138 %25 
					                                 f32 %154 = OpLoad %153 
					                                 f32 %155 = OpFMul %152 %154 
					                        Private f32* %156 = OpAccessChain %48 %25 
					                                              OpStore %156 %155 
					                               f32_2 %157 = OpLoad %138 
					                               f32_2 %158 = OpVectorShuffle %157 %157 0 0 
					                                 f32 %159 = OpDot %158 %22 
					                        Private f32* %160 = OpAccessChain %138 %25 
					                                              OpStore %160 %159 
					                        Private f32* %161 = OpAccessChain %138 %25 
					                                 f32 %162 = OpLoad %161 
					                                 f32 %163 = OpExtInst %1 13 %162 
					                        Private f32* %164 = OpAccessChain %9 %44 
					                                              OpStore %164 %163 
					                               f32_2 %165 = OpLoad %9 
					                               f32_2 %168 = OpFMul %165 %167 
					                                              OpStore %9 %168 
					                        Private f32* %169 = OpAccessChain %9 %44 
					                                 f32 %170 = OpLoad %169 
					                                 f32 %171 = OpExtInst %1 10 %170 
					                        Private f32* %172 = OpAccessChain %138 %25 
					                                              OpStore %172 %171 
					                        Private f32* %177 = OpAccessChain %138 %25 
					                                 f32 %178 = OpLoad %177 
					                                bool %179 = OpFOrdLessThan %176 %178 
					                                              OpStore %175 %179 
					                        Private f32* %180 = OpAccessChain %9 %25 
					                                 f32 %181 = OpLoad %180 
					                                 f32 %182 = OpExtInst %1 14 %181 
					                        Private f32* %183 = OpAccessChain %84 %25 
					                                              OpStore %183 %182 
					                        Private f32* %184 = OpAccessChain %84 %25 
					                                 f32 %185 = OpLoad %184 
					                                 f32 %187 = OpFMul %185 %186 
					                        Private f32* %188 = OpAccessChain %84 %25 
					                                              OpStore %188 %187 
					                        Private f32* %189 = OpAccessChain %84 %25 
					                                 f32 %190 = OpLoad %189 
					                                 f32 %191 = OpExtInst %1 13 %190 
					                        Private f32* %192 = OpAccessChain %84 %25 
					                                              OpStore %192 %191 
					                        Private f32* %194 = OpAccessChain %84 %25 
					                                 f32 %195 = OpLoad %194 
					                        Private f32* %196 = OpAccessChain %48 %25 
					                                 f32 %197 = OpLoad %196 
					                                bool %198 = OpFOrdLessThan %195 %197 
					                                              OpStore %193 %198 
					                                bool %202 = OpLoad %175 
					                                 u32 %203 = OpSelect %202 %44 %25 
					                                 u32 %205 = OpIMul %203 %204 
					                                bool %206 = OpLoad %193 
					                                 u32 %207 = OpSelect %206 %44 %25 
					                                 u32 %208 = OpIMul %207 %204 
					                                 u32 %209 = OpBitwiseOr %205 %208 
					                                 i32 %210 = OpBitcast %209 
					                        Private i32* %212 = OpAccessChain %201 %44 
					                                              OpStore %212 %210 
					                        Uniform f32* %213 = OpAccessChain %13 %15 
					                                 f32 %214 = OpLoad %213 
					                                 f32 %216 = OpFMul %214 %215 
					                        Private f32* %217 = OpAccessChain %48 %25 
					                                              OpStore %217 %216 
					                        Private f32* %218 = OpAccessChain %48 %25 
					                                 f32 %219 = OpLoad %218 
					                                 f32 %220 = OpExtInst %1 8 %219 
					                        Private f32* %221 = OpAccessChain %48 %25 
					                                              OpStore %221 %220 
					                               f32_3 %222 = OpLoad %48 
					                               f32_2 %223 = OpVectorShuffle %222 %222 0 0 
					                                 f32 %224 = OpDot %223 %22 
					                                              OpStore %113 %224 
					                                 f32 %225 = OpLoad %113 
					                                 f32 %226 = OpExtInst %1 13 %225 
					                                              OpStore %113 %226 
					                                 f32 %227 = OpLoad %113 
					                                 f32 %228 = OpFMul %227 %34 
					                                              OpStore %113 %228 
					                                 f32 %229 = OpLoad %113 
					                                 f32 %230 = OpExtInst %1 10 %229 
					                                              OpStore %113 %230 
					                                 f32 %231 = OpLoad %113 
					                        Uniform f32* %233 = OpAccessChain %13 %232 
					                                 f32 %234 = OpLoad %233 
					                                 f32 %235 = OpFMul %231 %234 
					                        Private f32* %237 = OpAccessChain %48 %236 
					                                              OpStore %237 %235 
					                        Uniform f32* %238 = OpAccessChain %13 %15 
					                                 f32 %239 = OpLoad %238 
					                        Private f32* %240 = OpAccessChain %48 %44 
					                                              OpStore %240 %239 
					                               f32_3 %241 = OpLoad %48 
					                               f32_2 %242 = OpVectorShuffle %241 %241 0 1 
					                                 f32 %243 = OpDot %242 %22 
					                        Private f32* %244 = OpAccessChain %48 %25 
					                                              OpStore %244 %243 
					                        Private f32* %245 = OpAccessChain %48 %25 
					                                 f32 %246 = OpLoad %245 
					                                 f32 %247 = OpExtInst %1 13 %246 
					                        Private f32* %248 = OpAccessChain %48 %25 
					                                              OpStore %248 %247 
					                        Private f32* %249 = OpAccessChain %48 %25 
					                                 f32 %250 = OpLoad %249 
					                                 f32 %251 = OpFMul %250 %34 
					                        Private f32* %252 = OpAccessChain %48 %25 
					                                              OpStore %252 %251 
					                        Private f32* %253 = OpAccessChain %48 %25 
					                                 f32 %254 = OpLoad %253 
					                                 f32 %255 = OpExtInst %1 10 %254 
					                        Private f32* %256 = OpAccessChain %48 %25 
					                                              OpStore %256 %255 
					                        Private f32* %257 = OpAccessChain %48 %25 
					                                 f32 %258 = OpLoad %257 
					                                 f32 %260 = OpFMul %258 %259 
					                        Private f32* %261 = OpAccessChain %9 %25 
					                                 f32 %262 = OpLoad %261 
					                                 f32 %263 = OpFAdd %260 %262 
					                        Private f32* %264 = OpAccessChain %48 %25 
					                                              OpStore %264 %263 
					                        Private f32* %265 = OpAccessChain %9 %25 
					                                 f32 %266 = OpLoad %265 
					                        Private f32* %267 = OpAccessChain %70 %44 
					                                 f32 %268 = OpLoad %267 
					                                bool %269 = OpFOrdLessThan %266 %268 
					                                 u32 %270 = OpSelect %269 %204 %25 
					                                 i32 %271 = OpBitcast %270 
					                        Private i32* %272 = OpAccessChain %201 %25 
					                                              OpStore %272 %271 
					                        Private f32* %273 = OpAccessChain %70 %44 
					                                 f32 %274 = OpLoad %273 
					                        Private f32* %275 = OpAccessChain %48 %25 
					                                 f32 %276 = OpLoad %275 
					                                bool %277 = OpFOrdLessThan %274 %276 
					                                 u32 %278 = OpSelect %277 %204 %25 
					                                 f32 %279 = OpBitcast %278 
					                        Private f32* %280 = OpAccessChain %48 %25 
					                                              OpStore %280 %279 
					                               i32_2 %281 = OpLoad %201 
					                               u32_2 %283 = OpBitcast %281 
					                               f32_3 %284 = OpLoad %48 
					                               f32_2 %285 = OpVectorShuffle %284 %284 0 2 
					                               u32_2 %286 = OpBitcast %285 
					                               u32_2 %287 = OpBitwiseAnd %283 %286 
					                               i32_2 %288 = OpBitcast %287 
					                                              OpStore %201 %288 
					                        Private i32* %289 = OpAccessChain %201 %44 
					                                 i32 %290 = OpLoad %289 
					                                 u32 %291 = OpBitcast %290 
					                        Private i32* %292 = OpAccessChain %201 %25 
					                                 i32 %293 = OpLoad %292 
					                                 u32 %294 = OpBitcast %293 
					                                 u32 %295 = OpBitwiseAnd %291 %294 
					                                 f32 %296 = OpBitcast %295 
					                        Private f32* %297 = OpAccessChain %9 %25 
					                                              OpStore %297 %296 
					                        Private f32* %299 = OpAccessChain %53 %44 
					                                              OpStore %299 %298 
					                        Uniform f32* %300 = OpAccessChain %13 %232 
					                                 f32 %301 = OpLoad %300 
					                        Uniform f32* %302 = OpAccessChain %13 %232 
					                                 f32 %303 = OpLoad %302 
					                               f32_2 %304 = OpCompositeConstruct %301 %303 
					                                 f32 %305 = OpCompositeExtract %304 0 
					                                 f32 %306 = OpCompositeExtract %304 1 
					                               f32_2 %307 = OpCompositeConstruct %305 %306 
					                               f32_2 %308 = OpLoad %53 
					                               f32_2 %309 = OpFMul %307 %308 
					                               f32_2 %310 = OpLoad %70 
					                               f32_2 %311 = OpFAdd %309 %310 
					                                              OpStore %138 %311 
					                 read_only Texture2D %316 = OpLoad %315 
					                             sampler %320 = OpLoad %319 
					          read_only Texture2DSampled %322 = OpSampledImage %316 %320 
					                               f32_2 %323 = OpLoad %138 
					                               f32_4 %324 = OpImageSampleImplicitLod %322 %323 
					                               f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
					                                              OpStore %312 %325 
					                               f32_2 %328 = OpLoad %9 
					                               f32_3 %329 = OpVectorShuffle %328 %328 0 0 0 
					                               f32_3 %330 = OpLoad %312 
					                               f32_3 %331 = OpFAdd %329 %330 
					                               f32_4 %332 = OpLoad %327 
					                               f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
					                                              OpStore %327 %333 
					                         Output f32* %337 = OpAccessChain %327 %335 
					                                              OpStore %337 %334 
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
						vec4 unused_0_3;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					ivec2 u_xlati0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec2 u_xlat2;
					vec2 u_xlat3;
					bool u_xlatb3;
					vec2 u_xlat4;
					vec2 u_xlat6;
					float u_xlat7;
					void main()
					{
					    u_xlat0.x = dot(vec2(_TimeX), vec2(12.9799995, 78.1299973));
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43858.5547;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat0.y = sin(u_xlat0.x);
					    u_xlat1.x = sin(_TimeX);
					    u_xlat2.x = cos(_TimeX);
					    u_xlat0.x = u_xlat0.x * abs(u_xlat2.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(100.0, 0.100000001);
					    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat4.x = u_xlat6.y * 32.0 + (-u_xlat0.x);
					    u_xlat0.x = cos(u_xlat0.x);
					    u_xlat4.x = u_xlat4.x * u_xlat4.x;
					    u_xlat4.x = u_xlat4.x * -0.0601122938;
					    u_xlat4.x = exp2(u_xlat4.x);
					    u_xlat7 = (-u_xlat0.y) * u_xlat4.x + u_xlat6.x;
					    u_xlat2.x = u_xlat0.y * u_xlat4.x;
					    u_xlat2.x = (-u_xlat2.x);
					    u_xlat4.xy = vec2(u_xlat7) * vec2(100.0, 10.0);
					    u_xlat3.x = floor(u_xlat4.y);
					    u_xlat3.x = (-u_xlat3.x) * 10.0 + u_xlat4.x;
					    u_xlat1.x = u_xlat1.x * u_xlat3.x;
					    u_xlat3.x = dot(u_xlat3.xx, vec2(12.9799995, 78.1299973));
					    u_xlat0.y = sin(u_xlat3.x);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 43858.5547);
					    u_xlat3.x = fract(u_xlat0.y);
					    u_xlatb3 = 0.400000006<u_xlat3.x;
					    u_xlat4.x = cos(u_xlat0.x);
					    u_xlat4.x = u_xlat4.x * 36.0;
					    u_xlat4.x = sin(u_xlat4.x);
					    u_xlatb1 = u_xlat4.x<u_xlat1.x;
					    u_xlati0.y = int((uint(u_xlatb3) * 0xffffffffu) | (uint(u_xlatb1) * 0xffffffffu));
					    u_xlat1.x = _TimeX * 0.600000024;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat7 = dot(u_xlat1.xx, vec2(12.9799995, 78.1299973));
					    u_xlat7 = sin(u_xlat7);
					    u_xlat7 = u_xlat7 * 43858.5547;
					    u_xlat7 = fract(u_xlat7);
					    u_xlat1.z = u_xlat7 * _Value;
					    u_xlat1.y = _TimeX;
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9799995, 78.1299973));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43858.5547;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 0.25 + u_xlat0.x;
					    u_xlati0.x = int((u_xlat0.x<u_xlat6.y) ? 0xFFFFFFFFu : uint(0));
					    u_xlat1.x = uintBitsToFloat((u_xlat6.y<u_xlat1.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0.xy = ivec2(uvec2(u_xlati0.xy) & floatBitsToUint(u_xlat1).xz);
					    u_xlat0.x = uintBitsToFloat(uint(u_xlati0.y) & uint(u_xlati0.x));
					    u_xlat2.y = 0.0;
					    u_xlat3.xy = vec2(vec2(_Value, _Value)) * u_xlat2.xy + u_xlat6.xy;
					    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat10_1.xyz;
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