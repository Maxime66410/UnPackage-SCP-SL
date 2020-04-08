Shader "CameraFilterPack/FX_Glitch2" {
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
			GpuProgramID 32405
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
					uniform 	float _Glitch;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					bvec4 u_xlatb4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat10;
					float u_xlat16_10;
					vec2 u_xlat11;
					float u_xlat16;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vec2(0.5, 0.5));
					    u_xlatb5 = u_xlat10_0.x<1.0;
					    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat10.xyxy + vec4(100.050003, -0.5, -0.5, -0.5);
					    u_xlat10_2 = texture(_MainTex, u_xlat10.xy);
					    u_xlat3 = u_xlat1.zwzw * vec4(500000.0, 500000.0, 4.50000007e-05, 4.50000007e-05);
					    u_xlat5.xy = (bool(u_xlatb5)) ? u_xlat3.zw : u_xlat1.zw;
					    u_xlatb4 = lessThan(u_xlat10_0.xxxx, vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012));
					    u_xlat5.xy = (u_xlatb4.w) ? u_xlat3.xy : u_xlat5.xy;
					    u_xlat3 = u_xlat1 * vec4(4.99999987e-05, 4.99999987e-05, 0.000449999992, 0.000449999992);
					    u_xlat5.xy = (u_xlatb4.z) ? u_xlat3.zw : u_xlat5.xy;
					    u_xlat5.xy = (u_xlatb4.y) ? u_xlat3.xy : u_xlat5.xy;
					    u_xlat1.xy = (u_xlatb4.x) ? u_xlat1.zw : u_xlat5.xy;
					    u_xlat1.z = float(0.25);
					    u_xlat1.w = float(0.349999994);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xz);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xw);
					    u_xlat5.x = sin(u_xlat10_4.x);
					    u_xlat16_10 = log2(u_xlat10_3.x);
					    u_xlat10.x = u_xlat16_10 * 6.93147182;
					    u_xlat10.x = sin(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 200.0;
					    u_xlat1.yz = u_xlat10.xx * u_xlat1.xy;
					    u_xlat10.x = cos(u_xlat10_0.x);
					    u_xlat3.xyz = u_xlat10_0.xxx * vec3(179.0, 2.25, 0.846800029);
					    u_xlat0.x = u_xlat1.z * 40005.0 + u_xlat10.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat5.x * u_xlat0.x + u_xlat1.y;
					    u_xlatb5 = u_xlat5.x<0.5;
					    u_xlat1.x = (u_xlatb5) ? u_xlat0.x : u_xlat1.y;
					    u_xlat0.x = sin(u_xlat3.x);
					    u_xlat0.yw = cos(u_xlat3.yz);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xz;
					    u_xlat11.xy = fract(u_xlat1.xy);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat1.xy = u_xlat11.xy * u_xlat11.xy;
					    u_xlat11.xy = (-u_xlat11.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat11.xy * u_xlat1.xy;
					    u_xlat3.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(43812.1758, 0.400000006, 0.800000012);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat11.x = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat11.x = u_xlat1.x * u_xlat11.x + u_xlat3.y;
					    u_xlat16 = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat0.x = u_xlat1.x * u_xlat16 + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat11.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat5.xz = u_xlat0.xx * vec2(6.23839998, 6.23839998) + u_xlat0.yw;
					    u_xlat0.x = u_xlat10.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 6.23799992;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43812.1758;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = sin(u_xlat5.xz);
					    u_xlat0.xy = u_xlat0.xy * vec2(43812.1758, 43812.1758);
					    u_xlat1.yz = fract(u_xlat0.xy);
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_2.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(vec3(_Glitch, _Glitch, _Glitch)) * u_xlat0.xyz + u_xlat10_2.xyz;
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
					; Bound: 459
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %39 %435 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD0 Location 39 
					                                             OpMemberDecorate %41 0 Offset 41 
					                                             OpMemberDecorate %41 1 RelaxedPrecision 
					                                             OpMemberDecorate %41 1 Offset 41 
					                                             OpDecorate %41 Block 
					                                             OpDecorate %43 DescriptorSet 43 
					                                             OpDecorate %43 Binding 43 
					                                             OpDecorate %48 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %70 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %162 RelaxedPrecision 
					                                             OpDecorate %163 RelaxedPrecision 
					                                             OpDecorate %164 RelaxedPrecision 
					                                             OpDecorate %171 RelaxedPrecision 
					                                             OpDecorate %172 RelaxedPrecision 
					                                             OpDecorate %173 RelaxedPrecision 
					                                             OpDecorate %174 RelaxedPrecision 
					                                             OpDecorate %176 RelaxedPrecision 
					                                             OpDecorate %427 RelaxedPrecision 
					                                             OpDecorate %429 RelaxedPrecision 
					                                             OpDecorate %430 RelaxedPrecision 
					                                             OpDecorate %435 Location 435 
					                                             OpDecorate %452 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 4 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_4* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                 f32 %21 = OpConstant 3,674022E-40 
					                               f32_2 %22 = OpConstantComposite %21 %21 
					                                     %24 = OpTypeInt 32 0 
					                                 u32 %25 = OpConstant 0 
					                                     %27 = OpTypePointer Private %6 
					                                     %29 = OpTypeBool 
					                                     %30 = OpTypePointer Private %29 
					                       Private bool* %31 = OpVariable Private 
					                                 f32 %34 = OpConstant 3,674022E-40 
					                                     %36 = OpTypePointer Private %20 
					                      Private f32_2* %37 = OpVariable Private 
					                                     %38 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %41 = OpTypeStruct %6 %7 
					                                     %42 = OpTypePointer Uniform %41 
					       Uniform struct {f32; f32_4;}* %43 = OpVariable Uniform 
					                                     %44 = OpTypeInt 32 1 
					                                 i32 %45 = OpConstant 1 
					                                     %46 = OpTypePointer Uniform %7 
					                      Private f32_4* %55 = OpVariable Private 
					                                 f32 %58 = OpConstant 3,674022E-40 
					                                 f32 %59 = OpConstant 3,674022E-40 
					                               f32_4 %60 = OpConstantComposite %58 %59 %59 %59 
					                                     %62 = OpTypeVector %6 3 
					                                     %63 = OpTypePointer Private %62 
					                      Private f32_3* %64 = OpVariable Private 
					                      Private f32_4* %71 = OpVariable Private 
					                                 f32 %74 = OpConstant 3,674022E-40 
					                                 f32 %75 = OpConstant 3,674022E-40 
					                               f32_4 %76 = OpConstantComposite %74 %74 %75 %75 
					                      Private f32_2* %78 = OpVariable Private 
					                                     %80 = OpTypePointer Function %20 
					                                     %90 = OpTypeVector %29 4 
					                                     %91 = OpTypePointer Private %90 
					                     Private bool_4* %92 = OpVariable Private 
					                                 f32 %95 = OpConstant 3,674022E-40 
					                                 f32 %96 = OpConstant 3,674022E-40 
					                                 f32 %97 = OpConstant 3,674022E-40 
					                                 f32 %98 = OpConstant 3,674022E-40 
					                               f32_4 %99 = OpConstantComposite %95 %96 %97 %98 
					                                u32 %101 = OpConstant 3 
					                                f32 %113 = OpConstant 3,674022E-40 
					                                f32 %114 = OpConstant 3,674022E-40 
					                              f32_4 %115 = OpConstantComposite %113 %113 %114 %114 
					                                u32 %117 = OpConstant 2 
					                                u32 %128 = OpConstant 1 
					                                f32 %151 = OpConstant 3,674022E-40 
					                                f32 %153 = OpConstant 3,674022E-40 
					                       Private f32* %155 = OpVariable Private 
					                       Private f32* %171 = OpVariable Private 
					                                f32 %175 = OpConstant 3,674022E-40 
					                                f32 %182 = OpConstant 3,674022E-40 
					                                f32 %198 = OpConstant 3,674022E-40 
					                                f32 %199 = OpConstant 3,674022E-40 
					                                f32 %200 = OpConstant 3,674022E-40 
					                              f32_3 %201 = OpConstantComposite %198 %199 %200 
					                                f32 %207 = OpConstant 3,674022E-40 
					                      Private bool* %226 = OpVariable Private 
					                                    %231 = OpTypePointer Function %6 
					                     Private f32_2* %258 = OpVariable Private 
					                                f32 %269 = OpConstant 3,674022E-40 
					                                f32 %282 = OpConstant 3,674022E-40 
					                              f32_2 %283 = OpConstantComposite %282 %282 
					                                f32 %285 = OpConstant 3,674022E-40 
					                              f32_2 %286 = OpConstantComposite %285 %285 
					                                f32 %296 = OpConstant 3,674022E-40 
					                              f32_3 %297 = OpConstantComposite %34 %269 %296 
					                                f32 %307 = OpConstant 3,674022E-40 
					                              f32_3 %308 = OpConstantComposite %307 %96 %98 
					                              f32_3 %323 = OpConstantComposite %307 %307 %307 
					                       Private f32* %348 = OpVariable Private 
					                                f32 %381 = OpConstant 3,674022E-40 
					                              f32_2 %382 = OpConstantComposite %381 %381 
					                                f32 %395 = OpConstant 3,674022E-40 
					                              f32_2 %416 = OpConstantComposite %307 %307 
					                                    %434 = OpTypePointer Output %7 
					                      Output f32_4* %435 = OpVariable Output 
					                                i32 %436 = OpConstant 0 
					                                    %437 = OpTypePointer Uniform %6 
					                                    %456 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                     Function f32_2* %81 = OpVariable Function 
					                    Function f32_2* %104 = OpVariable Function 
					                    Function f32_2* %120 = OpVariable Function 
					                    Function f32_2* %131 = OpVariable Function 
					                    Function f32_2* %141 = OpVariable Function 
					                      Function f32* %232 = OpVariable Function 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_4 %23 = OpImageSampleImplicitLod %19 %22 
					                                 f32 %26 = OpCompositeExtract %23 0 
					                        Private f32* %28 = OpAccessChain %9 %25 
					                                             OpStore %28 %26 
					                        Private f32* %32 = OpAccessChain %9 %25 
					                                 f32 %33 = OpLoad %32 
					                                bool %35 = OpFOrdLessThan %33 %34 
					                                             OpStore %31 %35 
					                               f32_2 %40 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %47 = OpAccessChain %43 %45 
					                               f32_4 %48 = OpLoad %47 
					                               f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                               f32_2 %50 = OpFMul %40 %49 
					                      Uniform f32_4* %51 = OpAccessChain %43 %45 
					                               f32_4 %52 = OpLoad %51 
					                               f32_2 %53 = OpVectorShuffle %52 %52 2 3 
					                               f32_2 %54 = OpFAdd %50 %53 
					                                             OpStore %37 %54 
					                               f32_2 %56 = OpLoad %37 
					                               f32_4 %57 = OpVectorShuffle %56 %56 0 1 0 1 
					                               f32_4 %61 = OpFAdd %57 %60 
					                                             OpStore %55 %61 
					                 read_only Texture2D %65 = OpLoad %12 
					                             sampler %66 = OpLoad %16 
					          read_only Texture2DSampled %67 = OpSampledImage %65 %66 
					                               f32_2 %68 = OpLoad %37 
					                               f32_4 %69 = OpImageSampleImplicitLod %67 %68 
					                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
					                                             OpStore %64 %70 
					                               f32_4 %72 = OpLoad %55 
					                               f32_4 %73 = OpVectorShuffle %72 %72 2 3 2 3 
					                               f32_4 %77 = OpFMul %73 %76 
					                                             OpStore %71 %77 
					                                bool %79 = OpLoad %31 
					                                             OpSelectionMerge %83 None 
					                                             OpBranchConditional %79 %82 %86 
					                                     %82 = OpLabel 
					                               f32_4 %84 = OpLoad %71 
					                               f32_2 %85 = OpVectorShuffle %84 %84 2 3 
					                                             OpStore %81 %85 
					                                             OpBranch %83 
					                                     %86 = OpLabel 
					                               f32_4 %87 = OpLoad %55 
					                               f32_2 %88 = OpVectorShuffle %87 %87 2 3 
					                                             OpStore %81 %88 
					                                             OpBranch %83 
					                                     %83 = OpLabel 
					                               f32_2 %89 = OpLoad %81 
					                                             OpStore %78 %89 
					                               f32_4 %93 = OpLoad %9 
					                               f32_4 %94 = OpVectorShuffle %93 %93 0 0 0 0 
					                             bool_4 %100 = OpFOrdLessThan %94 %99 
					                                             OpStore %92 %100 
					                      Private bool* %102 = OpAccessChain %92 %101 
					                               bool %103 = OpLoad %102 
					                                             OpSelectionMerge %106 None 
					                                             OpBranchConditional %103 %105 %109 
					                                    %105 = OpLabel 
					                              f32_4 %107 = OpLoad %71 
					                              f32_2 %108 = OpVectorShuffle %107 %107 0 1 
					                                             OpStore %104 %108 
					                                             OpBranch %106 
					                                    %109 = OpLabel 
					                              f32_2 %110 = OpLoad %78 
					                                             OpStore %104 %110 
					                                             OpBranch %106 
					                                    %106 = OpLabel 
					                              f32_2 %111 = OpLoad %104 
					                                             OpStore %78 %111 
					                              f32_4 %112 = OpLoad %55 
					                              f32_4 %116 = OpFMul %112 %115 
					                                             OpStore %71 %116 
					                      Private bool* %118 = OpAccessChain %92 %117 
					                               bool %119 = OpLoad %118 
					                                             OpSelectionMerge %122 None 
					                                             OpBranchConditional %119 %121 %125 
					                                    %121 = OpLabel 
					                              f32_4 %123 = OpLoad %71 
					                              f32_2 %124 = OpVectorShuffle %123 %123 2 3 
					                                             OpStore %120 %124 
					                                             OpBranch %122 
					                                    %125 = OpLabel 
					                              f32_2 %126 = OpLoad %78 
					                                             OpStore %120 %126 
					                                             OpBranch %122 
					                                    %122 = OpLabel 
					                              f32_2 %127 = OpLoad %120 
					                                             OpStore %78 %127 
					                      Private bool* %129 = OpAccessChain %92 %128 
					                               bool %130 = OpLoad %129 
					                                             OpSelectionMerge %133 None 
					                                             OpBranchConditional %130 %132 %136 
					                                    %132 = OpLabel 
					                              f32_4 %134 = OpLoad %71 
					                              f32_2 %135 = OpVectorShuffle %134 %134 0 1 
					                                             OpStore %131 %135 
					                                             OpBranch %133 
					                                    %136 = OpLabel 
					                              f32_2 %137 = OpLoad %78 
					                                             OpStore %131 %137 
					                                             OpBranch %133 
					                                    %133 = OpLabel 
					                              f32_2 %138 = OpLoad %131 
					                                             OpStore %78 %138 
					                      Private bool* %139 = OpAccessChain %92 %25 
					                               bool %140 = OpLoad %139 
					                                             OpSelectionMerge %143 None 
					                                             OpBranchConditional %140 %142 %146 
					                                    %142 = OpLabel 
					                              f32_4 %144 = OpLoad %55 
					                              f32_2 %145 = OpVectorShuffle %144 %144 2 3 
					                                             OpStore %141 %145 
					                                             OpBranch %143 
					                                    %146 = OpLabel 
					                              f32_2 %147 = OpLoad %78 
					                                             OpStore %141 %147 
					                                             OpBranch %143 
					                                    %143 = OpLabel 
					                              f32_2 %148 = OpLoad %141 
					                              f32_4 %149 = OpLoad %55 
					                              f32_4 %150 = OpVectorShuffle %149 %148 4 5 2 3 
					                                             OpStore %55 %150 
					                       Private f32* %152 = OpAccessChain %55 %117 
					                                             OpStore %152 %151 
					                       Private f32* %154 = OpAccessChain %55 %101 
					                                             OpStore %154 %153 
					                read_only Texture2D %156 = OpLoad %12 
					                            sampler %157 = OpLoad %16 
					         read_only Texture2DSampled %158 = OpSampledImage %156 %157 
					                              f32_4 %159 = OpLoad %55 
					                              f32_2 %160 = OpVectorShuffle %159 %159 0 2 
					                              f32_4 %161 = OpImageSampleImplicitLod %158 %160 
					                                f32 %162 = OpCompositeExtract %161 0 
					                                             OpStore %155 %162 
					                read_only Texture2D %163 = OpLoad %12 
					                            sampler %164 = OpLoad %16 
					         read_only Texture2DSampled %165 = OpSampledImage %163 %164 
					                              f32_4 %166 = OpLoad %55 
					                              f32_2 %167 = OpVectorShuffle %166 %166 0 3 
					                              f32_4 %168 = OpImageSampleImplicitLod %165 %167 
					                                f32 %169 = OpCompositeExtract %168 0 
					                       Private f32* %170 = OpAccessChain %78 %128 
					                                             OpStore %170 %169 
					                                f32 %172 = OpLoad %155 
					                                f32 %173 = OpExtInst %1 30 %172 
					                                             OpStore %171 %173 
					                                f32 %174 = OpLoad %171 
					                                f32 %176 = OpFMul %174 %175 
					                       Private f32* %177 = OpAccessChain %78 %25 
					                                             OpStore %177 %176 
					                              f32_2 %178 = OpLoad %78 
					                              f32_2 %179 = OpExtInst %1 13 %178 
					                                             OpStore %78 %179 
					                       Private f32* %180 = OpAccessChain %78 %25 
					                                f32 %181 = OpLoad %180 
					                                f32 %183 = OpFMul %181 %182 
					                       Private f32* %184 = OpAccessChain %78 %25 
					                                             OpStore %184 %183 
					                              f32_2 %185 = OpLoad %78 
					                              f32_2 %186 = OpVectorShuffle %185 %185 0 0 
					                              f32_4 %187 = OpLoad %55 
					                              f32_2 %188 = OpVectorShuffle %187 %187 0 1 
					                              f32_2 %189 = OpFMul %186 %188 
					                              f32_4 %190 = OpLoad %55 
					                              f32_4 %191 = OpVectorShuffle %190 %189 0 4 5 3 
					                                             OpStore %55 %191 
					                       Private f32* %192 = OpAccessChain %9 %25 
					                                f32 %193 = OpLoad %192 
					                                f32 %194 = OpExtInst %1 14 %193 
					                       Private f32* %195 = OpAccessChain %78 %25 
					                                             OpStore %195 %194 
					                              f32_4 %196 = OpLoad %9 
					                              f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
					                              f32_3 %202 = OpFMul %197 %201 
					                              f32_4 %203 = OpLoad %71 
					                              f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
					                                             OpStore %71 %204 
					                       Private f32* %205 = OpAccessChain %55 %117 
					                                f32 %206 = OpLoad %205 
					                                f32 %208 = OpFMul %206 %207 
					                       Private f32* %209 = OpAccessChain %78 %25 
					                                f32 %210 = OpLoad %209 
					                                f32 %211 = OpFAdd %208 %210 
					                       Private f32* %212 = OpAccessChain %9 %25 
					                                             OpStore %212 %211 
					                       Private f32* %213 = OpAccessChain %9 %25 
					                                f32 %214 = OpLoad %213 
					                                f32 %215 = OpExtInst %1 13 %214 
					                       Private f32* %216 = OpAccessChain %9 %25 
					                                             OpStore %216 %215 
					                       Private f32* %217 = OpAccessChain %78 %128 
					                                f32 %218 = OpLoad %217 
					                       Private f32* %219 = OpAccessChain %9 %25 
					                                f32 %220 = OpLoad %219 
					                                f32 %221 = OpFMul %218 %220 
					                       Private f32* %222 = OpAccessChain %55 %128 
					                                f32 %223 = OpLoad %222 
					                                f32 %224 = OpFAdd %221 %223 
					                       Private f32* %225 = OpAccessChain %9 %25 
					                                             OpStore %225 %224 
					                       Private f32* %227 = OpAccessChain %78 %128 
					                                f32 %228 = OpLoad %227 
					                               bool %229 = OpFOrdLessThan %228 %21 
					                                             OpStore %226 %229 
					                               bool %230 = OpLoad %226 
					                                             OpSelectionMerge %234 None 
					                                             OpBranchConditional %230 %233 %237 
					                                    %233 = OpLabel 
					                       Private f32* %235 = OpAccessChain %9 %25 
					                                f32 %236 = OpLoad %235 
					                                             OpStore %232 %236 
					                                             OpBranch %234 
					                                    %237 = OpLabel 
					                       Private f32* %238 = OpAccessChain %55 %128 
					                                f32 %239 = OpLoad %238 
					                                             OpStore %232 %239 
					                                             OpBranch %234 
					                                    %234 = OpLabel 
					                                f32 %240 = OpLoad %232 
					                       Private f32* %241 = OpAccessChain %55 %25 
					                                             OpStore %241 %240 
					                       Private f32* %242 = OpAccessChain %71 %25 
					                                f32 %243 = OpLoad %242 
					                                f32 %244 = OpExtInst %1 13 %243 
					                       Private f32* %245 = OpAccessChain %9 %25 
					                                             OpStore %245 %244 
					                              f32_4 %246 = OpLoad %71 
					                              f32_2 %247 = OpVectorShuffle %246 %246 1 2 
					                              f32_2 %248 = OpExtInst %1 14 %247 
					                              f32_4 %249 = OpLoad %9 
					                              f32_4 %250 = OpVectorShuffle %249 %248 0 1 4 5 
					                                             OpStore %9 %250 
					                              f32_4 %251 = OpLoad %9 
					                              f32_2 %252 = OpVectorShuffle %251 %251 0 0 
					                              f32_4 %253 = OpLoad %55 
					                              f32_2 %254 = OpVectorShuffle %253 %253 0 2 
					                              f32_2 %255 = OpFMul %252 %254 
					                              f32_4 %256 = OpLoad %55 
					                              f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
					                                             OpStore %55 %257 
					                              f32_4 %259 = OpLoad %55 
					                              f32_2 %260 = OpVectorShuffle %259 %259 0 1 
					                              f32_2 %261 = OpExtInst %1 10 %260 
					                                             OpStore %258 %261 
					                              f32_4 %262 = OpLoad %55 
					                              f32_2 %263 = OpVectorShuffle %262 %262 0 1 
					                              f32_2 %264 = OpExtInst %1 8 %263 
					                              f32_4 %265 = OpLoad %55 
					                              f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
					                                             OpStore %55 %266 
					                       Private f32* %267 = OpAccessChain %55 %128 
					                                f32 %268 = OpLoad %267 
					                                f32 %270 = OpFMul %268 %269 
					                       Private f32* %271 = OpAccessChain %55 %25 
					                                f32 %272 = OpLoad %271 
					                                f32 %273 = OpFAdd %270 %272 
					                       Private f32* %274 = OpAccessChain %9 %25 
					                                             OpStore %274 %273 
					                              f32_2 %275 = OpLoad %258 
					                              f32_2 %276 = OpLoad %258 
					                              f32_2 %277 = OpFMul %275 %276 
					                              f32_4 %278 = OpLoad %55 
					                              f32_4 %279 = OpVectorShuffle %278 %277 4 5 2 3 
					                                             OpStore %55 %279 
					                              f32_2 %280 = OpLoad %258 
					                              f32_2 %281 = OpFNegate %280 
					                              f32_2 %284 = OpFMul %281 %283 
					                              f32_2 %287 = OpFAdd %284 %286 
					                                             OpStore %258 %287 
					                              f32_2 %288 = OpLoad %258 
					                              f32_4 %289 = OpLoad %55 
					                              f32_2 %290 = OpVectorShuffle %289 %289 0 1 
					                              f32_2 %291 = OpFMul %288 %290 
					                              f32_4 %292 = OpLoad %55 
					                              f32_4 %293 = OpVectorShuffle %292 %291 4 5 2 3 
					                                             OpStore %55 %293 
					                              f32_4 %294 = OpLoad %9 
					                              f32_3 %295 = OpVectorShuffle %294 %294 0 0 0 
					                              f32_3 %298 = OpFAdd %295 %297 
					                              f32_4 %299 = OpLoad %71 
					                              f32_4 %300 = OpVectorShuffle %299 %298 4 5 6 3 
					                                             OpStore %71 %300 
					                       Private f32* %301 = OpAccessChain %9 %25 
					                                f32 %302 = OpLoad %301 
					                                f32 %303 = OpExtInst %1 13 %302 
					                       Private f32* %304 = OpAccessChain %9 %25 
					                                             OpStore %304 %303 
					                              f32_4 %305 = OpLoad %9 
					                              f32_3 %306 = OpVectorShuffle %305 %305 0 2 3 
					                              f32_3 %309 = OpFMul %306 %308 
					                              f32_4 %310 = OpLoad %9 
					                              f32_4 %311 = OpVectorShuffle %310 %309 4 1 5 6 
					                                             OpStore %9 %311 
					                       Private f32* %312 = OpAccessChain %9 %25 
					                                f32 %313 = OpLoad %312 
					                                f32 %314 = OpExtInst %1 10 %313 
					                       Private f32* %315 = OpAccessChain %9 %25 
					                                             OpStore %315 %314 
					                              f32_4 %316 = OpLoad %71 
					                              f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
					                              f32_3 %318 = OpExtInst %1 13 %317 
					                              f32_4 %319 = OpLoad %71 
					                              f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
					                                             OpStore %71 %320 
					                              f32_4 %321 = OpLoad %71 
					                              f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
					                              f32_3 %324 = OpFMul %322 %323 
					                              f32_4 %325 = OpLoad %71 
					                              f32_4 %326 = OpVectorShuffle %325 %324 4 5 6 3 
					                                             OpStore %71 %326 
					                              f32_4 %327 = OpLoad %71 
					                              f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
					                              f32_3 %329 = OpExtInst %1 10 %328 
					                              f32_4 %330 = OpLoad %71 
					                              f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
					                                             OpStore %71 %331 
					                       Private f32* %332 = OpAccessChain %71 %128 
					                                f32 %333 = OpLoad %332 
					                                f32 %334 = OpFNegate %333 
					                       Private f32* %335 = OpAccessChain %71 %117 
					                                f32 %336 = OpLoad %335 
					                                f32 %337 = OpFAdd %334 %336 
					                       Private f32* %338 = OpAccessChain %258 %25 
					                                             OpStore %338 %337 
					                       Private f32* %339 = OpAccessChain %55 %25 
					                                f32 %340 = OpLoad %339 
					                       Private f32* %341 = OpAccessChain %258 %25 
					                                f32 %342 = OpLoad %341 
					                                f32 %343 = OpFMul %340 %342 
					                       Private f32* %344 = OpAccessChain %71 %128 
					                                f32 %345 = OpLoad %344 
					                                f32 %346 = OpFAdd %343 %345 
					                       Private f32* %347 = OpAccessChain %258 %25 
					                                             OpStore %347 %346 
					                       Private f32* %349 = OpAccessChain %9 %25 
					                                f32 %350 = OpLoad %349 
					                                f32 %351 = OpFNegate %350 
					                       Private f32* %352 = OpAccessChain %71 %25 
					                                f32 %353 = OpLoad %352 
					                                f32 %354 = OpFAdd %351 %353 
					                                             OpStore %348 %354 
					                       Private f32* %355 = OpAccessChain %55 %25 
					                                f32 %356 = OpLoad %355 
					                                f32 %357 = OpLoad %348 
					                                f32 %358 = OpFMul %356 %357 
					                       Private f32* %359 = OpAccessChain %9 %25 
					                                f32 %360 = OpLoad %359 
					                                f32 %361 = OpFAdd %358 %360 
					                       Private f32* %362 = OpAccessChain %9 %25 
					                                             OpStore %362 %361 
					                       Private f32* %363 = OpAccessChain %9 %25 
					                                f32 %364 = OpLoad %363 
					                                f32 %365 = OpFNegate %364 
					                       Private f32* %366 = OpAccessChain %258 %25 
					                                f32 %367 = OpLoad %366 
					                                f32 %368 = OpFAdd %365 %367 
					                       Private f32* %369 = OpAccessChain %55 %25 
					                                             OpStore %369 %368 
					                       Private f32* %370 = OpAccessChain %55 %128 
					                                f32 %371 = OpLoad %370 
					                       Private f32* %372 = OpAccessChain %55 %25 
					                                f32 %373 = OpLoad %372 
					                                f32 %374 = OpFMul %371 %373 
					                       Private f32* %375 = OpAccessChain %9 %25 
					                                f32 %376 = OpLoad %375 
					                                f32 %377 = OpFAdd %374 %376 
					                       Private f32* %378 = OpAccessChain %9 %25 
					                                             OpStore %378 %377 
					                              f32_4 %379 = OpLoad %9 
					                              f32_2 %380 = OpVectorShuffle %379 %379 0 0 
					                              f32_2 %383 = OpFMul %380 %382 
					                              f32_4 %384 = OpLoad %9 
					                              f32_2 %385 = OpVectorShuffle %384 %384 2 3 
					                              f32_2 %386 = OpFAdd %383 %385 
					                                             OpStore %37 %386 
					                       Private f32* %387 = OpAccessChain %78 %25 
					                                f32 %388 = OpLoad %387 
					                       Private f32* %389 = OpAccessChain %9 %25 
					                                f32 %390 = OpLoad %389 
					                                f32 %391 = OpFMul %388 %390 
					                       Private f32* %392 = OpAccessChain %9 %25 
					                                             OpStore %392 %391 
					                       Private f32* %393 = OpAccessChain %9 %25 
					                                f32 %394 = OpLoad %393 
					                                f32 %396 = OpFMul %394 %395 
					                       Private f32* %397 = OpAccessChain %9 %25 
					                                             OpStore %397 %396 
					                       Private f32* %398 = OpAccessChain %9 %25 
					                                f32 %399 = OpLoad %398 
					                                f32 %400 = OpExtInst %1 13 %399 
					                       Private f32* %401 = OpAccessChain %9 %25 
					                                             OpStore %401 %400 
					                       Private f32* %402 = OpAccessChain %9 %25 
					                                f32 %403 = OpLoad %402 
					                                f32 %404 = OpFMul %403 %307 
					                       Private f32* %405 = OpAccessChain %9 %25 
					                                             OpStore %405 %404 
					                       Private f32* %406 = OpAccessChain %9 %25 
					                                f32 %407 = OpLoad %406 
					                                f32 %408 = OpExtInst %1 10 %407 
					                       Private f32* %409 = OpAccessChain %55 %25 
					                                             OpStore %409 %408 
					                              f32_2 %410 = OpLoad %37 
					                              f32_2 %411 = OpExtInst %1 13 %410 
					                              f32_4 %412 = OpLoad %9 
					                              f32_4 %413 = OpVectorShuffle %412 %411 4 5 2 3 
					                                             OpStore %9 %413 
					                              f32_4 %414 = OpLoad %9 
					                              f32_2 %415 = OpVectorShuffle %414 %414 0 1 
					                              f32_2 %417 = OpFMul %415 %416 
					                              f32_4 %418 = OpLoad %9 
					                              f32_4 %419 = OpVectorShuffle %418 %417 4 5 2 3 
					                                             OpStore %9 %419 
					                              f32_4 %420 = OpLoad %9 
					                              f32_2 %421 = OpVectorShuffle %420 %420 0 1 
					                              f32_2 %422 = OpExtInst %1 10 %421 
					                              f32_4 %423 = OpLoad %55 
					                              f32_4 %424 = OpVectorShuffle %423 %422 0 4 5 3 
					                                             OpStore %55 %424 
					                              f32_4 %425 = OpLoad %55 
					                              f32_3 %426 = OpVectorShuffle %425 %425 0 1 2 
					                              f32_3 %427 = OpLoad %64 
					                              f32_3 %428 = OpFMul %426 %427 
					                              f32_3 %429 = OpLoad %64 
					                              f32_3 %430 = OpFNegate %429 
					                              f32_3 %431 = OpFAdd %428 %430 
					                              f32_4 %432 = OpLoad %9 
					                              f32_4 %433 = OpVectorShuffle %432 %431 4 5 6 3 
					                                             OpStore %9 %433 
					                       Uniform f32* %438 = OpAccessChain %43 %436 
					                                f32 %439 = OpLoad %438 
					                       Uniform f32* %440 = OpAccessChain %43 %436 
					                                f32 %441 = OpLoad %440 
					                       Uniform f32* %442 = OpAccessChain %43 %436 
					                                f32 %443 = OpLoad %442 
					                              f32_3 %444 = OpCompositeConstruct %439 %441 %443 
					                                f32 %445 = OpCompositeExtract %444 0 
					                                f32 %446 = OpCompositeExtract %444 1 
					                                f32 %447 = OpCompositeExtract %444 2 
					                              f32_3 %448 = OpCompositeConstruct %445 %446 %447 
					                              f32_4 %449 = OpLoad %9 
					                              f32_3 %450 = OpVectorShuffle %449 %449 0 1 2 
					                              f32_3 %451 = OpFMul %448 %450 
					                              f32_3 %452 = OpLoad %64 
					                              f32_3 %453 = OpFAdd %451 %452 
					                              f32_4 %454 = OpLoad %435 
					                              f32_4 %455 = OpVectorShuffle %454 %453 4 5 6 3 
					                                             OpStore %435 %455 
					                        Output f32* %457 = OpAccessChain %435 %101 
					                                             OpStore %457 %34 
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
						float _Glitch;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat10_4;
					bvec4 u_xlatb4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec2 u_xlat10;
					float u_xlat16_10;
					vec2 u_xlat11;
					float u_xlat16;
					void main()
					{
					    u_xlat10_0 = texture(_MainTex, vec2(0.5, 0.5));
					    u_xlatb5 = u_xlat10_0.x<1.0;
					    u_xlat10.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1 = u_xlat10.xyxy + vec4(100.050003, -0.5, -0.5, -0.5);
					    u_xlat10_2 = texture(_MainTex, u_xlat10.xy);
					    u_xlat3 = u_xlat1.zwzw * vec4(500000.0, 500000.0, 4.50000007e-05, 4.50000007e-05);
					    u_xlat5.xy = (bool(u_xlatb5)) ? u_xlat3.zw : u_xlat1.zw;
					    u_xlatb4 = lessThan(u_xlat10_0.xxxx, vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012));
					    u_xlat5.xy = (u_xlatb4.w) ? u_xlat3.xy : u_xlat5.xy;
					    u_xlat3 = u_xlat1 * vec4(4.99999987e-05, 4.99999987e-05, 0.000449999992, 0.000449999992);
					    u_xlat5.xy = (u_xlatb4.z) ? u_xlat3.zw : u_xlat5.xy;
					    u_xlat5.xy = (u_xlatb4.y) ? u_xlat3.xy : u_xlat5.xy;
					    u_xlat1.xy = (u_xlatb4.x) ? u_xlat1.zw : u_xlat5.xy;
					    u_xlat1.z = float(0.25);
					    u_xlat1.w = float(0.349999994);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xz);
					    u_xlat10_4 = texture(_MainTex, u_xlat1.xw);
					    u_xlat5.x = sin(u_xlat10_4.x);
					    u_xlat16_10 = log2(u_xlat10_3.x);
					    u_xlat10.x = u_xlat16_10 * 6.93147182;
					    u_xlat10.x = sin(u_xlat10.x);
					    u_xlat10.x = u_xlat10.x * 200.0;
					    u_xlat1.yz = u_xlat10.xx * u_xlat1.xy;
					    u_xlat10.x = cos(u_xlat10_0.x);
					    u_xlat3.xyz = u_xlat10_0.xxx * vec3(179.0, 2.25, 0.846800029);
					    u_xlat0.x = u_xlat1.z * 40005.0 + u_xlat10.x;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat5.x * u_xlat0.x + u_xlat1.y;
					    u_xlatb5 = u_xlat5.x<0.5;
					    u_xlat1.x = (u_xlatb5) ? u_xlat0.x : u_xlat1.y;
					    u_xlat0.x = sin(u_xlat3.x);
					    u_xlat0.yw = cos(u_xlat3.yz);
					    u_xlat1.xy = u_xlat0.xx * u_xlat1.xz;
					    u_xlat11.xy = fract(u_xlat1.xy);
					    u_xlat1.xy = floor(u_xlat1.xy);
					    u_xlat0.x = u_xlat1.y * 59.0 + u_xlat1.x;
					    u_xlat1.xy = u_xlat11.xy * u_xlat11.xy;
					    u_xlat11.xy = (-u_xlat11.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
					    u_xlat1.xy = u_xlat11.xy * u_xlat1.xy;
					    u_xlat3.xyz = u_xlat0.xxx + vec3(1.0, 59.0, 60.0);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.xyw = u_xlat0.xyw * vec3(43812.1758, 0.400000006, 0.800000012);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat3.xyz = sin(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(43812.1758, 43812.1758, 43812.1758);
					    u_xlat3.xyz = fract(u_xlat3.xyz);
					    u_xlat11.x = (-u_xlat3.y) + u_xlat3.z;
					    u_xlat11.x = u_xlat1.x * u_xlat11.x + u_xlat3.y;
					    u_xlat16 = (-u_xlat0.x) + u_xlat3.x;
					    u_xlat0.x = u_xlat1.x * u_xlat16 + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x) + u_xlat11.x;
					    u_xlat0.x = u_xlat1.y * u_xlat1.x + u_xlat0.x;
					    u_xlat5.xz = u_xlat0.xx * vec2(6.23839998, 6.23839998) + u_xlat0.yw;
					    u_xlat0.x = u_xlat10.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * 6.23799992;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 43812.1758;
					    u_xlat1.x = fract(u_xlat0.x);
					    u_xlat0.xy = sin(u_xlat5.xz);
					    u_xlat0.xy = u_xlat0.xy * vec2(43812.1758, 43812.1758);
					    u_xlat1.yz = fract(u_xlat0.xy);
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat10_2.xyz + (-u_xlat10_2.xyz);
					    SV_Target0.xyz = vec3(vec3(_Glitch, _Glitch, _Glitch)) * u_xlat0.xyz + u_xlat10_2.xyz;
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