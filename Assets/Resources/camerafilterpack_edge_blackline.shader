Shader "CameraFilterPack/Edge_BlackLine" {
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
			GpuProgramID 15993
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
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					ivec3 u_xlati2;
					vec2 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat10_5;
					int u_xlati12;
					vec2 u_xlat14;
					float u_xlat18;
					int u_xlati18;
					bool u_xlatb18;
					vec4 TempArray0[25];
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    TempArray0[0].x = -1.0;
					    TempArray0[1].x = -1.0;
					    TempArray0[2].x = -1.0;
					    TempArray0[3].x = -1.0;
					    TempArray0[4].x = -1.0;
					    TempArray0[5].x = -1.0;
					    TempArray0[6].x = -1.0;
					    TempArray0[7].x = -1.0;
					    TempArray0[8].x = -1.0;
					    TempArray0[9].x = -1.0;
					    TempArray0[10].x = -1.0;
					    TempArray0[11].x = -1.0;
					    TempArray0[13].x = -1.0;
					    TempArray0[14].x = -1.0;
					    TempArray0[15].x = -1.0;
					    TempArray0[16].x = -1.0;
					    TempArray0[17].x = -1.0;
					    TempArray0[18].x = -1.0;
					    TempArray0[19].x = -1.0;
					    TempArray0[20].x = -1.0;
					    TempArray0[21].x = -1.0;
					    TempArray0[22].x = -1.0;
					    TempArray0[23].x = -1.0;
					    TempArray0[24].x = -1.0;
					    TempArray0[12].x = 24.0;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlati12 = 0;
					    while(true){
					        u_xlatb18 = u_xlati12>=5;
					        if(u_xlatb18){break;}
					        u_xlati2.xy = ivec2(u_xlati12) + ivec2(int(0xFFFFFFFEu), 1);
					        u_xlat3.x = float(u_xlati2.x);
					        u_xlat4 = u_xlat1;
					        u_xlati2.x = 0;
					        while(true){
					            u_xlatb18 = u_xlati2.x>=5;
					            if(u_xlatb18){break;}
					            u_xlati18 = u_xlati12 * 5 + u_xlati2.x;
					            u_xlat18 = TempArray0[u_xlati18].x;
					            u_xlati2.xz = u_xlati2.xx + ivec2(1, int(0xFFFFFFFEu));
					            u_xlat3.y = float(u_xlati2.z);
					            u_xlat14.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
					            u_xlat10_5 = texture(_MainTex, u_xlat14.xy);
					            u_xlat4 = vec4(u_xlat18) * u_xlat10_5 + u_xlat4;
					        }
					        u_xlat1 = u_xlat4;
					        u_xlati12 = u_xlati2.y;
					    }
					    u_xlat0.x = u_xlat1.y + u_xlat1.x;
					    u_xlat0.x = u_xlat1.z + u_xlat0.x;
					    u_xlatb0 = u_xlat0.x<2.39999986;
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat1;
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
					; Bound: 219
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %11 %211 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate vs_TEXCOORD0 Location 11 
					                                              OpMemberDecorate %14 0 RelaxedPrecision 
					                                              OpMemberDecorate %14 0 Offset 14 
					                                              OpDecorate %14 Block 
					                                              OpDecorate %16 DescriptorSet 16 
					                                              OpDecorate %16 Binding 16 
					                                              OpDecorate %21 RelaxedPrecision 
					                                              OpDecorate %22 RelaxedPrecision 
					                                              OpDecorate %25 RelaxedPrecision 
					                                              OpDecorate %26 RelaxedPrecision 
					                                              OpDecorate %171 RelaxedPrecision 
					                                              OpDecorate %174 RelaxedPrecision 
					                                              OpDecorate %174 DescriptorSet 174 
					                                              OpDecorate %174 Binding 174 
					                                              OpDecorate %175 RelaxedPrecision 
					                                              OpDecorate %178 RelaxedPrecision 
					                                              OpDecorate %178 DescriptorSet 178 
					                                              OpDecorate %178 Binding 178 
					                                              OpDecorate %179 RelaxedPrecision 
					                                              OpDecorate %185 RelaxedPrecision 
					                                              OpDecorate %186 RelaxedPrecision 
					                                              OpDecorate %187 RelaxedPrecision 
					                                              OpDecorate %211 Location 211 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 2 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_2* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                      %13 = OpTypeVector %6 4 
					                                      %14 = OpTypeStruct %13 
					                                      %15 = OpTypePointer Uniform %14 
					             Uniform struct {f32_4;}* %16 = OpVariable Uniform 
					                                      %17 = OpTypeInt 32 1 
					                                  i32 %18 = OpConstant 0 
					                                      %19 = OpTypePointer Uniform %13 
					                                      %28 = OpTypeInt 32 0 
					                                  u32 %29 = OpConstant 25 
					                                      %30 = OpTypeArray %13 %29 
					                                      %31 = OpTypePointer Private %30 
					                   Private f32_4[25]* %32 = OpVariable Private 
					                                  f32 %33 = OpConstant 3,674022E-40 
					                                  u32 %34 = OpConstant 0 
					                                      %35 = OpTypePointer Private %6 
					                                  i32 %37 = OpConstant 1 
					                                  i32 %39 = OpConstant 2 
					                                  i32 %41 = OpConstant 3 
					                                  i32 %43 = OpConstant 4 
					                                  i32 %45 = OpConstant 5 
					                                  i32 %47 = OpConstant 6 
					                                  i32 %49 = OpConstant 7 
					                                  i32 %51 = OpConstant 8 
					                                  i32 %53 = OpConstant 9 
					                                  i32 %55 = OpConstant 10 
					                                  i32 %57 = OpConstant 11 
					                                  i32 %59 = OpConstant 13 
					                                  i32 %61 = OpConstant 14 
					                                  i32 %63 = OpConstant 15 
					                                  i32 %65 = OpConstant 16 
					                                  i32 %67 = OpConstant 17 
					                                  i32 %69 = OpConstant 18 
					                                  i32 %71 = OpConstant 19 
					                                  i32 %73 = OpConstant 20 
					                                  i32 %75 = OpConstant 21 
					                                  i32 %77 = OpConstant 22 
					                                  i32 %79 = OpConstant 23 
					                                  i32 %81 = OpConstant 24 
					                                  i32 %83 = OpConstant 12 
					                                  f32 %84 = OpConstant 3,674022E-40 
					                                      %86 = OpTypePointer Private %13 
					                       Private f32_4* %87 = OpVariable Private 
					                                  f32 %88 = OpConstant 3,674022E-40 
					                                  u32 %90 = OpConstant 1 
					                                  u32 %92 = OpConstant 2 
					                                  u32 %94 = OpConstant 3 
					                                      %96 = OpTypePointer Private %17 
					                         Private i32* %97 = OpVariable Private 
					                                     %103 = OpTypeBool 
					                                bool %104 = OpConstantTrue 
					                                     %105 = OpTypePointer Private %103 
					                       Private bool* %106 = OpVariable Private 
					                                     %113 = OpTypeVector %17 3 
					                                     %114 = OpTypePointer Private %113 
					                      Private i32_3* %115 = OpVariable Private 
					                                     %117 = OpTypeVector %17 2 
					                                 i32 %119 = OpConstant -2 
					                               i32_2 %120 = OpConstantComposite %119 %37 
					                      Private f32_2* %124 = OpVariable Private 
					                      Private f32_4* %129 = OpVariable Private 
					                        Private i32* %144 = OpVariable Private 
					                        Private f32* %150 = OpVariable Private 
					                               i32_2 %156 = OpConstantComposite %37 %119 
					                      Private f32_2* %164 = OpVariable Private 
					                                 f32 %166 = OpConstant 3,674022E-40 
					                               f32_2 %167 = OpConstantComposite %166 %166 
					                      Private f32_4* %171 = OpVariable Private 
					                                     %172 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %173 = OpTypePointer UniformConstant %172 
					UniformConstant read_only Texture2D* %174 = OpVariable UniformConstant 
					                                     %176 = OpTypeSampler 
					                                     %177 = OpTypePointer UniformConstant %176 
					            UniformConstant sampler* %178 = OpVariable UniformConstant 
					                                     %180 = OpTypeSampledImage %172 
					                       Private bool* %205 = OpVariable Private 
					                                 f32 %208 = OpConstant 3,674022E-40 
					                                     %210 = OpTypePointer Output %13 
					                       Output f32_4* %211 = OpVariable Output 
					                               f32_4 %213 = OpConstantComposite %88 %88 %88 %88 
					                                     %215 = OpTypeVector %103 4 
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
					                         Private f32* %36 = OpAccessChain %32 %18 %34 
					                                              OpStore %36 %33 
					                         Private f32* %38 = OpAccessChain %32 %37 %34 
					                                              OpStore %38 %33 
					                         Private f32* %40 = OpAccessChain %32 %39 %34 
					                                              OpStore %40 %33 
					                         Private f32* %42 = OpAccessChain %32 %41 %34 
					                                              OpStore %42 %33 
					                         Private f32* %44 = OpAccessChain %32 %43 %34 
					                                              OpStore %44 %33 
					                         Private f32* %46 = OpAccessChain %32 %45 %34 
					                                              OpStore %46 %33 
					                         Private f32* %48 = OpAccessChain %32 %47 %34 
					                                              OpStore %48 %33 
					                         Private f32* %50 = OpAccessChain %32 %49 %34 
					                                              OpStore %50 %33 
					                         Private f32* %52 = OpAccessChain %32 %51 %34 
					                                              OpStore %52 %33 
					                         Private f32* %54 = OpAccessChain %32 %53 %34 
					                                              OpStore %54 %33 
					                         Private f32* %56 = OpAccessChain %32 %55 %34 
					                                              OpStore %56 %33 
					                         Private f32* %58 = OpAccessChain %32 %57 %34 
					                                              OpStore %58 %33 
					                         Private f32* %60 = OpAccessChain %32 %59 %34 
					                                              OpStore %60 %33 
					                         Private f32* %62 = OpAccessChain %32 %61 %34 
					                                              OpStore %62 %33 
					                         Private f32* %64 = OpAccessChain %32 %63 %34 
					                                              OpStore %64 %33 
					                         Private f32* %66 = OpAccessChain %32 %65 %34 
					                                              OpStore %66 %33 
					                         Private f32* %68 = OpAccessChain %32 %67 %34 
					                                              OpStore %68 %33 
					                         Private f32* %70 = OpAccessChain %32 %69 %34 
					                                              OpStore %70 %33 
					                         Private f32* %72 = OpAccessChain %32 %71 %34 
					                                              OpStore %72 %33 
					                         Private f32* %74 = OpAccessChain %32 %73 %34 
					                                              OpStore %74 %33 
					                         Private f32* %76 = OpAccessChain %32 %75 %34 
					                                              OpStore %76 %33 
					                         Private f32* %78 = OpAccessChain %32 %77 %34 
					                                              OpStore %78 %33 
					                         Private f32* %80 = OpAccessChain %32 %79 %34 
					                                              OpStore %80 %33 
					                         Private f32* %82 = OpAccessChain %32 %81 %34 
					                                              OpStore %82 %33 
					                         Private f32* %85 = OpAccessChain %32 %83 %34 
					                                              OpStore %85 %84 
					                         Private f32* %89 = OpAccessChain %87 %34 
					                                              OpStore %89 %88 
					                         Private f32* %91 = OpAccessChain %87 %90 
					                                              OpStore %91 %88 
					                         Private f32* %93 = OpAccessChain %87 %92 
					                                              OpStore %93 %88 
					                         Private f32* %95 = OpAccessChain %87 %94 
					                                              OpStore %95 %88 
					                                              OpStore %97 %18 
					                                              OpBranch %98 
					                                      %98 = OpLabel 
					                                              OpLoopMerge %100 %101 None 
					                                              OpBranch %102 
					                                     %102 = OpLabel 
					                                              OpBranchConditional %104 %99 %100 
					                                      %99 = OpLabel 
					                                 i32 %107 = OpLoad %97 
					                                bool %108 = OpSGreaterThanEqual %107 %45 
					                                              OpStore %106 %108 
					                                bool %109 = OpLoad %106 
					                                              OpSelectionMerge %111 None 
					                                              OpBranchConditional %109 %110 %111 
					                                     %110 = OpLabel 
					                                              OpBranch %100 
					                                     %111 = OpLabel 
					                                 i32 %116 = OpLoad %97 
					                               i32_2 %118 = OpCompositeConstruct %116 %116 
					                               i32_2 %121 = OpIAdd %118 %120 
					                               i32_3 %122 = OpLoad %115 
					                               i32_3 %123 = OpVectorShuffle %122 %121 3 4 2 
					                                              OpStore %115 %123 
					                        Private i32* %125 = OpAccessChain %115 %34 
					                                 i32 %126 = OpLoad %125 
					                                 f32 %127 = OpConvertSToF %126 
					                        Private f32* %128 = OpAccessChain %124 %34 
					                                              OpStore %128 %127 
					                               f32_4 %130 = OpLoad %87 
					                                              OpStore %129 %130 
					                        Private i32* %131 = OpAccessChain %115 %34 
					                                              OpStore %131 %18 
					                                              OpBranch %132 
					                                     %132 = OpLabel 
					                                              OpLoopMerge %134 %135 None 
					                                              OpBranch %136 
					                                     %136 = OpLabel 
					                                              OpBranchConditional %104 %133 %134 
					                                     %133 = OpLabel 
					                        Private i32* %137 = OpAccessChain %115 %34 
					                                 i32 %138 = OpLoad %137 
					                                bool %139 = OpSGreaterThanEqual %138 %45 
					                                              OpStore %106 %139 
					                                bool %140 = OpLoad %106 
					                                              OpSelectionMerge %142 None 
					                                              OpBranchConditional %140 %141 %142 
					                                     %141 = OpLabel 
					                                              OpBranch %134 
					                                     %142 = OpLabel 
					                                 i32 %145 = OpLoad %97 
					                                 i32 %146 = OpIMul %145 %45 
					                        Private i32* %147 = OpAccessChain %115 %34 
					                                 i32 %148 = OpLoad %147 
					                                 i32 %149 = OpIAdd %146 %148 
					                                              OpStore %144 %149 
					                                 i32 %151 = OpLoad %144 
					                        Private f32* %152 = OpAccessChain %32 %151 %34 
					                                 f32 %153 = OpLoad %152 
					                                              OpStore %150 %153 
					                               i32_3 %154 = OpLoad %115 
					                               i32_2 %155 = OpVectorShuffle %154 %154 0 0 
					                               i32_2 %157 = OpIAdd %155 %156 
					                               i32_3 %158 = OpLoad %115 
					                               i32_3 %159 = OpVectorShuffle %158 %157 3 1 4 
					                                              OpStore %115 %159 
					                        Private i32* %160 = OpAccessChain %115 %92 
					                                 i32 %161 = OpLoad %160 
					                                 f32 %162 = OpConvertSToF %161 
					                        Private f32* %163 = OpAccessChain %124 %90 
					                                              OpStore %163 %162 
					                               f32_2 %165 = OpLoad %124 
					                               f32_2 %168 = OpFMul %165 %167 
					                               f32_2 %169 = OpLoad %9 
					                               f32_2 %170 = OpFAdd %168 %169 
					                                              OpStore %164 %170 
					                 read_only Texture2D %175 = OpLoad %174 
					                             sampler %179 = OpLoad %178 
					          read_only Texture2DSampled %181 = OpSampledImage %175 %179 
					                               f32_2 %182 = OpLoad %164 
					                               f32_4 %183 = OpImageSampleImplicitLod %181 %182 
					                                              OpStore %171 %183 
					                                 f32 %184 = OpLoad %150 
					                               f32_4 %185 = OpCompositeConstruct %184 %184 %184 %184 
					                               f32_4 %186 = OpLoad %171 
					                               f32_4 %187 = OpFMul %185 %186 
					                               f32_4 %188 = OpLoad %129 
					                               f32_4 %189 = OpFAdd %187 %188 
					                                              OpStore %129 %189 
					                                              OpBranch %135 
					                                     %135 = OpLabel 
					                                              OpBranch %132 
					                                     %134 = OpLabel 
					                               f32_4 %190 = OpLoad %129 
					                                              OpStore %87 %190 
					                        Private i32* %191 = OpAccessChain %115 %90 
					                                 i32 %192 = OpLoad %191 
					                                              OpStore %97 %192 
					                                              OpBranch %101 
					                                     %101 = OpLabel 
					                                              OpBranch %98 
					                                     %100 = OpLabel 
					                        Private f32* %193 = OpAccessChain %87 %90 
					                                 f32 %194 = OpLoad %193 
					                        Private f32* %195 = OpAccessChain %87 %34 
					                                 f32 %196 = OpLoad %195 
					                                 f32 %197 = OpFAdd %194 %196 
					                        Private f32* %198 = OpAccessChain %9 %34 
					                                              OpStore %198 %197 
					                        Private f32* %199 = OpAccessChain %87 %92 
					                                 f32 %200 = OpLoad %199 
					                        Private f32* %201 = OpAccessChain %9 %34 
					                                 f32 %202 = OpLoad %201 
					                                 f32 %203 = OpFAdd %200 %202 
					                        Private f32* %204 = OpAccessChain %9 %34 
					                                              OpStore %204 %203 
					                        Private f32* %206 = OpAccessChain %9 %34 
					                                 f32 %207 = OpLoad %206 
					                                bool %209 = OpFOrdLessThan %207 %208 
					                                              OpStore %205 %209 
					                                bool %212 = OpLoad %205 
					                               f32_4 %214 = OpLoad %87 
					                              bool_4 %216 = OpCompositeConstruct %212 %212 %212 %212 
					                               f32_4 %217 = OpSelect %216 %213 %214 
					                                              OpStore %211 %217 
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
					vec2 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					ivec3 u_xlati2;
					vec2 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat10_5;
					int u_xlati12;
					vec2 u_xlat14;
					float u_xlat18;
					int u_xlati18;
					bool u_xlatb18;
					vec4 TempArray0[25];
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    TempArray0[0].x = -1.0;
					    TempArray0[1].x = -1.0;
					    TempArray0[2].x = -1.0;
					    TempArray0[3].x = -1.0;
					    TempArray0[4].x = -1.0;
					    TempArray0[5].x = -1.0;
					    TempArray0[6].x = -1.0;
					    TempArray0[7].x = -1.0;
					    TempArray0[8].x = -1.0;
					    TempArray0[9].x = -1.0;
					    TempArray0[10].x = -1.0;
					    TempArray0[11].x = -1.0;
					    TempArray0[13].x = -1.0;
					    TempArray0[14].x = -1.0;
					    TempArray0[15].x = -1.0;
					    TempArray0[16].x = -1.0;
					    TempArray0[17].x = -1.0;
					    TempArray0[18].x = -1.0;
					    TempArray0[19].x = -1.0;
					    TempArray0[20].x = -1.0;
					    TempArray0[21].x = -1.0;
					    TempArray0[22].x = -1.0;
					    TempArray0[23].x = -1.0;
					    TempArray0[24].x = -1.0;
					    TempArray0[12].x = 24.0;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    u_xlati12 = 0;
					    while(true){
					        u_xlatb18 = u_xlati12>=5;
					        if(u_xlatb18){break;}
					        u_xlati2.xy = ivec2(u_xlati12) + ivec2(int(0xFFFFFFFEu), 1);
					        u_xlat3.x = float(u_xlati2.x);
					        u_xlat4 = u_xlat1;
					        u_xlati2.x = 0;
					        while(true){
					            u_xlatb18 = u_xlati2.x>=5;
					            if(u_xlatb18){break;}
					            u_xlati18 = u_xlati12 * 5 + u_xlati2.x;
					            u_xlat18 = TempArray0[u_xlati18].x;
					            u_xlati2.xz = u_xlati2.xx + ivec2(1, int(0xFFFFFFFEu));
					            u_xlat3.y = float(u_xlati2.z);
					            u_xlat14.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
					            u_xlat10_5 = texture(_MainTex, u_xlat14.xy);
					            u_xlat4 = vec4(u_xlat18) * u_xlat10_5 + u_xlat4;
					        }
					        u_xlat1 = u_xlat4;
					        u_xlati12 = u_xlati2.y;
					    }
					    u_xlat0.x = u_xlat1.y + u_xlat1.x;
					    u_xlat0.x = u_xlat1.z + u_xlat0.x;
					    u_xlatb0 = u_xlat0.x<2.39999986;
					    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat1;
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