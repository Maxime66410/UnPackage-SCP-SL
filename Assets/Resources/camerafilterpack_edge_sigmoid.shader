Shader "CameraFilterPack/Edge_Sigmoid" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 0.3
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_Gain ("_Gain", Range(1, 10)) = 3
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 45774
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
					uniform 	float _Gain;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					float u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					int u_xlati4;
					vec4 u_xlat10_5;
					float u_xlat6;
					vec3 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					bool u_xlatb16;
					int u_xlati19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati19 = int(int(0xFFFFFFFFu));
					    while(true){
					        u_xlat2 = float(u_xlati19);
					        u_xlatb8 = 1.0<u_xlat2;
					        if(u_xlatb8){break;}
					        u_xlatb2 = u_xlat2==0.0;
					        u_xlat3.yw = vec2(ivec2(u_xlati19));
					        u_xlat8.xyz = u_xlat1.xyz;
					        u_xlati4 = int(0xFFFFFFFFu);
					        while(true){
					            u_xlat10.x = float(u_xlati4);
					            u_xlatb16 = 1.0<u_xlat10.x;
					            if(u_xlatb16){break;}
					            u_xlatb10 = u_xlat10.x==0.0;
					            u_xlatb10 = u_xlatb2 && u_xlatb10;
					            if(u_xlatb10){
					                u_xlat3.x = float(u_xlati4);
					                u_xlat10.xy = u_xlat12.xy * u_xlat3.xy + u_xlat0.xy;
					                u_xlat10_5 = textureLod(_MainTex, u_xlat10.xy, 0.0);
					                u_xlat8.xyz = u_xlat10_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat8.xyz;
					            } else {
					                u_xlat3.z = float(u_xlati4);
					                u_xlat3.xz = u_xlat12.xy * u_xlat3.zw + u_xlat0.xy;
					                u_xlat10_5 = textureLod(_MainTex, u_xlat3.xz, 0.0);
					                u_xlat8.xyz = u_xlat8.xyz + (-u_xlat10_5.xyz);
					            }
					            u_xlati4 = u_xlati4 + 1;
					        }
					        u_xlat1.xyz = u_xlat8.xyz;
					        u_xlati19 = u_xlati19 + 1;
					    }
					    u_xlat0.x = u_xlat1.y + u_xlat1.x;
					    u_xlat0.x = u_xlat1.z + u_xlat0.x;
					    u_xlat6 = (-_Gain) + 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat6;
					    u_xlat0.x = u_xlat0.x + -0.180000007;
					    u_xlat0.x = u_xlat0.x * -12.9842558;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat0.xxx;
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
					; Bound: 232
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %220 
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
					                                              OpDecorate %119 RelaxedPrecision 
					                                              OpDecorate %122 RelaxedPrecision 
					                                              OpDecorate %122 DescriptorSet 122 
					                                              OpDecorate %122 Binding 122 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %126 RelaxedPrecision 
					                                              OpDecorate %126 DescriptorSet 126 
					                                              OpDecorate %126 Binding 126 
					                                              OpDecorate %127 RelaxedPrecision 
					                                              OpDecorate %132 RelaxedPrecision 
					                                              OpDecorate %133 RelaxedPrecision 
					                                              OpDecorate %136 RelaxedPrecision 
					                                              OpDecorate %151 RelaxedPrecision 
					                                              OpDecorate %152 RelaxedPrecision 
					                                              OpDecorate %157 RelaxedPrecision 
					                                              OpDecorate %159 RelaxedPrecision 
					                                              OpDecorate %160 RelaxedPrecision 
					                                              OpDecorate %220 Location 220 
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
					                       Private f32_2* %28 = OpVariable Private 
					                                  f32 %29 = OpConstant 3,674022E-40 
					                                f32_2 %30 = OpConstantComposite %29 %29 
					                                  i32 %31 = OpConstant 0 
					                                      %36 = OpTypeVector %6 3 
					                                      %37 = OpTypePointer Private %36 
					                       Private f32_3* %38 = OpVariable Private 
					                                  f32 %39 = OpConstant 3,674022E-40 
					                                      %40 = OpTypeInt 32 0 
					                                  u32 %41 = OpConstant 0 
					                                      %42 = OpTypePointer Private %6 
					                                  u32 %44 = OpConstant 1 
					                                  u32 %46 = OpConstant 2 
					                                      %48 = OpTypePointer Private %17 
					                         Private i32* %49 = OpVariable Private 
					                                  i32 %50 = OpConstant -1 
					                                      %56 = OpTypeBool 
					                                 bool %57 = OpConstantTrue 
					                         Private f32* %58 = OpVariable Private 
					                                      %61 = OpTypePointer Private %56 
					                        Private bool* %62 = OpVariable Private 
					                        Private bool* %69 = OpVariable Private 
					                                      %72 = OpTypePointer Private %13 
					                       Private f32_4* %73 = OpVariable Private 
					                                      %75 = OpTypeVector %17 2 
					                       Private f32_3* %80 = OpVariable Private 
					                         Private i32* %82 = OpVariable Private 
					                       Private f32_2* %88 = OpVariable Private 
					                        Private bool* %92 = OpVariable Private 
					                       Private bool* %100 = OpVariable Private 
					                      Private f32_3* %119 = OpVariable Private 
					                                     %120 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %121 = OpTypePointer UniformConstant %120 
					UniformConstant read_only Texture2D* %122 = OpVariable UniformConstant 
					                                     %124 = OpTypeSampler 
					                                     %125 = OpTypePointer UniformConstant %124 
					            UniformConstant sampler* %126 = OpVariable UniformConstant 
					                                     %128 = OpTypeSampledImage %120 
					                                 f32 %134 = OpConstant 3,674022E-40 
					                               f32_3 %135 = OpConstantComposite %134 %134 %134 
					                                 i32 %163 = OpConstant 1 
					                        Private f32* %180 = OpVariable Private 
					                                     %181 = OpTypePointer Uniform %6 
					                                 f32 %185 = OpConstant 3,674022E-40 
					                                 f32 %194 = OpConstant 3,674022E-40 
					                                 f32 %199 = OpConstant 3,674022E-40 
					                                     %219 = OpTypePointer Output %13 
					                       Output f32_4* %220 = OpVariable Output 
					                                 u32 %228 = OpConstant 3 
					                                     %229 = OpTypePointer Output %6 
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
					                       Uniform f32_4* %32 = OpAccessChain %16 %31 
					                                f32_4 %33 = OpLoad %32 
					                                f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                f32_2 %35 = OpFDiv %30 %34 
					                                              OpStore %28 %35 
					                         Private f32* %43 = OpAccessChain %38 %41 
					                                              OpStore %43 %39 
					                         Private f32* %45 = OpAccessChain %38 %44 
					                                              OpStore %45 %39 
					                         Private f32* %47 = OpAccessChain %38 %46 
					                                              OpStore %47 %39 
					                                              OpStore %49 %50 
					                                              OpBranch %51 
					                                      %51 = OpLabel 
					                                              OpLoopMerge %53 %54 None 
					                                              OpBranch %55 
					                                      %55 = OpLabel 
					                                              OpBranchConditional %57 %52 %53 
					                                      %52 = OpLabel 
					                                  i32 %59 = OpLoad %49 
					                                  f32 %60 = OpConvertSToF %59 
					                                              OpStore %58 %60 
					                                  f32 %63 = OpLoad %58 
					                                 bool %64 = OpFOrdLessThan %29 %63 
					                                              OpStore %62 %64 
					                                 bool %65 = OpLoad %62 
					                                              OpSelectionMerge %67 None 
					                                              OpBranchConditional %65 %66 %67 
					                                      %66 = OpLabel 
					                                              OpBranch %53 
					                                      %67 = OpLabel 
					                                  f32 %70 = OpLoad %58 
					                                 bool %71 = OpFOrdEqual %70 %39 
					                                              OpStore %69 %71 
					                                  i32 %74 = OpLoad %49 
					                                i32_2 %76 = OpCompositeConstruct %74 %74 
					                                f32_2 %77 = OpConvertSToF %76 
					                                f32_4 %78 = OpLoad %73 
					                                f32_4 %79 = OpVectorShuffle %78 %77 0 4 2 5 
					                                              OpStore %73 %79 
					                                f32_3 %81 = OpLoad %38 
					                                              OpStore %80 %81 
					                                              OpStore %82 %50 
					                                              OpBranch %83 
					                                      %83 = OpLabel 
					                                              OpLoopMerge %85 %86 None 
					                                              OpBranch %87 
					                                      %87 = OpLabel 
					                                              OpBranchConditional %57 %84 %85 
					                                      %84 = OpLabel 
					                                  i32 %89 = OpLoad %82 
					                                  f32 %90 = OpConvertSToF %89 
					                         Private f32* %91 = OpAccessChain %88 %41 
					                                              OpStore %91 %90 
					                         Private f32* %93 = OpAccessChain %88 %41 
					                                  f32 %94 = OpLoad %93 
					                                 bool %95 = OpFOrdLessThan %29 %94 
					                                              OpStore %92 %95 
					                                 bool %96 = OpLoad %92 
					                                              OpSelectionMerge %98 None 
					                                              OpBranchConditional %96 %97 %98 
					                                      %97 = OpLabel 
					                                              OpBranch %85 
					                                      %98 = OpLabel 
					                        Private f32* %101 = OpAccessChain %88 %41 
					                                 f32 %102 = OpLoad %101 
					                                bool %103 = OpFOrdEqual %102 %39 
					                                              OpStore %100 %103 
					                                bool %104 = OpLoad %69 
					                                bool %105 = OpLoad %100 
					                                bool %106 = OpLogicalAnd %104 %105 
					                                              OpStore %100 %106 
					                                bool %107 = OpLoad %100 
					                                              OpSelectionMerge %109 None 
					                                              OpBranchConditional %107 %108 %139 
					                                     %108 = OpLabel 
					                                 i32 %110 = OpLoad %82 
					                                 f32 %111 = OpConvertSToF %110 
					                        Private f32* %112 = OpAccessChain %73 %41 
					                                              OpStore %112 %111 
					                               f32_2 %113 = OpLoad %28 
					                               f32_4 %114 = OpLoad %73 
					                               f32_2 %115 = OpVectorShuffle %114 %114 0 1 
					                               f32_2 %116 = OpFMul %113 %115 
					                               f32_2 %117 = OpLoad %9 
					                               f32_2 %118 = OpFAdd %116 %117 
					                                              OpStore %88 %118 
					                 read_only Texture2D %123 = OpLoad %122 
					                             sampler %127 = OpLoad %126 
					          read_only Texture2DSampled %129 = OpSampledImage %123 %127 
					                               f32_2 %130 = OpLoad %88 
					                               f32_4 %131 = OpImageSampleExplicitLod %129 %130 Lod %13 
					                               f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                              OpStore %119 %132 
					                               f32_3 %133 = OpLoad %119 
					                               f32_3 %136 = OpFMul %133 %135 
					                               f32_3 %137 = OpLoad %80 
					                               f32_3 %138 = OpFAdd %136 %137 
					                                              OpStore %80 %138 
					                                              OpBranch %109 
					                                     %139 = OpLabel 
					                                 i32 %140 = OpLoad %82 
					                                 f32 %141 = OpConvertSToF %140 
					                        Private f32* %142 = OpAccessChain %73 %46 
					                                              OpStore %142 %141 
					                               f32_2 %143 = OpLoad %28 
					                               f32_4 %144 = OpLoad %73 
					                               f32_2 %145 = OpVectorShuffle %144 %144 2 3 
					                               f32_2 %146 = OpFMul %143 %145 
					                               f32_2 %147 = OpLoad %9 
					                               f32_2 %148 = OpFAdd %146 %147 
					                               f32_4 %149 = OpLoad %73 
					                               f32_4 %150 = OpVectorShuffle %149 %148 4 1 5 3 
					                                              OpStore %73 %150 
					                 read_only Texture2D %151 = OpLoad %122 
					                             sampler %152 = OpLoad %126 
					          read_only Texture2DSampled %153 = OpSampledImage %151 %152 
					                               f32_4 %154 = OpLoad %73 
					                               f32_2 %155 = OpVectorShuffle %154 %154 0 2 
					                               f32_4 %156 = OpImageSampleExplicitLod %153 %155 Lod %13 
					                               f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
					                                              OpStore %119 %157 
					                               f32_3 %158 = OpLoad %80 
					                               f32_3 %159 = OpLoad %119 
					                               f32_3 %160 = OpFNegate %159 
					                               f32_3 %161 = OpFAdd %158 %160 
					                                              OpStore %80 %161 
					                                              OpBranch %109 
					                                     %109 = OpLabel 
					                                 i32 %162 = OpLoad %82 
					                                 i32 %164 = OpIAdd %162 %163 
					                                              OpStore %82 %164 
					                                              OpBranch %86 
					                                      %86 = OpLabel 
					                                              OpBranch %83 
					                                      %85 = OpLabel 
					                               f32_3 %165 = OpLoad %80 
					                                              OpStore %38 %165 
					                                 i32 %166 = OpLoad %49 
					                                 i32 %167 = OpIAdd %166 %163 
					                                              OpStore %49 %167 
					                                              OpBranch %54 
					                                      %54 = OpLabel 
					                                              OpBranch %51 
					                                      %53 = OpLabel 
					                        Private f32* %168 = OpAccessChain %38 %44 
					                                 f32 %169 = OpLoad %168 
					                        Private f32* %170 = OpAccessChain %38 %41 
					                                 f32 %171 = OpLoad %170 
					                                 f32 %172 = OpFAdd %169 %171 
					                        Private f32* %173 = OpAccessChain %9 %41 
					                                              OpStore %173 %172 
					                        Private f32* %174 = OpAccessChain %38 %46 
					                                 f32 %175 = OpLoad %174 
					                        Private f32* %176 = OpAccessChain %9 %41 
					                                 f32 %177 = OpLoad %176 
					                                 f32 %178 = OpFAdd %175 %177 
					                        Private f32* %179 = OpAccessChain %9 %41 
					                                              OpStore %179 %178 
					                        Uniform f32* %182 = OpAccessChain %16 %163 
					                                 f32 %183 = OpLoad %182 
					                                 f32 %184 = OpFNegate %183 
					                                 f32 %186 = OpFAdd %184 %185 
					                                              OpStore %180 %186 
					                        Private f32* %187 = OpAccessChain %9 %41 
					                                 f32 %188 = OpLoad %187 
					                                 f32 %189 = OpLoad %180 
					                                 f32 %190 = OpFDiv %188 %189 
					                        Private f32* %191 = OpAccessChain %9 %41 
					                                              OpStore %191 %190 
					                        Private f32* %192 = OpAccessChain %9 %41 
					                                 f32 %193 = OpLoad %192 
					                                 f32 %195 = OpFAdd %193 %194 
					                        Private f32* %196 = OpAccessChain %9 %41 
					                                              OpStore %196 %195 
					                        Private f32* %197 = OpAccessChain %9 %41 
					                                 f32 %198 = OpLoad %197 
					                                 f32 %200 = OpFMul %198 %199 
					                        Private f32* %201 = OpAccessChain %9 %41 
					                                              OpStore %201 %200 
					                        Private f32* %202 = OpAccessChain %9 %41 
					                                 f32 %203 = OpLoad %202 
					                                 f32 %204 = OpExtInst %1 29 %203 
					                        Private f32* %205 = OpAccessChain %9 %41 
					                                              OpStore %205 %204 
					                        Private f32* %206 = OpAccessChain %9 %41 
					                                 f32 %207 = OpLoad %206 
					                                 f32 %208 = OpFAdd %207 %29 
					                        Private f32* %209 = OpAccessChain %9 %41 
					                                              OpStore %209 %208 
					                        Private f32* %210 = OpAccessChain %9 %41 
					                                 f32 %211 = OpLoad %210 
					                                 f32 %212 = OpFDiv %29 %211 
					                        Private f32* %213 = OpAccessChain %9 %41 
					                                              OpStore %213 %212 
					                        Private f32* %214 = OpAccessChain %9 %41 
					                                 f32 %215 = OpLoad %214 
					                                 f32 %216 = OpFNegate %215 
					                                 f32 %217 = OpFAdd %216 %29 
					                        Private f32* %218 = OpAccessChain %9 %41 
					                                              OpStore %218 %217 
					                               f32_2 %221 = OpLoad %9 
					                               f32_3 %222 = OpVectorShuffle %221 %221 0 0 0 
					                               f32_2 %223 = OpLoad %9 
					                               f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
					                               f32_3 %225 = OpFAdd %222 %224 
					                               f32_4 %226 = OpLoad %220 
					                               f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
					                                              OpStore %220 %227 
					                         Output f32* %230 = OpAccessChain %220 %228 
					                                              OpStore %230 %29 
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
						float _Gain;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec3 u_xlat1;
					float u_xlat2;
					bool u_xlatb2;
					vec4 u_xlat3;
					int u_xlati4;
					vec4 u_xlat10_5;
					float u_xlat6;
					vec3 u_xlat8;
					bool u_xlatb8;
					vec2 u_xlat10;
					bool u_xlatb10;
					vec2 u_xlat12;
					bool u_xlatb16;
					int u_xlati19;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat12.xy = vec2(1.0, 1.0) / _ScreenResolution.xy;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlati19 = int(int(0xFFFFFFFFu));
					    while(true){
					        u_xlat2 = float(u_xlati19);
					        u_xlatb8 = 1.0<u_xlat2;
					        if(u_xlatb8){break;}
					        u_xlatb2 = u_xlat2==0.0;
					        u_xlat3.yw = vec2(ivec2(u_xlati19));
					        u_xlat8.xyz = u_xlat1.xyz;
					        u_xlati4 = int(0xFFFFFFFFu);
					        while(true){
					            u_xlat10.x = float(u_xlati4);
					            u_xlatb16 = 1.0<u_xlat10.x;
					            if(u_xlatb16){break;}
					            u_xlatb10 = u_xlat10.x==0.0;
					            u_xlatb10 = u_xlatb2 && u_xlatb10;
					            if(u_xlatb10){
					                u_xlat3.x = float(u_xlati4);
					                u_xlat10.xy = u_xlat12.xy * u_xlat3.xy + u_xlat0.xy;
					                u_xlat10_5 = textureLod(_MainTex, u_xlat10.xy, 0.0);
					                u_xlat8.xyz = u_xlat10_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat8.xyz;
					            } else {
					                u_xlat3.z = float(u_xlati4);
					                u_xlat3.xz = u_xlat12.xy * u_xlat3.zw + u_xlat0.xy;
					                u_xlat10_5 = textureLod(_MainTex, u_xlat3.xz, 0.0);
					                u_xlat8.xyz = u_xlat8.xyz + (-u_xlat10_5.xyz);
					            //ENDIF
					            }
					            u_xlati4 = u_xlati4 + 1;
					        }
					        u_xlat1.xyz = u_xlat8.xyz;
					        u_xlati19 = u_xlati19 + 1;
					    }
					    u_xlat0.x = u_xlat1.y + u_xlat1.x;
					    u_xlat0.x = u_xlat1.z + u_xlat0.x;
					    u_xlat6 = (-_Gain) + 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat6;
					    u_xlat0.x = u_xlat0.x + -0.180000007;
					    u_xlat0.x = u_xlat0.x * -12.9842558;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + 1.0;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    SV_Target0.xyz = u_xlat0.xxx + u_xlat0.xxx;
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