Shader "CameraFilterPack/TV_Video3D" {
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
			GpuProgramID 44475
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
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat6;
					vec2 u_xlat13;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.xyx * _MainTex_ST.xyx + _MainTex_ST.zwz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(500.0, 500.0, 500.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat0.xy * vec2(0.00200000009, 0.00200000009);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<64 ; u_xlati_loop_1++)
					    {
					        u_xlat18 = float(u_xlati_loop_1);
					        u_xlat18 = (-u_xlat18) * 0.00200000009 + u_xlat1.y;
					        u_xlat1.w = u_xlat18 + u_xlat18;
					        u_xlat3.xy = u_xlat1.xw + vec2(0.75, 0.375);
					        u_xlat13.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006);
					        u_xlat10_4 = texture(_MainTex, u_xlat13.xy);
					        u_xlat3.z = u_xlat10_4.x * 0.200000003;
					        u_xlat18 = u_xlat10_4.x * 0.200000003 + u_xlat18;
					        u_xlatb18 = u_xlat1.y<u_xlat18;
					        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat2.xyz;
					    }
					    u_xlat0.xw = u_xlat2.xy * vec2(0.400000006, 0.400000006);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xw);
					    u_xlat3 = u_xlat2.xyxy + vec4(0.0, 0.00400000019, -0.0, -0.00400000019);
					    u_xlat3 = u_xlat3 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat10_3.x * 0.200000003;
					    u_xlat16_0 = u_xlat10_4.x * 0.200000003 + (-u_xlat16_0);
					    u_xlat3.y = max(u_xlat16_0, 0.00300000003);
					    u_xlat4 = u_xlat2.xyxy + vec4(0.00400000019, 0.0, -0.00400000019, -0.0);
					    u_xlat4 = u_xlat4 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_0 = u_xlat10_4.x * 0.200000003;
					    u_xlat16_0 = u_xlat10_5.x * 0.200000003 + (-u_xlat16_0);
					    u_xlat3.x = max(u_xlat16_0, 0.00300000003);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00800000038, 0.00800000038);
					    u_xlat3.z = -6.40000071e-05;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xw = u_xlat0.xx * u_xlat3.xz;
					    u_xlat0.x = dot(u_xlat0.xw, vec2(0.707106769, -0.707106769));
					    u_xlat18 = max(u_xlat0.x, 0.200000003);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat10_1.xyz;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat18 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat18 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xy = u_xlat0.zy * vec2(0.00160000008, 0.00200000009) + vec2(-0.400000006, 0.0);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6 = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat6) + u_xlat0.xxx;
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
					; Bound: 336
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %12 %320 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 12 
					                                              OpMemberDecorate %16 0 RelaxedPrecision 
					                                              OpMemberDecorate %16 0 Offset 16 
					                                              OpDecorate %16 Block 
					                                              OpDecorate %18 DescriptorSet 18 
					                                              OpDecorate %18 Binding 18 
					                                              OpDecorate %23 RelaxedPrecision 
					                                              OpDecorate %24 RelaxedPrecision 
					                                              OpDecorate %27 RelaxedPrecision 
					                                              OpDecorate %28 RelaxedPrecision 
					                                              OpDecorate %104 RelaxedPrecision 
					                                              OpDecorate %107 RelaxedPrecision 
					                                              OpDecorate %107 DescriptorSet 107 
					                                              OpDecorate %107 Binding 107 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %111 RelaxedPrecision 
					                                              OpDecorate %111 DescriptorSet 111 
					                                              OpDecorate %111 Binding 111 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %117 RelaxedPrecision 
					                                              OpDecorate %118 RelaxedPrecision 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %150 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %152 RelaxedPrecision 
					                                              OpDecorate %157 RelaxedPrecision 
					                                              OpDecorate %168 RelaxedPrecision 
					                                              OpDecorate %169 RelaxedPrecision 
					                                              OpDecorate %170 RelaxedPrecision 
					                                              OpDecorate %175 RelaxedPrecision 
					                                              OpDecorate %176 RelaxedPrecision 
					                                              OpDecorate %177 RelaxedPrecision 
					                                              OpDecorate %178 RelaxedPrecision 
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
					                                              OpDecorate %195 RelaxedPrecision 
					                                              OpDecorate %204 RelaxedPrecision 
					                                              OpDecorate %205 RelaxedPrecision 
					                                              OpDecorate %210 RelaxedPrecision 
					                                              OpDecorate %211 RelaxedPrecision 
					                                              OpDecorate %212 RelaxedPrecision 
					                                              OpDecorate %217 RelaxedPrecision 
					                                              OpDecorate %218 RelaxedPrecision 
					                                              OpDecorate %219 RelaxedPrecision 
					                                              OpDecorate %220 RelaxedPrecision 
					                                              OpDecorate %221 RelaxedPrecision 
					                                              OpDecorate %222 RelaxedPrecision 
					                                              OpDecorate %223 RelaxedPrecision 
					                                              OpDecorate %224 RelaxedPrecision 
					                                              OpDecorate %225 RelaxedPrecision 
					                                              OpDecorate %226 RelaxedPrecision 
					                                              OpDecorate %265 RelaxedPrecision 
					                                              OpDecorate %266 RelaxedPrecision 
					                                              OpDecorate %267 RelaxedPrecision 
					                                              OpDecorate %320 Location 320 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 2 
					                                      %11 = OpTypePointer Input %10 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 3 
					                                      %16 = OpTypeStruct %7 
					                                      %17 = OpTypePointer Uniform %16 
					             Uniform struct {f32_4;}* %18 = OpVariable Uniform 
					                                      %19 = OpTypeInt 32 1 
					                                  i32 %20 = OpConstant 0 
					                                      %21 = OpTypePointer Uniform %7 
					                                  f32 %34 = OpConstant 3,674022E-40 
					                                f32_3 %35 = OpConstantComposite %34 %34 %34 
					                       Private f32_4* %44 = OpVariable Private 
					                                  f32 %47 = OpConstant 3,674022E-40 
					                                f32_2 %48 = OpConstantComposite %47 %47 
					                                      %52 = OpTypePointer Private %13 
					                       Private f32_3* %53 = OpVariable Private 
					                                  f32 %54 = OpConstant 3,674022E-40 
					                                      %55 = OpTypeInt 32 0 
					                                  u32 %56 = OpConstant 0 
					                                      %57 = OpTypePointer Private %6 
					                                  u32 %59 = OpConstant 1 
					                                  u32 %61 = OpConstant 2 
					                                      %63 = OpTypePointer Function %19 
					                                  i32 %71 = OpConstant 64 
					                                      %72 = OpTypeBool 
					                         Private f32* %74 = OpVariable Private 
					                                  u32 %86 = OpConstant 3 
					                       Private f32_4* %88 = OpVariable Private 
					                                  f32 %91 = OpConstant 3,674022E-40 
					                                  f32 %92 = OpConstant 3,674022E-40 
					                                f32_2 %93 = OpConstantComposite %91 %92 
					                                      %97 = OpTypePointer Private %10 
					                       Private f32_2* %98 = OpVariable Private 
					                                 f32 %101 = OpConstant 3,674022E-40 
					                               f32_2 %102 = OpConstantComposite %101 %101 
					                        Private f32* %104 = OpVariable Private 
					                                     %105 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %106 = OpTypePointer UniformConstant %105 
					UniformConstant read_only Texture2D* %107 = OpVariable UniformConstant 
					                                     %109 = OpTypeSampler 
					                                     %110 = OpTypePointer UniformConstant %109 
					            UniformConstant sampler* %111 = OpVariable UniformConstant 
					                                     %113 = OpTypeSampledImage %105 
					                                 f32 %119 = OpConstant 3,674022E-40 
					                                     %126 = OpTypePointer Private %72 
					                       Private bool* %127 = OpVariable Private 
					                                     %133 = OpTypePointer Function %13 
					                                 i32 %143 = OpConstant 1 
					                      Private f32_3* %150 = OpVariable Private 
					                                 f32 %160 = OpConstant 3,674022E-40 
					                                 f32 %161 = OpConstant 3,674022E-40 
					                                 f32 %162 = OpConstant 3,674022E-40 
					                               f32_4 %163 = OpConstantComposite %54 %160 %161 %162 
					                               f32_4 %166 = OpConstantComposite %101 %101 %101 %101 
					                        Private f32* %168 = OpVariable Private 
					                        Private f32* %176 = OpVariable Private 
					                        Private f32* %184 = OpVariable Private 
					                        Private f32* %187 = OpVariable Private 
					                                 f32 %194 = OpConstant 3,674022E-40 
					                      Private f32_4* %197 = OpVariable Private 
					                               f32_4 %200 = OpConstantComposite %160 %54 %162 %161 
					                                 f32 %230 = OpConstant 3,674022E-40 
					                               f32_2 %231 = OpConstantComposite %230 %230 
					                                 f32 %235 = OpConstant 3,674022E-40 
					                                 f32 %256 = OpConstant 3,674022E-40 
					                                 f32 %257 = OpConstant 3,674022E-40 
					                               f32_2 %258 = OpConstantComposite %256 %257 
					                                 f32 %285 = OpConstant 3,674022E-40 
					                                 f32 %297 = OpConstant 3,674022E-40 
					                               f32_2 %298 = OpConstantComposite %297 %47 
					                                 f32 %300 = OpConstant 3,674022E-40 
					                               f32_2 %301 = OpConstantComposite %300 %54 
					                        Private f32* %309 = OpVariable Private 
					                                 f32 %316 = OpConstant 3,674022E-40 
					                                     %319 = OpTypePointer Output %7 
					                       Output f32_4* %320 = OpVariable Output 
					                                     %331 = OpTypePointer Output %6 
					                                     %334 = OpTypePointer Private %19 
					                        Private i32* %335 = OpVariable Private 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function i32* %64 = OpVariable Function 
					                     Function f32_3* %134 = OpVariable Function 
					                                f32_2 %14 = OpLoad vs_TEXCOORD0 
					                                f32_3 %15 = OpVectorShuffle %14 %14 0 1 0 
					                       Uniform f32_4* %22 = OpAccessChain %18 %20 
					                                f32_4 %23 = OpLoad %22 
					                                f32_3 %24 = OpVectorShuffle %23 %23 0 1 0 
					                                f32_3 %25 = OpFMul %15 %24 
					                       Uniform f32_4* %26 = OpAccessChain %18 %20 
					                                f32_4 %27 = OpLoad %26 
					                                f32_3 %28 = OpVectorShuffle %27 %27 2 3 2 
					                                f32_3 %29 = OpFAdd %25 %28 
					                                f32_4 %30 = OpLoad %9 
					                                f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
					                                              OpStore %9 %31 
					                                f32_4 %32 = OpLoad %9 
					                                f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
					                                f32_3 %36 = OpFMul %33 %35 
					                                f32_4 %37 = OpLoad %9 
					                                f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
					                                              OpStore %9 %38 
					                                f32_4 %39 = OpLoad %9 
					                                f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
					                                f32_3 %41 = OpExtInst %1 8 %40 
					                                f32_4 %42 = OpLoad %9 
					                                f32_4 %43 = OpVectorShuffle %42 %41 4 5 6 3 
					                                              OpStore %9 %43 
					                                f32_4 %45 = OpLoad %9 
					                                f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                f32_2 %49 = OpFMul %46 %48 
					                                f32_4 %50 = OpLoad %44 
					                                f32_4 %51 = OpVectorShuffle %50 %49 4 5 2 3 
					                                              OpStore %44 %51 
					                         Private f32* %58 = OpAccessChain %53 %56 
					                                              OpStore %58 %54 
					                         Private f32* %60 = OpAccessChain %53 %59 
					                                              OpStore %60 %54 
					                         Private f32* %62 = OpAccessChain %53 %61 
					                                              OpStore %62 %54 
					                                              OpStore %64 %20 
					                                              OpBranch %65 
					                                      %65 = OpLabel 
					                                              OpLoopMerge %67 %68 None 
					                                              OpBranch %69 
					                                      %69 = OpLabel 
					                                  i32 %70 = OpLoad %64 
					                                 bool %73 = OpSLessThan %70 %71 
					                                              OpBranchConditional %73 %66 %67 
					                                      %66 = OpLabel 
					                                  i32 %75 = OpLoad %64 
					                                  f32 %76 = OpConvertSToF %75 
					                                              OpStore %74 %76 
					                                  f32 %77 = OpLoad %74 
					                                  f32 %78 = OpFNegate %77 
					                                  f32 %79 = OpFMul %78 %47 
					                         Private f32* %80 = OpAccessChain %44 %59 
					                                  f32 %81 = OpLoad %80 
					                                  f32 %82 = OpFAdd %79 %81 
					                                              OpStore %74 %82 
					                                  f32 %83 = OpLoad %74 
					                                  f32 %84 = OpLoad %74 
					                                  f32 %85 = OpFAdd %83 %84 
					                         Private f32* %87 = OpAccessChain %44 %86 
					                                              OpStore %87 %85 
					                                f32_4 %89 = OpLoad %44 
					                                f32_2 %90 = OpVectorShuffle %89 %89 0 3 
					                                f32_2 %94 = OpFAdd %90 %93 
					                                f32_4 %95 = OpLoad %88 
					                                f32_4 %96 = OpVectorShuffle %95 %94 4 5 2 3 
					                                              OpStore %88 %96 
					                                f32_4 %99 = OpLoad %88 
					                               f32_2 %100 = OpVectorShuffle %99 %99 0 1 
					                               f32_2 %103 = OpFMul %100 %102 
					                                              OpStore %98 %103 
					                 read_only Texture2D %108 = OpLoad %107 
					                             sampler %112 = OpLoad %111 
					          read_only Texture2DSampled %114 = OpSampledImage %108 %112 
					                               f32_2 %115 = OpLoad %98 
					                               f32_4 %116 = OpImageSampleImplicitLod %114 %115 
					                                 f32 %117 = OpCompositeExtract %116 0 
					                                              OpStore %104 %117 
					                                 f32 %118 = OpLoad %104 
					                                 f32 %120 = OpFMul %118 %119 
					                        Private f32* %121 = OpAccessChain %88 %61 
					                                              OpStore %121 %120 
					                                 f32 %122 = OpLoad %104 
					                                 f32 %123 = OpFMul %122 %119 
					                                 f32 %124 = OpLoad %74 
					                                 f32 %125 = OpFAdd %123 %124 
					                                              OpStore %74 %125 
					                        Private f32* %128 = OpAccessChain %44 %59 
					                                 f32 %129 = OpLoad %128 
					                                 f32 %130 = OpLoad %74 
					                                bool %131 = OpFOrdLessThan %129 %130 
					                                              OpStore %127 %131 
					                                bool %132 = OpLoad %127 
					                                              OpSelectionMerge %136 None 
					                                              OpBranchConditional %132 %135 %139 
					                                     %135 = OpLabel 
					                               f32_4 %137 = OpLoad %88 
					                               f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
					                                              OpStore %134 %138 
					                                              OpBranch %136 
					                                     %139 = OpLabel 
					                               f32_3 %140 = OpLoad %53 
					                                              OpStore %134 %140 
					                                              OpBranch %136 
					                                     %136 = OpLabel 
					                               f32_3 %141 = OpLoad %134 
					                                              OpStore %53 %141 
					                                              OpBranch %68 
					                                      %68 = OpLabel 
					                                 i32 %142 = OpLoad %64 
					                                 i32 %144 = OpIAdd %142 %143 
					                                              OpStore %64 %144 
					                                              OpBranch %65 
					                                      %67 = OpLabel 
					                               f32_3 %145 = OpLoad %53 
					                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
					                               f32_2 %147 = OpFMul %146 %102 
					                               f32_4 %148 = OpLoad %9 
					                               f32_4 %149 = OpVectorShuffle %148 %147 4 1 2 5 
					                                              OpStore %9 %149 
					                 read_only Texture2D %151 = OpLoad %107 
					                             sampler %152 = OpLoad %111 
					          read_only Texture2DSampled %153 = OpSampledImage %151 %152 
					                               f32_4 %154 = OpLoad %9 
					                               f32_2 %155 = OpVectorShuffle %154 %154 0 3 
					                               f32_4 %156 = OpImageSampleImplicitLod %153 %155 
					                               f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
					                                              OpStore %150 %157 
					                               f32_3 %158 = OpLoad %53 
					                               f32_4 %159 = OpVectorShuffle %158 %158 0 1 0 1 
					                               f32_4 %164 = OpFAdd %159 %163 
					                                              OpStore %88 %164 
					                               f32_4 %165 = OpLoad %88 
					                               f32_4 %167 = OpFMul %165 %166 
					                                              OpStore %88 %167 
					                 read_only Texture2D %169 = OpLoad %107 
					                             sampler %170 = OpLoad %111 
					          read_only Texture2DSampled %171 = OpSampledImage %169 %170 
					                               f32_4 %172 = OpLoad %88 
					                               f32_2 %173 = OpVectorShuffle %172 %172 0 1 
					                               f32_4 %174 = OpImageSampleImplicitLod %171 %173 
					                                 f32 %175 = OpCompositeExtract %174 0 
					                                              OpStore %168 %175 
					                 read_only Texture2D %177 = OpLoad %107 
					                             sampler %178 = OpLoad %111 
					          read_only Texture2DSampled %179 = OpSampledImage %177 %178 
					                               f32_4 %180 = OpLoad %88 
					                               f32_2 %181 = OpVectorShuffle %180 %180 2 3 
					                               f32_4 %182 = OpImageSampleImplicitLod %179 %181 
					                                 f32 %183 = OpCompositeExtract %182 0 
					                                              OpStore %176 %183 
					                                 f32 %185 = OpLoad %176 
					                                 f32 %186 = OpFMul %185 %119 
					                                              OpStore %184 %186 
					                                 f32 %188 = OpLoad %168 
					                                 f32 %189 = OpFMul %188 %119 
					                                 f32 %190 = OpLoad %184 
					                                 f32 %191 = OpFNegate %190 
					                                 f32 %192 = OpFAdd %189 %191 
					                                              OpStore %187 %192 
					                                 f32 %193 = OpLoad %187 
					                                 f32 %195 = OpExtInst %1 40 %193 %194 
					                        Private f32* %196 = OpAccessChain %88 %59 
					                                              OpStore %196 %195 
					                               f32_3 %198 = OpLoad %53 
					                               f32_4 %199 = OpVectorShuffle %198 %198 0 1 0 1 
					                               f32_4 %201 = OpFAdd %199 %200 
					                                              OpStore %197 %201 
					                               f32_4 %202 = OpLoad %197 
					                               f32_4 %203 = OpFMul %202 %166 
					                                              OpStore %197 %203 
					                 read_only Texture2D %204 = OpLoad %107 
					                             sampler %205 = OpLoad %111 
					          read_only Texture2DSampled %206 = OpSampledImage %204 %205 
					                               f32_4 %207 = OpLoad %197 
					                               f32_2 %208 = OpVectorShuffle %207 %207 0 1 
					                               f32_4 %209 = OpImageSampleImplicitLod %206 %208 
					                                 f32 %210 = OpCompositeExtract %209 0 
					                                              OpStore %168 %210 
					                 read_only Texture2D %211 = OpLoad %107 
					                             sampler %212 = OpLoad %111 
					          read_only Texture2DSampled %213 = OpSampledImage %211 %212 
					                               f32_4 %214 = OpLoad %197 
					                               f32_2 %215 = OpVectorShuffle %214 %214 2 3 
					                               f32_4 %216 = OpImageSampleImplicitLod %213 %215 
					                                 f32 %217 = OpCompositeExtract %216 0 
					                                              OpStore %176 %217 
					                                 f32 %218 = OpLoad %176 
					                                 f32 %219 = OpFMul %218 %119 
					                                              OpStore %184 %219 
					                                 f32 %220 = OpLoad %168 
					                                 f32 %221 = OpFMul %220 %119 
					                                 f32 %222 = OpLoad %184 
					                                 f32 %223 = OpFNegate %222 
					                                 f32 %224 = OpFAdd %221 %223 
					                                              OpStore %187 %224 
					                                 f32 %225 = OpLoad %187 
					                                 f32 %226 = OpExtInst %1 40 %225 %194 
					                        Private f32* %227 = OpAccessChain %88 %56 
					                                              OpStore %227 %226 
					                               f32_4 %228 = OpLoad %88 
					                               f32_2 %229 = OpVectorShuffle %228 %228 0 1 
					                               f32_2 %232 = OpFMul %229 %231 
					                               f32_4 %233 = OpLoad %88 
					                               f32_4 %234 = OpVectorShuffle %233 %232 4 5 2 3 
					                                              OpStore %88 %234 
					                        Private f32* %236 = OpAccessChain %88 %61 
					                                              OpStore %236 %235 
					                               f32_4 %237 = OpLoad %88 
					                               f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
					                               f32_4 %239 = OpLoad %88 
					                               f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
					                                 f32 %241 = OpDot %238 %240 
					                        Private f32* %242 = OpAccessChain %9 %56 
					                                              OpStore %242 %241 
					                        Private f32* %243 = OpAccessChain %9 %56 
					                                 f32 %244 = OpLoad %243 
					                                 f32 %245 = OpExtInst %1 32 %244 
					                        Private f32* %246 = OpAccessChain %9 %56 
					                                              OpStore %246 %245 
					                               f32_4 %247 = OpLoad %9 
					                               f32_2 %248 = OpVectorShuffle %247 %247 0 0 
					                               f32_4 %249 = OpLoad %88 
					                               f32_2 %250 = OpVectorShuffle %249 %249 0 2 
					                               f32_2 %251 = OpFMul %248 %250 
					                               f32_4 %252 = OpLoad %9 
					                               f32_4 %253 = OpVectorShuffle %252 %251 4 1 2 5 
					                                              OpStore %9 %253 
					                               f32_4 %254 = OpLoad %9 
					                               f32_2 %255 = OpVectorShuffle %254 %254 0 3 
					                                 f32 %259 = OpDot %255 %258 
					                        Private f32* %260 = OpAccessChain %9 %56 
					                                              OpStore %260 %259 
					                        Private f32* %261 = OpAccessChain %9 %56 
					                                 f32 %262 = OpLoad %261 
					                                 f32 %263 = OpExtInst %1 40 %262 %119 
					                                              OpStore %74 %263 
					                                 f32 %264 = OpLoad %74 
					                               f32_3 %265 = OpCompositeConstruct %264 %264 %264 
					                               f32_3 %266 = OpLoad %150 
					                               f32_3 %267 = OpFMul %265 %266 
					                               f32_4 %268 = OpLoad %44 
					                               f32_4 %269 = OpVectorShuffle %268 %267 4 5 6 3 
					                                              OpStore %44 %269 
					                        Private f32* %270 = OpAccessChain %9 %56 
					                                 f32 %271 = OpLoad %270 
					                        Private f32* %272 = OpAccessChain %9 %56 
					                                 f32 %273 = OpLoad %272 
					                                 f32 %274 = OpFMul %271 %273 
					                        Private f32* %275 = OpAccessChain %9 %56 
					                                              OpStore %275 %274 
					                        Private f32* %276 = OpAccessChain %9 %56 
					                                 f32 %277 = OpLoad %276 
					                        Private f32* %278 = OpAccessChain %9 %56 
					                                 f32 %279 = OpLoad %278 
					                                 f32 %280 = OpFMul %277 %279 
					                                              OpStore %74 %280 
					                        Private f32* %281 = OpAccessChain %9 %56 
					                                 f32 %282 = OpLoad %281 
					                                 f32 %283 = OpLoad %74 
					                                 f32 %284 = OpFMul %282 %283 
					                                 f32 %286 = OpFAdd %284 %285 
					                        Private f32* %287 = OpAccessChain %9 %56 
					                                              OpStore %287 %286 
					                               f32_4 %288 = OpLoad %9 
					                               f32_3 %289 = OpVectorShuffle %288 %288 0 0 0 
					                               f32_4 %290 = OpLoad %44 
					                               f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
					                               f32_3 %292 = OpFMul %289 %291 
					                               f32_4 %293 = OpLoad %44 
					                               f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
					                                              OpStore %44 %294 
					                               f32_4 %295 = OpLoad %9 
					                               f32_2 %296 = OpVectorShuffle %295 %295 2 1 
					                               f32_2 %299 = OpFMul %296 %298 
					                               f32_2 %302 = OpFAdd %299 %301 
					                               f32_3 %303 = OpLoad %53 
					                               f32_3 %304 = OpVectorShuffle %303 %302 3 4 2 
					                                              OpStore %53 %304 
					                               f32_3 %305 = OpLoad %53 
					                               f32_3 %306 = OpLoad %53 
					                                 f32 %307 = OpDot %305 %306 
					                        Private f32* %308 = OpAccessChain %9 %56 
					                                              OpStore %308 %307 
					                        Private f32* %310 = OpAccessChain %9 %56 
					                                 f32 %311 = OpLoad %310 
					                                 f32 %312 = OpFNegate %311 
					                                 f32 %313 = OpFAdd %312 %285 
					                                              OpStore %309 %313 
					                        Private f32* %314 = OpAccessChain %9 %56 
					                                 f32 %315 = OpLoad %314 
					                                 f32 %317 = OpFMul %315 %316 
					                        Private f32* %318 = OpAccessChain %9 %56 
					                                              OpStore %318 %317 
					                               f32_4 %321 = OpLoad %44 
					                               f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
					                                 f32 %323 = OpLoad %309 
					                               f32_3 %324 = OpCompositeConstruct %323 %323 %323 
					                               f32_3 %325 = OpFMul %322 %324 
					                               f32_4 %326 = OpLoad %9 
					                               f32_3 %327 = OpVectorShuffle %326 %326 0 0 0 
					                               f32_3 %328 = OpFAdd %325 %327 
					                               f32_4 %329 = OpLoad %320 
					                               f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
					                                              OpStore %320 %330 
					                         Output f32* %332 = OpAccessChain %320 %86 
					                                              OpStore %332 %285 
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
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat16_0;
					int u_xlati0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat10_5;
					float u_xlat6;
					vec2 u_xlat13;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD0.xyx * _MainTex_ST.xyx + _MainTex_ST.zwz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(500.0, 500.0, 500.0);
					    u_xlat0.xyz = floor(u_xlat0.xyz);
					    u_xlat1.xy = u_xlat0.xy * vec2(0.00200000009, 0.00200000009);
					    u_xlat2.x = float(0.0);
					    u_xlat2.y = float(0.0);
					    u_xlat2.z = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<64 ; u_xlati_loop_1++)
					    {
					        u_xlat18 = float(u_xlati_loop_1);
					        u_xlat18 = (-u_xlat18) * 0.00200000009 + u_xlat1.y;
					        u_xlat1.w = u_xlat18 + u_xlat18;
					        u_xlat3.xy = u_xlat1.xw + vec2(0.75, 0.375);
					        u_xlat13.xy = u_xlat3.xy * vec2(0.400000006, 0.400000006);
					        u_xlat10_4 = texture(_MainTex, u_xlat13.xy);
					        u_xlat3.z = u_xlat10_4.x * 0.200000003;
					        u_xlat18 = u_xlat10_4.x * 0.200000003 + u_xlat18;
					        u_xlatb18 = u_xlat1.y<u_xlat18;
					        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat2.xyz;
					    }
					    u_xlat0.xw = u_xlat2.xy * vec2(0.400000006, 0.400000006);
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xw);
					    u_xlat3 = u_xlat2.xyxy + vec4(0.0, 0.00400000019, -0.0, -0.00400000019);
					    u_xlat3 = u_xlat3 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat10_3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat16_0 = u_xlat10_3.x * 0.200000003;
					    u_xlat16_0 = u_xlat10_4.x * 0.200000003 + (-u_xlat16_0);
					    u_xlat3.y = max(u_xlat16_0, 0.00300000003);
					    u_xlat4 = u_xlat2.xyxy + vec4(0.00400000019, 0.0, -0.00400000019, -0.0);
					    u_xlat4 = u_xlat4 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006);
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xy);
					    u_xlat10_4 = texture(_MainTex, u_xlat4.zw);
					    u_xlat16_0 = u_xlat10_4.x * 0.200000003;
					    u_xlat16_0 = u_xlat10_5.x * 0.200000003 + (-u_xlat16_0);
					    u_xlat3.x = max(u_xlat16_0, 0.00300000003);
					    u_xlat3.xy = u_xlat3.xy * vec2(0.00800000038, 0.00800000038);
					    u_xlat3.z = -6.40000071e-05;
					    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xw = u_xlat0.xx * u_xlat3.xz;
					    u_xlat0.x = dot(u_xlat0.xw, vec2(0.707106769, -0.707106769));
					    u_xlat18 = max(u_xlat0.x, 0.200000003);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat10_1.xyz;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat18 = u_xlat0.x * u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * u_xlat18 + 1.0;
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xy = u_xlat0.zy * vec2(0.00160000008, 0.00200000009) + vec2(-0.400000006, 0.0);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat6 = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * 0.800000012;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat6) + u_xlat0.xxx;
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