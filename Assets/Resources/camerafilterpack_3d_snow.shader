Shader "CameraFilterPack/3D_Snow" {
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
			GpuProgramID 48393
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_3_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_3_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_0.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_0.xyz = in_TEXCOORD0.xyx;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD2 = phase0_Output0_0.zw;
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
					uniform 	vec4 _ProjectionParams;
					uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
					uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    phase0_Output0_0 = in_TEXCOORD0.xyxy;
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD2 = phase0_Output0_0.zw;
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
					uniform 	vec4 _Time;
					uniform 	vec4 _ZBufferParams;
					uniform 	float _Visualize;
					uniform 	float _TimeX;
					uniform 	float _Value2;
					uniform 	float _Value4;
					uniform 	float _Value5;
					uniform 	float Drop_Near;
					uniform 	float Drop_Far;
					uniform 	float Drop_With_Obj;
					uniform 	float _FixDistance;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(2) uniform  sampler2D Texture2;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					bool u_xlatb9;
					vec2 u_xlat10;
					float u_xlat18;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat9.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9.x = (-Drop_Near) + Drop_Far;
					    u_xlat18 = u_xlat0.x + (-Drop_Near);
					    u_xlat9.x = float(1.0) / u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * u_xlat18;
					    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
					    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
					    u_xlat9.x = u_xlat9.x * u_xlat9.x;
					    u_xlat1 = u_xlat9.xxxx * vec4(u_xlat27);
					    u_xlatb9 = _Visualize==1.0;
					    if(u_xlatb9){
					        SV_Target0 = u_xlat1;
					        return;
					    }
					    u_xlat9.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = _TimeX * _Value4;
					    u_xlat10_2 = texture(_MainTex, u_xlat9.xz);
					    u_xlat3 = vec4(Drop_Near) + vec4(0.5, 0.300000012, 0.200000003, 0.100000001);
					    u_xlat3 = u_xlat0.xxxx + (-u_xlat3);
					    u_xlat3 = u_xlat3 * vec4(100.0, 100.0, 100.0, 100.0);
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat4 = u_xlat3 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat4 = vec4(vec4(_Value5, _Value5, _Value5, _Value5)) * vec4(10.0, 8.0, 6.0, 4.0);
					    u_xlat0.x = _Time.x * 16.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat5 = u_xlat0.xxxx * vec4(0.200000003, 0.0400000028, 0.0800000057, 0.120000005);
					    u_xlat9.x = u_xlat9.x * u_xlat4.x + u_xlat5.y;
					    u_xlat6.x = u_xlat9.x + 0.100000001;
					    u_xlat7 = u_xlat1.xxxx * vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012);
					    u_xlat6.y = u_xlat9.z * u_xlat4.x + u_xlat7.x;
					    u_xlat10_6 = texture(Texture2, u_xlat6.xy);
					    u_xlat9.x = u_xlat3.x * u_xlat10_6.x;
					    u_xlat6 = vs_TEXCOORD2.xyxy + vec4(0.100000001, 0.0, 0.400000006, 0.0);
					    u_xlat10.xy = u_xlat6.xz * u_xlat4.yz + u_xlat5.zw;
					    u_xlat8.xy = u_xlat10.xy + vec2(0.100000001, 0.100000001);
					    u_xlat8.zw = u_xlat6.yw * u_xlat4.yz + u_xlat7.yz;
					    u_xlat10_6 = texture(Texture2, u_xlat8.xz);
					    u_xlat27 = u_xlat3.y * u_xlat10_6.x;
					    u_xlat27 = u_xlat27 * 0.200000003;
					    u_xlat9.x = u_xlat9.x * 0.200000003 + u_xlat27;
					    u_xlat10_6 = texture(Texture2, u_xlat8.yw);
					    u_xlat27 = u_xlat3.z * u_xlat10_6.x;
					    u_xlat9.x = u_xlat27 * 0.200000003 + u_xlat9.x;
					    u_xlat6 = vs_TEXCOORD2.xyxy + vec4(0.800000012, 0.0, 0.5, 0.0);
					    u_xlat27 = u_xlat4.w * u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * 0.160000011 + u_xlat27;
					    u_xlat3.x = u_xlat0.x + 0.100000001;
					    u_xlat3.y = u_xlat6.y * u_xlat4.w + u_xlat7.w;
					    u_xlat10_4 = texture(Texture2, u_xlat3.xy);
					    u_xlat0.x = u_xlat3.w * u_xlat10_4.x;
					    u_xlat0.x = u_xlat0.x * 0.200000003 + u_xlat9.x;
					    u_xlat9.x = u_xlat18 * 100.0;
					    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
					    u_xlat18 = u_xlat9.x * -2.0 + 3.0;
					    u_xlat9.x = u_xlat9.x * u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * u_xlat18;
					    u_xlat18 = _Value5 + _Value5;
					    u_xlat27 = u_xlat6.z * u_xlat18 + u_xlat5.x;
					    u_xlat3.x = u_xlat27 + 0.100000001;
					    u_xlat3.y = u_xlat6.w * u_xlat18 + u_xlat1.x;
					    u_xlat10_3 = texture(Texture2, u_xlat3.xy);
					    u_xlat9.x = u_xlat9.x * u_xlat10_3.x;
					    u_xlat0.x = u_xlat9.x * 0.200000003 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value2;
					    u_xlat9.x = u_xlat1.w * Drop_With_Obj;
					    SV_Target0 = u_xlat9.xxxx * u_xlat0.xxxx + u_xlat10_2;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 162
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Vertex %4 "main" %30 %58 %116 %120 %121 %137 %150 %153 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpDecorate %13 ArrayStride 13 
					                                                      OpDecorate %14 ArrayStride 14 
					                                                      OpMemberDecorate %16 0 Offset 16 
					                                                      OpMemberDecorate %16 1 Offset 16 
					                                                      OpMemberDecorate %16 2 Offset 16 
					                                                      OpMemberDecorate %16 3 Offset 16 
					                                                      OpDecorate %16 Block 
					                                                      OpDecorate %18 DescriptorSet 18 
					                                                      OpDecorate %18 Binding 18 
					                                                      OpDecorate %30 Location 30 
					                                                      OpDecorate %58 Location 58 
					                                                      OpMemberDecorate %114 0 BuiltIn 114 
					                                                      OpMemberDecorate %114 1 BuiltIn 114 
					                                                      OpMemberDecorate %114 2 BuiltIn 114 
					                                                      OpDecorate %114 Block 
					                                                      OpDecorate %120 Location 120 
					                                                      OpDecorate %121 Location 121 
					                                                      OpDecorate vs_TEXCOORD1 Location 137 
					                                                      OpDecorate vs_TEXCOORD0 Location 150 
					                                                      OpDecorate vs_TEXCOORD2 Location 153 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeBool 
					                                               %7 = OpTypePointer Private %6 
					                                 Private bool* %8 = OpVariable Private 
					                                               %9 = OpTypeFloat 32 
					                                              %10 = OpTypeVector %9 4 
					                                              %11 = OpTypeInt 32 0 
					                                          u32 %12 = OpConstant 4 
					                                              %13 = OpTypeArray %10 %12 
					                                              %14 = OpTypeArray %10 %12 
					                                              %15 = OpTypeVector %9 2 
					                                              %16 = OpTypeStruct %10 %13 %14 %15 
					                                              %17 = OpTypePointer Uniform %16 
					Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_2;}* %18 = OpVariable Uniform 
					                                              %19 = OpTypeInt 32 1 
					                                          i32 %20 = OpConstant 3 
					                                          u32 %21 = OpConstant 1 
					                                              %22 = OpTypePointer Uniform %9 
					                                          f32 %25 = OpConstant 3,674022E-40 
					                                              %27 = OpTypePointer Private %9 
					                                 Private f32* %28 = OpVariable Private 
					                                              %29 = OpTypePointer Input %15 
					                                 Input f32_2* %30 = OpVariable Input 
					                                              %31 = OpTypePointer Input %9 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                              %37 = OpTypePointer Private %10 
					                               Private f32_4* %38 = OpVariable Private 
					                                              %40 = OpTypePointer Function %9 
					                                          u32 %49 = OpConstant 3 
					                                              %51 = OpTypeVector %9 3 
					                               Private f32_4* %56 = OpVariable Private 
					                                              %57 = OpTypePointer Input %10 
					                                 Input f32_4* %58 = OpVariable Input 
					                                          i32 %61 = OpConstant 1 
					                                              %62 = OpTypePointer Uniform %10 
					                                          i32 %66 = OpConstant 0 
					                                          i32 %74 = OpConstant 2 
					                               Private f32_4* %86 = OpVariable Private 
					                                             %113 = OpTypeArray %9 %21 
					                                             %114 = OpTypeStruct %10 %9 %113 
					                                             %115 = OpTypePointer Output %114 
					        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
					                                             %118 = OpTypePointer Output %10 
					                               Output f32_4* %120 = OpVariable Output 
					                                Input f32_4* %121 = OpVariable Input 
					                                         u32 %125 = OpConstant 0 
					                                         f32 %132 = OpConstant 3,674022E-40 
					                                       f32_3 %133 = OpConstantComposite %132 %132 %132 
					                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                             %149 = OpTypePointer Output %15 
					                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                       Output f32_2* vs_TEXCOORD2 = OpVariable Output 
					                                             %156 = OpTypePointer Output %9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                Function f32* %41 = OpVariable Function 
					                                 Uniform f32* %23 = OpAccessChain %18 %20 %21 
					                                          f32 %24 = OpLoad %23 
					                                         bool %26 = OpFOrdLessThan %24 %25 
					                                                      OpStore %8 %26 
					                                   Input f32* %32 = OpAccessChain %30 %21 
					                                          f32 %33 = OpLoad %32 
					                                          f32 %34 = OpFNegate %33 
					                                          f32 %36 = OpFAdd %34 %35 
					                                                      OpStore %28 %36 
					                                         bool %39 = OpLoad %8 
					                                                      OpSelectionMerge %43 None 
					                                                      OpBranchConditional %39 %42 %45 
					                                              %42 = OpLabel 
					                                          f32 %44 = OpLoad %28 
					                                                      OpStore %41 %44 
					                                                      OpBranch %43 
					                                              %45 = OpLabel 
					                                   Input f32* %46 = OpAccessChain %30 %21 
					                                          f32 %47 = OpLoad %46 
					                                                      OpStore %41 %47 
					                                                      OpBranch %43 
					                                              %43 = OpLabel 
					                                          f32 %48 = OpLoad %41 
					                                 Private f32* %50 = OpAccessChain %38 %49 
					                                                      OpStore %50 %48 
					                                        f32_2 %52 = OpLoad %30 
					                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 0 
					                                        f32_4 %54 = OpLoad %38 
					                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
					                                                      OpStore %38 %55 
					                                        f32_4 %59 = OpLoad %58 
					                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
					                               Uniform f32_4* %63 = OpAccessChain %18 %61 %61 
					                                        f32_4 %64 = OpLoad %63 
					                                        f32_4 %65 = OpFMul %60 %64 
					                                                      OpStore %56 %65 
					                               Uniform f32_4* %67 = OpAccessChain %18 %61 %66 
					                                        f32_4 %68 = OpLoad %67 
					                                        f32_4 %69 = OpLoad %58 
					                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
					                                        f32_4 %71 = OpFMul %68 %70 
					                                        f32_4 %72 = OpLoad %56 
					                                        f32_4 %73 = OpFAdd %71 %72 
					                                                      OpStore %56 %73 
					                               Uniform f32_4* %75 = OpAccessChain %18 %61 %74 
					                                        f32_4 %76 = OpLoad %75 
					                                        f32_4 %77 = OpLoad %58 
					                                        f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
					                                        f32_4 %79 = OpFMul %76 %78 
					                                        f32_4 %80 = OpLoad %56 
					                                        f32_4 %81 = OpFAdd %79 %80 
					                                                      OpStore %56 %81 
					                                        f32_4 %82 = OpLoad %56 
					                               Uniform f32_4* %83 = OpAccessChain %18 %61 %20 
					                                        f32_4 %84 = OpLoad %83 
					                                        f32_4 %85 = OpFAdd %82 %84 
					                                                      OpStore %56 %85 
					                                        f32_4 %87 = OpLoad %56 
					                                        f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                               Uniform f32_4* %89 = OpAccessChain %18 %74 %61 
					                                        f32_4 %90 = OpLoad %89 
					                                        f32_4 %91 = OpFMul %88 %90 
					                                                      OpStore %86 %91 
					                               Uniform f32_4* %92 = OpAccessChain %18 %74 %66 
					                                        f32_4 %93 = OpLoad %92 
					                                        f32_4 %94 = OpLoad %56 
					                                        f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
					                                        f32_4 %96 = OpFMul %93 %95 
					                                        f32_4 %97 = OpLoad %86 
					                                        f32_4 %98 = OpFAdd %96 %97 
					                                                      OpStore %86 %98 
					                               Uniform f32_4* %99 = OpAccessChain %18 %74 %74 
					                                       f32_4 %100 = OpLoad %99 
					                                       f32_4 %101 = OpLoad %56 
					                                       f32_4 %102 = OpVectorShuffle %101 %101 2 2 2 2 
					                                       f32_4 %103 = OpFMul %100 %102 
					                                       f32_4 %104 = OpLoad %86 
					                                       f32_4 %105 = OpFAdd %103 %104 
					                                                      OpStore %86 %105 
					                              Uniform f32_4* %106 = OpAccessChain %18 %74 %20 
					                                       f32_4 %107 = OpLoad %106 
					                                       f32_4 %108 = OpLoad %56 
					                                       f32_4 %109 = OpVectorShuffle %108 %108 3 3 3 3 
					                                       f32_4 %110 = OpFMul %107 %109 
					                                       f32_4 %111 = OpLoad %86 
					                                       f32_4 %112 = OpFAdd %110 %111 
					                                                      OpStore %56 %112 
					                                       f32_4 %117 = OpLoad %56 
					                               Output f32_4* %119 = OpAccessChain %116 %66 
					                                                      OpStore %119 %117 
					                                       f32_4 %122 = OpLoad %121 
					                                                      OpStore %120 %122 
					                                Private f32* %123 = OpAccessChain %56 %21 
					                                         f32 %124 = OpLoad %123 
					                                Uniform f32* %126 = OpAccessChain %18 %66 %125 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %128 = OpFMul %124 %127 
					                                Private f32* %129 = OpAccessChain %56 %21 
					                                                      OpStore %129 %128 
					                                       f32_4 %130 = OpLoad %56 
					                                       f32_3 %131 = OpVectorShuffle %130 %130 0 3 1 
					                                       f32_3 %134 = OpFMul %131 %133 
					                                       f32_4 %135 = OpLoad %86 
					                                       f32_4 %136 = OpVectorShuffle %135 %134 4 1 5 6 
					                                                      OpStore %86 %136 
					                                       f32_4 %138 = OpLoad %56 
					                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
					                                       f32_4 %140 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %141 = OpVectorShuffle %140 %139 0 1 4 5 
					                                                      OpStore vs_TEXCOORD1 %141 
					                                       f32_4 %142 = OpLoad %86 
					                                       f32_2 %143 = OpVectorShuffle %142 %142 2 2 
					                                       f32_4 %144 = OpLoad %86 
					                                       f32_2 %145 = OpVectorShuffle %144 %144 0 3 
					                                       f32_2 %146 = OpFAdd %143 %145 
					                                       f32_4 %147 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 2 3 
					                                                      OpStore vs_TEXCOORD1 %148 
					                                       f32_4 %151 = OpLoad %38 
					                                       f32_2 %152 = OpVectorShuffle %151 %151 0 1 
					                                                      OpStore vs_TEXCOORD0 %152 
					                                       f32_4 %154 = OpLoad %38 
					                                       f32_2 %155 = OpVectorShuffle %154 %154 2 3 
					                                                      OpStore vs_TEXCOORD2 %155 
					                                 Output f32* %157 = OpAccessChain %116 %66 %21 
					                                         f32 %158 = OpLoad %157 
					                                         f32 %159 = OpFNegate %158 
					                                 Output f32* %160 = OpAccessChain %116 %66 %21 
					                                                      OpStore %160 %159 
					                                                      OpReturn
					                                                      OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 495
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %137 %141 %292 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
					                                                      OpDecorate vs_TEXCOORD1 Location 12 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpDecorate %24 DescriptorSet 24 
					                                                      OpDecorate %24 Binding 24 
					                                                      OpMemberDecorate %35 0 Offset 35 
					                                                      OpMemberDecorate %35 1 Offset 35 
					                                                      OpMemberDecorate %35 2 Offset 35 
					                                                      OpMemberDecorate %35 3 Offset 35 
					                                                      OpMemberDecorate %35 4 Offset 35 
					                                                      OpMemberDecorate %35 5 Offset 35 
					                                                      OpMemberDecorate %35 6 Offset 35 
					                                                      OpMemberDecorate %35 7 Offset 35 
					                                                      OpMemberDecorate %35 8 Offset 35 
					                                                      OpMemberDecorate %35 9 Offset 35 
					                                                      OpMemberDecorate %35 10 Offset 35 
					                                                      OpMemberDecorate %35 11 RelaxedPrecision 
					                                                      OpMemberDecorate %35 11 Offset 35 
					                                                      OpDecorate %35 Block 
					                                                      OpDecorate %37 DescriptorSet 37 
					                                                      OpDecorate %37 Binding 37 
					                                                      OpDecorate %137 Location 137 
					                                                      OpDecorate vs_TEXCOORD0 Location 141 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %164 DescriptorSet 164 
					                                                      OpDecorate %164 Binding 164 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %166 DescriptorSet 166 
					                                                      OpDecorate %166 Binding 166 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %277 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %278 DescriptorSet 278 
					                                                      OpDecorate %278 Binding 278 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %280 DescriptorSet 280 
					                                                      OpDecorate %280 Binding 280 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD2 Location 292 
					                                                      OpDecorate %322 RelaxedPrecision 
					                                                      OpDecorate %323 RelaxedPrecision 
					                                                      OpDecorate %324 RelaxedPrecision 
					                                                      OpDecorate %329 RelaxedPrecision 
					                                                      OpDecorate %332 RelaxedPrecision 
					                                                      OpDecorate %342 RelaxedPrecision 
					                                                      OpDecorate %343 RelaxedPrecision 
					                                                      OpDecorate %348 RelaxedPrecision 
					                                                      OpDecorate %351 RelaxedPrecision 
					                                                      OpDecorate %388 RelaxedPrecision 
					                                                      OpDecorate %389 RelaxedPrecision 
					                                                      OpDecorate %390 RelaxedPrecision 
					                                                      OpDecorate %395 RelaxedPrecision 
					                                                      OpDecorate %398 RelaxedPrecision 
					                                                      OpDecorate %453 RelaxedPrecision 
					                                                      OpDecorate %454 RelaxedPrecision 
					                                                      OpDecorate %455 RelaxedPrecision 
					                                                      OpDecorate %460 RelaxedPrecision 
					                                                      OpDecorate %463 RelaxedPrecision 
					                                                      OpDecorate %492 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 2 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_2* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 4 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %18 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %19 = OpTypePointer UniformConstant %18 
					         UniformConstant read_only Texture2D* %20 = OpVariable UniformConstant 
					                                              %22 = OpTypeSampler 
					                                              %23 = OpTypePointer UniformConstant %22 
					                     UniformConstant sampler* %24 = OpVariable UniformConstant 
					                                              %26 = OpTypeSampledImage %18 
					                                              %30 = OpTypeInt 32 0 
					                                          u32 %31 = OpConstant 0 
					                                              %33 = OpTypePointer Private %6 
					                                              %35 = OpTypeStruct %10 %10 %6 %6 %6 %6 %6 %6 %6 %6 %6 %10 
					                                              %36 = OpTypePointer Uniform %35 
					Uniform struct {f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %37 = OpVariable Uniform 
					                                              %38 = OpTypeInt 32 1 
					                                          i32 %39 = OpConstant 1 
					                                          u32 %40 = OpConstant 2 
					                                              %41 = OpTypePointer Uniform %6 
					                                          u32 %47 = OpConstant 3 
					                                          f32 %52 = OpConstant 3,674022E-40 
					                                              %57 = OpTypeVector %6 3 
					                                              %58 = OpTypePointer Private %57 
					                               Private f32_3* %59 = OpVariable Private 
					                                          i32 %60 = OpConstant 10 
					                                          f32 %63 = OpConstant 3,674022E-40 
					                                          f32 %74 = OpConstant 3,674022E-40 
					                                          i32 %77 = OpConstant 7 
					                                          i32 %81 = OpConstant 8 
					                                 Private f32* %86 = OpVariable Private 
					                                Private f32* %106 = OpVariable Private 
					                                         f32 %109 = OpConstant 3,674022E-40 
					                                         f32 %111 = OpConstant 3,674022E-40 
					                                             %119 = OpTypePointer Private %10 
					                              Private f32_4* %120 = OpVariable Private 
					                                             %126 = OpTypeBool 
					                                             %127 = OpTypePointer Private %126 
					                               Private bool* %128 = OpVariable Private 
					                                         i32 %129 = OpConstant 2 
					                                             %136 = OpTypePointer Output %10 
					                               Output f32_4* %137 = OpVariable Output 
					                                             %140 = OpTypePointer Input %7 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %143 = OpConstant 11 
					                                             %144 = OpTypePointer Uniform %10 
					                                         i32 %155 = OpConstant 3 
					                                         i32 %158 = OpConstant 5 
					                              Private f32_4* %163 = OpVariable Private 
					        UniformConstant read_only Texture2D* %164 = OpVariable UniformConstant 
					                    UniformConstant sampler* %166 = OpVariable UniformConstant 
					                              Private f32_4* %172 = OpVariable Private 
					                                         f32 %176 = OpConstant 3,674022E-40 
					                                         f32 %177 = OpConstant 3,674022E-40 
					                                         f32 %178 = OpConstant 3,674022E-40 
					                                         f32 %179 = OpConstant 3,674022E-40 
					                                       f32_4 %180 = OpConstantComposite %176 %177 %178 %179 
					                                         f32 %188 = OpConstant 3,674022E-40 
					                                       f32_4 %189 = OpConstantComposite %188 %188 %188 %188 
					                              Private f32_4* %195 = OpVariable Private 
					                                       f32_4 %197 = OpConstantComposite %109 %109 %109 %109 
					                                       f32_4 %199 = OpConstantComposite %111 %111 %111 %111 
					                                         i32 %207 = OpConstant 6 
					                                         f32 %222 = OpConstant 3,674022E-40 
					                                         f32 %223 = OpConstant 3,674022E-40 
					                                         f32 %224 = OpConstant 3,674022E-40 
					                                       f32_4 %225 = OpConstantComposite %63 %222 %223 %224 
					                                         i32 %227 = OpConstant 0 
					                                         f32 %230 = OpConstant 3,674022E-40 
					                              Private f32_4* %237 = OpVariable Private 
					                                         f32 %240 = OpConstant 3,674022E-40 
					                                         f32 %241 = OpConstant 3,674022E-40 
					                                         f32 %242 = OpConstant 3,674022E-40 
					                                       f32_4 %243 = OpConstantComposite %178 %240 %241 %242 
					                                         u32 %250 = OpConstant 1 
					                              Private f32_4* %255 = OpVariable Private 
					                              Private f32_4* %260 = OpVariable Private 
					                                         f32 %263 = OpConstant 3,674022E-40 
					                                         f32 %264 = OpConstant 3,674022E-40 
					                                         f32 %265 = OpConstant 3,674022E-40 
					                                       f32_4 %266 = OpConstantComposite %178 %263 %264 %265 
					                                Private f32* %277 = OpVariable Private 
					        UniformConstant read_only Texture2D* %278 = OpVariable UniformConstant 
					                    UniformConstant sampler* %280 = OpVariable UniformConstant 
					                        Input f32_2* vs_TEXCOORD2 = OpVariable Input 
					                                       f32_4 %295 = OpConstantComposite %179 %74 %263 %74 
					                              Private f32_2* %297 = OpVariable Private 
					                              Private f32_4* %306 = OpVariable Private 
					                                       f32_2 %308 = OpConstantComposite %179 %179 
					                                Private f32* %322 = OpVariable Private 
					                                       f32_4 %361 = OpConstantComposite %265 %74 %176 %74 
					                                         f32 %370 = OpConstant 3,674022E-40 
					                                Private f32* %388 = OpVariable Private 
					                                Private f32* %453 = OpVariable Private 
					                                         i32 %475 = OpConstant 4 
					                                         i32 %482 = OpConstant 9 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_4 %13 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                        f32_4 %15 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
					                                        f32_2 %17 = OpFDiv %14 %16 
					                                                      OpStore %9 %17 
					                          read_only Texture2D %21 = OpLoad %20 
					                                      sampler %25 = OpLoad %24 
					                   read_only Texture2DSampled %27 = OpSampledImage %21 %25 
					                                        f32_2 %28 = OpLoad %9 
					                                        f32_4 %29 = OpImageSampleImplicitLod %27 %28 
					                                          f32 %32 = OpCompositeExtract %29 0 
					                                 Private f32* %34 = OpAccessChain %9 %31 
					                                                      OpStore %34 %32 
					                                 Uniform f32* %42 = OpAccessChain %37 %39 %40 
					                                          f32 %43 = OpLoad %42 
					                                 Private f32* %44 = OpAccessChain %9 %31 
					                                          f32 %45 = OpLoad %44 
					                                          f32 %46 = OpFMul %43 %45 
					                                 Uniform f32* %48 = OpAccessChain %37 %39 %47 
					                                          f32 %49 = OpLoad %48 
					                                          f32 %50 = OpFAdd %46 %49 
					                                 Private f32* %51 = OpAccessChain %9 %31 
					                                                      OpStore %51 %50 
					                                 Private f32* %53 = OpAccessChain %9 %31 
					                                          f32 %54 = OpLoad %53 
					                                          f32 %55 = OpFDiv %52 %54 
					                                 Private f32* %56 = OpAccessChain %9 %31 
					                                                      OpStore %56 %55 
					                                 Uniform f32* %61 = OpAccessChain %37 %60 
					                                          f32 %62 = OpLoad %61 
					                                          f32 %64 = OpFMul %62 %63 
					                                 Private f32* %65 = OpAccessChain %59 %31 
					                                                      OpStore %65 %64 
					                                 Private f32* %66 = OpAccessChain %9 %31 
					                                          f32 %67 = OpLoad %66 
					                                 Private f32* %68 = OpAccessChain %59 %31 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFDiv %67 %69 
					                                 Private f32* %71 = OpAccessChain %9 %31 
					                                                      OpStore %71 %70 
					                                 Private f32* %72 = OpAccessChain %9 %31 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %75 = OpExtInst %1 43 %73 %74 %52 
					                                 Private f32* %76 = OpAccessChain %9 %31 
					                                                      OpStore %76 %75 
					                                 Uniform f32* %78 = OpAccessChain %37 %77 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFNegate %79 
					                                 Uniform f32* %82 = OpAccessChain %37 %81 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %84 = OpFAdd %80 %83 
					                                 Private f32* %85 = OpAccessChain %59 %31 
					                                                      OpStore %85 %84 
					                                 Private f32* %87 = OpAccessChain %9 %31 
					                                          f32 %88 = OpLoad %87 
					                                 Uniform f32* %89 = OpAccessChain %37 %77 
					                                          f32 %90 = OpLoad %89 
					                                          f32 %91 = OpFNegate %90 
					                                          f32 %92 = OpFAdd %88 %91 
					                                                      OpStore %86 %92 
					                                 Private f32* %93 = OpAccessChain %59 %31 
					                                          f32 %94 = OpLoad %93 
					                                          f32 %95 = OpFDiv %52 %94 
					                                 Private f32* %96 = OpAccessChain %59 %31 
					                                                      OpStore %96 %95 
					                                 Private f32* %97 = OpAccessChain %59 %31 
					                                          f32 %98 = OpLoad %97 
					                                          f32 %99 = OpLoad %86 
					                                         f32 %100 = OpFMul %98 %99 
					                                Private f32* %101 = OpAccessChain %59 %31 
					                                                      OpStore %101 %100 
					                                Private f32* %102 = OpAccessChain %59 %31 
					                                         f32 %103 = OpLoad %102 
					                                         f32 %104 = OpExtInst %1 43 %103 %74 %52 
					                                Private f32* %105 = OpAccessChain %59 %31 
					                                                      OpStore %105 %104 
					                                Private f32* %107 = OpAccessChain %59 %31 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %110 = OpFMul %108 %109 
					                                         f32 %112 = OpFAdd %110 %111 
					                                                      OpStore %106 %112 
					                                Private f32* %113 = OpAccessChain %59 %31 
					                                         f32 %114 = OpLoad %113 
					                                Private f32* %115 = OpAccessChain %59 %31 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %117 = OpFMul %114 %116 
					                                Private f32* %118 = OpAccessChain %59 %31 
					                                                      OpStore %118 %117 
					                                       f32_3 %121 = OpLoad %59 
					                                       f32_4 %122 = OpVectorShuffle %121 %121 0 0 0 0 
					                                         f32 %123 = OpLoad %106 
					                                       f32_4 %124 = OpCompositeConstruct %123 %123 %123 %123 
					                                       f32_4 %125 = OpFMul %122 %124 
					                                                      OpStore %120 %125 
					                                Uniform f32* %130 = OpAccessChain %37 %129 
					                                         f32 %131 = OpLoad %130 
					                                        bool %132 = OpFOrdEqual %131 %52 
					                                                      OpStore %128 %132 
					                                        bool %133 = OpLoad %128 
					                                                      OpSelectionMerge %135 None 
					                                                      OpBranchConditional %133 %134 %135 
					                                             %134 = OpLabel 
					                                       f32_4 %138 = OpLoad %120 
					                                                      OpStore %137 %138 
					                                                      OpReturn
					                                             %135 = OpLabel 
					                                       f32_2 %142 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %145 = OpAccessChain %37 %143 
					                                       f32_4 %146 = OpLoad %145 
					                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
					                                       f32_2 %148 = OpFMul %142 %147 
					                              Uniform f32_4* %149 = OpAccessChain %37 %143 
					                                       f32_4 %150 = OpLoad %149 
					                                       f32_2 %151 = OpVectorShuffle %150 %150 2 3 
					                                       f32_2 %152 = OpFAdd %148 %151 
					                                       f32_3 %153 = OpLoad %59 
					                                       f32_3 %154 = OpVectorShuffle %153 %152 3 1 4 
					                                                      OpStore %59 %154 
					                                Uniform f32* %156 = OpAccessChain %37 %155 
					                                         f32 %157 = OpLoad %156 
					                                Uniform f32* %159 = OpAccessChain %37 %158 
					                                         f32 %160 = OpLoad %159 
					                                         f32 %161 = OpFMul %157 %160 
					                                Private f32* %162 = OpAccessChain %120 %31 
					                                                      OpStore %162 %161 
					                         read_only Texture2D %165 = OpLoad %164 
					                                     sampler %167 = OpLoad %166 
					                  read_only Texture2DSampled %168 = OpSampledImage %165 %167 
					                                       f32_3 %169 = OpLoad %59 
					                                       f32_2 %170 = OpVectorShuffle %169 %169 0 2 
					                                       f32_4 %171 = OpImageSampleImplicitLod %168 %170 
					                                                      OpStore %163 %171 
					                                Uniform f32* %173 = OpAccessChain %37 %77 
					                                         f32 %174 = OpLoad %173 
					                                       f32_4 %175 = OpCompositeConstruct %174 %174 %174 %174 
					                                       f32_4 %181 = OpFAdd %175 %180 
					                                                      OpStore %172 %181 
					                                       f32_2 %182 = OpLoad %9 
					                                       f32_4 %183 = OpVectorShuffle %182 %182 0 0 0 0 
					                                       f32_4 %184 = OpLoad %172 
					                                       f32_4 %185 = OpFNegate %184 
					                                       f32_4 %186 = OpFAdd %183 %185 
					                                                      OpStore %172 %186 
					                                       f32_4 %187 = OpLoad %172 
					                                       f32_4 %190 = OpFMul %187 %189 
					                                                      OpStore %172 %190 
					                                       f32_4 %191 = OpLoad %172 
					                                       f32_4 %192 = OpCompositeConstruct %74 %74 %74 %74 
					                                       f32_4 %193 = OpCompositeConstruct %52 %52 %52 %52 
					                                       f32_4 %194 = OpExtInst %1 43 %191 %192 %193 
					                                                      OpStore %172 %194 
					                                       f32_4 %196 = OpLoad %172 
					                                       f32_4 %198 = OpFMul %196 %197 
					                                       f32_4 %200 = OpFAdd %198 %199 
					                                                      OpStore %195 %200 
					                                       f32_4 %201 = OpLoad %172 
					                                       f32_4 %202 = OpLoad %172 
					                                       f32_4 %203 = OpFMul %201 %202 
					                                                      OpStore %172 %203 
					                                       f32_4 %204 = OpLoad %172 
					                                       f32_4 %205 = OpLoad %195 
					                                       f32_4 %206 = OpFMul %204 %205 
					                                                      OpStore %172 %206 
					                                Uniform f32* %208 = OpAccessChain %37 %207 
					                                         f32 %209 = OpLoad %208 
					                                Uniform f32* %210 = OpAccessChain %37 %207 
					                                         f32 %211 = OpLoad %210 
					                                Uniform f32* %212 = OpAccessChain %37 %207 
					                                         f32 %213 = OpLoad %212 
					                                Uniform f32* %214 = OpAccessChain %37 %207 
					                                         f32 %215 = OpLoad %214 
					                                       f32_4 %216 = OpCompositeConstruct %209 %211 %213 %215 
					                                         f32 %217 = OpCompositeExtract %216 0 
					                                         f32 %218 = OpCompositeExtract %216 1 
					                                         f32 %219 = OpCompositeExtract %216 2 
					                                         f32 %220 = OpCompositeExtract %216 3 
					                                       f32_4 %221 = OpCompositeConstruct %217 %218 %219 %220 
					                                       f32_4 %226 = OpFMul %221 %225 
					                                                      OpStore %195 %226 
					                                Uniform f32* %228 = OpAccessChain %37 %227 %31 
					                                         f32 %229 = OpLoad %228 
					                                         f32 %231 = OpFMul %229 %230 
					                                Private f32* %232 = OpAccessChain %9 %31 
					                                                      OpStore %232 %231 
					                                Private f32* %233 = OpAccessChain %9 %31 
					                                         f32 %234 = OpLoad %233 
					                                         f32 %235 = OpExtInst %1 13 %234 
					                                Private f32* %236 = OpAccessChain %9 %31 
					                                                      OpStore %236 %235 
					                                       f32_2 %238 = OpLoad %9 
					                                       f32_4 %239 = OpVectorShuffle %238 %238 0 0 0 0 
					                                       f32_4 %244 = OpFMul %239 %243 
					                                                      OpStore %237 %244 
					                                Private f32* %245 = OpAccessChain %59 %31 
					                                         f32 %246 = OpLoad %245 
					                                Private f32* %247 = OpAccessChain %195 %31 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFMul %246 %248 
					                                Private f32* %251 = OpAccessChain %237 %250 
					                                         f32 %252 = OpLoad %251 
					                                         f32 %253 = OpFAdd %249 %252 
					                                Private f32* %254 = OpAccessChain %59 %31 
					                                                      OpStore %254 %253 
					                                Private f32* %256 = OpAccessChain %59 %31 
					                                         f32 %257 = OpLoad %256 
					                                         f32 %258 = OpFAdd %257 %179 
					                                Private f32* %259 = OpAccessChain %255 %31 
					                                                      OpStore %259 %258 
					                                       f32_4 %261 = OpLoad %120 
					                                       f32_4 %262 = OpVectorShuffle %261 %261 0 0 0 0 
					                                       f32_4 %267 = OpFMul %262 %266 
					                                                      OpStore %260 %267 
					                                Private f32* %268 = OpAccessChain %59 %40 
					                                         f32 %269 = OpLoad %268 
					                                Private f32* %270 = OpAccessChain %195 %31 
					                                         f32 %271 = OpLoad %270 
					                                         f32 %272 = OpFMul %269 %271 
					                                Private f32* %273 = OpAccessChain %260 %31 
					                                         f32 %274 = OpLoad %273 
					                                         f32 %275 = OpFAdd %272 %274 
					                                Private f32* %276 = OpAccessChain %255 %250 
					                                                      OpStore %276 %275 
					                         read_only Texture2D %279 = OpLoad %278 
					                                     sampler %281 = OpLoad %280 
					                  read_only Texture2DSampled %282 = OpSampledImage %279 %281 
					                                       f32_4 %283 = OpLoad %255 
					                                       f32_2 %284 = OpVectorShuffle %283 %283 0 1 
					                                       f32_4 %285 = OpImageSampleImplicitLod %282 %284 
					                                         f32 %286 = OpCompositeExtract %285 0 
					                                                      OpStore %277 %286 
					                                Private f32* %287 = OpAccessChain %172 %31 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %289 = OpLoad %277 
					                                         f32 %290 = OpFMul %288 %289 
					                                Private f32* %291 = OpAccessChain %59 %31 
					                                                      OpStore %291 %290 
					                                       f32_2 %293 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %294 = OpVectorShuffle %293 %293 0 1 0 1 
					                                       f32_4 %296 = OpFAdd %294 %295 
					                                                      OpStore %255 %296 
					                                       f32_4 %298 = OpLoad %255 
					                                       f32_2 %299 = OpVectorShuffle %298 %298 0 2 
					                                       f32_4 %300 = OpLoad %195 
					                                       f32_2 %301 = OpVectorShuffle %300 %300 1 2 
					                                       f32_2 %302 = OpFMul %299 %301 
					                                       f32_4 %303 = OpLoad %237 
					                                       f32_2 %304 = OpVectorShuffle %303 %303 2 3 
					                                       f32_2 %305 = OpFAdd %302 %304 
					                                                      OpStore %297 %305 
					                                       f32_2 %307 = OpLoad %297 
					                                       f32_2 %309 = OpFAdd %307 %308 
					                                       f32_4 %310 = OpLoad %306 
					                                       f32_4 %311 = OpVectorShuffle %310 %309 4 5 2 3 
					                                                      OpStore %306 %311 
					                                       f32_4 %312 = OpLoad %255 
					                                       f32_2 %313 = OpVectorShuffle %312 %312 1 3 
					                                       f32_4 %314 = OpLoad %195 
					                                       f32_2 %315 = OpVectorShuffle %314 %314 1 2 
					                                       f32_2 %316 = OpFMul %313 %315 
					                                       f32_4 %317 = OpLoad %260 
					                                       f32_2 %318 = OpVectorShuffle %317 %317 1 2 
					                                       f32_2 %319 = OpFAdd %316 %318 
					                                       f32_4 %320 = OpLoad %306 
					                                       f32_4 %321 = OpVectorShuffle %320 %319 0 1 4 5 
					                                                      OpStore %306 %321 
					                         read_only Texture2D %323 = OpLoad %278 
					                                     sampler %324 = OpLoad %280 
					                  read_only Texture2DSampled %325 = OpSampledImage %323 %324 
					                                       f32_4 %326 = OpLoad %306 
					                                       f32_2 %327 = OpVectorShuffle %326 %326 0 2 
					                                       f32_4 %328 = OpImageSampleImplicitLod %325 %327 
					                                         f32 %329 = OpCompositeExtract %328 0 
					                                                      OpStore %322 %329 
					                                Private f32* %330 = OpAccessChain %172 %250 
					                                         f32 %331 = OpLoad %330 
					                                         f32 %332 = OpLoad %322 
					                                         f32 %333 = OpFMul %331 %332 
					                                                      OpStore %106 %333 
					                                         f32 %334 = OpLoad %106 
					                                         f32 %335 = OpFMul %334 %178 
					                                                      OpStore %106 %335 
					                                Private f32* %336 = OpAccessChain %59 %31 
					                                         f32 %337 = OpLoad %336 
					                                         f32 %338 = OpFMul %337 %178 
					                                         f32 %339 = OpLoad %106 
					                                         f32 %340 = OpFAdd %338 %339 
					                                Private f32* %341 = OpAccessChain %59 %31 
					                                                      OpStore %341 %340 
					                         read_only Texture2D %342 = OpLoad %278 
					                                     sampler %343 = OpLoad %280 
					                  read_only Texture2DSampled %344 = OpSampledImage %342 %343 
					                                       f32_4 %345 = OpLoad %306 
					                                       f32_2 %346 = OpVectorShuffle %345 %345 1 3 
					                                       f32_4 %347 = OpImageSampleImplicitLod %344 %346 
					                                         f32 %348 = OpCompositeExtract %347 0 
					                                                      OpStore %322 %348 
					                                Private f32* %349 = OpAccessChain %172 %40 
					                                         f32 %350 = OpLoad %349 
					                                         f32 %351 = OpLoad %322 
					                                         f32 %352 = OpFMul %350 %351 
					                                                      OpStore %106 %352 
					                                         f32 %353 = OpLoad %106 
					                                         f32 %354 = OpFMul %353 %178 
					                                Private f32* %355 = OpAccessChain %59 %31 
					                                         f32 %356 = OpLoad %355 
					                                         f32 %357 = OpFAdd %354 %356 
					                                Private f32* %358 = OpAccessChain %59 %31 
					                                                      OpStore %358 %357 
					                                       f32_2 %359 = OpLoad vs_TEXCOORD2 
					                                       f32_4 %360 = OpVectorShuffle %359 %359 0 1 0 1 
					                                       f32_4 %362 = OpFAdd %360 %361 
					                                                      OpStore %255 %362 
					                                Private f32* %363 = OpAccessChain %195 %47 
					                                         f32 %364 = OpLoad %363 
					                                Private f32* %365 = OpAccessChain %255 %31 
					                                         f32 %366 = OpLoad %365 
					                                         f32 %367 = OpFMul %364 %366 
					                                                      OpStore %106 %367 
					                                Private f32* %368 = OpAccessChain %9 %31 
					                                         f32 %369 = OpLoad %368 
					                                         f32 %371 = OpFMul %369 %370 
					                                         f32 %372 = OpLoad %106 
					                                         f32 %373 = OpFAdd %371 %372 
					                                Private f32* %374 = OpAccessChain %9 %31 
					                                                      OpStore %374 %373 
					                                Private f32* %375 = OpAccessChain %9 %31 
					                                         f32 %376 = OpLoad %375 
					                                         f32 %377 = OpFAdd %376 %179 
					                                Private f32* %378 = OpAccessChain %172 %31 
					                                                      OpStore %378 %377 
					                                Private f32* %379 = OpAccessChain %255 %250 
					                                         f32 %380 = OpLoad %379 
					                                Private f32* %381 = OpAccessChain %195 %47 
					                                         f32 %382 = OpLoad %381 
					                                         f32 %383 = OpFMul %380 %382 
					                                Private f32* %384 = OpAccessChain %260 %47 
					                                         f32 %385 = OpLoad %384 
					                                         f32 %386 = OpFAdd %383 %385 
					                                Private f32* %387 = OpAccessChain %172 %250 
					                                                      OpStore %387 %386 
					                         read_only Texture2D %389 = OpLoad %278 
					                                     sampler %390 = OpLoad %280 
					                  read_only Texture2DSampled %391 = OpSampledImage %389 %390 
					                                       f32_4 %392 = OpLoad %172 
					                                       f32_2 %393 = OpVectorShuffle %392 %392 0 1 
					                                       f32_4 %394 = OpImageSampleImplicitLod %391 %393 
					                                         f32 %395 = OpCompositeExtract %394 0 
					                                                      OpStore %388 %395 
					                                Private f32* %396 = OpAccessChain %172 %47 
					                                         f32 %397 = OpLoad %396 
					                                         f32 %398 = OpLoad %388 
					                                         f32 %399 = OpFMul %397 %398 
					                                Private f32* %400 = OpAccessChain %9 %31 
					                                                      OpStore %400 %399 
					                                Private f32* %401 = OpAccessChain %9 %31 
					                                         f32 %402 = OpLoad %401 
					                                         f32 %403 = OpFMul %402 %178 
					                                Private f32* %404 = OpAccessChain %59 %31 
					                                         f32 %405 = OpLoad %404 
					                                         f32 %406 = OpFAdd %403 %405 
					                                Private f32* %407 = OpAccessChain %9 %31 
					                                                      OpStore %407 %406 
					                                         f32 %408 = OpLoad %86 
					                                         f32 %409 = OpFMul %408 %188 
					                                Private f32* %410 = OpAccessChain %59 %31 
					                                                      OpStore %410 %409 
					                                Private f32* %411 = OpAccessChain %59 %31 
					                                         f32 %412 = OpLoad %411 
					                                         f32 %413 = OpExtInst %1 43 %412 %74 %52 
					                                Private f32* %414 = OpAccessChain %59 %31 
					                                                      OpStore %414 %413 
					                                Private f32* %415 = OpAccessChain %59 %31 
					                                         f32 %416 = OpLoad %415 
					                                         f32 %417 = OpFMul %416 %109 
					                                         f32 %418 = OpFAdd %417 %111 
					                                                      OpStore %86 %418 
					                                Private f32* %419 = OpAccessChain %59 %31 
					                                         f32 %420 = OpLoad %419 
					                                Private f32* %421 = OpAccessChain %59 %31 
					                                         f32 %422 = OpLoad %421 
					                                         f32 %423 = OpFMul %420 %422 
					                                Private f32* %424 = OpAccessChain %59 %31 
					                                                      OpStore %424 %423 
					                                Private f32* %425 = OpAccessChain %59 %31 
					                                         f32 %426 = OpLoad %425 
					                                         f32 %427 = OpLoad %86 
					                                         f32 %428 = OpFMul %426 %427 
					                                Private f32* %429 = OpAccessChain %59 %31 
					                                                      OpStore %429 %428 
					                                Uniform f32* %430 = OpAccessChain %37 %207 
					                                         f32 %431 = OpLoad %430 
					                                Uniform f32* %432 = OpAccessChain %37 %207 
					                                         f32 %433 = OpLoad %432 
					                                         f32 %434 = OpFAdd %431 %433 
					                                                      OpStore %86 %434 
					                                Private f32* %435 = OpAccessChain %255 %40 
					                                         f32 %436 = OpLoad %435 
					                                         f32 %437 = OpLoad %86 
					                                         f32 %438 = OpFMul %436 %437 
					                                Private f32* %439 = OpAccessChain %237 %31 
					                                         f32 %440 = OpLoad %439 
					                                         f32 %441 = OpFAdd %438 %440 
					                                                      OpStore %106 %441 
					                                         f32 %442 = OpLoad %106 
					                                         f32 %443 = OpFAdd %442 %179 
					                                Private f32* %444 = OpAccessChain %172 %31 
					                                                      OpStore %444 %443 
					                                Private f32* %445 = OpAccessChain %255 %47 
					                                         f32 %446 = OpLoad %445 
					                                         f32 %447 = OpLoad %86 
					                                         f32 %448 = OpFMul %446 %447 
					                                Private f32* %449 = OpAccessChain %120 %31 
					                                         f32 %450 = OpLoad %449 
					                                         f32 %451 = OpFAdd %448 %450 
					                                Private f32* %452 = OpAccessChain %172 %250 
					                                                      OpStore %452 %451 
					                         read_only Texture2D %454 = OpLoad %278 
					                                     sampler %455 = OpLoad %280 
					                  read_only Texture2DSampled %456 = OpSampledImage %454 %455 
					                                       f32_4 %457 = OpLoad %172 
					                                       f32_2 %458 = OpVectorShuffle %457 %457 0 1 
					                                       f32_4 %459 = OpImageSampleImplicitLod %456 %458 
					                                         f32 %460 = OpCompositeExtract %459 0 
					                                                      OpStore %453 %460 
					                                Private f32* %461 = OpAccessChain %59 %31 
					                                         f32 %462 = OpLoad %461 
					                                         f32 %463 = OpLoad %453 
					                                         f32 %464 = OpFMul %462 %463 
					                                Private f32* %465 = OpAccessChain %59 %31 
					                                                      OpStore %465 %464 
					                                Private f32* %466 = OpAccessChain %59 %31 
					                                         f32 %467 = OpLoad %466 
					                                         f32 %468 = OpFMul %467 %178 
					                                Private f32* %469 = OpAccessChain %9 %31 
					                                         f32 %470 = OpLoad %469 
					                                         f32 %471 = OpFAdd %468 %470 
					                                Private f32* %472 = OpAccessChain %9 %31 
					                                                      OpStore %472 %471 
					                                Private f32* %473 = OpAccessChain %9 %31 
					                                         f32 %474 = OpLoad %473 
					                                Uniform f32* %476 = OpAccessChain %37 %475 
					                                         f32 %477 = OpLoad %476 
					                                         f32 %478 = OpFMul %474 %477 
					                                Private f32* %479 = OpAccessChain %9 %31 
					                                                      OpStore %479 %478 
					                                Private f32* %480 = OpAccessChain %120 %47 
					                                         f32 %481 = OpLoad %480 
					                                Uniform f32* %483 = OpAccessChain %37 %482 
					                                         f32 %484 = OpLoad %483 
					                                         f32 %485 = OpFMul %481 %484 
					                                Private f32* %486 = OpAccessChain %59 %31 
					                                                      OpStore %486 %485 
					                                       f32_3 %487 = OpLoad %59 
					                                       f32_4 %488 = OpVectorShuffle %487 %487 0 0 0 0 
					                                       f32_2 %489 = OpLoad %9 
					                                       f32_4 %490 = OpVectorShuffle %489 %489 0 0 0 0 
					                                       f32_4 %491 = OpFMul %488 %490 
					                                       f32_4 %492 = OpLoad %163 
					                                       f32_4 %493 = OpFAdd %491 %492 
					                                                      OpStore %137 %493 
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
						float _Visualize;
						float _TimeX;
						float _Value2;
						float _Value4;
						float _Value5;
						float Drop_Near;
						float Drop_Far;
						float Drop_With_Obj;
						float _FixDistance;
						vec4 unused_0_10[2];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[6];
						vec4 _ZBufferParams;
						vec4 unused_1_3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D Texture2;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat10_3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat10_6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					bool u_xlatb9;
					vec2 u_xlat10;
					float u_xlat18;
					float u_xlat27;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat9.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat9.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat9.x = (-Drop_Near) + Drop_Far;
					    u_xlat18 = u_xlat0.x + (-Drop_Near);
					    u_xlat9.x = float(1.0) / u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * u_xlat18;
					    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
					    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
					    u_xlat9.x = u_xlat9.x * u_xlat9.x;
					    u_xlat1 = u_xlat9.xxxx * vec4(u_xlat27);
					    u_xlatb9 = _Visualize==1.0;
					    if(u_xlatb9){
					        SV_Target0 = u_xlat1;
					        return;
					    //ENDIF
					    }
					    u_xlat9.xz = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.x = _TimeX * _Value4;
					    u_xlat10_2 = texture(_MainTex, u_xlat9.xz);
					    u_xlat3 = vec4(Drop_Near) + vec4(0.5, 0.300000012, 0.200000003, 0.100000001);
					    u_xlat3 = u_xlat0.xxxx + (-u_xlat3);
					    u_xlat3 = u_xlat3 * vec4(100.0, 100.0, 100.0, 100.0);
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat4 = u_xlat3 * vec4(-2.0, -2.0, -2.0, -2.0) + vec4(3.0, 3.0, 3.0, 3.0);
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat4 = vec4(vec4(_Value5, _Value5, _Value5, _Value5)) * vec4(10.0, 8.0, 6.0, 4.0);
					    u_xlat0.x = _Time.x * 16.0;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat5 = u_xlat0.xxxx * vec4(0.200000003, 0.0400000028, 0.0800000057, 0.120000005);
					    u_xlat9.x = u_xlat9.x * u_xlat4.x + u_xlat5.y;
					    u_xlat6.x = u_xlat9.x + 0.100000001;
					    u_xlat7 = u_xlat1.xxxx * vec4(0.200000003, 0.400000006, 0.600000024, 0.800000012);
					    u_xlat6.y = u_xlat9.z * u_xlat4.x + u_xlat7.x;
					    u_xlat10_6 = texture(Texture2, u_xlat6.xy);
					    u_xlat9.x = u_xlat3.x * u_xlat10_6.x;
					    u_xlat6 = vs_TEXCOORD2.xyxy + vec4(0.100000001, 0.0, 0.400000006, 0.0);
					    u_xlat10.xy = u_xlat6.xz * u_xlat4.yz + u_xlat5.zw;
					    u_xlat8.xy = u_xlat10.xy + vec2(0.100000001, 0.100000001);
					    u_xlat8.zw = u_xlat6.yw * u_xlat4.yz + u_xlat7.yz;
					    u_xlat10_6 = texture(Texture2, u_xlat8.xz);
					    u_xlat27 = u_xlat3.y * u_xlat10_6.x;
					    u_xlat27 = u_xlat27 * 0.200000003;
					    u_xlat9.x = u_xlat9.x * 0.200000003 + u_xlat27;
					    u_xlat10_6 = texture(Texture2, u_xlat8.yw);
					    u_xlat27 = u_xlat3.z * u_xlat10_6.x;
					    u_xlat9.x = u_xlat27 * 0.200000003 + u_xlat9.x;
					    u_xlat6 = vs_TEXCOORD2.xyxy + vec4(0.800000012, 0.0, 0.5, 0.0);
					    u_xlat27 = u_xlat4.w * u_xlat6.x;
					    u_xlat0.x = u_xlat0.x * 0.160000011 + u_xlat27;
					    u_xlat3.x = u_xlat0.x + 0.100000001;
					    u_xlat3.y = u_xlat6.y * u_xlat4.w + u_xlat7.w;
					    u_xlat10_4 = texture(Texture2, u_xlat3.xy);
					    u_xlat0.x = u_xlat3.w * u_xlat10_4.x;
					    u_xlat0.x = u_xlat0.x * 0.200000003 + u_xlat9.x;
					    u_xlat9.x = u_xlat18 * 100.0;
					    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
					    u_xlat18 = u_xlat9.x * -2.0 + 3.0;
					    u_xlat9.x = u_xlat9.x * u_xlat9.x;
					    u_xlat9.x = u_xlat9.x * u_xlat18;
					    u_xlat18 = _Value5 + _Value5;
					    u_xlat27 = u_xlat6.z * u_xlat18 + u_xlat5.x;
					    u_xlat3.x = u_xlat27 + 0.100000001;
					    u_xlat3.y = u_xlat6.w * u_xlat18 + u_xlat1.x;
					    u_xlat10_3 = texture(Texture2, u_xlat3.xy);
					    u_xlat9.x = u_xlat9.x * u_xlat10_3.x;
					    u_xlat0.x = u_xlat9.x * 0.200000003 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x * _Value2;
					    u_xlat9.x = u_xlat1.w * Drop_With_Obj;
					    SV_Target0 = u_xlat9.xxxx * u_xlat0.xxxx + u_xlat10_2;
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