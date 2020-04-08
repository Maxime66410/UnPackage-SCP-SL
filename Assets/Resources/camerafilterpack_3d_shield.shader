Shader "CameraFilterPack/3D_Shield" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(0, 1)) = 1
		_ScreenResolution ("_ScreenResolution", Vector) = (0,0,0,0)
		_ColorRGB ("_ColorRGB", Vector) = (1,1,1,1)
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 64564
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[5];
						vec4 _ProjectionParams;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec4 in_COLOR0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
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
					    u_xlat0 = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
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
					    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat0;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
					uniform 	vec4 _ZBufferParams;
					uniform 	float _Visualize;
					uniform 	float _TimeX;
					uniform 	float _Near;
					uniform 	float _Far;
					uniform 	float _FixDistance;
					uniform 	float _LightIntensity;
					uniform 	float _FadeShield;
					uniform 	float _Value;
					uniform 	float _Value2;
					uniform 	float _Value3;
					uniform 	float _Value4;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec2 u_xlat3;
					bool u_xlatb3;
					float u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					vec2 u_xlat14;
					float u_xlat15;
					int u_xlati15;
					float u_xlat20;
					int u_xlati20;
					float u_xlat21;
					bool u_xlatb21;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat6.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat6.x;
					    u_xlat6.x = _Far + _Near;
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					    u_xlat6.x = u_xlat6.x + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat6.x = float(1.0) / u_xlat6.x;
					    u_xlat0.x = u_xlat6.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0 = u_xlat0.xxxx * u_xlat6.xxxx;
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat12 = _TimeX * 1.29999995;
					    u_xlat2.xy = vec2(u_xlat12) * vec2(_Value2, _Value3);
					    u_xlat14.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.x = float(u_xlati_loop_1);
					        u_xlat3.x = u_xlat3.x * 0.897597909;
					        u_xlat4 = cos(u_xlat3.x);
					        u_xlat3.x = sin(u_xlat3.x);
					        u_xlat9 = u_xlat12 * u_xlat4;
					        u_xlat9 = u_xlat9 * _Value + u_xlat2.x;
					        u_xlat9 = u_xlat0.x + u_xlat9;
					        u_xlat15 = u_xlat12 * u_xlat3.x;
					        u_xlat15 = u_xlat15 * _Value + (-u_xlat2.y);
					        u_xlat15 = u_xlat0.y + (-u_xlat15);
					        u_xlat3.x = u_xlat3.x * u_xlat15;
					        u_xlat3.x = u_xlat9 * u_xlat4 + (-u_xlat3.x);
					        u_xlat3.x = u_xlat3.x * 6.0;
					        u_xlat3.x = cos(u_xlat3.x);
					        u_xlat14.x = u_xlat3.x * _Value4 + u_xlat14.x;
					    }
					    u_xlat3.xy = u_xlat0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat14.y = 0.0;
					    for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat21 = float(u_xlati_loop_2);
					        u_xlat21 = u_xlat21 * 0.897597909;
					        u_xlat4 = sin(u_xlat21);
					        u_xlat5 = cos(u_xlat21);
					        u_xlat21 = u_xlat12 * u_xlat5;
					        u_xlat21 = u_xlat21 * _Value + u_xlat2.x;
					        u_xlat21 = u_xlat21 + u_xlat3.x;
					        u_xlat10 = u_xlat12 * u_xlat4;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat2.y);
					        u_xlat10 = u_xlat0.y + (-u_xlat10);
					        u_xlat4 = u_xlat4 * u_xlat10;
					        u_xlat21 = u_xlat21 * u_xlat5 + (-u_xlat4);
					        u_xlat21 = u_xlat21 * 6.0;
					        u_xlat21 = cos(u_xlat21);
					        u_xlat14.y = u_xlat21 * _Value4 + u_xlat14.y;
					    }
					    u_xlat14.xy = cos(u_xlat14.xy);
					    u_xlat20 = (-u_xlat14.y) + u_xlat14.x;
					    u_xlat3.x = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat21 = float(u_xlati_loop_3);
					        u_xlat21 = u_xlat21 * 0.897597909;
					        u_xlat4 = sin(u_xlat21);
					        u_xlat5 = cos(u_xlat21);
					        u_xlat21 = u_xlat12 * u_xlat5;
					        u_xlat21 = u_xlat21 * _Value + u_xlat2.x;
					        u_xlat21 = u_xlat0.x + u_xlat21;
					        u_xlat10 = u_xlat12 * u_xlat4;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat2.y);
					        u_xlat10 = u_xlat3.y + (-u_xlat10);
					        u_xlat4 = u_xlat4 * u_xlat10;
					        u_xlat21 = u_xlat21 * u_xlat5 + (-u_xlat4);
					        u_xlat21 = u_xlat21 * 6.0;
					        u_xlat21 = cos(u_xlat21);
					        u_xlat3.x = u_xlat21 * _Value4 + u_xlat3.x;
					    }
					    u_xlat12 = cos(u_xlat3.x);
					    u_xlat12 = (-u_xlat12) + u_xlat14.x;
					    u_xlat2.x = u_xlat20 * 0.00833333377;
					    u_xlat3.x = u_xlat20 * 0.0166666675 + u_xlat0.x;
					    u_xlat0.x = u_xlat12 * 0.00833333377;
					    u_xlat3.y = u_xlat12 * 0.0166666675 + u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = u_xlat0.x * 700.0 + 1.0;
					    u_xlat6.x = u_xlat20 * 0.00833333377 + -0.0120000001;
					    u_xlat6.y = u_xlat12 * 0.00833333377 + -0.0120000001;
					    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyxx).xy;
					    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
					    u_xlat6.x = u_xlat6.y * u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 200000.0;
					    u_xlat12 = log2(u_xlat0.x);
					    u_xlat6.x = u_xlat12 * u_xlat6.x;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat0.x = (u_xlatb2.x) ? u_xlat6.x : u_xlat0.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat2 = u_xlat0.xxxx * u_xlat10_2;
					    u_xlat2 = u_xlat2 * vec4(_LightIntensity) + (-u_xlat10_1);
					    u_xlat2 = u_xlat2 * vec4(vec4(_FadeShield, _FadeShield, _FadeShield, _FadeShield));
					    SV_Target0 = u_xlat0.wwww * u_xlat2 + u_xlat10_1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 127
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %9 %11 %17 %85 %89 %90 %109 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate vs_TEXCOORD0 Location 9 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %17 Location 17 
					                                                     OpDecorate %22 ArrayStride 22 
					                                                     OpDecorate %23 ArrayStride 23 
					                                                     OpMemberDecorate %24 0 Offset 24 
					                                                     OpMemberDecorate %24 1 Offset 24 
					                                                     OpMemberDecorate %24 2 Offset 24 
					                                                     OpDecorate %24 Block 
					                                                     OpDecorate %26 DescriptorSet 26 
					                                                     OpDecorate %26 Binding 26 
					                                                     OpMemberDecorate %83 0 BuiltIn 83 
					                                                     OpMemberDecorate %83 1 BuiltIn 83 
					                                                     OpMemberDecorate %83 2 BuiltIn 83 
					                                                     OpDecorate %83 Block 
					                                                     OpDecorate %89 Location 89 
					                                                     OpDecorate %90 Location 90 
					                                                     OpDecorate vs_TEXCOORD1 Location 109 
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
					                                             %24 = OpTypeStruct %13 %22 %23 
					                                             %25 = OpTypePointer Uniform %24 
					Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
					                                             %27 = OpTypeInt 32 1 
					                                         i32 %28 = OpConstant 1 
					                                             %29 = OpTypePointer Uniform %13 
					                                         i32 %33 = OpConstant 0 
					                                         i32 %41 = OpConstant 2 
					                                         i32 %50 = OpConstant 3 
					                              Private f32_4* %54 = OpVariable Private 
					                                         u32 %81 = OpConstant 1 
					                                             %82 = OpTypeArray %6 %81 
					                                             %83 = OpTypeStruct %13 %6 %82 
					                                             %84 = OpTypePointer Output %83 
					        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
					                                             %87 = OpTypePointer Output %13 
					                               Output f32_4* %89 = OpVariable Output 
					                                Input f32_4* %90 = OpVariable Input 
					                                             %92 = OpTypePointer Private %6 
					                                         u32 %95 = OpConstant 0 
					                                             %96 = OpTypePointer Uniform %6 
					                                            %101 = OpTypeVector %6 3 
					                                        f32 %104 = OpConstant 3,674022E-40 
					                                      f32_3 %105 = OpConstantComposite %104 %104 %104 
					                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
					                                            %121 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                                       f32_2 %12 = OpLoad %11 
					                                                     OpStore vs_TEXCOORD0 %12 
					                                       f32_4 %18 = OpLoad %17 
					                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
					                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
					                                       f32_4 %31 = OpLoad %30 
					                                       f32_4 %32 = OpFMul %19 %31 
					                                                     OpStore %15 %32 
					                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
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
					                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
					                                       f32_4 %58 = OpLoad %57 
					                                       f32_4 %59 = OpFMul %56 %58 
					                                                     OpStore %54 %59 
					                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
					                                       f32_4 %61 = OpLoad %60 
					                                       f32_4 %62 = OpLoad %15 
					                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
					                                       f32_4 %64 = OpFMul %61 %63 
					                                       f32_4 %65 = OpLoad %54 
					                                       f32_4 %66 = OpFAdd %64 %65 
					                                                     OpStore %54 %66 
					                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
					                                       f32_4 %68 = OpLoad %67 
					                                       f32_4 %69 = OpLoad %15 
					                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
					                                       f32_4 %71 = OpFMul %68 %70 
					                                       f32_4 %72 = OpLoad %54 
					                                       f32_4 %73 = OpFAdd %71 %72 
					                                                     OpStore %54 %73 
					                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
					                                       f32_4 %75 = OpLoad %74 
					                                       f32_4 %76 = OpLoad %15 
					                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
					                                       f32_4 %78 = OpFMul %75 %77 
					                                       f32_4 %79 = OpLoad %54 
					                                       f32_4 %80 = OpFAdd %78 %79 
					                                                     OpStore %15 %80 
					                                       f32_4 %86 = OpLoad %15 
					                               Output f32_4* %88 = OpAccessChain %85 %33 
					                                                     OpStore %88 %86 
					                                       f32_4 %91 = OpLoad %90 
					                                                     OpStore %89 %91 
					                                Private f32* %93 = OpAccessChain %15 %81 
					                                         f32 %94 = OpLoad %93 
					                                Uniform f32* %97 = OpAccessChain %26 %33 %95 
					                                         f32 %98 = OpLoad %97 
					                                         f32 %99 = OpFMul %94 %98 
					                               Private f32* %100 = OpAccessChain %15 %81 
					                                                     OpStore %100 %99 
					                                      f32_4 %102 = OpLoad %15 
					                                      f32_3 %103 = OpVectorShuffle %102 %102 0 3 1 
					                                      f32_3 %106 = OpFMul %103 %105 
					                                      f32_4 %107 = OpLoad %54 
					                                      f32_4 %108 = OpVectorShuffle %107 %106 4 1 5 6 
					                                                     OpStore %54 %108 
					                                      f32_4 %110 = OpLoad %15 
					                                      f32_2 %111 = OpVectorShuffle %110 %110 2 3 
					                                      f32_4 %112 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %113 = OpVectorShuffle %112 %111 0 1 4 5 
					                                                     OpStore vs_TEXCOORD1 %113 
					                                      f32_4 %114 = OpLoad %54 
					                                      f32_2 %115 = OpVectorShuffle %114 %114 2 2 
					                                      f32_4 %116 = OpLoad %54 
					                                      f32_2 %117 = OpVectorShuffle %116 %116 0 3 
					                                      f32_2 %118 = OpFAdd %115 %117 
					                                      f32_4 %119 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
					                                                     OpStore vs_TEXCOORD1 %120 
					                                Output f32* %122 = OpAccessChain %85 %33 %81 
					                                        f32 %123 = OpLoad %122 
					                                        f32 %124 = OpFNegate %123 
					                                Output f32* %125 = OpAccessChain %85 %33 %81 
					                                                     OpStore %125 %124 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 592
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %144 %148 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD1 Location 11 
					                                                      OpDecorate %22 DescriptorSet 22 
					                                                      OpDecorate %22 Binding 22 
					                                                      OpDecorate %26 DescriptorSet 26 
					                                                      OpDecorate %26 Binding 26 
					                                                      OpMemberDecorate %38 0 Offset 38 
					                                                      OpMemberDecorate %38 1 Offset 38 
					                                                      OpMemberDecorate %38 2 Offset 38 
					                                                      OpMemberDecorate %38 3 Offset 38 
					                                                      OpMemberDecorate %38 4 Offset 38 
					                                                      OpMemberDecorate %38 5 Offset 38 
					                                                      OpMemberDecorate %38 6 Offset 38 
					                                                      OpMemberDecorate %38 7 Offset 38 
					                                                      OpMemberDecorate %38 8 Offset 38 
					                                                      OpMemberDecorate %38 9 Offset 38 
					                                                      OpMemberDecorate %38 10 Offset 38 
					                                                      OpMemberDecorate %38 11 Offset 38 
					                                                      OpMemberDecorate %38 12 RelaxedPrecision 
					                                                      OpMemberDecorate %38 12 Offset 38 
					                                                      OpDecorate %38 Block 
					                                                      OpDecorate %40 DescriptorSet 40 
					                                                      OpDecorate %40 Binding 40 
					                                                      OpDecorate %144 Location 144 
					                                                      OpDecorate vs_TEXCOORD0 Location 148 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %154 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %162 RelaxedPrecision 
					                                                      OpDecorate %163 RelaxedPrecision 
					                                                      OpDecorate %163 DescriptorSet 163 
					                                                      OpDecorate %163 Binding 163 
					                                                      OpDecorate %164 RelaxedPrecision 
					                                                      OpDecorate %165 RelaxedPrecision 
					                                                      OpDecorate %165 DescriptorSet 165 
					                                                      OpDecorate %165 Binding 165 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %544 RelaxedPrecision 
					                                                      OpDecorate %545 RelaxedPrecision 
					                                                      OpDecorate %546 RelaxedPrecision 
					                                                      OpDecorate %552 RelaxedPrecision 
					                                                      OpDecorate %560 RelaxedPrecision 
					                                                      OpDecorate %561 RelaxedPrecision 
					                                                      OpDecorate %584 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypePointer Input %7 
					                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
					                                              %12 = OpTypeVector %6 2 
					                                              %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %21 = OpTypePointer UniformConstant %20 
					         UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
					                                              %24 = OpTypeSampler 
					                                              %25 = OpTypePointer UniformConstant %24 
					                     UniformConstant sampler* %26 = OpVariable UniformConstant 
					                                              %28 = OpTypeSampledImage %20 
					                                              %33 = OpTypeInt 32 0 
					                                          u32 %34 = OpConstant 0 
					                                              %36 = OpTypePointer Private %6 
					                                              %38 = OpTypeStruct %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %7 
					                                              %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32_4;}* %40 = OpVariable Uniform 
					                                              %41 = OpTypeInt 32 1 
					                                          i32 %42 = OpConstant 0 
					                                          u32 %43 = OpConstant 2 
					                                              %44 = OpTypePointer Uniform %6 
					                                          u32 %50 = OpConstant 3 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                              %60 = OpTypePointer Private %12 
					                               Private f32_2* %61 = OpVariable Private 
					                                          i32 %62 = OpConstant 5 
					                                          f32 %65 = OpConstant 3,674022E-40 
					                                          i32 %74 = OpConstant 4 
					                                          i32 %77 = OpConstant 3 
					                                          f32 %84 = OpConstant 3,674022E-40 
					                                         f32 %117 = OpConstant 3,674022E-40 
					                                         f32 %119 = OpConstant 3,674022E-40 
					                                             %133 = OpTypeBool 
					                                             %134 = OpTypePointer Private %133 
					                               Private bool* %135 = OpVariable Private 
					                                         i32 %136 = OpConstant 1 
					                                             %143 = OpTypePointer Output %7 
					                               Output f32_4* %144 = OpVariable Output 
					                                             %147 = OpTypePointer Input %12 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                         i32 %150 = OpConstant 12 
					                                             %151 = OpTypePointer Uniform %7 
					                              Private f32_4* %162 = OpVariable Private 
					        UniformConstant read_only Texture2D* %163 = OpVariable UniformConstant 
					                    UniformConstant sampler* %165 = OpVariable UniformConstant 
					                                Private f32* %171 = OpVariable Private 
					                                         i32 %172 = OpConstant 2 
					                                         f32 %175 = OpConstant 3,674022E-40 
					                              Private f32_4* %177 = OpVariable Private 
					                                         i32 %180 = OpConstant 9 
					                                         i32 %183 = OpConstant 10 
					                              Private f32_2* %190 = OpVariable Private 
					                                             %192 = OpTypePointer Function %41 
					                                         i32 %200 = OpConstant 8 
					                              Private f32_2* %202 = OpVariable Private 
					                                         f32 %208 = OpConstant 3,674022E-40 
					                                Private f32* %211 = OpVariable Private 
					                                Private f32* %219 = OpVariable Private 
					                                Private f32* %234 = OpVariable Private 
					                                         u32 %243 = OpConstant 1 
					                                         f32 %268 = OpConstant 3,674022E-40 
					                                         i32 %277 = OpConstant 11 
					                                         f32 %289 = OpConstant 3,674022E-40 
					                                       f32_2 %290 = OpConstantComposite %289 %289 
					                                Private f32* %301 = OpVariable Private 
					                                Private f32* %308 = OpVariable Private 
					                                Private f32* %325 = OpVariable Private 
					                                Private f32* %367 = OpVariable Private 
					                                         f32 %453 = OpConstant 3,674022E-40 
					                                         f32 %457 = OpConstant 3,674022E-40 
					                                         f32 %480 = OpConstant 3,674022E-40 
					                                         f32 %486 = OpConstant 3,674022E-40 
					                                             %493 = OpTypeVector %133 2 
					                                             %494 = OpTypePointer Private %493 
					                             Private bool_2* %495 = OpVariable Private 
					                                       f32_4 %496 = OpConstantComposite %84 %84 %84 %84 
					                                             %499 = OpTypeVector %133 4 
					                                         f32 %516 = OpConstant 3,674022E-40 
					                                             %533 = OpTypePointer Function %6 
					                              Private f32_4* %544 = OpVariable Private 
					                                         i32 %555 = OpConstant 6 
					                                         i32 %564 = OpConstant 7 
					                               Private bool* %587 = OpVariable Private 
					                                             %588 = OpTypePointer Private %41 
					                                Private i32* %589 = OpVariable Private 
					                                Private i32* %590 = OpVariable Private 
					                               Private bool* %591 = OpVariable Private 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function i32* %193 = OpVariable Function 
					                               Function i32* %293 = OpVariable Function 
					                               Function i32* %375 = OpVariable Function 
					                               Function f32* %534 = OpVariable Function 
					                                        f32_4 %13 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
					                                        f32_4 %15 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %16 = OpVectorShuffle %15 %15 3 3 
					                                        f32_2 %17 = OpFDiv %14 %16 
					                                        f32_4 %18 = OpLoad %9 
					                                        f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
					                                                      OpStore %9 %19 
					                          read_only Texture2D %23 = OpLoad %22 
					                                      sampler %27 = OpLoad %26 
					                   read_only Texture2DSampled %29 = OpSampledImage %23 %27 
					                                        f32_4 %30 = OpLoad %9 
					                                        f32_2 %31 = OpVectorShuffle %30 %30 0 1 
					                                        f32_4 %32 = OpImageSampleImplicitLod %29 %31 
					                                          f32 %35 = OpCompositeExtract %32 0 
					                                 Private f32* %37 = OpAccessChain %9 %34 
					                                                      OpStore %37 %35 
					                                 Uniform f32* %45 = OpAccessChain %40 %42 %43 
					                                          f32 %46 = OpLoad %45 
					                                 Private f32* %47 = OpAccessChain %9 %34 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFMul %46 %48 
					                                 Uniform f32* %51 = OpAccessChain %40 %42 %50 
					                                          f32 %52 = OpLoad %51 
					                                          f32 %53 = OpFAdd %49 %52 
					                                 Private f32* %54 = OpAccessChain %9 %34 
					                                                      OpStore %54 %53 
					                                 Private f32* %56 = OpAccessChain %9 %34 
					                                          f32 %57 = OpLoad %56 
					                                          f32 %58 = OpFDiv %55 %57 
					                                 Private f32* %59 = OpAccessChain %9 %34 
					                                                      OpStore %59 %58 
					                                 Uniform f32* %63 = OpAccessChain %40 %62 
					                                          f32 %64 = OpLoad %63 
					                                          f32 %66 = OpFMul %64 %65 
					                                 Private f32* %67 = OpAccessChain %61 %34 
					                                                      OpStore %67 %66 
					                                 Private f32* %68 = OpAccessChain %9 %34 
					                                          f32 %69 = OpLoad %68 
					                                 Private f32* %70 = OpAccessChain %61 %34 
					                                          f32 %71 = OpLoad %70 
					                                          f32 %72 = OpFDiv %69 %71 
					                                 Private f32* %73 = OpAccessChain %9 %34 
					                                                      OpStore %73 %72 
					                                 Uniform f32* %75 = OpAccessChain %40 %74 
					                                          f32 %76 = OpLoad %75 
					                                 Uniform f32* %78 = OpAccessChain %40 %77 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFAdd %76 %79 
					                                 Private f32* %81 = OpAccessChain %61 %34 
					                                                      OpStore %81 %80 
					                                 Private f32* %82 = OpAccessChain %61 %34 
					                                          f32 %83 = OpLoad %82 
					                                          f32 %85 = OpExtInst %1 43 %83 %84 %55 
					                                 Private f32* %86 = OpAccessChain %61 %34 
					                                                      OpStore %86 %85 
					                                 Private f32* %87 = OpAccessChain %61 %34 
					                                          f32 %88 = OpLoad %87 
					                                 Uniform f32* %89 = OpAccessChain %40 %77 
					                                          f32 %90 = OpLoad %89 
					                                          f32 %91 = OpFNegate %90 
					                                          f32 %92 = OpFAdd %88 %91 
					                                 Private f32* %93 = OpAccessChain %61 %34 
					                                                      OpStore %93 %92 
					                                 Private f32* %94 = OpAccessChain %9 %34 
					                                          f32 %95 = OpLoad %94 
					                                 Uniform f32* %96 = OpAccessChain %40 %77 
					                                          f32 %97 = OpLoad %96 
					                                          f32 %98 = OpFNegate %97 
					                                          f32 %99 = OpFAdd %95 %98 
					                                Private f32* %100 = OpAccessChain %9 %34 
					                                                      OpStore %100 %99 
					                                Private f32* %101 = OpAccessChain %61 %34 
					                                         f32 %102 = OpLoad %101 
					                                         f32 %103 = OpFDiv %55 %102 
					                                Private f32* %104 = OpAccessChain %61 %34 
					                                                      OpStore %104 %103 
					                                Private f32* %105 = OpAccessChain %61 %34 
					                                         f32 %106 = OpLoad %105 
					                                Private f32* %107 = OpAccessChain %9 %34 
					                                         f32 %108 = OpLoad %107 
					                                         f32 %109 = OpFMul %106 %108 
					                                Private f32* %110 = OpAccessChain %9 %34 
					                                                      OpStore %110 %109 
					                                Private f32* %111 = OpAccessChain %9 %34 
					                                         f32 %112 = OpLoad %111 
					                                         f32 %113 = OpExtInst %1 43 %112 %84 %55 
					                                Private f32* %114 = OpAccessChain %9 %34 
					                                                      OpStore %114 %113 
					                                Private f32* %115 = OpAccessChain %9 %34 
					                                         f32 %116 = OpLoad %115 
					                                         f32 %118 = OpFMul %116 %117 
					                                         f32 %120 = OpFAdd %118 %119 
					                                Private f32* %121 = OpAccessChain %61 %34 
					                                                      OpStore %121 %120 
					                                Private f32* %122 = OpAccessChain %9 %34 
					                                         f32 %123 = OpLoad %122 
					                                Private f32* %124 = OpAccessChain %9 %34 
					                                         f32 %125 = OpLoad %124 
					                                         f32 %126 = OpFMul %123 %125 
					                                Private f32* %127 = OpAccessChain %9 %34 
					                                                      OpStore %127 %126 
					                                       f32_4 %128 = OpLoad %9 
					                                       f32_4 %129 = OpVectorShuffle %128 %128 0 0 0 0 
					                                       f32_2 %130 = OpLoad %61 
					                                       f32_4 %131 = OpVectorShuffle %130 %130 0 0 0 0 
					                                       f32_4 %132 = OpFMul %129 %131 
					                                                      OpStore %9 %132 
					                                Uniform f32* %137 = OpAccessChain %40 %136 
					                                         f32 %138 = OpLoad %137 
					                                        bool %139 = OpFOrdEqual %138 %55 
					                                                      OpStore %135 %139 
					                                        bool %140 = OpLoad %135 
					                                                      OpSelectionMerge %142 None 
					                                                      OpBranchConditional %140 %141 %142 
					                                             %141 = OpLabel 
					                                       f32_4 %145 = OpLoad %9 
					                                                      OpStore %144 %145 
					                                                      OpReturn
					                                             %142 = OpLabel 
					                                       f32_2 %149 = OpLoad vs_TEXCOORD0 
					                              Uniform f32_4* %152 = OpAccessChain %40 %150 
					                                       f32_4 %153 = OpLoad %152 
					                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
					                                       f32_2 %155 = OpFMul %149 %154 
					                              Uniform f32_4* %156 = OpAccessChain %40 %150 
					                                       f32_4 %157 = OpLoad %156 
					                                       f32_2 %158 = OpVectorShuffle %157 %157 2 3 
					                                       f32_2 %159 = OpFAdd %155 %158 
					                                       f32_4 %160 = OpLoad %9 
					                                       f32_4 %161 = OpVectorShuffle %160 %159 4 5 2 3 
					                                                      OpStore %9 %161 
					                         read_only Texture2D %164 = OpLoad %163 
					                                     sampler %166 = OpLoad %165 
					                  read_only Texture2DSampled %167 = OpSampledImage %164 %166 
					                                       f32_4 %168 = OpLoad %9 
					                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
					                                       f32_4 %170 = OpImageSampleImplicitLod %167 %169 
					                                                      OpStore %162 %170 
					                                Uniform f32* %173 = OpAccessChain %40 %172 
					                                         f32 %174 = OpLoad %173 
					                                         f32 %176 = OpFMul %174 %175 
					                                                      OpStore %171 %176 
					                                         f32 %178 = OpLoad %171 
					                                       f32_2 %179 = OpCompositeConstruct %178 %178 
					                                Uniform f32* %181 = OpAccessChain %40 %180 
					                                         f32 %182 = OpLoad %181 
					                                Uniform f32* %184 = OpAccessChain %40 %183 
					                                         f32 %185 = OpLoad %184 
					                                       f32_2 %186 = OpCompositeConstruct %182 %185 
					                                       f32_2 %187 = OpFMul %179 %186 
					                                       f32_4 %188 = OpLoad %177 
					                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 2 3 
					                                                      OpStore %177 %189 
					                                Private f32* %191 = OpAccessChain %190 %34 
					                                                      OpStore %191 %84 
					                                                      OpStore %193 %42 
					                                                      OpBranch %194 
					                                             %194 = OpLabel 
					                                                      OpLoopMerge %196 %197 None 
					                                                      OpBranch %198 
					                                             %198 = OpLabel 
					                                         i32 %199 = OpLoad %193 
					                                        bool %201 = OpSLessThan %199 %200 
					                                                      OpBranchConditional %201 %195 %196 
					                                             %195 = OpLabel 
					                                         i32 %203 = OpLoad %193 
					                                         f32 %204 = OpConvertSToF %203 
					                                Private f32* %205 = OpAccessChain %202 %34 
					                                                      OpStore %205 %204 
					                                Private f32* %206 = OpAccessChain %202 %34 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %209 = OpFMul %207 %208 
					                                Private f32* %210 = OpAccessChain %202 %34 
					                                                      OpStore %210 %209 
					                                Private f32* %212 = OpAccessChain %202 %34 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %214 = OpExtInst %1 14 %213 
					                                                      OpStore %211 %214 
					                                Private f32* %215 = OpAccessChain %202 %34 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpExtInst %1 13 %216 
					                                Private f32* %218 = OpAccessChain %202 %34 
					                                                      OpStore %218 %217 
					                                         f32 %220 = OpLoad %171 
					                                         f32 %221 = OpLoad %211 
					                                         f32 %222 = OpFMul %220 %221 
					                                                      OpStore %219 %222 
					                                         f32 %223 = OpLoad %219 
					                                Uniform f32* %224 = OpAccessChain %40 %200 
					                                         f32 %225 = OpLoad %224 
					                                         f32 %226 = OpFMul %223 %225 
					                                Private f32* %227 = OpAccessChain %177 %34 
					                                         f32 %228 = OpLoad %227 
					                                         f32 %229 = OpFAdd %226 %228 
					                                                      OpStore %219 %229 
					                                Private f32* %230 = OpAccessChain %9 %34 
					                                         f32 %231 = OpLoad %230 
					                                         f32 %232 = OpLoad %219 
					                                         f32 %233 = OpFAdd %231 %232 
					                                                      OpStore %219 %233 
					                                         f32 %235 = OpLoad %171 
					                                Private f32* %236 = OpAccessChain %202 %34 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFMul %235 %237 
					                                                      OpStore %234 %238 
					                                         f32 %239 = OpLoad %234 
					                                Uniform f32* %240 = OpAccessChain %40 %200 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFMul %239 %241 
					                                Private f32* %244 = OpAccessChain %177 %243 
					                                         f32 %245 = OpLoad %244 
					                                         f32 %246 = OpFNegate %245 
					                                         f32 %247 = OpFAdd %242 %246 
					                                                      OpStore %234 %247 
					                                Private f32* %248 = OpAccessChain %9 %243 
					                                         f32 %249 = OpLoad %248 
					                                         f32 %250 = OpLoad %234 
					                                         f32 %251 = OpFNegate %250 
					                                         f32 %252 = OpFAdd %249 %251 
					                                                      OpStore %234 %252 
					                                Private f32* %253 = OpAccessChain %202 %34 
					                                         f32 %254 = OpLoad %253 
					                                         f32 %255 = OpLoad %234 
					                                         f32 %256 = OpFMul %254 %255 
					                                Private f32* %257 = OpAccessChain %202 %34 
					                                                      OpStore %257 %256 
					                                         f32 %258 = OpLoad %219 
					                                         f32 %259 = OpLoad %211 
					                                         f32 %260 = OpFMul %258 %259 
					                                Private f32* %261 = OpAccessChain %202 %34 
					                                         f32 %262 = OpLoad %261 
					                                         f32 %263 = OpFNegate %262 
					                                         f32 %264 = OpFAdd %260 %263 
					                                Private f32* %265 = OpAccessChain %202 %34 
					                                                      OpStore %265 %264 
					                                Private f32* %266 = OpAccessChain %202 %34 
					                                         f32 %267 = OpLoad %266 
					                                         f32 %269 = OpFMul %267 %268 
					                                Private f32* %270 = OpAccessChain %202 %34 
					                                                      OpStore %270 %269 
					                                Private f32* %271 = OpAccessChain %202 %34 
					                                         f32 %272 = OpLoad %271 
					                                         f32 %273 = OpExtInst %1 14 %272 
					                                Private f32* %274 = OpAccessChain %202 %34 
					                                                      OpStore %274 %273 
					                                Private f32* %275 = OpAccessChain %202 %34 
					                                         f32 %276 = OpLoad %275 
					                                Uniform f32* %278 = OpAccessChain %40 %277 
					                                         f32 %279 = OpLoad %278 
					                                         f32 %280 = OpFMul %276 %279 
					                                Private f32* %281 = OpAccessChain %190 %34 
					                                         f32 %282 = OpLoad %281 
					                                         f32 %283 = OpFAdd %280 %282 
					                                Private f32* %284 = OpAccessChain %190 %34 
					                                                      OpStore %284 %283 
					                                                      OpBranch %197 
					                                             %197 = OpLabel 
					                                         i32 %285 = OpLoad %193 
					                                         i32 %286 = OpIAdd %285 %136 
					                                                      OpStore %193 %286 
					                                                      OpBranch %194 
					                                             %196 = OpLabel 
					                                       f32_4 %287 = OpLoad %9 
					                                       f32_2 %288 = OpVectorShuffle %287 %287 0 1 
					                                       f32_2 %291 = OpFAdd %288 %290 
					                                                      OpStore %202 %291 
					                                Private f32* %292 = OpAccessChain %190 %243 
					                                                      OpStore %292 %84 
					                                                      OpStore %293 %42 
					                                                      OpBranch %294 
					                                             %294 = OpLabel 
					                                                      OpLoopMerge %296 %297 None 
					                                                      OpBranch %298 
					                                             %298 = OpLabel 
					                                         i32 %299 = OpLoad %293 
					                                        bool %300 = OpSLessThan %299 %200 
					                                                      OpBranchConditional %300 %295 %296 
					                                             %295 = OpLabel 
					                                         i32 %302 = OpLoad %293 
					                                         f32 %303 = OpConvertSToF %302 
					                                                      OpStore %301 %303 
					                                         f32 %304 = OpLoad %301 
					                                         f32 %305 = OpFMul %304 %208 
					                                                      OpStore %301 %305 
					                                         f32 %306 = OpLoad %301 
					                                         f32 %307 = OpExtInst %1 13 %306 
					                                                      OpStore %211 %307 
					                                         f32 %309 = OpLoad %301 
					                                         f32 %310 = OpExtInst %1 14 %309 
					                                                      OpStore %308 %310 
					                                         f32 %311 = OpLoad %171 
					                                         f32 %312 = OpLoad %308 
					                                         f32 %313 = OpFMul %311 %312 
					                                                      OpStore %301 %313 
					                                         f32 %314 = OpLoad %301 
					                                Uniform f32* %315 = OpAccessChain %40 %200 
					                                         f32 %316 = OpLoad %315 
					                                         f32 %317 = OpFMul %314 %316 
					                                Private f32* %318 = OpAccessChain %177 %34 
					                                         f32 %319 = OpLoad %318 
					                                         f32 %320 = OpFAdd %317 %319 
					                                                      OpStore %301 %320 
					                                         f32 %321 = OpLoad %301 
					                                Private f32* %322 = OpAccessChain %202 %34 
					                                         f32 %323 = OpLoad %322 
					                                         f32 %324 = OpFAdd %321 %323 
					                                                      OpStore %301 %324 
					                                         f32 %326 = OpLoad %171 
					                                         f32 %327 = OpLoad %211 
					                                         f32 %328 = OpFMul %326 %327 
					                                                      OpStore %325 %328 
					                                         f32 %329 = OpLoad %325 
					                                Uniform f32* %330 = OpAccessChain %40 %200 
					                                         f32 %331 = OpLoad %330 
					                                         f32 %332 = OpFMul %329 %331 
					                                Private f32* %333 = OpAccessChain %177 %243 
					                                         f32 %334 = OpLoad %333 
					                                         f32 %335 = OpFNegate %334 
					                                         f32 %336 = OpFAdd %332 %335 
					                                                      OpStore %325 %336 
					                                Private f32* %337 = OpAccessChain %9 %243 
					                                         f32 %338 = OpLoad %337 
					                                         f32 %339 = OpLoad %325 
					                                         f32 %340 = OpFNegate %339 
					                                         f32 %341 = OpFAdd %338 %340 
					                                                      OpStore %325 %341 
					                                         f32 %342 = OpLoad %211 
					                                         f32 %343 = OpLoad %325 
					                                         f32 %344 = OpFMul %342 %343 
					                                                      OpStore %211 %344 
					                                         f32 %345 = OpLoad %301 
					                                         f32 %346 = OpLoad %308 
					                                         f32 %347 = OpFMul %345 %346 
					                                         f32 %348 = OpLoad %211 
					                                         f32 %349 = OpFNegate %348 
					                                         f32 %350 = OpFAdd %347 %349 
					                                                      OpStore %301 %350 
					                                         f32 %351 = OpLoad %301 
					                                         f32 %352 = OpFMul %351 %268 
					                                                      OpStore %301 %352 
					                                         f32 %353 = OpLoad %301 
					                                         f32 %354 = OpExtInst %1 14 %353 
					                                                      OpStore %301 %354 
					                                         f32 %355 = OpLoad %301 
					                                Uniform f32* %356 = OpAccessChain %40 %277 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFMul %355 %357 
					                                Private f32* %359 = OpAccessChain %190 %243 
					                                         f32 %360 = OpLoad %359 
					                                         f32 %361 = OpFAdd %358 %360 
					                                Private f32* %362 = OpAccessChain %190 %243 
					                                                      OpStore %362 %361 
					                                                      OpBranch %297 
					                                             %297 = OpLabel 
					                                         i32 %363 = OpLoad %293 
					                                         i32 %364 = OpIAdd %363 %136 
					                                                      OpStore %293 %364 
					                                                      OpBranch %294 
					                                             %296 = OpLabel 
					                                       f32_2 %365 = OpLoad %190 
					                                       f32_2 %366 = OpExtInst %1 14 %365 
					                                                      OpStore %190 %366 
					                                Private f32* %368 = OpAccessChain %190 %243 
					                                         f32 %369 = OpLoad %368 
					                                         f32 %370 = OpFNegate %369 
					                                Private f32* %371 = OpAccessChain %190 %34 
					                                         f32 %372 = OpLoad %371 
					                                         f32 %373 = OpFAdd %370 %372 
					                                                      OpStore %367 %373 
					                                Private f32* %374 = OpAccessChain %202 %34 
					                                                      OpStore %374 %84 
					                                                      OpStore %375 %42 
					                                                      OpBranch %376 
					                                             %376 = OpLabel 
					                                                      OpLoopMerge %378 %379 None 
					                                                      OpBranch %380 
					                                             %380 = OpLabel 
					                                         i32 %381 = OpLoad %375 
					                                        bool %382 = OpSLessThan %381 %200 
					                                                      OpBranchConditional %382 %377 %378 
					                                             %377 = OpLabel 
					                                         i32 %383 = OpLoad %375 
					                                         f32 %384 = OpConvertSToF %383 
					                                                      OpStore %301 %384 
					                                         f32 %385 = OpLoad %301 
					                                         f32 %386 = OpFMul %385 %208 
					                                                      OpStore %301 %386 
					                                         f32 %387 = OpLoad %301 
					                                         f32 %388 = OpExtInst %1 13 %387 
					                                                      OpStore %211 %388 
					                                         f32 %389 = OpLoad %301 
					                                         f32 %390 = OpExtInst %1 14 %389 
					                                                      OpStore %308 %390 
					                                         f32 %391 = OpLoad %171 
					                                         f32 %392 = OpLoad %308 
					                                         f32 %393 = OpFMul %391 %392 
					                                                      OpStore %301 %393 
					                                         f32 %394 = OpLoad %301 
					                                Uniform f32* %395 = OpAccessChain %40 %200 
					                                         f32 %396 = OpLoad %395 
					                                         f32 %397 = OpFMul %394 %396 
					                                Private f32* %398 = OpAccessChain %177 %34 
					                                         f32 %399 = OpLoad %398 
					                                         f32 %400 = OpFAdd %397 %399 
					                                                      OpStore %301 %400 
					                                Private f32* %401 = OpAccessChain %9 %34 
					                                         f32 %402 = OpLoad %401 
					                                         f32 %403 = OpLoad %301 
					                                         f32 %404 = OpFAdd %402 %403 
					                                                      OpStore %301 %404 
					                                         f32 %405 = OpLoad %171 
					                                         f32 %406 = OpLoad %211 
					                                         f32 %407 = OpFMul %405 %406 
					                                                      OpStore %325 %407 
					                                         f32 %408 = OpLoad %325 
					                                Uniform f32* %409 = OpAccessChain %40 %200 
					                                         f32 %410 = OpLoad %409 
					                                         f32 %411 = OpFMul %408 %410 
					                                Private f32* %412 = OpAccessChain %177 %243 
					                                         f32 %413 = OpLoad %412 
					                                         f32 %414 = OpFNegate %413 
					                                         f32 %415 = OpFAdd %411 %414 
					                                                      OpStore %325 %415 
					                                Private f32* %416 = OpAccessChain %202 %243 
					                                         f32 %417 = OpLoad %416 
					                                         f32 %418 = OpLoad %325 
					                                         f32 %419 = OpFNegate %418 
					                                         f32 %420 = OpFAdd %417 %419 
					                                                      OpStore %325 %420 
					                                         f32 %421 = OpLoad %211 
					                                         f32 %422 = OpLoad %325 
					                                         f32 %423 = OpFMul %421 %422 
					                                                      OpStore %211 %423 
					                                         f32 %424 = OpLoad %301 
					                                         f32 %425 = OpLoad %308 
					                                         f32 %426 = OpFMul %424 %425 
					                                         f32 %427 = OpLoad %211 
					                                         f32 %428 = OpFNegate %427 
					                                         f32 %429 = OpFAdd %426 %428 
					                                                      OpStore %301 %429 
					                                         f32 %430 = OpLoad %301 
					                                         f32 %431 = OpFMul %430 %268 
					                                                      OpStore %301 %431 
					                                         f32 %432 = OpLoad %301 
					                                         f32 %433 = OpExtInst %1 14 %432 
					                                                      OpStore %301 %433 
					                                         f32 %434 = OpLoad %301 
					                                Uniform f32* %435 = OpAccessChain %40 %277 
					                                         f32 %436 = OpLoad %435 
					                                         f32 %437 = OpFMul %434 %436 
					                                Private f32* %438 = OpAccessChain %202 %34 
					                                         f32 %439 = OpLoad %438 
					                                         f32 %440 = OpFAdd %437 %439 
					                                Private f32* %441 = OpAccessChain %202 %34 
					                                                      OpStore %441 %440 
					                                                      OpBranch %379 
					                                             %379 = OpLabel 
					                                         i32 %442 = OpLoad %375 
					                                         i32 %443 = OpIAdd %442 %136 
					                                                      OpStore %375 %443 
					                                                      OpBranch %376 
					                                             %378 = OpLabel 
					                                Private f32* %444 = OpAccessChain %202 %34 
					                                         f32 %445 = OpLoad %444 
					                                         f32 %446 = OpExtInst %1 14 %445 
					                                                      OpStore %171 %446 
					                                         f32 %447 = OpLoad %171 
					                                         f32 %448 = OpFNegate %447 
					                                Private f32* %449 = OpAccessChain %190 %34 
					                                         f32 %450 = OpLoad %449 
					                                         f32 %451 = OpFAdd %448 %450 
					                                                      OpStore %171 %451 
					                                         f32 %452 = OpLoad %367 
					                                         f32 %454 = OpFMul %452 %453 
					                                Private f32* %455 = OpAccessChain %177 %34 
					                                                      OpStore %455 %454 
					                                         f32 %456 = OpLoad %367 
					                                         f32 %458 = OpFMul %456 %457 
					                                Private f32* %459 = OpAccessChain %9 %34 
					                                         f32 %460 = OpLoad %459 
					                                         f32 %461 = OpFAdd %458 %460 
					                                Private f32* %462 = OpAccessChain %202 %34 
					                                                      OpStore %462 %461 
					                                         f32 %463 = OpLoad %171 
					                                         f32 %464 = OpFMul %463 %453 
					                                Private f32* %465 = OpAccessChain %9 %34 
					                                                      OpStore %465 %464 
					                                         f32 %466 = OpLoad %171 
					                                         f32 %467 = OpFMul %466 %457 
					                                Private f32* %468 = OpAccessChain %9 %243 
					                                         f32 %469 = OpLoad %468 
					                                         f32 %470 = OpFAdd %467 %469 
					                                Private f32* %471 = OpAccessChain %202 %243 
					                                                      OpStore %471 %470 
					                                Private f32* %472 = OpAccessChain %9 %34 
					                                         f32 %473 = OpLoad %472 
					                                Private f32* %474 = OpAccessChain %177 %34 
					                                         f32 %475 = OpLoad %474 
					                                         f32 %476 = OpFMul %473 %475 
					                                Private f32* %477 = OpAccessChain %9 %34 
					                                                      OpStore %477 %476 
					                                Private f32* %478 = OpAccessChain %9 %34 
					                                         f32 %479 = OpLoad %478 
					                                         f32 %481 = OpFMul %479 %480 
					                                         f32 %482 = OpFAdd %481 %55 
					                                Private f32* %483 = OpAccessChain %9 %34 
					                                                      OpStore %483 %482 
					                                         f32 %484 = OpLoad %367 
					                                         f32 %485 = OpFMul %484 %453 
					                                         f32 %487 = OpFAdd %485 %486 
					                                Private f32* %488 = OpAccessChain %61 %34 
					                                                      OpStore %488 %487 
					                                         f32 %489 = OpLoad %171 
					                                         f32 %490 = OpFMul %489 %453 
					                                         f32 %491 = OpFAdd %490 %486 
					                                Private f32* %492 = OpAccessChain %61 %243 
					                                                      OpStore %492 %491 
					                                       f32_2 %497 = OpLoad %61 
					                                       f32_4 %498 = OpVectorShuffle %497 %497 0 1 0 0 
					                                      bool_4 %500 = OpFOrdLessThan %496 %498 
					                                      bool_2 %501 = OpVectorShuffle %500 %500 0 1 
					                                                      OpStore %495 %501 
					                               Private bool* %502 = OpAccessChain %495 %243 
					                                        bool %503 = OpLoad %502 
					                               Private bool* %504 = OpAccessChain %495 %34 
					                                        bool %505 = OpLoad %504 
					                                        bool %506 = OpLogicalAnd %503 %505 
					                               Private bool* %507 = OpAccessChain %495 %34 
					                                                      OpStore %507 %506 
					                                Private f32* %508 = OpAccessChain %61 %243 
					                                         f32 %509 = OpLoad %508 
					                                Private f32* %510 = OpAccessChain %61 %34 
					                                         f32 %511 = OpLoad %510 
					                                         f32 %512 = OpFMul %509 %511 
					                                Private f32* %513 = OpAccessChain %61 %34 
					                                                      OpStore %513 %512 
					                                Private f32* %514 = OpAccessChain %61 %34 
					                                         f32 %515 = OpLoad %514 
					                                         f32 %517 = OpFMul %515 %516 
					                                Private f32* %518 = OpAccessChain %61 %34 
					                                                      OpStore %518 %517 
					                                Private f32* %519 = OpAccessChain %9 %34 
					                                         f32 %520 = OpLoad %519 
					                                         f32 %521 = OpExtInst %1 30 %520 
					                                                      OpStore %171 %521 
					                                         f32 %522 = OpLoad %171 
					                                Private f32* %523 = OpAccessChain %61 %34 
					                                         f32 %524 = OpLoad %523 
					                                         f32 %525 = OpFMul %522 %524 
					                                Private f32* %526 = OpAccessChain %61 %34 
					                                                      OpStore %526 %525 
					                                Private f32* %527 = OpAccessChain %61 %34 
					                                         f32 %528 = OpLoad %527 
					                                         f32 %529 = OpExtInst %1 29 %528 
					                                Private f32* %530 = OpAccessChain %61 %34 
					                                                      OpStore %530 %529 
					                               Private bool* %531 = OpAccessChain %495 %34 
					                                        bool %532 = OpLoad %531 
					                                                      OpSelectionMerge %536 None 
					                                                      OpBranchConditional %532 %535 %539 
					                                             %535 = OpLabel 
					                                Private f32* %537 = OpAccessChain %61 %34 
					                                         f32 %538 = OpLoad %537 
					                                                      OpStore %534 %538 
					                                                      OpBranch %536 
					                                             %539 = OpLabel 
					                                Private f32* %540 = OpAccessChain %9 %34 
					                                         f32 %541 = OpLoad %540 
					                                                      OpStore %534 %541 
					                                                      OpBranch %536 
					                                             %536 = OpLabel 
					                                         f32 %542 = OpLoad %534 
					                                Private f32* %543 = OpAccessChain %9 %34 
					                                                      OpStore %543 %542 
					                         read_only Texture2D %545 = OpLoad %163 
					                                     sampler %546 = OpLoad %165 
					                  read_only Texture2DSampled %547 = OpSampledImage %545 %546 
					                                       f32_2 %548 = OpLoad %202 
					                                       f32_4 %549 = OpImageSampleImplicitLod %547 %548 
					                                                      OpStore %544 %549 
					                                       f32_4 %550 = OpLoad %9 
					                                       f32_4 %551 = OpVectorShuffle %550 %550 0 0 0 0 
					                                       f32_4 %552 = OpLoad %544 
					                                       f32_4 %553 = OpFMul %551 %552 
					                                                      OpStore %177 %553 
					                                       f32_4 %554 = OpLoad %177 
					                                Uniform f32* %556 = OpAccessChain %40 %555 
					                                         f32 %557 = OpLoad %556 
					                                       f32_4 %558 = OpCompositeConstruct %557 %557 %557 %557 
					                                       f32_4 %559 = OpFMul %554 %558 
					                                       f32_4 %560 = OpLoad %162 
					                                       f32_4 %561 = OpFNegate %560 
					                                       f32_4 %562 = OpFAdd %559 %561 
					                                                      OpStore %177 %562 
					                                       f32_4 %563 = OpLoad %177 
					                                Uniform f32* %565 = OpAccessChain %40 %564 
					                                         f32 %566 = OpLoad %565 
					                                Uniform f32* %567 = OpAccessChain %40 %564 
					                                         f32 %568 = OpLoad %567 
					                                Uniform f32* %569 = OpAccessChain %40 %564 
					                                         f32 %570 = OpLoad %569 
					                                Uniform f32* %571 = OpAccessChain %40 %564 
					                                         f32 %572 = OpLoad %571 
					                                       f32_4 %573 = OpCompositeConstruct %566 %568 %570 %572 
					                                         f32 %574 = OpCompositeExtract %573 0 
					                                         f32 %575 = OpCompositeExtract %573 1 
					                                         f32 %576 = OpCompositeExtract %573 2 
					                                         f32 %577 = OpCompositeExtract %573 3 
					                                       f32_4 %578 = OpCompositeConstruct %574 %575 %576 %577 
					                                       f32_4 %579 = OpFMul %563 %578 
					                                                      OpStore %177 %579 
					                                       f32_4 %580 = OpLoad %9 
					                                       f32_4 %581 = OpVectorShuffle %580 %580 3 3 3 3 
					                                       f32_4 %582 = OpLoad %177 
					                                       f32_4 %583 = OpFMul %581 %582 
					                                       f32_4 %584 = OpLoad %162 
					                                       f32_4 %585 = OpFAdd %583 %584 
					                                                      OpStore %144 %585 
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
						vec4 unused_0_3[2];
						float _Near;
						float _Far;
						float _FixDistance;
						float _LightIntensity;
						float _FadeShield;
						float _Value;
						float _Value2;
						float _Value3;
						float _Value4;
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					bvec2 u_xlatb2;
					vec2 u_xlat3;
					bool u_xlatb3;
					float u_xlat4;
					float u_xlat5;
					vec2 u_xlat6;
					float u_xlat9;
					float u_xlat10;
					float u_xlat12;
					vec2 u_xlat14;
					float u_xlat15;
					int u_xlati15;
					float u_xlat20;
					int u_xlati20;
					float u_xlat21;
					bool u_xlatb21;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat10_0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat6.x = _FixDistance * 10.0;
					    u_xlat0.x = u_xlat0.x / u_xlat6.x;
					    u_xlat6.x = _Far + _Near;
					    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					    u_xlat6.x = u_xlat6.x + (-_Near);
					    u_xlat0.x = u_xlat0.x + (-_Near);
					    u_xlat6.x = float(1.0) / u_xlat6.x;
					    u_xlat0.x = u_xlat6.x * u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat0 = u_xlat0.xxxx * u_xlat6.xxxx;
					    u_xlatb1 = _Visualize==1.0;
					    if(u_xlatb1){
					        SV_Target0 = u_xlat0;
					        return;
					    //ENDIF
					    }
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat10_1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat12 = _TimeX * 1.29999995;
					    u_xlat2.xy = vec2(u_xlat12) * vec2(_Value2, _Value3);
					    u_xlat14.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
					    {
					        u_xlat3.x = float(u_xlati_loop_1);
					        u_xlat3.x = u_xlat3.x * 0.897597909;
					        u_xlat4 = cos(u_xlat3.x);
					        u_xlat3.x = sin(u_xlat3.x);
					        u_xlat9 = u_xlat12 * u_xlat4;
					        u_xlat9 = u_xlat9 * _Value + u_xlat2.x;
					        u_xlat9 = u_xlat0.x + u_xlat9;
					        u_xlat15 = u_xlat12 * u_xlat3.x;
					        u_xlat15 = u_xlat15 * _Value + (-u_xlat2.y);
					        u_xlat15 = u_xlat0.y + (-u_xlat15);
					        u_xlat3.x = u_xlat3.x * u_xlat15;
					        u_xlat3.x = u_xlat9 * u_xlat4 + (-u_xlat3.x);
					        u_xlat3.x = u_xlat3.x * 6.0;
					        u_xlat3.x = cos(u_xlat3.x);
					        u_xlat14.x = u_xlat3.x * _Value4 + u_xlat14.x;
					    }
					    u_xlat3.xy = u_xlat0.xy + vec2(8.52999973, 8.52999973);
					    u_xlat14.y = 0.0;
					    for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<8 ; u_xlati_loop_2++)
					    {
					        u_xlat21 = float(u_xlati_loop_2);
					        u_xlat21 = u_xlat21 * 0.897597909;
					        u_xlat4 = sin(u_xlat21);
					        u_xlat5 = cos(u_xlat21);
					        u_xlat21 = u_xlat12 * u_xlat5;
					        u_xlat21 = u_xlat21 * _Value + u_xlat2.x;
					        u_xlat21 = u_xlat21 + u_xlat3.x;
					        u_xlat10 = u_xlat12 * u_xlat4;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat2.y);
					        u_xlat10 = u_xlat0.y + (-u_xlat10);
					        u_xlat4 = u_xlat4 * u_xlat10;
					        u_xlat21 = u_xlat21 * u_xlat5 + (-u_xlat4);
					        u_xlat21 = u_xlat21 * 6.0;
					        u_xlat21 = cos(u_xlat21);
					        u_xlat14.y = u_xlat21 * _Value4 + u_xlat14.y;
					    }
					    u_xlat14.xy = cos(u_xlat14.xy);
					    u_xlat20 = (-u_xlat14.y) + u_xlat14.x;
					    u_xlat3.x = float(0.0);
					    for(int u_xlati_loop_3 = int(0) ; u_xlati_loop_3<8 ; u_xlati_loop_3++)
					    {
					        u_xlat21 = float(u_xlati_loop_3);
					        u_xlat21 = u_xlat21 * 0.897597909;
					        u_xlat4 = sin(u_xlat21);
					        u_xlat5 = cos(u_xlat21);
					        u_xlat21 = u_xlat12 * u_xlat5;
					        u_xlat21 = u_xlat21 * _Value + u_xlat2.x;
					        u_xlat21 = u_xlat0.x + u_xlat21;
					        u_xlat10 = u_xlat12 * u_xlat4;
					        u_xlat10 = u_xlat10 * _Value + (-u_xlat2.y);
					        u_xlat10 = u_xlat3.y + (-u_xlat10);
					        u_xlat4 = u_xlat4 * u_xlat10;
					        u_xlat21 = u_xlat21 * u_xlat5 + (-u_xlat4);
					        u_xlat21 = u_xlat21 * 6.0;
					        u_xlat21 = cos(u_xlat21);
					        u_xlat3.x = u_xlat21 * _Value4 + u_xlat3.x;
					    }
					    u_xlat12 = cos(u_xlat3.x);
					    u_xlat12 = (-u_xlat12) + u_xlat14.x;
					    u_xlat2.x = u_xlat20 * 0.00833333377;
					    u_xlat3.x = u_xlat20 * 0.0166666675 + u_xlat0.x;
					    u_xlat0.x = u_xlat12 * 0.00833333377;
					    u_xlat3.y = u_xlat12 * 0.0166666675 + u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat2.x;
					    u_xlat0.x = u_xlat0.x * 700.0 + 1.0;
					    u_xlat6.x = u_xlat20 * 0.00833333377 + -0.0120000001;
					    u_xlat6.y = u_xlat12 * 0.00833333377 + -0.0120000001;
					    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyxx).xy;
					    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
					    u_xlat6.x = u_xlat6.y * u_xlat6.x;
					    u_xlat6.x = u_xlat6.x * 200000.0;
					    u_xlat12 = log2(u_xlat0.x);
					    u_xlat6.x = u_xlat12 * u_xlat6.x;
					    u_xlat6.x = exp2(u_xlat6.x);
					    u_xlat0.x = (u_xlatb2.x) ? u_xlat6.x : u_xlat0.x;
					    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
					    u_xlat2 = u_xlat0.xxxx * u_xlat10_2;
					    u_xlat2 = u_xlat2 * vec4(_LightIntensity) + (-u_xlat10_1);
					    u_xlat2 = u_xlat2 * vec4(vec4(_FadeShield, _FadeShield, _FadeShield, _FadeShield));
					    SV_Target0 = u_xlat0.wwww * u_xlat2 + u_xlat10_1;
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