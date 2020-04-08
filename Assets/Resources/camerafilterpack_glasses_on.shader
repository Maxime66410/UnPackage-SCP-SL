Shader "CameraFilterPack/Glasses_On" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2 ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 15992
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
					in  vec2 vs_TEXCOORD1;
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
					    u_xlat22.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
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
					    u_xlat4 = u_xlat6 + GlassColor;
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
					    u_xlat2 = GlassColor * vec4(UseFinalGlassColor);
					    u_xlat2 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat10_7;
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
					; Bound: 601
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %33 %593 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
					                                                      OpDecorate vs_TEXCOORD1 Location 33 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %147 RelaxedPrecision 
					                                                      OpDecorate %147 DescriptorSet 147 
					                                                      OpDecorate %147 Binding 147 
					                                                      OpDecorate %148 RelaxedPrecision 
					                                                      OpDecorate %151 RelaxedPrecision 
					                                                      OpDecorate %151 DescriptorSet 151 
					                                                      OpDecorate %151 Binding 151 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %167 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %179 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %181 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %184 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %202 RelaxedPrecision 
					                                                      OpDecorate %202 DescriptorSet 202 
					                                                      OpDecorate %202 Binding 202 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %204 DescriptorSet 204 
					                                                      OpDecorate %204 Binding 204 
					                                                      OpDecorate %205 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %261 RelaxedPrecision 
					                                                      OpDecorate %262 RelaxedPrecision 
					                                                      OpDecorate %263 RelaxedPrecision 
					                                                      OpDecorate %366 RelaxedPrecision 
					                                                      OpDecorate %367 RelaxedPrecision 
					                                                      OpDecorate %368 RelaxedPrecision 
					                                                      OpDecorate %372 RelaxedPrecision 
					                                                      OpDecorate %374 RelaxedPrecision 
					                                                      OpDecorate %375 RelaxedPrecision 
					                                                      OpDecorate %376 RelaxedPrecision 
					                                                      OpDecorate %503 RelaxedPrecision 
					                                                      OpDecorate %504 RelaxedPrecision 
					                                                      OpDecorate %509 RelaxedPrecision 
					                                                      OpDecorate %511 RelaxedPrecision 
					                                                      OpDecorate %513 RelaxedPrecision 
					                                                      OpDecorate %514 RelaxedPrecision 
					                                                      OpDecorate %516 RelaxedPrecision 
					                                                      OpDecorate %553 RelaxedPrecision 
					                                                      OpDecorate %554 RelaxedPrecision 
					                                                      OpDecorate %579 RelaxedPrecision 
					                                                      OpDecorate %593 Location 593 
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
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                          f32 %35 = OpConstant 3,674022E-40 
					                                        f32_2 %36 = OpConstantComposite %35 %35 
					                                              %38 = OpTypePointer Private %14 
					                               Private f32_4* %39 = OpVariable Private 
					                                          i32 %40 = OpConstant 1 
					                                              %41 = OpTypePointer Uniform %6 
					                                          f32 %45 = OpConstant 3,674022E-40 
					                                              %47 = OpTypeInt 32 0 
					                                          u32 %48 = OpConstant 0 
					                                              %49 = OpTypePointer Private %6 
					                               Private f32_4* %51 = OpVariable Private 
					                                          f32 %56 = OpConstant 3,674022E-40 
					                                        f32_2 %57 = OpConstantComposite %56 %56 
					                                          f32 %63 = OpConstant 3,674022E-40 
					                                          f32 %68 = OpConstant 3,674022E-40 
					                                          u32 %70 = OpConstant 2 
					                                          f32 %74 = OpConstant 3,674022E-40 
					                                 Private f32* %77 = OpVariable Private 
					                                          f32 %80 = OpConstant 3,674022E-40 
					                                          f32 %82 = OpConstant 3,674022E-40 
					                               Private f32_3* %84 = OpVariable Private 
					                                          i32 %89 = OpConstant 0 
					                                          f32 %93 = OpConstant 3,674022E-40 
					                                          f32 %94 = OpConstant 3,674022E-40 
					                                        f32_3 %95 = OpConstantComposite %68 %93 %94 
					                              Private f32_4* %108 = OpVariable Private 
					                                       f32_2 %111 = OpConstantComposite %80 %80 
					                                       f32_2 %113 = OpConstantComposite %82 %82 
					                                Private f32* %130 = OpVariable Private 
					                                         u32 %131 = OpConstant 1 
					                              Private f32_3* %144 = OpVariable Private 
					                                             %145 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                             %146 = OpTypePointer UniformConstant %145 
					        UniformConstant read_only Texture2D* %147 = OpVariable UniformConstant 
					                                             %149 = OpTypeSampler 
					                                             %150 = OpTypePointer UniformConstant %149 
					                    UniformConstant sampler* %151 = OpVariable UniformConstant 
					                                             %153 = OpTypeSampledImage %145 
					                                         i32 %159 = OpConstant 5 
					                                         i32 %163 = OpConstant 6 
					                                Private f32* %174 = OpVariable Private 
					                                         i32 %186 = OpConstant 3 
					                              Private f32_4* %190 = OpVariable Private 
					                                         f32 %194 = OpConstant 3,674022E-40 
					                                       f32_2 %195 = OpConstantComposite %194 %194 
					        UniformConstant read_only Texture2D* %202 = OpVariable UniformConstant 
					                    UniformConstant sampler* %204 = OpVariable UniformConstant 
					                                Private f32* %212 = OpVariable Private 
					                                         i32 %215 = OpConstant 4 
					                              Private f32_2* %219 = OpVariable Private 
					                                         f32 %222 = OpConstant 3,674022E-40 
					                              Private f32_4* %261 = OpVariable Private 
					                                         u32 %268 = OpConstant 6 
					                                             %269 = OpTypeArray %14 %268 
					                                             %270 = OpTypePointer Private %269 
					                           Private f32_4[6]* %271 = OpVariable Private 
					                                         i32 %273 = OpConstant 2 
					                                         f32 %274 = OpConstant 3,674022E-40 
					                              Private f32_4* %280 = OpVariable Private 
					                                             %284 = OpTypePointer Private %18 
					                                Private i32* %285 = OpVariable Private 
					                                         i32 %286 = OpConstant -2 
					                                             %292 = OpTypeBool 
					                                        bool %293 = OpConstantTrue 
					                                             %294 = OpTypePointer Private %292 
					                               Private bool* %295 = OpVariable Private 
					                                             %302 = OpTypeVector %18 2 
					                                             %303 = OpTypePointer Private %302 
					                              Private i32_2* %304 = OpVariable Private 
					                                       i32_2 %307 = OpConstantComposite %273 %40 
					                                Private f32* %313 = OpVariable Private 
					                              Private f32_2* %316 = OpVariable Private 
					                              Private f32_4* %322 = OpVariable Private 
					                                Private i32* %327 = OpVariable Private 
					                               Private bool* %333 = OpVariable Private 
					                              Private i32_2* %340 = OpVariable Private 
					                                Private f32* %344 = OpVariable Private 
					                              Private f32_2* %352 = OpVariable Private 
					                              Private f32_3* %366 = OpVariable Private 
					                                       f32_3 %392 = OpConstantComposite %222 %222 %222 
					                                         u32 %396 = OpConstant 3 
					                                       f32_4 %413 = OpConstantComposite %194 %194 %194 %194 
					                                         i32 %419 = OpConstant 10 
					                                         f32 %432 = OpConstant 3,674022E-40 
					                                         f32 %444 = OpConstant 3,674022E-40 
					                                         f32 %454 = OpConstant 3,674022E-40 
					                                         i32 %463 = OpConstant 7 
					                                         f32 %469 = OpConstant 3,674022E-40 
					                                         i32 %480 = OpConstant 9 
					                                Private f32* %509 = OpVariable Private 
					                                         f32 %512 = OpConstant 3,674022E-40 
					                                         f32 %515 = OpConstant 3,674022E-40 
					                                Private f32* %522 = OpVariable Private 
					                                         f32 %544 = OpConstant 3,674022E-40 
					                                       f32_4 %545 = OpConstantComposite %544 %544 %544 %544 
					                                         i32 %571 = OpConstant 8 
					                                       f32_4 %577 = OpConstantComposite %56 %56 %56 %56 
					                                             %592 = OpTypePointer Output %14 
					                               Output f32_4* %593 = OpVariable Output 
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
					                                        f32_2 %34 = OpLoad vs_TEXCOORD1 
					                                        f32_2 %37 = OpFAdd %34 %36 
					                                                      OpStore %32 %37 
					                                 Uniform f32* %42 = OpAccessChain %17 %40 
					                                          f32 %43 = OpLoad %42 
					                                          f32 %44 = OpFNegate %43 
					                                          f32 %46 = OpFAdd %44 %45 
					                                 Private f32* %50 = OpAccessChain %39 %48 
					                                                      OpStore %50 %46 
					                                        f32_2 %52 = OpLoad %32 
					                                        f32_4 %53 = OpLoad %39 
					                                        f32_2 %54 = OpVectorShuffle %53 %53 0 0 
					                                        f32_2 %55 = OpFMul %52 %54 
					                                        f32_2 %58 = OpFAdd %55 %57 
					                                        f32_4 %59 = OpLoad %51 
					                                        f32_4 %60 = OpVectorShuffle %59 %58 4 5 2 3 
					                                                      OpStore %51 %60 
					                                 Uniform f32* %61 = OpAccessChain %17 %40 
					                                          f32 %62 = OpLoad %61 
					                                          f32 %64 = OpFAdd %62 %63 
					                                 Private f32* %65 = OpAccessChain %32 %48 
					                                                      OpStore %65 %64 
					                                 Private f32* %66 = OpAccessChain %32 %48 
					                                          f32 %67 = OpLoad %66 
					                                          f32 %69 = OpFMul %67 %68 
					                                 Private f32* %71 = OpAccessChain %9 %70 
					                                                      OpStore %71 %69 
					                                 Private f32* %72 = OpAccessChain %9 %70 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %75 = OpExtInst %1 43 %73 %74 %45 
					                                 Private f32* %76 = OpAccessChain %9 %70 
					                                                      OpStore %76 %75 
					                                 Private f32* %78 = OpAccessChain %9 %70 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %81 = OpFMul %79 %80 
					                                          f32 %83 = OpFAdd %81 %82 
					                                                      OpStore %77 %83 
					                                 Uniform f32* %85 = OpAccessChain %17 %40 
					                                          f32 %86 = OpLoad %85 
					                                 Uniform f32* %87 = OpAccessChain %17 %40 
					                                          f32 %88 = OpLoad %87 
					                                 Uniform f32* %90 = OpAccessChain %17 %89 
					                                          f32 %91 = OpLoad %90 
					                                        f32_3 %92 = OpCompositeConstruct %86 %88 %91 
					                                        f32_3 %96 = OpFMul %92 %95 
					                                                      OpStore %84 %96 
					                                        f32_3 %97 = OpLoad %84 
					                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
					                                        f32_3 %99 = OpLoad %84 
					                                       f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
					                                                      OpStore %84 %100 
					                                       f32_3 %101 = OpLoad %84 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
					                                       f32_2 %103 = OpCompositeConstruct %74 %74 
					                                       f32_2 %104 = OpCompositeConstruct %45 %45 
					                                       f32_2 %105 = OpExtInst %1 43 %102 %103 %104 
					                                       f32_3 %106 = OpLoad %84 
					                                       f32_3 %107 = OpVectorShuffle %106 %105 3 4 2 
					                                                      OpStore %84 %107 
					                                       f32_3 %109 = OpLoad %84 
					                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
					                                       f32_2 %112 = OpFMul %110 %111 
					                                       f32_2 %114 = OpFAdd %112 %113 
					                                       f32_4 %115 = OpLoad %108 
					                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 3 
					                                                      OpStore %108 %116 
					                                       f32_3 %117 = OpLoad %84 
					                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
					                                       f32_3 %119 = OpLoad %84 
					                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
					                                       f32_2 %121 = OpFMul %118 %120 
					                                       f32_3 %122 = OpLoad %84 
					                                       f32_3 %123 = OpVectorShuffle %122 %121 3 4 2 
					                                                      OpStore %84 %123 
					                                Private f32* %124 = OpAccessChain %84 %48 
					                                         f32 %125 = OpLoad %124 
					                                Private f32* %126 = OpAccessChain %108 %48 
					                                         f32 %127 = OpLoad %126 
					                                         f32 %128 = OpFMul %125 %127 
					                                Private f32* %129 = OpAccessChain %84 %48 
					                                                      OpStore %129 %128 
					                                Private f32* %132 = OpAccessChain %108 %131 
					                                         f32 %133 = OpLoad %132 
					                                         f32 %134 = OpFNegate %133 
					                                Private f32* %135 = OpAccessChain %84 %131 
					                                         f32 %136 = OpLoad %135 
					                                         f32 %137 = OpFMul %134 %136 
					                                Private f32* %138 = OpAccessChain %51 %131 
					                                         f32 %139 = OpLoad %138 
					                                         f32 %140 = OpFAdd %137 %139 
					                                                      OpStore %130 %140 
					                                         f32 %141 = OpLoad %130 
					                                         f32 %142 = OpExtInst %1 37 %141 %74 
					                                Private f32* %143 = OpAccessChain %51 %70 
					                                                      OpStore %143 %142 
					                         read_only Texture2D %148 = OpLoad %147 
					                                     sampler %152 = OpLoad %151 
					                  read_only Texture2DSampled %154 = OpSampledImage %148 %152 
					                                       f32_4 %155 = OpLoad %51 
					                                       f32_2 %156 = OpVectorShuffle %155 %155 0 2 
					                                       f32_4 %157 = OpImageSampleImplicitLod %154 %156 
					                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
					                                                      OpStore %144 %158 
					                              Uniform f32_4* %160 = OpAccessChain %17 %159 
					                                       f32_4 %161 = OpLoad %160 
					                                       f32_4 %162 = OpFNegate %161 
					                              Uniform f32_4* %164 = OpAccessChain %17 %163 
					                                       f32_4 %165 = OpLoad %164 
					                                       f32_4 %166 = OpFAdd %162 %165 
					                                                      OpStore %108 %166 
					                                       f32_3 %167 = OpLoad %144 
					                                       f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
					                                       f32_4 %169 = OpLoad %108 
					                                       f32_4 %170 = OpFMul %168 %169 
					                              Uniform f32_4* %171 = OpAccessChain %17 %159 
					                                       f32_4 %172 = OpLoad %171 
					                                       f32_4 %173 = OpFAdd %170 %172 
					                                                      OpStore %108 %173 
					                                Private f32* %175 = OpAccessChain %144 %48 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %177 = OpFNegate %176 
					                                Private f32* %178 = OpAccessChain %144 %131 
					                                         f32 %179 = OpLoad %178 
					                                         f32 %180 = OpFAdd %177 %179 
					                                                      OpStore %174 %180 
					                                         f32 %181 = OpLoad %174 
					                                         f32 %182 = OpExtInst %1 43 %181 %74 %45 
					                                                      OpStore %174 %182 
					                                         f32 %183 = OpLoad %174 
					                                         f32 %184 = OpFAdd %183 %35 
					                                                      OpStore %174 %184 
					                                         f32 %185 = OpLoad %174 
					                                Uniform f32* %187 = OpAccessChain %17 %186 
					                                         f32 %188 = OpLoad %187 
					                                         f32 %189 = OpFMul %185 %188 
					                                                      OpStore %130 %189 
					                                         f32 %191 = OpLoad %130 
					                                       f32_2 %192 = OpCompositeConstruct %191 %191 
					                                       f32_2 %193 = OpFNegate %192 
					                                       f32_2 %196 = OpFMul %193 %195 
					                                       f32_3 %197 = OpLoad %9 
					                                       f32_2 %198 = OpVectorShuffle %197 %197 0 1 
					                                       f32_2 %199 = OpFAdd %196 %198 
					                                       f32_4 %200 = OpLoad %190 
					                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 2 3 
					                                                      OpStore %190 %201 
					                         read_only Texture2D %203 = OpLoad %202 
					                                     sampler %205 = OpLoad %204 
					                  read_only Texture2DSampled %206 = OpSampledImage %203 %205 
					                                       f32_4 %207 = OpLoad %190 
					                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
					                                       f32_4 %209 = OpImageSampleImplicitLod %206 %208 
					                                         f32 %210 = OpCompositeExtract %209 1 
					                                Private f32* %211 = OpAccessChain %190 %131 
					                                                      OpStore %211 %210 
					                                Uniform f32* %213 = OpAccessChain %17 %40 
					                                         f32 %214 = OpLoad %213 
					                                Uniform f32* %216 = OpAccessChain %17 %215 
					                                         f32 %217 = OpLoad %216 
					                                         f32 %218 = OpFMul %214 %217 
					                                                      OpStore %212 %218 
					                                         f32 %220 = OpLoad %212 
					                                         f32 %221 = OpFNegate %220 
					                                         f32 %223 = OpFMul %221 %222 
					                                         f32 %224 = OpFAdd %223 %194 
					                                Private f32* %225 = OpAccessChain %219 %48 
					                                                      OpStore %225 %224 
					                                         f32 %226 = OpLoad %130 
					                                       f32_2 %227 = OpCompositeConstruct %226 %226 
					                                       f32_2 %228 = OpFNegate %227 
					                                       f32_2 %229 = OpLoad %219 
					                                       f32_2 %230 = OpVectorShuffle %229 %229 0 0 
					                                       f32_2 %231 = OpFMul %228 %230 
					                                       f32_3 %232 = OpLoad %9 
					                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
					                                       f32_2 %234 = OpFAdd %231 %233 
					                                                      OpStore %219 %234 
					                         read_only Texture2D %235 = OpLoad %202 
					                                     sampler %236 = OpLoad %204 
					                  read_only Texture2DSampled %237 = OpSampledImage %235 %236 
					                                       f32_2 %238 = OpLoad %219 
					                                       f32_4 %239 = OpImageSampleImplicitLod %237 %238 
					                                         f32 %240 = OpCompositeExtract %239 0 
					                                Private f32* %241 = OpAccessChain %190 %48 
					                                                      OpStore %241 %240 
					                                         f32 %242 = OpLoad %212 
					                                         f32 %243 = OpFMul %242 %222 
					                                         f32 %244 = OpFAdd %243 %194 
					                                                      OpStore %212 %244 
					                                         f32 %245 = OpLoad %130 
					                                       f32_2 %246 = OpCompositeConstruct %245 %245 
					                                       f32_2 %247 = OpFNegate %246 
					                                         f32 %248 = OpLoad %212 
					                                       f32_2 %249 = OpCompositeConstruct %248 %248 
					                                       f32_2 %250 = OpFMul %247 %249 
					                                       f32_3 %251 = OpLoad %9 
					                                       f32_2 %252 = OpVectorShuffle %251 %251 0 1 
					                                       f32_2 %253 = OpFAdd %250 %252 
					                                                      OpStore %219 %253 
					                         read_only Texture2D %254 = OpLoad %202 
					                                     sampler %255 = OpLoad %204 
					                  read_only Texture2DSampled %256 = OpSampledImage %254 %255 
					                                       f32_2 %257 = OpLoad %219 
					                                       f32_4 %258 = OpImageSampleImplicitLod %256 %257 
					                                         f32 %259 = OpCompositeExtract %258 2 
					                                Private f32* %260 = OpAccessChain %190 %70 
					                                                      OpStore %260 %259 
					                         read_only Texture2D %262 = OpLoad %202 
					                                     sampler %263 = OpLoad %204 
					                  read_only Texture2DSampled %264 = OpSampledImage %262 %263 
					                                       f32_3 %265 = OpLoad %9 
					                                       f32_2 %266 = OpVectorShuffle %265 %265 0 1 
					                                       f32_4 %267 = OpImageSampleImplicitLod %264 %266 
					                                                      OpStore %261 %267 
					                                Private f32* %272 = OpAccessChain %271 %159 %48 
					                                                      OpStore %272 %74 
					                                Private f32* %275 = OpAccessChain %271 %273 %48 
					                                                      OpStore %275 %274 
					                                Private f32* %276 = OpAccessChain %271 %40 %48 
					                                                      OpStore %276 %274 
					                                Private f32* %277 = OpAccessChain %271 %186 %48 
					                                                      OpStore %277 %274 
					                                Private f32* %278 = OpAccessChain %271 %89 %48 
					                                                      OpStore %278 %274 
					                                Private f32* %279 = OpAccessChain %271 %215 %48 
					                                                      OpStore %279 %274 
					                                Private f32* %281 = OpAccessChain %280 %48 
					                                                      OpStore %281 %74 
					                                Private f32* %282 = OpAccessChain %280 %131 
					                                                      OpStore %282 %74 
					                                Private f32* %283 = OpAccessChain %280 %70 
					                                                      OpStore %283 %74 
					                                                      OpStore %285 %286 
					                                                      OpBranch %287 
					                                             %287 = OpLabel 
					                                                      OpLoopMerge %289 %290 None 
					                                                      OpBranch %291 
					                                             %291 = OpLabel 
					                                                      OpBranchConditional %293 %288 %289 
					                                             %288 = OpLabel 
					                                         i32 %296 = OpLoad %285 
					                                        bool %297 = OpSLessThan %273 %296 
					                                                      OpStore %295 %297 
					                                        bool %298 = OpLoad %295 
					                                                      OpSelectionMerge %300 None 
					                                                      OpBranchConditional %298 %299 %300 
					                                             %299 = OpLabel 
					                                                      OpBranch %289 
					                                             %300 = OpLabel 
					                                         i32 %305 = OpLoad %285 
					                                       i32_2 %306 = OpCompositeConstruct %305 %305 
					                                       i32_2 %308 = OpIAdd %306 %307 
					                                                      OpStore %304 %308 
					                                Private i32* %309 = OpAccessChain %304 %48 
					                                         i32 %310 = OpLoad %309 
					                                Private f32* %311 = OpAccessChain %271 %310 %48 
					                                         f32 %312 = OpLoad %311 
					                                                      OpStore %212 %312 
					                                         i32 %314 = OpLoad %285 
					                                         f32 %315 = OpConvertSToF %314 
					                                                      OpStore %313 %315 
					                                         f32 %317 = OpLoad %313 
					                                Uniform f32* %318 = OpAccessChain %17 %273 
					                                         f32 %319 = OpLoad %318 
					                                         f32 %320 = OpFMul %317 %319 
					                                Private f32* %321 = OpAccessChain %316 %48 
					                                                      OpStore %321 %320 
					                                       f32_4 %323 = OpLoad %280 
					                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
					                                       f32_4 %325 = OpLoad %322 
					                                       f32_4 %326 = OpVectorShuffle %325 %324 4 1 5 6 
					                                                      OpStore %322 %326 
					                                                      OpStore %327 %286 
					                                                      OpBranch %328 
					                                             %328 = OpLabel 
					                                                      OpLoopMerge %330 %331 None 
					                                                      OpBranch %332 
					                                             %332 = OpLabel 
					                                                      OpBranchConditional %293 %329 %330 
					                                             %329 = OpLabel 
					                                         i32 %334 = OpLoad %327 
					                                        bool %335 = OpSLessThan %273 %334 
					                                                      OpStore %333 %335 
					                                        bool %336 = OpLoad %333 
					                                                      OpSelectionMerge %338 None 
					                                                      OpBranchConditional %336 %337 %338 
					                                             %337 = OpLabel 
					                                                      OpBranch %330 
					                                             %338 = OpLabel 
					                                         i32 %341 = OpLoad %327 
					                                       i32_2 %342 = OpCompositeConstruct %341 %341 
					                                       i32_2 %343 = OpIAdd %342 %307 
					                                                      OpStore %340 %343 
					                                Private i32* %345 = OpAccessChain %340 %48 
					                                         i32 %346 = OpLoad %345 
					                                Private f32* %347 = OpAccessChain %271 %346 %48 
					                                         f32 %348 = OpLoad %347 
					                                                      OpStore %344 %348 
					                                         f32 %349 = OpLoad %212 
					                                         f32 %350 = OpLoad %344 
					                                         f32 %351 = OpFMul %349 %350 
					                                                      OpStore %344 %351 
					                                         i32 %353 = OpLoad %327 
					                                         f32 %354 = OpConvertSToF %353 
					                                Private f32* %355 = OpAccessChain %352 %48 
					                                                      OpStore %355 %354 
					                                Private f32* %356 = OpAccessChain %352 %48 
					                                         f32 %357 = OpLoad %356 
					                                Uniform f32* %358 = OpAccessChain %17 %273 
					                                         f32 %359 = OpLoad %358 
					                                         f32 %360 = OpFMul %357 %359 
					                                Private f32* %361 = OpAccessChain %316 %131 
					                                                      OpStore %361 %360 
					                                       f32_3 %362 = OpLoad %9 
					                                       f32_2 %363 = OpVectorShuffle %362 %362 0 1 
					                                       f32_2 %364 = OpLoad %316 
					                                       f32_2 %365 = OpFAdd %363 %364 
					                                                      OpStore %352 %365 
					                         read_only Texture2D %367 = OpLoad %202 
					                                     sampler %368 = OpLoad %204 
					                  read_only Texture2DSampled %369 = OpSampledImage %367 %368 
					                                       f32_2 %370 = OpLoad %352 
					                                       f32_4 %371 = OpImageSampleImplicitLod %369 %370 
					                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
					                                                      OpStore %366 %372 
					                                         f32 %373 = OpLoad %344 
					                                       f32_3 %374 = OpCompositeConstruct %373 %373 %373 
					                                       f32_3 %375 = OpLoad %366 
					                                       f32_3 %376 = OpFMul %374 %375 
					                                       f32_4 %377 = OpLoad %322 
					                                       f32_3 %378 = OpVectorShuffle %377 %377 0 2 3 
					                                       f32_3 %379 = OpFAdd %376 %378 
					                                       f32_4 %380 = OpLoad %322 
					                                       f32_4 %381 = OpVectorShuffle %380 %379 4 1 5 6 
					                                                      OpStore %322 %381 
					                                Private i32* %382 = OpAccessChain %340 %131 
					                                         i32 %383 = OpLoad %382 
					                                                      OpStore %327 %383 
					                                                      OpBranch %331 
					                                             %331 = OpLabel 
					                                                      OpBranch %328 
					                                             %330 = OpLabel 
					                                       f32_4 %384 = OpLoad %322 
					                                       f32_3 %385 = OpVectorShuffle %384 %384 0 2 3 
					                                       f32_4 %386 = OpLoad %280 
					                                       f32_4 %387 = OpVectorShuffle %386 %385 4 5 6 3 
					                                                      OpStore %280 %387 
					                                Private i32* %388 = OpAccessChain %304 %131 
					                                         i32 %389 = OpLoad %388 
					                                                      OpStore %285 %389 
					                                                      OpBranch %290 
					                                             %290 = OpLabel 
					                                                      OpBranch %287 
					                                             %289 = OpLabel 
					                                       f32_4 %390 = OpLoad %280 
					                                       f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
					                                       f32_3 %393 = OpFMul %391 %392 
					                                       f32_4 %394 = OpLoad %280 
					                                       f32_4 %395 = OpVectorShuffle %394 %393 4 5 6 3 
					                                                      OpStore %280 %395 
					                                Private f32* %397 = OpAccessChain %280 %396 
					                                                      OpStore %397 %45 
					                                Uniform f32* %398 = OpAccessChain %17 %40 
					                                         f32 %399 = OpLoad %398 
					                                Uniform f32* %400 = OpAccessChain %17 %40 
					                                         f32 %401 = OpLoad %400 
					                                Uniform f32* %402 = OpAccessChain %17 %40 
					                                         f32 %403 = OpLoad %402 
					                                Uniform f32* %404 = OpAccessChain %17 %40 
					                                         f32 %405 = OpLoad %404 
					                                       f32_4 %406 = OpCompositeConstruct %399 %401 %403 %405 
					                                         f32 %407 = OpCompositeExtract %406 0 
					                                         f32 %408 = OpCompositeExtract %406 1 
					                                         f32 %409 = OpCompositeExtract %406 2 
					                                         f32 %410 = OpCompositeExtract %406 3 
					                                       f32_4 %411 = OpCompositeConstruct %407 %408 %409 %410 
					                                       f32_4 %412 = OpFNegate %411 
					                                       f32_4 %414 = OpFMul %412 %413 
					                                       f32_4 %415 = OpLoad %280 
					                                       f32_4 %416 = OpFAdd %414 %415 
					                                                      OpStore %280 %416 
					                                Private f32* %417 = OpAccessChain %39 %48 
					                                         f32 %418 = OpLoad %417 
					                                Uniform f32* %420 = OpAccessChain %17 %419 
					                                         f32 %421 = OpLoad %420 
					                                         f32 %422 = OpFMul %418 %421 
					                                Private f32* %423 = OpAccessChain %9 %48 
					                                                      OpStore %423 %422 
					                                Private f32* %424 = OpAccessChain %9 %48 
					                                         f32 %425 = OpLoad %424 
					                                Private f32* %426 = OpAccessChain %9 %131 
					                                         f32 %427 = OpLoad %426 
					                                         f32 %428 = OpFMul %425 %427 
					                                Private f32* %429 = OpAccessChain %9 %48 
					                                                      OpStore %429 %428 
					                                Private f32* %430 = OpAccessChain %9 %48 
					                                         f32 %431 = OpLoad %430 
					                                         f32 %433 = OpFMul %431 %432 
					                                Private f32* %434 = OpAccessChain %84 %70 
					                                         f32 %435 = OpLoad %434 
					                                         f32 %436 = OpFAdd %433 %435 
					                                Private f32* %437 = OpAccessChain %9 %48 
					                                                      OpStore %437 %436 
					                                Private f32* %438 = OpAccessChain %9 %48 
					                                         f32 %439 = OpLoad %438 
					                                         f32 %440 = OpExtInst %1 13 %439 
					                                Private f32* %441 = OpAccessChain %9 %48 
					                                                      OpStore %441 %440 
					                                Private f32* %442 = OpAccessChain %9 %48 
					                                         f32 %443 = OpLoad %442 
					                                         f32 %445 = OpFMul %443 %444 
					                                         f32 %446 = OpFAdd %445 %444 
					                                Private f32* %447 = OpAccessChain %9 %48 
					                                                      OpStore %447 %446 
					                                Private f32* %448 = OpAccessChain %9 %48 
					                                         f32 %449 = OpLoad %448 
					                                         f32 %450 = OpExtInst %1 30 %449 
					                                Private f32* %451 = OpAccessChain %9 %48 
					                                                      OpStore %451 %450 
					                                Private f32* %452 = OpAccessChain %9 %48 
					                                         f32 %453 = OpLoad %452 
					                                         f32 %455 = OpFMul %453 %454 
					                                Private f32* %456 = OpAccessChain %9 %48 
					                                                      OpStore %456 %455 
					                                Private f32* %457 = OpAccessChain %9 %48 
					                                         f32 %458 = OpLoad %457 
					                                         f32 %459 = OpExtInst %1 29 %458 
					                                Private f32* %460 = OpAccessChain %9 %48 
					                                                      OpStore %460 %459 
					                                Private f32* %461 = OpAccessChain %190 %396 
					                                                      OpStore %461 %45 
					                                       f32_4 %462 = OpLoad %190 
					                              Uniform f32_4* %464 = OpAccessChain %17 %463 
					                                       f32_4 %465 = OpLoad %464 
					                                       f32_4 %466 = OpFAdd %462 %465 
					                                                      OpStore %190 %466 
					                                Private f32* %467 = OpAccessChain %9 %48 
					                                         f32 %468 = OpLoad %467 
					                                         f32 %470 = OpFMul %468 %469 
					                                         f32 %471 = OpFAdd %470 %274 
					                                Private f32* %472 = OpAccessChain %9 %48 
					                                                      OpStore %472 %471 
					                                       f32_4 %473 = OpLoad %190 
					                                       f32_3 %474 = OpLoad %9 
					                                       f32_4 %475 = OpVectorShuffle %474 %474 0 0 0 0 
					                                       f32_4 %476 = OpFMul %473 %475 
					                                       f32_4 %477 = OpLoad %190 
					                                       f32_4 %478 = OpFNegate %477 
					                                       f32_4 %479 = OpFAdd %476 %478 
					                                                      OpStore %322 %479 
					                                Uniform f32* %481 = OpAccessChain %17 %480 
					                                         f32 %482 = OpLoad %481 
					                                Uniform f32* %483 = OpAccessChain %17 %480 
					                                         f32 %484 = OpLoad %483 
					                                Uniform f32* %485 = OpAccessChain %17 %480 
					                                         f32 %486 = OpLoad %485 
					                                Uniform f32* %487 = OpAccessChain %17 %480 
					                                         f32 %488 = OpLoad %487 
					                                       f32_4 %489 = OpCompositeConstruct %482 %484 %486 %488 
					                                         f32 %490 = OpCompositeExtract %489 0 
					                                         f32 %491 = OpCompositeExtract %489 1 
					                                         f32 %492 = OpCompositeExtract %489 2 
					                                         f32 %493 = OpCompositeExtract %489 3 
					                                       f32_4 %494 = OpCompositeConstruct %490 %491 %492 %493 
					                                       f32_4 %495 = OpLoad %322 
					                                       f32_4 %496 = OpFMul %494 %495 
					                                       f32_4 %497 = OpLoad %190 
					                                       f32_4 %498 = OpFAdd %496 %497 
					                                                      OpStore %190 %498 
					                                       f32_4 %499 = OpLoad %190 
					                                       f32_4 %500 = OpFNegate %499 
					                                       f32_4 %501 = OpLoad %280 
					                                       f32_4 %502 = OpFAdd %500 %501 
					                                                      OpStore %322 %502 
					                                       f32_3 %503 = OpLoad %144 
					                                       f32_4 %504 = OpVectorShuffle %503 %503 2 2 2 2 
					                                       f32_4 %505 = OpLoad %322 
					                                       f32_4 %506 = OpFMul %504 %505 
					                                       f32_4 %507 = OpLoad %190 
					                                       f32_4 %508 = OpFAdd %506 %507 
					                                                      OpStore %190 %508 
					                                Private f32* %510 = OpAccessChain %144 %131 
					                                         f32 %511 = OpLoad %510 
					                                         f32 %513 = OpFAdd %511 %512 
					                                                      OpStore %509 %513 
					                                         f32 %514 = OpLoad %509 
					                                         f32 %516 = OpFMul %514 %515 
					                                Private f32* %517 = OpAccessChain %9 %48 
					                                                      OpStore %517 %516 
					                                Private f32* %518 = OpAccessChain %9 %48 
					                                         f32 %519 = OpLoad %518 
					                                         f32 %520 = OpExtInst %1 43 %519 %74 %45 
					                                Private f32* %521 = OpAccessChain %9 %48 
					                                                      OpStore %521 %520 
					                                Private f32* %523 = OpAccessChain %9 %48 
					                                         f32 %524 = OpLoad %523 
					                                         f32 %525 = OpFMul %524 %80 
					                                         f32 %526 = OpFAdd %525 %82 
					                                                      OpStore %522 %526 
					                                       f32_3 %527 = OpLoad %9 
					                                       f32_2 %528 = OpVectorShuffle %527 %527 0 2 
					                                       f32_3 %529 = OpLoad %9 
					                                       f32_2 %530 = OpVectorShuffle %529 %529 0 2 
					                                       f32_2 %531 = OpFMul %528 %530 
					                                       f32_3 %532 = OpLoad %9 
					                                       f32_3 %533 = OpVectorShuffle %532 %531 3 1 4 
					                                                      OpStore %9 %533 
					                                         f32 %534 = OpLoad %522 
					                                         f32 %535 = OpFNegate %534 
					                                Private f32* %536 = OpAccessChain %9 %48 
					                                         f32 %537 = OpLoad %536 
					                                         f32 %538 = OpFMul %535 %537 
					                                         f32 %539 = OpFAdd %538 %45 
					                                Private f32* %540 = OpAccessChain %9 %48 
					                                                      OpStore %540 %539 
					                                       f32_3 %541 = OpLoad %9 
					                                       f32_4 %542 = OpVectorShuffle %541 %541 0 0 0 0 
					                                       f32_4 %543 = OpFNegate %542 
					                                       f32_4 %546 = OpFMul %543 %545 
					                                       f32_4 %547 = OpLoad %108 
					                                       f32_4 %548 = OpFAdd %546 %547 
					                                                      OpStore %108 %548 
					                                       f32_4 %549 = OpLoad %190 
					                                       f32_4 %550 = OpFNegate %549 
					                                       f32_4 %551 = OpLoad %108 
					                                       f32_4 %552 = OpFAdd %550 %551 
					                                                      OpStore %108 %552 
					                                       f32_3 %553 = OpLoad %144 
					                                       f32_4 %554 = OpVectorShuffle %553 %553 0 0 0 0 
					                                       f32_4 %555 = OpLoad %108 
					                                       f32_4 %556 = OpFMul %554 %555 
					                                       f32_4 %557 = OpLoad %190 
					                                       f32_4 %558 = OpFAdd %556 %557 
					                                                      OpStore %51 %558 
					                                       f32_4 %559 = OpLoad %280 
					                                       f32_4 %560 = OpFNegate %559 
					                                       f32_4 %561 = OpLoad %51 
					                                       f32_4 %562 = OpFAdd %560 %561 
					                                                      OpStore %51 %562 
					                                       f32_3 %563 = OpLoad %84 
					                                       f32_4 %564 = OpVectorShuffle %563 %563 0 0 0 0 
					                                       f32_4 %565 = OpLoad %51 
					                                       f32_4 %566 = OpFMul %564 %565 
					                                       f32_4 %567 = OpLoad %280 
					                                       f32_4 %568 = OpFAdd %566 %567 
					                                                      OpStore %39 %568 
					                              Uniform f32_4* %569 = OpAccessChain %17 %463 
					                                       f32_4 %570 = OpLoad %569 
					                                Uniform f32* %572 = OpAccessChain %17 %571 
					                                         f32 %573 = OpLoad %572 
					                                       f32_4 %574 = OpCompositeConstruct %573 %573 %573 %573 
					                                       f32_4 %575 = OpFMul %570 %574 
					                                                      OpStore %51 %575 
					                                       f32_4 %576 = OpLoad %51 
					                                       f32_4 %578 = OpFMul %576 %577 
					                                       f32_4 %579 = OpLoad %261 
					                                       f32_4 %580 = OpFAdd %578 %579 
					                                                      OpStore %51 %580 
					                                         f32 %581 = OpLoad %77 
					                                         f32 %582 = OpFNegate %581 
					                                Private f32* %583 = OpAccessChain %9 %70 
					                                         f32 %584 = OpLoad %583 
					                                         f32 %585 = OpFMul %582 %584 
					                                         f32 %586 = OpFAdd %585 %45 
					                                Private f32* %587 = OpAccessChain %9 %48 
					                                                      OpStore %587 %586 
					                                       f32_4 %588 = OpLoad %39 
					                                       f32_4 %589 = OpLoad %51 
					                                       f32_4 %590 = OpFNegate %589 
					                                       f32_4 %591 = OpFAdd %588 %590 
					                                                      OpStore %39 %591 
					                                       f32_3 %594 = OpLoad %9 
					                                       f32_4 %595 = OpVectorShuffle %594 %594 0 0 0 0 
					                                       f32_4 %596 = OpLoad %39 
					                                       f32_4 %597 = OpFMul %595 %596 
					                                       f32_4 %598 = OpLoad %51 
					                                       f32_4 %599 = OpFAdd %597 %598 
					                                                      OpStore %593 %599 
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
					in  vec2 vs_TEXCOORD1;
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
					    u_xlat22.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
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
					    u_xlat4 = u_xlat6 + GlassColor;
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
					    u_xlat2 = GlassColor * vec4(UseFinalGlassColor);
					    u_xlat2 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5) + u_xlat10_7;
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