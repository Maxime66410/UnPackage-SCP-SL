Shader "CameraFilterPack/Glasses_OnX" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 52411
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[3];
						vec2 _MainTex_TexelSize;
						vec4 unused_0_2[5];
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
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.xxxy.w<0.0;
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
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD1 = phase0_Output0_0.zw;
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
					 vec4 phase0_Output0_0;
					out vec2 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
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
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_COLOR0 = in_COLOR0;
					vs_TEXCOORD0 = phase0_Output0_0.xy;
					vs_TEXCOORD1 = phase0_Output0_0.zw;
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
					uniform 	float Fade;
					uniform 	float VisionBlur;
					uniform 	float GlassDistortion;
					uniform 	float GlassAberration;
					uniform 	vec4 GlassesColor;
					uniform 	vec4 GlassesColor2;
					uniform 	vec4 GlassColor;
					uniform 	float UseFinalGlassColor;
					uniform 	float UseScanLine;
					uniform 	float UseScanLineSize;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex2;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					vec4 u_xlat10_10;
					float u_xlat11;
					vec3 u_xlat12;
					float u_xlat16;
					ivec2 u_xlati16;
					vec2 u_xlat19;
					vec2 u_xlat22;
					float u_xlat23;
					float u_xlat16_23;
					int u_xlati23;
					float u_xlat30;
					ivec2 u_xlati30;
					float u_xlat33;
					float u_xlat35;
					bool u_xlatb35;
					float u_xlat38;
					bool u_xlatb38;
					vec4 TempArray0[6];
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat22.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = (-Fade) + 1.0;
					    u_xlat2.xy = u_xlat22.xy * u_xlat1.xx + vec2(0.5, 0.5);
					    u_xlat22.x = Fade + -0.699999988;
					    u_xlat0.z = u_xlat22.x * 3.33333325;
					    u_xlat0.z = clamp(u_xlat0.z, 0.0, 1.0);
					    u_xlat33 = u_xlat0.z * -2.0 + 3.0;
					    u_xlat12.xyz = vec3(Fade, Fade, _TimeX) * vec3(3.33333325, 5.0, 3.5);
					    u_xlat12.xy = u_xlat12.xy;
					    u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
					    u_xlat3.xy = u_xlat12.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat12.xy = u_xlat12.xy * u_xlat12.xy;
					    u_xlat12.x = u_xlat12.x * u_xlat3.x;
					    u_xlat23 = (-u_xlat3.y) * u_xlat12.y + u_xlat2.y;
					    u_xlat2.z = min(u_xlat23, 0.0);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.xz);
					    u_xlat3 = (-GlassesColor) + GlassesColor2;
					    u_xlat3 = u_xlat10_2.yyyy * u_xlat3 + GlassesColor;
					    u_xlat16_23 = (-u_xlat10_2.x) + u_xlat10_2.y;
					    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
					    u_xlat16_23 = u_xlat16_23 + -0.5;
					    u_xlat23 = u_xlat16_23 * GlassDistortion;
					    u_xlat4.xy = (-vec2(u_xlat23)) * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					    u_xlat35 = Fade * GlassAberration;
					    u_xlat4.x = (-u_xlat35) * 0.25 + 0.200000003;
					    u_xlat4.xz = (-vec2(u_xlat23)) * u_xlat4.xx + u_xlat0.xy;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xz);
					    u_xlat35 = u_xlat35 * 0.25 + 0.200000003;
					    u_xlat4.xz = (-vec2(u_xlat23)) * vec2(u_xlat35) + u_xlat0.xy;
					    u_xlat6 = texture(_MainTex, u_xlat4.xz);
					    u_xlat10_7 = texture(_MainTex, u_xlat0.xy);
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat4.x = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat4.w = float(0.0);
					    u_xlati23 = int(0xFFFFFFFEu);
					    while(true){
					        u_xlatb35 = 2<u_xlati23;
					        if(u_xlatb35){break;}
					        u_xlati16.xy = ivec2(u_xlati23) + ivec2(2, 1);
					        u_xlat35 = TempArray0[u_xlati16.x].x;
					        u_xlat16 = float(u_xlati23);
					        u_xlat8.x = u_xlat16 * VisionBlur;
					        u_xlat9.xyz = u_xlat4.xzw;
					        u_xlati16.x = int(0xFFFFFFFEu);
					        while(true){
					            u_xlatb38 = 2<u_xlati16.x;
					            if(u_xlatb38){break;}
					            u_xlati30.xy = u_xlati16.xx + ivec2(2, 1);
					            u_xlat38 = TempArray0[u_xlati30.x].x;
					            u_xlat38 = u_xlat35 * u_xlat38;
					            u_xlat30 = float(u_xlati16.x);
					            u_xlat8.y = u_xlat30 * VisionBlur;
					            u_xlat19.xy = u_xlat0.xy + u_xlat8.xy;
					            u_xlat10_10 = texture(_MainTex, u_xlat19.xy);
					            u_xlat9.xyz = vec3(u_xlat38) * u_xlat10_10.xyz + u_xlat9.xyz;
					            u_xlati16.x = u_xlati30.y;
					        }
					        u_xlat4.xzw = u_xlat9.xyz;
					        u_xlati23 = u_xlati16.y;
					    }
					    u_xlat8.xyz = u_xlat4.xzw * vec3(0.25, 0.25, 0.25);
					    u_xlat8.w = 1.0;
					    u_xlat8 = (-vec4(vec4(Fade, Fade, Fade, Fade))) * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003) + u_xlat8;
					    u_xlat0.x = u_xlat1.x * UseScanLineSize;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * 1.5 + u_xlat12.z;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat6.x = u_xlat10_5.x;
					    u_xlat6.y = u_xlat10_4.y;
					    u_xlat6.w = 1.0;
					    u_xlat4 = u_xlat6 * GlassColor;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat5 = u_xlat4 * u_xlat0.xxxx + (-u_xlat4);
					    u_xlat4 = vec4(vec4(UseScanLine, UseScanLine, UseScanLine, UseScanLine)) * u_xlat5 + u_xlat4;
					    u_xlat5 = (-u_xlat4) + u_xlat8;
					    u_xlat4 = u_xlat10_2.zzzz * u_xlat5 + u_xlat4;
					    u_xlat16_0 = u_xlat10_2.y + -0.100000001;
					    u_xlat0.x = u_xlat16_0 * 2.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz;
					    u_xlat0.x = (-u_xlat11) * u_xlat0.x + 1.0;
					    u_xlat3 = (-u_xlat0.xxxx) * vec4(0.800000012, 0.800000012, 0.800000012, 0.800000012) + u_xlat3;
					    u_xlat3 = (-u_xlat4) + u_xlat3;
					    u_xlat2 = u_xlat10_2.xxxx * u_xlat3 + u_xlat4;
					    u_xlat2 = (-u_xlat8) + u_xlat2;
					    u_xlat1 = u_xlat12.xxxx * u_xlat2 + u_xlat8;
					    u_xlat2 = u_xlat10_7 * GlassColor + (-u_xlat10_7);
					    u_xlat2 = vec4(UseFinalGlassColor) * u_xlat2 + u_xlat10_7;
					    u_xlat0.x = (-u_xlat33) * u_xlat0.z + 1.0;
					    u_xlat1 = u_xlat1 + (-u_xlat2);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 135
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %30 %58 %109 %119 %120 %123 %126 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %13 ArrayStride 13 
					                                                     OpDecorate %14 ArrayStride 14 
					                                                     OpMemberDecorate %16 0 Offset 16 
					                                                     OpMemberDecorate %16 1 Offset 16 
					                                                     OpMemberDecorate %16 2 Offset 16 
					                                                     OpDecorate %16 Block 
					                                                     OpDecorate %18 DescriptorSet 18 
					                                                     OpDecorate %18 Binding 18 
					                                                     OpDecorate %30 Location 30 
					                                                     OpDecorate %58 Location 58 
					                                                     OpMemberDecorate %107 0 BuiltIn 107 
					                                                     OpMemberDecorate %107 1 BuiltIn 107 
					                                                     OpMemberDecorate %107 2 BuiltIn 107 
					                                                     OpDecorate %107 Block 
					                                                     OpDecorate %119 Location 119 
					                                                     OpDecorate %120 Location 120 
					                                                     OpDecorate vs_TEXCOORD0 Location 123 
					                                                     OpDecorate vs_TEXCOORD1 Location 126 
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
					                                             %16 = OpTypeStruct %13 %14 %15 
					                                             %17 = OpTypePointer Uniform %16 
					Uniform struct {f32_4[4]; f32_4[4]; f32_2;}* %18 = OpVariable Uniform 
					                                             %19 = OpTypeInt 32 1 
					                                         i32 %20 = OpConstant 2 
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
					                                         i32 %61 = OpConstant 0 
					                                         i32 %62 = OpConstant 1 
					                                             %63 = OpTypePointer Uniform %10 
					                                         i32 %82 = OpConstant 3 
					                              Private f32_4* %86 = OpVariable Private 
					                                            %106 = OpTypeArray %9 %21 
					                                            %107 = OpTypeStruct %10 %9 %106 
					                                            %108 = OpTypePointer Output %107 
					       Output struct {f32_4; f32; f32[1];}* %109 = OpVariable Output 
					                                            %117 = OpTypePointer Output %10 
					                              Output f32_4* %119 = OpVariable Output 
					                               Input f32_4* %120 = OpVariable Input 
					                                            %122 = OpTypePointer Output %15 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %129 = OpTypePointer Output %9 
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
					                              Uniform f32_4* %64 = OpAccessChain %18 %61 %62 
					                                       f32_4 %65 = OpLoad %64 
					                                       f32_4 %66 = OpFMul %60 %65 
					                                                     OpStore %56 %66 
					                              Uniform f32_4* %67 = OpAccessChain %18 %61 %61 
					                                       f32_4 %68 = OpLoad %67 
					                                       f32_4 %69 = OpLoad %58 
					                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
					                                       f32_4 %71 = OpFMul %68 %70 
					                                       f32_4 %72 = OpLoad %56 
					                                       f32_4 %73 = OpFAdd %71 %72 
					                                                     OpStore %56 %73 
					                              Uniform f32_4* %74 = OpAccessChain %18 %61 %20 
					                                       f32_4 %75 = OpLoad %74 
					                                       f32_4 %76 = OpLoad %58 
					                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
					                                       f32_4 %78 = OpFMul %75 %77 
					                                       f32_4 %79 = OpLoad %56 
					                                       f32_4 %80 = OpFAdd %78 %79 
					                                                     OpStore %56 %80 
					                                       f32_4 %81 = OpLoad %56 
					                              Uniform f32_4* %83 = OpAccessChain %18 %61 %82 
					                                       f32_4 %84 = OpLoad %83 
					                                       f32_4 %85 = OpFAdd %81 %84 
					                                                     OpStore %56 %85 
					                                       f32_4 %87 = OpLoad %56 
					                                       f32_4 %88 = OpVectorShuffle %87 %87 1 1 1 1 
					                              Uniform f32_4* %89 = OpAccessChain %18 %62 %62 
					                                       f32_4 %90 = OpLoad %89 
					                                       f32_4 %91 = OpFMul %88 %90 
					                                                     OpStore %86 %91 
					                              Uniform f32_4* %92 = OpAccessChain %18 %62 %61 
					                                       f32_4 %93 = OpLoad %92 
					                                       f32_4 %94 = OpLoad %56 
					                                       f32_4 %95 = OpVectorShuffle %94 %94 0 0 0 0 
					                                       f32_4 %96 = OpFMul %93 %95 
					                                       f32_4 %97 = OpLoad %86 
					                                       f32_4 %98 = OpFAdd %96 %97 
					                                                     OpStore %86 %98 
					                              Uniform f32_4* %99 = OpAccessChain %18 %62 %20 
					                                      f32_4 %100 = OpLoad %99 
					                                      f32_4 %101 = OpLoad %56 
					                                      f32_4 %102 = OpVectorShuffle %101 %101 2 2 2 2 
					                                      f32_4 %103 = OpFMul %100 %102 
					                                      f32_4 %104 = OpLoad %86 
					                                      f32_4 %105 = OpFAdd %103 %104 
					                                                     OpStore %86 %105 
					                             Uniform f32_4* %110 = OpAccessChain %18 %62 %82 
					                                      f32_4 %111 = OpLoad %110 
					                                      f32_4 %112 = OpLoad %56 
					                                      f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
					                                      f32_4 %114 = OpFMul %111 %113 
					                                      f32_4 %115 = OpLoad %86 
					                                      f32_4 %116 = OpFAdd %114 %115 
					                              Output f32_4* %118 = OpAccessChain %109 %61 
					                                                     OpStore %118 %116 
					                                      f32_4 %121 = OpLoad %120 
					                                                     OpStore %119 %121 
					                                      f32_4 %124 = OpLoad %38 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 0 1 
					                                                     OpStore vs_TEXCOORD0 %125 
					                                      f32_4 %127 = OpLoad %38 
					                                      f32_2 %128 = OpVectorShuffle %127 %127 2 3 
					                                                     OpStore vs_TEXCOORD1 %128 
					                                Output f32* %130 = OpAccessChain %109 %61 %21 
					                                        f32 %131 = OpLoad %130 
					                                        f32 %132 = OpFNegate %131 
					                                Output f32* %133 = OpAccessChain %109 %61 %21 
					                                                     OpStore %133 %132 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 603
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %595 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpMemberDecorate %15 0 Offset 15 
					                                                      OpMemberDecorate %15 1 Offset 15 
					                                                      OpMemberDecorate %15 2 Offset 15 
					                                                      OpMemberDecorate %15 3 Offset 15 
					                                                      OpMemberDecorate %15 4 Offset 15 
					                                                      OpMemberDecorate %15 5 Offset 15 
					                                                      OpMemberDecorate %15 6 Offset 15 
					                                                      OpMemberDecorate %15 7 Offset 15 
					                                                      OpMemberDecorate %15 8 Offset 15 
					                                                      OpMemberDecorate %15 9 Offset 15 
					                                                      OpMemberDecorate %15 10 Offset 15 
					                                                      OpMemberDecorate %15 11 RelaxedPrecision 
					                                                      OpMemberDecorate %15 11 Offset 15 
					                                                      OpDecorate %15 Block 
					                                                      OpDecorate %17 DescriptorSet 17 
					                                                      OpDecorate %17 Binding 17 
					                                                      OpDecorate %22 RelaxedPrecision 
					                                                      OpDecorate %23 RelaxedPrecision 
					                                                      OpDecorate %26 RelaxedPrecision 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %143 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %146 DescriptorSet 146 
					                                                      OpDecorate %146 Binding 146 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %150 DescriptorSet 150 
					                                                      OpDecorate %150 Binding 150 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %173 RelaxedPrecision 
					                                                      OpDecorate %175 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %178 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %201 DescriptorSet 201 
					                                                      OpDecorate %201 Binding 201 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %203 DescriptorSet 203 
					                                                      OpDecorate %203 Binding 203 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %365 RelaxedPrecision 
					                                                      OpDecorate %366 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %371 RelaxedPrecision 
					                                                      OpDecorate %373 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %502 RelaxedPrecision 
					                                                      OpDecorate %503 RelaxedPrecision 
					                                                      OpDecorate %508 RelaxedPrecision 
					                                                      OpDecorate %510 RelaxedPrecision 
					                                                      OpDecorate %512 RelaxedPrecision 
					                                                      OpDecorate %513 RelaxedPrecision 
					                                                      OpDecorate %515 RelaxedPrecision 
					                                                      OpDecorate %552 RelaxedPrecision 
					                                                      OpDecorate %553 RelaxedPrecision 
					                                                      OpDecorate %568 RelaxedPrecision 
					                                                      OpDecorate %572 RelaxedPrecision 
					                                                      OpDecorate %573 RelaxedPrecision 
					                                                      OpDecorate %581 RelaxedPrecision 
					                                                      OpDecorate %595 Location 595 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %14 = OpTypeVector %6 4 
					                                              %15 = OpTypeStruct %6 %6 %6 %6 %6 %14 %14 %14 %6 %6 %6 %14 
					                                              %16 = OpTypePointer Uniform %15 
					Uniform struct {f32; f32; f32; f32; f32; f32_4; f32_4; f32_4; f32; f32; f32; f32_4;}* %17 = OpVariable Uniform 
					                                              %18 = OpTypeInt 32 1 
					                                          i32 %19 = OpConstant 11 
					                                              %20 = OpTypePointer Uniform %14 
					                                              %31 = OpTypePointer Private %10 
					                               Private f32_2* %32 = OpVariable Private 
					                                          f32 %34 = OpConstant 3,674022E-40 
					                                        f32_2 %35 = OpConstantComposite %34 %34 
					                                              %37 = OpTypePointer Private %14 
					                               Private f32_4* %38 = OpVariable Private 
					                                          i32 %39 = OpConstant 1 
					                                              %40 = OpTypePointer Uniform %6 
					                                          f32 %44 = OpConstant 3,674022E-40 
					                                              %46 = OpTypeInt 32 0 
					                                          u32 %47 = OpConstant 0 
					                                              %48 = OpTypePointer Private %6 
					                               Private f32_4* %50 = OpVariable Private 
					                                          f32 %55 = OpConstant 3,674022E-40 
					                                        f32_2 %56 = OpConstantComposite %55 %55 
					                                          f32 %62 = OpConstant 3,674022E-40 
					                                          f32 %67 = OpConstant 3,674022E-40 
					                                          u32 %69 = OpConstant 2 
					                                          f32 %73 = OpConstant 3,674022E-40 
					                                 Private f32* %76 = OpVariable Private 
					                                          f32 %79 = OpConstant 3,674022E-40 
					                                          f32 %81 = OpConstant 3,674022E-40 
					                               Private f32_3* %83 = OpVariable Private 
					                                          i32 %88 = OpConstant 0 
					                                          f32 %92 = OpConstant 3,674022E-40 
					                                          f32 %93 = OpConstant 3,674022E-40 
					                                        f32_3 %94 = OpConstantComposite %67 %92 %93 
					                              Private f32_4* %107 = OpVariable Private 
					                                       f32_2 %110 = OpConstantComposite %79 %79 
					                                       f32_2 %112 = OpConstantComposite %81 %81 
					                                Private f32* %129 = OpVariable Private 
					                                         u32 %130 = OpConstant 1 
					                              Private f32_3* %143 = OpVariable Private 
					                                             %144 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %145 = OpTypePointer UniformConstant %144 
					        UniformConstant read_only Texture2D* %146 = OpVariable UniformConstant 
					                                             %148 = OpTypeSampler 
					                                             %149 = OpTypePointer UniformConstant %148 
					                    UniformConstant sampler* %150 = OpVariable UniformConstant 
					                                             %152 = OpTypeSampledImage %144 
					                                         i32 %158 = OpConstant 5 
					                                         i32 %162 = OpConstant 6 
					                                Private f32* %173 = OpVariable Private 
					                                         i32 %185 = OpConstant 3 
					                              Private f32_4* %189 = OpVariable Private 
					                                         f32 %193 = OpConstant 3,674022E-40 
					                                       f32_2 %194 = OpConstantComposite %193 %193 
					        UniformConstant read_only Texture2D* %201 = OpVariable UniformConstant 
					                    UniformConstant sampler* %203 = OpVariable UniformConstant 
					                                Private f32* %211 = OpVariable Private 
					                                         i32 %214 = OpConstant 4 
					                              Private f32_2* %218 = OpVariable Private 
					                                         f32 %221 = OpConstant 3,674022E-40 
					                              Private f32_4* %260 = OpVariable Private 
					                                         u32 %267 = OpConstant 6 
					                                             %268 = OpTypeArray %14 %267 
					                                             %269 = OpTypePointer Private %268 
					                           Private f32_4[6]* %270 = OpVariable Private 
					                                         i32 %272 = OpConstant 2 
					                                         f32 %273 = OpConstant 3,674022E-40 
					                              Private f32_4* %279 = OpVariable Private 
					                                             %283 = OpTypePointer Private %18 
					                                Private i32* %284 = OpVariable Private 
					                                         i32 %285 = OpConstant -2 
					                                             %291 = OpTypeBool 
					                                        bool %292 = OpConstantTrue 
					                                             %293 = OpTypePointer Private %291 
					                               Private bool* %294 = OpVariable Private 
					                                             %301 = OpTypeVector %18 2 
					                                             %302 = OpTypePointer Private %301 
					                              Private i32_2* %303 = OpVariable Private 
					                                       i32_2 %306 = OpConstantComposite %272 %39 
					                                Private f32* %312 = OpVariable Private 
					                              Private f32_2* %315 = OpVariable Private 
					                              Private f32_4* %321 = OpVariable Private 
					                                Private i32* %326 = OpVariable Private 
					                               Private bool* %332 = OpVariable Private 
					                              Private i32_2* %339 = OpVariable Private 
					                                Private f32* %343 = OpVariable Private 
					                              Private f32_2* %351 = OpVariable Private 
					                              Private f32_3* %365 = OpVariable Private 
					                                       f32_3 %391 = OpConstantComposite %221 %221 %221 
					                                         u32 %395 = OpConstant 3 
					                                       f32_4 %412 = OpConstantComposite %193 %193 %193 %193 
					                                         i32 %418 = OpConstant 10 
					                                         f32 %431 = OpConstant 3,674022E-40 
					                                         f32 %443 = OpConstant 3,674022E-40 
					                                         f32 %453 = OpConstant 3,674022E-40 
					                                         i32 %462 = OpConstant 7 
					                                         f32 %468 = OpConstant 3,674022E-40 
					                                         i32 %479 = OpConstant 9 
					                                Private f32* %508 = OpVariable Private 
					                                         f32 %511 = OpConstant 3,674022E-40 
					                                         f32 %514 = OpConstant 3,674022E-40 
					                                Private f32* %521 = OpVariable Private 
					                                         f32 %543 = OpConstant 3,674022E-40 
					                                       f32_4 %544 = OpConstantComposite %543 %543 %543 %543 
					                                         i32 %575 = OpConstant 8 
					                                             %594 = OpTypePointer Output %14 
					                               Output f32_4* %595 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD0 
					                               Uniform f32_4* %21 = OpAccessChain %17 %19 
					                                        f32_4 %22 = OpLoad %21 
					                                        f32_2 %23 = OpVectorShuffle %22 %22 0 1 
					                                        f32_2 %24 = OpFMul %13 %23 
					                               Uniform f32_4* %25 = OpAccessChain %17 %19 
					                                        f32_4 %26 = OpLoad %25 
					                                        f32_2 %27 = OpVectorShuffle %26 %26 2 3 
					                                        f32_2 %28 = OpFAdd %24 %27 
					                                        f32_3 %29 = OpLoad %9 
					                                        f32_3 %30 = OpVectorShuffle %29 %28 3 4 2 
					                                                      OpStore %9 %30 
					                                        f32_2 %33 = OpLoad vs_TEXCOORD0 
					                                        f32_2 %36 = OpFAdd %33 %35 
					                                                      OpStore %32 %36 
					                                 Uniform f32* %41 = OpAccessChain %17 %39 
					                                          f32 %42 = OpLoad %41 
					                                          f32 %43 = OpFNegate %42 
					                                          f32 %45 = OpFAdd %43 %44 
					                                 Private f32* %49 = OpAccessChain %38 %47 
					                                                      OpStore %49 %45 
					                                        f32_2 %51 = OpLoad %32 
					                                        f32_4 %52 = OpLoad %38 
					                                        f32_2 %53 = OpVectorShuffle %52 %52 0 0 
					                                        f32_2 %54 = OpFMul %51 %53 
					                                        f32_2 %57 = OpFAdd %54 %56 
					                                        f32_4 %58 = OpLoad %50 
					                                        f32_4 %59 = OpVectorShuffle %58 %57 4 5 2 3 
					                                                      OpStore %50 %59 
					                                 Uniform f32* %60 = OpAccessChain %17 %39 
					                                          f32 %61 = OpLoad %60 
					                                          f32 %63 = OpFAdd %61 %62 
					                                 Private f32* %64 = OpAccessChain %32 %47 
					                                                      OpStore %64 %63 
					                                 Private f32* %65 = OpAccessChain %32 %47 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %68 = OpFMul %66 %67 
					                                 Private f32* %70 = OpAccessChain %9 %69 
					                                                      OpStore %70 %68 
					                                 Private f32* %71 = OpAccessChain %9 %69 
					                                          f32 %72 = OpLoad %71 
					                                          f32 %74 = OpExtInst %1 43 %72 %73 %44 
					                                 Private f32* %75 = OpAccessChain %9 %69 
					                                                      OpStore %75 %74 
					                                 Private f32* %77 = OpAccessChain %9 %69 
					                                          f32 %78 = OpLoad %77 
					                                          f32 %80 = OpFMul %78 %79 
					                                          f32 %82 = OpFAdd %80 %81 
					                                                      OpStore %76 %82 
					                                 Uniform f32* %84 = OpAccessChain %17 %39 
					                                          f32 %85 = OpLoad %84 
					                                 Uniform f32* %86 = OpAccessChain %17 %39 
					                                          f32 %87 = OpLoad %86 
					                                 Uniform f32* %89 = OpAccessChain %17 %88 
					                                          f32 %90 = OpLoad %89 
					                                        f32_3 %91 = OpCompositeConstruct %85 %87 %90 
					                                        f32_3 %95 = OpFMul %91 %94 
					                                                      OpStore %83 %95 
					                                        f32_3 %96 = OpLoad %83 
					                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
					                                        f32_3 %98 = OpLoad %83 
					                                        f32_3 %99 = OpVectorShuffle %98 %97 3 4 2 
					                                                      OpStore %83 %99 
					                                       f32_3 %100 = OpLoad %83 
					                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
					                                       f32_2 %102 = OpCompositeConstruct %73 %73 
					                                       f32_2 %103 = OpCompositeConstruct %44 %44 
					                                       f32_2 %104 = OpExtInst %1 43 %101 %102 %103 
					                                       f32_3 %105 = OpLoad %83 
					                                       f32_3 %106 = OpVectorShuffle %105 %104 3 4 2 
					                                                      OpStore %83 %106 
					                                       f32_3 %108 = OpLoad %83 
					                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
					                                       f32_2 %111 = OpFMul %109 %110 
					                                       f32_2 %113 = OpFAdd %111 %112 
					                                       f32_4 %114 = OpLoad %107 
					                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 2 3 
					                                                      OpStore %107 %115 
					                                       f32_3 %116 = OpLoad %83 
					                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
					                                       f32_3 %118 = OpLoad %83 
					                                       f32_2 %119 = OpVectorShuffle %118 %118 0 1 
					                                       f32_2 %120 = OpFMul %117 %119 
					                                       f32_3 %121 = OpLoad %83 
					                                       f32_3 %122 = OpVectorShuffle %121 %120 3 4 2 
					                                                      OpStore %83 %122 
					                                Private f32* %123 = OpAccessChain %83 %47 
					                                         f32 %124 = OpLoad %123 
					                                Private f32* %125 = OpAccessChain %107 %47 
					                                         f32 %126 = OpLoad %125 
					                                         f32 %127 = OpFMul %124 %126 
					                                Private f32* %128 = OpAccessChain %83 %47 
					                                                      OpStore %128 %127 
					                                Private f32* %131 = OpAccessChain %107 %130 
					                                         f32 %132 = OpLoad %131 
					                                         f32 %133 = OpFNegate %132 
					                                Private f32* %134 = OpAccessChain %83 %130 
					                                         f32 %135 = OpLoad %134 
					                                         f32 %136 = OpFMul %133 %135 
					                                Private f32* %137 = OpAccessChain %50 %130 
					                                         f32 %138 = OpLoad %137 
					                                         f32 %139 = OpFAdd %136 %138 
					                                                      OpStore %129 %139 
					                                         f32 %140 = OpLoad %129 
					                                         f32 %141 = OpExtInst %1 37 %140 %73 
					                                Private f32* %142 = OpAccessChain %50 %69 
					                                                      OpStore %142 %141 
					                         read_only Texture2D %147 = OpLoad %146 
					                                     sampler %151 = OpLoad %150 
					                  read_only Texture2DSampled %153 = OpSampledImage %147 %151 
					                                       f32_4 %154 = OpLoad %50 
					                                       f32_2 %155 = OpVectorShuffle %154 %154 0 2 
					                                       f32_4 %156 = OpImageSampleImplicitLod %153 %155 
					                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
					                                                      OpStore %143 %157 
					                              Uniform f32_4* %159 = OpAccessChain %17 %158 
					                                       f32_4 %160 = OpLoad %159 
					                                       f32_4 %161 = OpFNegate %160 
					                              Uniform f32_4* %163 = OpAccessChain %17 %162 
					                                       f32_4 %164 = OpLoad %163 
					                                       f32_4 %165 = OpFAdd %161 %164 
					                                                      OpStore %107 %165 
					                                       f32_3 %166 = OpLoad %143 
					                                       f32_4 %167 = OpVectorShuffle %166 %166 1 1 1 1 
					                                       f32_4 %168 = OpLoad %107 
					                                       f32_4 %169 = OpFMul %167 %168 
					                              Uniform f32_4* %170 = OpAccessChain %17 %158 
					                                       f32_4 %171 = OpLoad %170 
					                                       f32_4 %172 = OpFAdd %169 %171 
					                                                      OpStore %107 %172 
					                                Private f32* %174 = OpAccessChain %143 %47 
					                                         f32 %175 = OpLoad %174 
					                                         f32 %176 = OpFNegate %175 
					                                Private f32* %177 = OpAccessChain %143 %130 
					                                         f32 %178 = OpLoad %177 
					                                         f32 %179 = OpFAdd %176 %178 
					                                                      OpStore %173 %179 
					                                         f32 %180 = OpLoad %173 
					                                         f32 %181 = OpExtInst %1 43 %180 %73 %44 
					                                                      OpStore %173 %181 
					                                         f32 %182 = OpLoad %173 
					                                         f32 %183 = OpFAdd %182 %34 
					                                                      OpStore %173 %183 
					                                         f32 %184 = OpLoad %173 
					                                Uniform f32* %186 = OpAccessChain %17 %185 
					                                         f32 %187 = OpLoad %186 
					                                         f32 %188 = OpFMul %184 %187 
					                                                      OpStore %129 %188 
					                                         f32 %190 = OpLoad %129 
					                                       f32_2 %191 = OpCompositeConstruct %190 %190 
					                                       f32_2 %192 = OpFNegate %191 
					                                       f32_2 %195 = OpFMul %192 %194 
					                                       f32_3 %196 = OpLoad %9 
					                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
					                                       f32_2 %198 = OpFAdd %195 %197 
					                                       f32_4 %199 = OpLoad %189 
					                                       f32_4 %200 = OpVectorShuffle %199 %198 4 5 2 3 
					                                                      OpStore %189 %200 
					                         read_only Texture2D %202 = OpLoad %201 
					                                     sampler %204 = OpLoad %203 
					                  read_only Texture2DSampled %205 = OpSampledImage %202 %204 
					                                       f32_4 %206 = OpLoad %189 
					                                       f32_2 %207 = OpVectorShuffle %206 %206 0 1 
					                                       f32_4 %208 = OpImageSampleImplicitLod %205 %207 
					                                         f32 %209 = OpCompositeExtract %208 1 
					                                Private f32* %210 = OpAccessChain %189 %130 
					                                                      OpStore %210 %209 
					                                Uniform f32* %212 = OpAccessChain %17 %39 
					                                         f32 %213 = OpLoad %212 
					                                Uniform f32* %215 = OpAccessChain %17 %214 
					                                         f32 %216 = OpLoad %215 
					                                         f32 %217 = OpFMul %213 %216 
					                                                      OpStore %211 %217 
					                                         f32 %219 = OpLoad %211 
					                                         f32 %220 = OpFNegate %219 
					                                         f32 %222 = OpFMul %220 %221 
					                                         f32 %223 = OpFAdd %222 %193 
					                                Private f32* %224 = OpAccessChain %218 %47 
					                                                      OpStore %224 %223 
					                                         f32 %225 = OpLoad %129 
					                                       f32_2 %226 = OpCompositeConstruct %225 %225 
					                                       f32_2 %227 = OpFNegate %226 
					                                       f32_2 %228 = OpLoad %218 
					                                       f32_2 %229 = OpVectorShuffle %228 %228 0 0 
					                                       f32_2 %230 = OpFMul %227 %229 
					                                       f32_3 %231 = OpLoad %9 
					                                       f32_2 %232 = OpVectorShuffle %231 %231 0 1 
					                                       f32_2 %233 = OpFAdd %230 %232 
					                                                      OpStore %218 %233 
					                         read_only Texture2D %234 = OpLoad %201 
					                                     sampler %235 = OpLoad %203 
					                  read_only Texture2DSampled %236 = OpSampledImage %234 %235 
					                                       f32_2 %237 = OpLoad %218 
					                                       f32_4 %238 = OpImageSampleImplicitLod %236 %237 
					                                         f32 %239 = OpCompositeExtract %238 0 
					                                Private f32* %240 = OpAccessChain %189 %47 
					                                                      OpStore %240 %239 
					                                         f32 %241 = OpLoad %211 
					                                         f32 %242 = OpFMul %241 %221 
					                                         f32 %243 = OpFAdd %242 %193 
					                                                      OpStore %211 %243 
					                                         f32 %244 = OpLoad %129 
					                                       f32_2 %245 = OpCompositeConstruct %244 %244 
					                                       f32_2 %246 = OpFNegate %245 
					                                         f32 %247 = OpLoad %211 
					                                       f32_2 %248 = OpCompositeConstruct %247 %247 
					                                       f32_2 %249 = OpFMul %246 %248 
					                                       f32_3 %250 = OpLoad %9 
					                                       f32_2 %251 = OpVectorShuffle %250 %250 0 1 
					                                       f32_2 %252 = OpFAdd %249 %251 
					                                                      OpStore %218 %252 
					                         read_only Texture2D %253 = OpLoad %201 
					                                     sampler %254 = OpLoad %203 
					                  read_only Texture2DSampled %255 = OpSampledImage %253 %254 
					                                       f32_2 %256 = OpLoad %218 
					                                       f32_4 %257 = OpImageSampleImplicitLod %255 %256 
					                                         f32 %258 = OpCompositeExtract %257 2 
					                                Private f32* %259 = OpAccessChain %189 %69 
					                                                      OpStore %259 %258 
					                         read_only Texture2D %261 = OpLoad %201 
					                                     sampler %262 = OpLoad %203 
					                  read_only Texture2DSampled %263 = OpSampledImage %261 %262 
					                                       f32_3 %264 = OpLoad %9 
					                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
					                                       f32_4 %266 = OpImageSampleImplicitLod %263 %265 
					                                                      OpStore %260 %266 
					                                Private f32* %271 = OpAccessChain %270 %158 %47 
					                                                      OpStore %271 %73 
					                                Private f32* %274 = OpAccessChain %270 %272 %47 
					                                                      OpStore %274 %273 
					                                Private f32* %275 = OpAccessChain %270 %39 %47 
					                                                      OpStore %275 %273 
					                                Private f32* %276 = OpAccessChain %270 %185 %47 
					                                                      OpStore %276 %273 
					                                Private f32* %277 = OpAccessChain %270 %88 %47 
					                                                      OpStore %277 %273 
					                                Private f32* %278 = OpAccessChain %270 %214 %47 
					                                                      OpStore %278 %273 
					                                Private f32* %280 = OpAccessChain %279 %47 
					                                                      OpStore %280 %73 
					                                Private f32* %281 = OpAccessChain %279 %130 
					                                                      OpStore %281 %73 
					                                Private f32* %282 = OpAccessChain %279 %69 
					                                                      OpStore %282 %73 
					                                                      OpStore %284 %285 
					                                                      OpBranch %286 
					                                             %286 = OpLabel 
					                                                      OpLoopMerge %288 %289 None 
					                                                      OpBranch %290 
					                                             %290 = OpLabel 
					                                                      OpBranchConditional %292 %287 %288 
					                                             %287 = OpLabel 
					                                         i32 %295 = OpLoad %284 
					                                        bool %296 = OpSLessThan %272 %295 
					                                                      OpStore %294 %296 
					                                        bool %297 = OpLoad %294 
					                                                      OpSelectionMerge %299 None 
					                                                      OpBranchConditional %297 %298 %299 
					                                             %298 = OpLabel 
					                                                      OpBranch %288 
					                                             %299 = OpLabel 
					                                         i32 %304 = OpLoad %284 
					                                       i32_2 %305 = OpCompositeConstruct %304 %304 
					                                       i32_2 %307 = OpIAdd %305 %306 
					                                                      OpStore %303 %307 
					                                Private i32* %308 = OpAccessChain %303 %47 
					                                         i32 %309 = OpLoad %308 
					                                Private f32* %310 = OpAccessChain %270 %309 %47 
					                                         f32 %311 = OpLoad %310 
					                                                      OpStore %211 %311 
					                                         i32 %313 = OpLoad %284 
					                                         f32 %314 = OpConvertSToF %313 
					                                                      OpStore %312 %314 
					                                         f32 %316 = OpLoad %312 
					                                Uniform f32* %317 = OpAccessChain %17 %272 
					                                         f32 %318 = OpLoad %317 
					                                         f32 %319 = OpFMul %316 %318 
					                                Private f32* %320 = OpAccessChain %315 %47 
					                                                      OpStore %320 %319 
					                                       f32_4 %322 = OpLoad %279 
					                                       f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
					                                       f32_4 %324 = OpLoad %321 
					                                       f32_4 %325 = OpVectorShuffle %324 %323 4 1 5 6 
					                                                      OpStore %321 %325 
					                                                      OpStore %326 %285 
					                                                      OpBranch %327 
					                                             %327 = OpLabel 
					                                                      OpLoopMerge %329 %330 None 
					                                                      OpBranch %331 
					                                             %331 = OpLabel 
					                                                      OpBranchConditional %292 %328 %329 
					                                             %328 = OpLabel 
					                                         i32 %333 = OpLoad %326 
					                                        bool %334 = OpSLessThan %272 %333 
					                                                      OpStore %332 %334 
					                                        bool %335 = OpLoad %332 
					                                                      OpSelectionMerge %337 None 
					                                                      OpBranchConditional %335 %336 %337 
					                                             %336 = OpLabel 
					                                                      OpBranch %329 
					                                             %337 = OpLabel 
					                                         i32 %340 = OpLoad %326 
					                                       i32_2 %341 = OpCompositeConstruct %340 %340 
					                                       i32_2 %342 = OpIAdd %341 %306 
					                                                      OpStore %339 %342 
					                                Private i32* %344 = OpAccessChain %339 %47 
					                                         i32 %345 = OpLoad %344 
					                                Private f32* %346 = OpAccessChain %270 %345 %47 
					                                         f32 %347 = OpLoad %346 
					                                                      OpStore %343 %347 
					                                         f32 %348 = OpLoad %211 
					                                         f32 %349 = OpLoad %343 
					                                         f32 %350 = OpFMul %348 %349 
					                                                      OpStore %343 %350 
					                                         i32 %352 = OpLoad %326 
					                                         f32 %353 = OpConvertSToF %352 
					                                Private f32* %354 = OpAccessChain %351 %47 
					                                                      OpStore %354 %353 
					                                Private f32* %355 = OpAccessChain %351 %47 
					                                         f32 %356 = OpLoad %355 
					                                Uniform f32* %357 = OpAccessChain %17 %272 
					                                         f32 %358 = OpLoad %357 
					                                         f32 %359 = OpFMul %356 %358 
					                                Private f32* %360 = OpAccessChain %315 %130 
					                                                      OpStore %360 %359 
					                                       f32_3 %361 = OpLoad %9 
					                                       f32_2 %362 = OpVectorShuffle %361 %361 0 1 
					                                       f32_2 %363 = OpLoad %315 
					                                       f32_2 %364 = OpFAdd %362 %363 
					                                                      OpStore %351 %364 
					                         read_only Texture2D %366 = OpLoad %201 
					                                     sampler %367 = OpLoad %203 
					                  read_only Texture2DSampled %368 = OpSampledImage %366 %367 
					                                       f32_2 %369 = OpLoad %351 
					                                       f32_4 %370 = OpImageSampleImplicitLod %368 %369 
					                                       f32_3 %371 = OpVectorShuffle %370 %370 0 1 2 
					                                                      OpStore %365 %371 
					                                         f32 %372 = OpLoad %343 
					                                       f32_3 %373 = OpCompositeConstruct %372 %372 %372 
					                                       f32_3 %374 = OpLoad %365 
					                                       f32_3 %375 = OpFMul %373 %374 
					                                       f32_4 %376 = OpLoad %321 
					                                       f32_3 %377 = OpVectorShuffle %376 %376 0 2 3 
					                                       f32_3 %378 = OpFAdd %375 %377 
					                                       f32_4 %379 = OpLoad %321 
					                                       f32_4 %380 = OpVectorShuffle %379 %378 4 1 5 6 
					                                                      OpStore %321 %380 
					                                Private i32* %381 = OpAccessChain %339 %130 
					                                         i32 %382 = OpLoad %381 
					                                                      OpStore %326 %382 
					                                                      OpBranch %330 
					                                             %330 = OpLabel 
					                                                      OpBranch %327 
					                                             %329 = OpLabel 
					                                       f32_4 %383 = OpLoad %321 
					                                       f32_3 %384 = OpVectorShuffle %383 %383 0 2 3 
					                                       f32_4 %385 = OpLoad %279 
					                                       f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
					                                                      OpStore %279 %386 
					                                Private i32* %387 = OpAccessChain %303 %130 
					                                         i32 %388 = OpLoad %387 
					                                                      OpStore %284 %388 
					                                                      OpBranch %289 
					                                             %289 = OpLabel 
					                                                      OpBranch %286 
					                                             %288 = OpLabel 
					                                       f32_4 %389 = OpLoad %279 
					                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
					                                       f32_3 %392 = OpFMul %390 %391 
					                                       f32_4 %393 = OpLoad %279 
					                                       f32_4 %394 = OpVectorShuffle %393 %392 4 5 6 3 
					                                                      OpStore %279 %394 
					                                Private f32* %396 = OpAccessChain %279 %395 
					                                                      OpStore %396 %44 
					                                Uniform f32* %397 = OpAccessChain %17 %39 
					                                         f32 %398 = OpLoad %397 
					                                Uniform f32* %399 = OpAccessChain %17 %39 
					                                         f32 %400 = OpLoad %399 
					                                Uniform f32* %401 = OpAccessChain %17 %39 
					                                         f32 %402 = OpLoad %401 
					                                Uniform f32* %403 = OpAccessChain %17 %39 
					                                         f32 %404 = OpLoad %403 
					                                       f32_4 %405 = OpCompositeConstruct %398 %400 %402 %404 
					                                         f32 %406 = OpCompositeExtract %405 0 
					                                         f32 %407 = OpCompositeExtract %405 1 
					                                         f32 %408 = OpCompositeExtract %405 2 
					                                         f32 %409 = OpCompositeExtract %405 3 
					                                       f32_4 %410 = OpCompositeConstruct %406 %407 %408 %409 
					                                       f32_4 %411 = OpFNegate %410 
					                                       f32_4 %413 = OpFMul %411 %412 
					                                       f32_4 %414 = OpLoad %279 
					                                       f32_4 %415 = OpFAdd %413 %414 
					                                                      OpStore %279 %415 
					                                Private f32* %416 = OpAccessChain %38 %47 
					                                         f32 %417 = OpLoad %416 
					                                Uniform f32* %419 = OpAccessChain %17 %418 
					                                         f32 %420 = OpLoad %419 
					                                         f32 %421 = OpFMul %417 %420 
					                                Private f32* %422 = OpAccessChain %9 %47 
					                                                      OpStore %422 %421 
					                                Private f32* %423 = OpAccessChain %9 %47 
					                                         f32 %424 = OpLoad %423 
					                                Private f32* %425 = OpAccessChain %9 %130 
					                                         f32 %426 = OpLoad %425 
					                                         f32 %427 = OpFMul %424 %426 
					                                Private f32* %428 = OpAccessChain %9 %47 
					                                                      OpStore %428 %427 
					                                Private f32* %429 = OpAccessChain %9 %47 
					                                         f32 %430 = OpLoad %429 
					                                         f32 %432 = OpFMul %430 %431 
					                                Private f32* %433 = OpAccessChain %83 %69 
					                                         f32 %434 = OpLoad %433 
					                                         f32 %435 = OpFAdd %432 %434 
					                                Private f32* %436 = OpAccessChain %9 %47 
					                                                      OpStore %436 %435 
					                                Private f32* %437 = OpAccessChain %9 %47 
					                                         f32 %438 = OpLoad %437 
					                                         f32 %439 = OpExtInst %1 13 %438 
					                                Private f32* %440 = OpAccessChain %9 %47 
					                                                      OpStore %440 %439 
					                                Private f32* %441 = OpAccessChain %9 %47 
					                                         f32 %442 = OpLoad %441 
					                                         f32 %444 = OpFMul %442 %443 
					                                         f32 %445 = OpFAdd %444 %443 
					                                Private f32* %446 = OpAccessChain %9 %47 
					                                                      OpStore %446 %445 
					                                Private f32* %447 = OpAccessChain %9 %47 
					                                         f32 %448 = OpLoad %447 
					                                         f32 %449 = OpExtInst %1 30 %448 
					                                Private f32* %450 = OpAccessChain %9 %47 
					                                                      OpStore %450 %449 
					                                Private f32* %451 = OpAccessChain %9 %47 
					                                         f32 %452 = OpLoad %451 
					                                         f32 %454 = OpFMul %452 %453 
					                                Private f32* %455 = OpAccessChain %9 %47 
					                                                      OpStore %455 %454 
					                                Private f32* %456 = OpAccessChain %9 %47 
					                                         f32 %457 = OpLoad %456 
					                                         f32 %458 = OpExtInst %1 29 %457 
					                                Private f32* %459 = OpAccessChain %9 %47 
					                                                      OpStore %459 %458 
					                                Private f32* %460 = OpAccessChain %189 %395 
					                                                      OpStore %460 %44 
					                                       f32_4 %461 = OpLoad %189 
					                              Uniform f32_4* %463 = OpAccessChain %17 %462 
					                                       f32_4 %464 = OpLoad %463 
					                                       f32_4 %465 = OpFMul %461 %464 
					                                                      OpStore %189 %465 
					                                Private f32* %466 = OpAccessChain %9 %47 
					                                         f32 %467 = OpLoad %466 
					                                         f32 %469 = OpFMul %467 %468 
					                                         f32 %470 = OpFAdd %469 %273 
					                                Private f32* %471 = OpAccessChain %9 %47 
					                                                      OpStore %471 %470 
					                                       f32_4 %472 = OpLoad %189 
					                                       f32_3 %473 = OpLoad %9 
					                                       f32_4 %474 = OpVectorShuffle %473 %473 0 0 0 0 
					                                       f32_4 %475 = OpFMul %472 %474 
					                                       f32_4 %476 = OpLoad %189 
					                                       f32_4 %477 = OpFNegate %476 
					                                       f32_4 %478 = OpFAdd %475 %477 
					                                                      OpStore %321 %478 
					                                Uniform f32* %480 = OpAccessChain %17 %479 
					                                         f32 %481 = OpLoad %480 
					                                Uniform f32* %482 = OpAccessChain %17 %479 
					                                         f32 %483 = OpLoad %482 
					                                Uniform f32* %484 = OpAccessChain %17 %479 
					                                         f32 %485 = OpLoad %484 
					                                Uniform f32* %486 = OpAccessChain %17 %479 
					                                         f32 %487 = OpLoad %486 
					                                       f32_4 %488 = OpCompositeConstruct %481 %483 %485 %487 
					                                         f32 %489 = OpCompositeExtract %488 0 
					                                         f32 %490 = OpCompositeExtract %488 1 
					                                         f32 %491 = OpCompositeExtract %488 2 
					                                         f32 %492 = OpCompositeExtract %488 3 
					                                       f32_4 %493 = OpCompositeConstruct %489 %490 %491 %492 
					                                       f32_4 %494 = OpLoad %321 
					                                       f32_4 %495 = OpFMul %493 %494 
					                                       f32_4 %496 = OpLoad %189 
					                                       f32_4 %497 = OpFAdd %495 %496 
					                                                      OpStore %189 %497 
					                                       f32_4 %498 = OpLoad %189 
					                                       f32_4 %499 = OpFNegate %498 
					                                       f32_4 %500 = OpLoad %279 
					                                       f32_4 %501 = OpFAdd %499 %500 
					                                                      OpStore %321 %501 
					                                       f32_3 %502 = OpLoad %143 
					                                       f32_4 %503 = OpVectorShuffle %502 %502 2 2 2 2 
					                                       f32_4 %504 = OpLoad %321 
					                                       f32_4 %505 = OpFMul %503 %504 
					                                       f32_4 %506 = OpLoad %189 
					                                       f32_4 %507 = OpFAdd %505 %506 
					                                                      OpStore %189 %507 
					                                Private f32* %509 = OpAccessChain %143 %130 
					                                         f32 %510 = OpLoad %509 
					                                         f32 %512 = OpFAdd %510 %511 
					                                                      OpStore %508 %512 
					                                         f32 %513 = OpLoad %508 
					                                         f32 %515 = OpFMul %513 %514 
					                                Private f32* %516 = OpAccessChain %9 %47 
					                                                      OpStore %516 %515 
					                                Private f32* %517 = OpAccessChain %9 %47 
					                                         f32 %518 = OpLoad %517 
					                                         f32 %519 = OpExtInst %1 43 %518 %73 %44 
					                                Private f32* %520 = OpAccessChain %9 %47 
					                                                      OpStore %520 %519 
					                                Private f32* %522 = OpAccessChain %9 %47 
					                                         f32 %523 = OpLoad %522 
					                                         f32 %524 = OpFMul %523 %79 
					                                         f32 %525 = OpFAdd %524 %81 
					                                                      OpStore %521 %525 
					                                       f32_3 %526 = OpLoad %9 
					                                       f32_2 %527 = OpVectorShuffle %526 %526 0 2 
					                                       f32_3 %528 = OpLoad %9 
					                                       f32_2 %529 = OpVectorShuffle %528 %528 0 2 
					                                       f32_2 %530 = OpFMul %527 %529 
					                                       f32_3 %531 = OpLoad %9 
					                                       f32_3 %532 = OpVectorShuffle %531 %530 3 1 4 
					                                                      OpStore %9 %532 
					                                         f32 %533 = OpLoad %521 
					                                         f32 %534 = OpFNegate %533 
					                                Private f32* %535 = OpAccessChain %9 %47 
					                                         f32 %536 = OpLoad %535 
					                                         f32 %537 = OpFMul %534 %536 
					                                         f32 %538 = OpFAdd %537 %44 
					                                Private f32* %539 = OpAccessChain %9 %47 
					                                                      OpStore %539 %538 
					                                       f32_3 %540 = OpLoad %9 
					                                       f32_4 %541 = OpVectorShuffle %540 %540 0 0 0 0 
					                                       f32_4 %542 = OpFNegate %541 
					                                       f32_4 %545 = OpFMul %542 %544 
					                                       f32_4 %546 = OpLoad %107 
					                                       f32_4 %547 = OpFAdd %545 %546 
					                                                      OpStore %107 %547 
					                                       f32_4 %548 = OpLoad %189 
					                                       f32_4 %549 = OpFNegate %548 
					                                       f32_4 %550 = OpLoad %107 
					                                       f32_4 %551 = OpFAdd %549 %550 
					                                                      OpStore %107 %551 
					                                       f32_3 %552 = OpLoad %143 
					                                       f32_4 %553 = OpVectorShuffle %552 %552 0 0 0 0 
					                                       f32_4 %554 = OpLoad %107 
					                                       f32_4 %555 = OpFMul %553 %554 
					                                       f32_4 %556 = OpLoad %189 
					                                       f32_4 %557 = OpFAdd %555 %556 
					                                                      OpStore %50 %557 
					                                       f32_4 %558 = OpLoad %279 
					                                       f32_4 %559 = OpFNegate %558 
					                                       f32_4 %560 = OpLoad %50 
					                                       f32_4 %561 = OpFAdd %559 %560 
					                                                      OpStore %50 %561 
					                                       f32_3 %562 = OpLoad %83 
					                                       f32_4 %563 = OpVectorShuffle %562 %562 0 0 0 0 
					                                       f32_4 %564 = OpLoad %50 
					                                       f32_4 %565 = OpFMul %563 %564 
					                                       f32_4 %566 = OpLoad %279 
					                                       f32_4 %567 = OpFAdd %565 %566 
					                                                      OpStore %38 %567 
					                                       f32_4 %568 = OpLoad %260 
					                              Uniform f32_4* %569 = OpAccessChain %17 %462 
					                                       f32_4 %570 = OpLoad %569 
					                                       f32_4 %571 = OpFMul %568 %570 
					                                       f32_4 %572 = OpLoad %260 
					                                       f32_4 %573 = OpFNegate %572 
					                                       f32_4 %574 = OpFAdd %571 %573 
					                                                      OpStore %50 %574 
					                                Uniform f32* %576 = OpAccessChain %17 %575 
					                                         f32 %577 = OpLoad %576 
					                                       f32_4 %578 = OpCompositeConstruct %577 %577 %577 %577 
					                                       f32_4 %579 = OpLoad %50 
					                                       f32_4 %580 = OpFMul %578 %579 
					                                       f32_4 %581 = OpLoad %260 
					                                       f32_4 %582 = OpFAdd %580 %581 
					                                                      OpStore %50 %582 
					                                         f32 %583 = OpLoad %76 
					                                         f32 %584 = OpFNegate %583 
					                                Private f32* %585 = OpAccessChain %9 %69 
					                                         f32 %586 = OpLoad %585 
					                                         f32 %587 = OpFMul %584 %586 
					                                         f32 %588 = OpFAdd %587 %44 
					                                Private f32* %589 = OpAccessChain %9 %47 
					                                                      OpStore %589 %588 
					                                       f32_4 %590 = OpLoad %38 
					                                       f32_4 %591 = OpLoad %50 
					                                       f32_4 %592 = OpFNegate %591 
					                                       f32_4 %593 = OpFAdd %590 %592 
					                                                      OpStore %38 %593 
					                                       f32_3 %596 = OpLoad %9 
					                                       f32_4 %597 = OpVectorShuffle %596 %596 0 0 0 0 
					                                       f32_4 %598 = OpLoad %38 
					                                       f32_4 %599 = OpFMul %597 %598 
					                                       f32_4 %600 = OpLoad %50 
					                                       f32_4 %601 = OpFAdd %599 %600 
					                                                      OpStore %595 %601 
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
						float Fade;
						float VisionBlur;
						float GlassDistortion;
						float GlassAberration;
						vec4 GlassesColor;
						vec4 GlassesColor2;
						vec4 GlassColor;
						float UseFinalGlassColor;
						float UseScanLine;
						float UseScanLineSize;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex2;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					float u_xlat16_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat10_7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					vec4 u_xlat10_10;
					float u_xlat11;
					vec3 u_xlat12;
					float u_xlat16;
					ivec2 u_xlati16;
					vec2 u_xlat19;
					vec2 u_xlat22;
					float u_xlat23;
					float u_xlat16_23;
					int u_xlati23;
					float u_xlat30;
					ivec2 u_xlati30;
					float u_xlat33;
					float u_xlat35;
					bool u_xlatb35;
					float u_xlat38;
					bool u_xlatb38;
					vec4 TempArray0[6];
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat22.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = (-Fade) + 1.0;
					    u_xlat2.xy = u_xlat22.xy * u_xlat1.xx + vec2(0.5, 0.5);
					    u_xlat22.x = Fade + -0.699999988;
					    u_xlat0.z = u_xlat22.x * 3.33333325;
					    u_xlat0.z = clamp(u_xlat0.z, 0.0, 1.0);
					    u_xlat33 = u_xlat0.z * -2.0 + 3.0;
					    u_xlat12.xyz = vec3(Fade, Fade, _TimeX) * vec3(3.33333325, 5.0, 3.5);
					    u_xlat12.xy = u_xlat12.xy;
					    u_xlat12.xy = clamp(u_xlat12.xy, 0.0, 1.0);
					    u_xlat3.xy = u_xlat12.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					    u_xlat12.xy = u_xlat12.xy * u_xlat12.xy;
					    u_xlat12.x = u_xlat12.x * u_xlat3.x;
					    u_xlat23 = (-u_xlat3.y) * u_xlat12.y + u_xlat2.y;
					    u_xlat2.z = min(u_xlat23, 0.0);
					    u_xlat10_2 = texture(_MainTex2, u_xlat2.xz);
					    u_xlat3 = (-GlassesColor) + GlassesColor2;
					    u_xlat3 = u_xlat10_2.yyyy * u_xlat3 + GlassesColor;
					    u_xlat16_23 = (-u_xlat10_2.x) + u_xlat10_2.y;
					    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
					    u_xlat16_23 = u_xlat16_23 + -0.5;
					    u_xlat23 = u_xlat16_23 * GlassDistortion;
					    u_xlat4.xy = (-vec2(u_xlat23)) * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
					    u_xlat10_4 = texture(_MainTex, u_xlat4.xy);
					    u_xlat35 = Fade * GlassAberration;
					    u_xlat4.x = (-u_xlat35) * 0.25 + 0.200000003;
					    u_xlat4.xz = (-vec2(u_xlat23)) * u_xlat4.xx + u_xlat0.xy;
					    u_xlat10_5 = texture(_MainTex, u_xlat4.xz);
					    u_xlat35 = u_xlat35 * 0.25 + 0.200000003;
					    u_xlat4.xz = (-vec2(u_xlat23)) * vec2(u_xlat35) + u_xlat0.xy;
					    u_xlat6 = texture(_MainTex, u_xlat4.xz);
					    u_xlat10_7 = texture(_MainTex, u_xlat0.xy);
					    TempArray0[5].x = 0.0;
					    TempArray0[2].x = 0.400000006;
					    TempArray0[1].x = 0.400000006;
					    TempArray0[3].x = 0.400000006;
					    TempArray0[0].x = 0.400000006;
					    TempArray0[4].x = 0.400000006;
					    u_xlat4.x = float(0.0);
					    u_xlat4.z = float(0.0);
					    u_xlat4.w = float(0.0);
					    u_xlati23 = int(0xFFFFFFFEu);
					    while(true){
					        u_xlatb35 = 2<u_xlati23;
					        if(u_xlatb35){break;}
					        u_xlati16.xy = ivec2(u_xlati23) + ivec2(2, 1);
					        u_xlat35 = TempArray0[u_xlati16.x].x;
					        u_xlat16 = float(u_xlati23);
					        u_xlat8.x = u_xlat16 * VisionBlur;
					        u_xlat9.xyz = u_xlat4.xzw;
					        u_xlati16.x = int(0xFFFFFFFEu);
					        while(true){
					            u_xlatb38 = 2<u_xlati16.x;
					            if(u_xlatb38){break;}
					            u_xlati30.xy = u_xlati16.xx + ivec2(2, 1);
					            u_xlat38 = TempArray0[u_xlati30.x].x;
					            u_xlat38 = u_xlat35 * u_xlat38;
					            u_xlat30 = float(u_xlati16.x);
					            u_xlat8.y = u_xlat30 * VisionBlur;
					            u_xlat19.xy = u_xlat0.xy + u_xlat8.xy;
					            u_xlat10_10 = texture(_MainTex, u_xlat19.xy);
					            u_xlat9.xyz = vec3(u_xlat38) * u_xlat10_10.xyz + u_xlat9.xyz;
					            u_xlati16.x = u_xlati30.y;
					        }
					        u_xlat4.xzw = u_xlat9.xyz;
					        u_xlati23 = u_xlati16.y;
					    }
					    u_xlat8.xyz = u_xlat4.xzw * vec3(0.25, 0.25, 0.25);
					    u_xlat8.w = 1.0;
					    u_xlat8 = (-vec4(vec4(Fade, Fade, Fade, Fade))) * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003) + u_xlat8;
					    u_xlat0.x = u_xlat1.x * UseScanLineSize;
					    u_xlat0.x = u_xlat0.x * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * 1.5 + u_xlat12.z;
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 0.349999994 + 0.349999994;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 1.70000005;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat6.x = u_xlat10_5.x;
					    u_xlat6.y = u_xlat10_4.y;
					    u_xlat6.w = 1.0;
					    u_xlat4 = u_xlat6 * GlassColor;
					    u_xlat0.x = u_xlat0.x * 0.699999988 + 0.400000006;
					    u_xlat5 = u_xlat4 * u_xlat0.xxxx + (-u_xlat4);
					    u_xlat4 = vec4(vec4(UseScanLine, UseScanLine, UseScanLine, UseScanLine)) * u_xlat5 + u_xlat4;
					    u_xlat5 = (-u_xlat4) + u_xlat8;
					    u_xlat4 = u_xlat10_2.zzzz * u_xlat5 + u_xlat4;
					    u_xlat16_0 = u_xlat10_2.y + -0.100000001;
					    u_xlat0.x = u_xlat16_0 * 2.5;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
					    u_xlat0.xz = u_xlat0.xz * u_xlat0.xz;
					    u_xlat0.x = (-u_xlat11) * u_xlat0.x + 1.0;
					    u_xlat3 = (-u_xlat0.xxxx) * vec4(0.800000012, 0.800000012, 0.800000012, 0.800000012) + u_xlat3;
					    u_xlat3 = (-u_xlat4) + u_xlat3;
					    u_xlat2 = u_xlat10_2.xxxx * u_xlat3 + u_xlat4;
					    u_xlat2 = (-u_xlat8) + u_xlat2;
					    u_xlat1 = u_xlat12.xxxx * u_xlat2 + u_xlat8;
					    u_xlat2 = u_xlat10_7 * GlassColor + (-u_xlat10_7);
					    u_xlat2 = vec4(UseFinalGlassColor) * u_xlat2 + u_xlat10_7;
					    u_xlat0.x = (-u_xlat33) * u_xlat0.z + 1.0;
					    u_xlat1 = u_xlat1 + (-u_xlat2);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
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