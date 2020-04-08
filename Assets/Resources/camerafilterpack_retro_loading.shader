Shader "CameraFilterPack/Retro_Loading" {
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
			GpuProgramID 42551
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
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					bvec3 u_xlatb4;
					bool u_xlatb5;
					vec2 u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _TimeX + 1.0;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.y = _Value * _TimeX;
					    u_xlat0.x = u_xlat0.y * 50.0 + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.00066666666, 10.0);
					    u_xlat1.x = floor(u_xlat0.y);
					    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 30.0;
					    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat8.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) + 30.0;
					    u_xlat4.x = (u_xlatb4.x) ? u_xlat8.x : (-u_xlat8.x);
					    u_xlat4.x = u_xlat4.x * 50.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat9.xy = u_xlat8.xy * vec2(50.0, 30.0);
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8.xy = floor(u_xlat9.xy);
					    u_xlatb4.x = u_xlat8.x>=u_xlat4.x;
					    u_xlat8.x = u_xlat8.y + 1.0;
					    u_xlatb0.z = u_xlat8.x>=u_xlat0.x;
					    u_xlatb0.x = u_xlat8.y>=u_xlat0.x;
					    u_xlat0.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xz));
					    u_xlat4.x = (u_xlatb4.x) ? 0.0 : u_xlat0.z;
					    u_xlat0.x = u_xlat4.x + u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat4.x = _TimeX * 10.0;
					    u_xlat1.y = floor(u_xlat4.x);
					    u_xlat4.xy = u_xlat1.xy * vec2(-1.0, 0.0);
					    u_xlat1.x = u_xlat8.y * 0.5;
					    u_xlat12 = sin(u_xlat8.y);
					    u_xlat12 = u_xlat12 * 10000.0;
					    u_xlat12 = fract(u_xlat12);
					    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb5) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlatb1 = u_xlat1.x>=0.5;
					    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
					    u_xlat4.xy = u_xlat4.xy * u_xlat1.xx;
					    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat12) + u_xlat9.xy;
					    u_xlat12 = fract(u_xlat9.y);
					    u_xlatb4.z = u_xlat12>=0.100000001;
					    u_xlat1.xy = floor(u_xlat4.xy);
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.y = u_xlat0.x * u_xlat1.x;
					    u_xlat3 = u_xlat4.xyxy + vec4(0.100000001, 0.0, -0.100000001, -0.0);
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlatb4.x = u_xlat4.x>=0.100000001;
					    u_xlat4.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xz));
					    u_xlat4.x = u_xlat4.z * u_xlat4.x;
					    u_xlat3 = floor(u_xlat3);
					    u_xlat8.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
					    u_xlat8.xy = fract(u_xlat8.xy);
					    u_xlat1.xz = u_xlat8.xy * u_xlat0.xx;
					    u_xlat0.xzw = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat0.xzw = u_xlat0.xzw * vec3(4.0, 4.0, 4.0);
					    u_xlat0.xzw = min(u_xlat0.xzw, vec3(1.0, 1.0, 1.0));
					    u_xlat1.xyz = u_xlat0.xzw * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xyz;
					    u_xlatb0.xzw = greaterThanEqual(u_xlat0.xxzw, vec4(0.25, 0.0, 0.25, 0.25)).xzw;
					    u_xlat0.xzw = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb0.xzw));
					    SV_Target0.xyz = u_xlat0.xzw * u_xlat4.xxx + u_xlat10_2.xyz;
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
					                                              OpEntryPoint Fragment %4 "main" %138 %445 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %10 0 Offset 10 
					                                              OpMemberDecorate %10 1 Offset 10 
					                                              OpMemberDecorate %10 2 RelaxedPrecision 
					                                              OpMemberDecorate %10 2 Offset 10 
					                                              OpDecorate %10 Block 
					                                              OpDecorate %12 DescriptorSet 12 
					                                              OpDecorate %12 Binding 12 
					                                              OpDecorate vs_TEXCOORD0 Location 138 
					                                              OpDecorate %143 RelaxedPrecision 
					                                              OpDecorate %144 RelaxedPrecision 
					                                              OpDecorate %147 RelaxedPrecision 
					                                              OpDecorate %148 RelaxedPrecision 
					                                              OpDecorate %154 RelaxedPrecision 
					                                              OpDecorate %157 RelaxedPrecision 
					                                              OpDecorate %157 DescriptorSet 157 
					                                              OpDecorate %157 Binding 157 
					                                              OpDecorate %158 RelaxedPrecision 
					                                              OpDecorate %161 RelaxedPrecision 
					                                              OpDecorate %161 DescriptorSet 161 
					                                              OpDecorate %161 Binding 161 
					                                              OpDecorate %162 RelaxedPrecision 
					                                              OpDecorate %167 RelaxedPrecision 
					                                              OpDecorate %445 Location 445 
					                                              OpDecorate %451 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeStruct %6 %6 %7 
					                                      %11 = OpTypePointer Uniform %10 
					   Uniform struct {f32; f32; f32_4;}* %12 = OpVariable Uniform 
					                                      %13 = OpTypeInt 32 1 
					                                  i32 %14 = OpConstant 0 
					                                      %15 = OpTypePointer Uniform %6 
					                                  f32 %18 = OpConstant 3,674022E-40 
					                                      %20 = OpTypeInt 32 0 
					                                  u32 %21 = OpConstant 0 
					                                      %22 = OpTypePointer Private %6 
					                                  i32 %28 = OpConstant 1 
					                                  u32 %34 = OpConstant 1 
					                                  f32 %38 = OpConstant 3,674022E-40 
					                                      %44 = OpTypeVector %6 2 
					                                  f32 %47 = OpConstant 3,674022E-40 
					                                  f32 %48 = OpConstant 3,674022E-40 
					                                f32_2 %49 = OpConstantComposite %47 %48 
					                                      %53 = OpTypeVector %6 3 
					                                      %54 = OpTypePointer Private %53 
					                       Private f32_3* %55 = OpVariable Private 
					                                      %60 = OpTypeBool 
					                                      %61 = OpTypeVector %60 3 
					                                      %62 = OpTypePointer Private %61 
					                      Private bool_3* %63 = OpVariable Private 
					                                      %70 = OpTypePointer Private %60 
					                                      %79 = OpTypePointer Function %6 
					                                  f32 %93 = OpConstant 3,674022E-40 
					                                     %103 = OpTypePointer Private %44 
					                      Private f32_2* %104 = OpVariable Private 
					                      Private f32_3* %119 = OpVariable Private 
					                                     %137 = OpTypePointer Input %44 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                 i32 %140 = OpConstant 2 
					                                     %141 = OpTypePointer Uniform %7 
					                      Private f32_2* %150 = OpVariable Private 
					                               f32_2 %152 = OpConstantComposite %38 %93 
					                      Private f32_3* %154 = OpVariable Private 
					                                     %155 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %156 = OpTypePointer UniformConstant %155 
					UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
					                                     %159 = OpTypeSampler 
					                                     %160 = OpTypePointer UniformConstant %159 
					            UniformConstant sampler* %161 = OpVariable UniformConstant 
					                                     %163 = OpTypeSampledImage %155 
					                                     %180 = OpTypeVector %60 4 
					                                     %181 = OpTypePointer Private %180 
					                     Private bool_4* %182 = OpVariable Private 
					                                 u32 %188 = OpConstant 2 
					                                 f32 %196 = OpConstant 3,674022E-40 
					                               f32_2 %197 = OpConstantComposite %196 %196 
					                               f32_2 %198 = OpConstantComposite %18 %18 
					                                     %199 = OpTypeVector %60 2 
					                                 f32 %236 = OpConstant 3,674022E-40 
					                               f32_2 %237 = OpConstantComposite %236 %196 
					                                 f32 %243 = OpConstant 3,674022E-40 
					                        Private f32* %246 = OpVariable Private 
					                                 f32 %251 = OpConstant 3,674022E-40 
					                       Private bool* %255 = OpVariable Private 
					                       Private bool* %279 = OpVariable Private 
					                                 f32 %306 = OpConstant 3,674022E-40 
					                                 f32 %316 = OpConstant 3,674022E-40 
					                                 f32 %317 = OpConstant 3,674022E-40 
					                               f32_2 %318 = OpConstantComposite %316 %317 
					                                 f32 %327 = OpConstant 3,674022E-40 
					                      Private f32_4* %340 = OpVariable Private 
					                                 f32 %343 = OpConstant 3,674022E-40 
					                                 f32 %344 = OpConstant 3,674022E-40 
					                               f32_4 %345 = OpConstantComposite %306 %196 %343 %344 
					                               f32_2 %380 = OpConstantComposite %327 %327 
					                                 f32 %397 = OpConstant 3,674022E-40 
					                               f32_3 %398 = OpConstantComposite %397 %397 %397 
					                               f32_3 %404 = OpConstantComposite %18 %18 %18 
					                                 f32 %410 = OpConstant 3,674022E-40 
					                               f32_3 %411 = OpConstantComposite %410 %410 %410 
					                                 f32 %413 = OpConstant 3,674022E-40 
					                               f32_3 %414 = OpConstantComposite %413 %413 %413 
					                                 f32 %431 = OpConstant 3,674022E-40 
					                               f32_4 %432 = OpConstantComposite %431 %196 %431 %431 
					                               f32_3 %437 = OpConstantComposite %196 %196 %196 
					                                     %444 = OpTypePointer Output %7 
					                       Output f32_4* %445 = OpVariable Output 
					                                 u32 %455 = OpConstant 3 
					                                     %456 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function f32* %80 = OpVariable Function 
					                       Function f32* %122 = OpVariable Function 
					                       Function f32* %208 = OpVariable Function 
					                       Function f32* %268 = OpVariable Function 
					                         Uniform f32* %16 = OpAccessChain %12 %14 
					                                  f32 %17 = OpLoad %16 
					                                  f32 %19 = OpFAdd %17 %18 
					                         Private f32* %23 = OpAccessChain %9 %21 
					                                              OpStore %23 %19 
					                         Private f32* %24 = OpAccessChain %9 %21 
					                                  f32 %25 = OpLoad %24 
					                                  f32 %26 = OpExtInst %1 8 %25 
					                         Private f32* %27 = OpAccessChain %9 %21 
					                                              OpStore %27 %26 
					                         Uniform f32* %29 = OpAccessChain %12 %28 
					                                  f32 %30 = OpLoad %29 
					                         Uniform f32* %31 = OpAccessChain %12 %14 
					                                  f32 %32 = OpLoad %31 
					                                  f32 %33 = OpFMul %30 %32 
					                         Private f32* %35 = OpAccessChain %9 %34 
					                                              OpStore %35 %33 
					                         Private f32* %36 = OpAccessChain %9 %34 
					                                  f32 %37 = OpLoad %36 
					                                  f32 %39 = OpFMul %37 %38 
					                         Private f32* %40 = OpAccessChain %9 %21 
					                                  f32 %41 = OpLoad %40 
					                                  f32 %42 = OpFAdd %39 %41 
					                         Private f32* %43 = OpAccessChain %9 %21 
					                                              OpStore %43 %42 
					                                f32_4 %45 = OpLoad %9 
					                                f32_2 %46 = OpVectorShuffle %45 %45 0 1 
					                                f32_2 %50 = OpFMul %46 %49 
					                                f32_4 %51 = OpLoad %9 
					                                f32_4 %52 = OpVectorShuffle %51 %50 4 5 2 3 
					                                              OpStore %9 %52 
					                         Private f32* %56 = OpAccessChain %9 %34 
					                                  f32 %57 = OpLoad %56 
					                                  f32 %58 = OpExtInst %1 8 %57 
					                         Private f32* %59 = OpAccessChain %55 %21 
					                                              OpStore %59 %58 
					                         Private f32* %64 = OpAccessChain %9 %21 
					                                  f32 %65 = OpLoad %64 
					                         Private f32* %66 = OpAccessChain %9 %21 
					                                  f32 %67 = OpLoad %66 
					                                  f32 %68 = OpFNegate %67 
					                                 bool %69 = OpFOrdGreaterThanEqual %65 %68 
					                        Private bool* %71 = OpAccessChain %63 %21 
					                                              OpStore %71 %69 
					                         Private f32* %72 = OpAccessChain %9 %21 
					                                  f32 %73 = OpLoad %72 
					                                  f32 %74 = OpExtInst %1 4 %73 
					                                  f32 %75 = OpExtInst %1 10 %74 
					                         Private f32* %76 = OpAccessChain %9 %21 
					                                              OpStore %76 %75 
					                        Private bool* %77 = OpAccessChain %63 %21 
					                                 bool %78 = OpLoad %77 
					                                              OpSelectionMerge %82 None 
					                                              OpBranchConditional %78 %81 %85 
					                                      %81 = OpLabel 
					                         Private f32* %83 = OpAccessChain %9 %21 
					                                  f32 %84 = OpLoad %83 
					                                              OpStore %80 %84 
					                                              OpBranch %82 
					                                      %85 = OpLabel 
					                         Private f32* %86 = OpAccessChain %9 %21 
					                                  f32 %87 = OpLoad %86 
					                                  f32 %88 = OpFNegate %87 
					                                              OpStore %80 %88 
					                                              OpBranch %82 
					                                      %82 = OpLabel 
					                                  f32 %89 = OpLoad %80 
					                         Private f32* %90 = OpAccessChain %9 %21 
					                                              OpStore %90 %89 
					                         Private f32* %91 = OpAccessChain %9 %21 
					                                  f32 %92 = OpLoad %91 
					                                  f32 %94 = OpFMul %92 %93 
					                         Private f32* %95 = OpAccessChain %9 %21 
					                                              OpStore %95 %94 
					                         Private f32* %96 = OpAccessChain %9 %21 
					                                  f32 %97 = OpLoad %96 
					                         Private f32* %98 = OpAccessChain %9 %21 
					                                  f32 %99 = OpLoad %98 
					                                 f32 %100 = OpFNegate %99 
					                                bool %101 = OpFOrdGreaterThanEqual %97 %100 
					                       Private bool* %102 = OpAccessChain %63 %21 
					                                              OpStore %102 %101 
					                        Private f32* %105 = OpAccessChain %9 %21 
					                                 f32 %106 = OpLoad %105 
					                                 f32 %107 = OpExtInst %1 4 %106 
					                                 f32 %108 = OpExtInst %1 10 %107 
					                        Private f32* %109 = OpAccessChain %104 %21 
					                                              OpStore %109 %108 
					                        Private f32* %110 = OpAccessChain %9 %21 
					                                 f32 %111 = OpLoad %110 
					                                 f32 %112 = OpExtInst %1 8 %111 
					                        Private f32* %113 = OpAccessChain %9 %21 
					                                              OpStore %113 %112 
					                        Private f32* %114 = OpAccessChain %9 %21 
					                                 f32 %115 = OpLoad %114 
					                                 f32 %116 = OpFNegate %115 
					                                 f32 %117 = OpFAdd %116 %93 
					                        Private f32* %118 = OpAccessChain %9 %21 
					                                              OpStore %118 %117 
					                       Private bool* %120 = OpAccessChain %63 %21 
					                                bool %121 = OpLoad %120 
					                                              OpSelectionMerge %124 None 
					                                              OpBranchConditional %121 %123 %127 
					                                     %123 = OpLabel 
					                        Private f32* %125 = OpAccessChain %104 %21 
					                                 f32 %126 = OpLoad %125 
					                                              OpStore %122 %126 
					                                              OpBranch %124 
					                                     %127 = OpLabel 
					                        Private f32* %128 = OpAccessChain %104 %21 
					                                 f32 %129 = OpLoad %128 
					                                 f32 %130 = OpFNegate %129 
					                                              OpStore %122 %130 
					                                              OpBranch %124 
					                                     %124 = OpLabel 
					                                 f32 %131 = OpLoad %122 
					                        Private f32* %132 = OpAccessChain %119 %21 
					                                              OpStore %132 %131 
					                        Private f32* %133 = OpAccessChain %119 %21 
					                                 f32 %134 = OpLoad %133 
					                                 f32 %135 = OpFMul %134 %38 
					                        Private f32* %136 = OpAccessChain %119 %21 
					                                              OpStore %136 %135 
					                               f32_2 %139 = OpLoad vs_TEXCOORD0 
					                      Uniform f32_4* %142 = OpAccessChain %12 %140 
					                               f32_4 %143 = OpLoad %142 
					                               f32_2 %144 = OpVectorShuffle %143 %143 0 1 
					                               f32_2 %145 = OpFMul %139 %144 
					                      Uniform f32_4* %146 = OpAccessChain %12 %140 
					                               f32_4 %147 = OpLoad %146 
					                               f32_2 %148 = OpVectorShuffle %147 %147 2 3 
					                               f32_2 %149 = OpFAdd %145 %148 
					                                              OpStore %104 %149 
					                               f32_2 %151 = OpLoad %104 
					                               f32_2 %153 = OpFMul %151 %152 
					                                              OpStore %150 %153 
					                 read_only Texture2D %158 = OpLoad %157 
					                             sampler %162 = OpLoad %161 
					          read_only Texture2DSampled %164 = OpSampledImage %158 %162 
					                               f32_2 %165 = OpLoad %104 
					                               f32_4 %166 = OpImageSampleImplicitLod %164 %165 
					                               f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
					                                              OpStore %154 %167 
					                               f32_2 %168 = OpLoad %150 
					                               f32_2 %169 = OpExtInst %1 8 %168 
					                                              OpStore %104 %169 
					                        Private f32* %170 = OpAccessChain %104 %21 
					                                 f32 %171 = OpLoad %170 
					                        Private f32* %172 = OpAccessChain %119 %21 
					                                 f32 %173 = OpLoad %172 
					                                bool %174 = OpFOrdGreaterThanEqual %171 %173 
					                       Private bool* %175 = OpAccessChain %63 %21 
					                                              OpStore %175 %174 
					                        Private f32* %176 = OpAccessChain %104 %34 
					                                 f32 %177 = OpLoad %176 
					                                 f32 %178 = OpFAdd %177 %18 
					                        Private f32* %179 = OpAccessChain %104 %21 
					                                              OpStore %179 %178 
					                        Private f32* %183 = OpAccessChain %104 %21 
					                                 f32 %184 = OpLoad %183 
					                        Private f32* %185 = OpAccessChain %9 %21 
					                                 f32 %186 = OpLoad %185 
					                                bool %187 = OpFOrdGreaterThanEqual %184 %186 
					                       Private bool* %189 = OpAccessChain %182 %188 
					                                              OpStore %189 %187 
					                        Private f32* %190 = OpAccessChain %104 %34 
					                                 f32 %191 = OpLoad %190 
					                        Private f32* %192 = OpAccessChain %9 %21 
					                                 f32 %193 = OpLoad %192 
					                                bool %194 = OpFOrdGreaterThanEqual %191 %193 
					                       Private bool* %195 = OpAccessChain %182 %21 
					                                              OpStore %195 %194 
					                              bool_4 %200 = OpLoad %182 
					                              bool_2 %201 = OpVectorShuffle %200 %200 0 2 
					                               f32_2 %202 = OpSelect %201 %198 %197 
					                               f32_2 %203 = OpExtInst %1 46 %197 %198 %202 
					                               f32_4 %204 = OpLoad %9 
					                               f32_4 %205 = OpVectorShuffle %204 %203 4 1 5 3 
					                                              OpStore %9 %205 
					                       Private bool* %206 = OpAccessChain %63 %21 
					                                bool %207 = OpLoad %206 
					                                              OpSelectionMerge %210 None 
					                                              OpBranchConditional %207 %209 %211 
					                                     %209 = OpLabel 
					                                              OpStore %208 %196 
					                                              OpBranch %210 
					                                     %211 = OpLabel 
					                        Private f32* %212 = OpAccessChain %9 %188 
					                                 f32 %213 = OpLoad %212 
					                                              OpStore %208 %213 
					                                              OpBranch %210 
					                                     %210 = OpLabel 
					                                 f32 %214 = OpLoad %208 
					                        Private f32* %215 = OpAccessChain %119 %21 
					                                              OpStore %215 %214 
					                        Private f32* %216 = OpAccessChain %119 %21 
					                                 f32 %217 = OpLoad %216 
					                        Private f32* %218 = OpAccessChain %9 %21 
					                                 f32 %219 = OpLoad %218 
					                                 f32 %220 = OpFAdd %217 %219 
					                        Private f32* %221 = OpAccessChain %9 %21 
					                                              OpStore %221 %220 
					                        Private f32* %222 = OpAccessChain %9 %21 
					                                 f32 %223 = OpLoad %222 
					                                 f32 %224 = OpExtInst %1 37 %223 %18 
					                        Private f32* %225 = OpAccessChain %9 %21 
					                                              OpStore %225 %224 
					                        Uniform f32* %226 = OpAccessChain %12 %14 
					                                 f32 %227 = OpLoad %226 
					                                 f32 %228 = OpFMul %227 %48 
					                        Private f32* %229 = OpAccessChain %119 %21 
					                                              OpStore %229 %228 
					                        Private f32* %230 = OpAccessChain %119 %21 
					                                 f32 %231 = OpLoad %230 
					                                 f32 %232 = OpExtInst %1 8 %231 
					                        Private f32* %233 = OpAccessChain %55 %34 
					                                              OpStore %233 %232 
					                               f32_3 %234 = OpLoad %55 
					                               f32_2 %235 = OpVectorShuffle %234 %234 0 1 
					                               f32_2 %238 = OpFMul %235 %237 
					                               f32_3 %239 = OpLoad %119 
					                               f32_3 %240 = OpVectorShuffle %239 %238 3 4 2 
					                                              OpStore %119 %240 
					                        Private f32* %241 = OpAccessChain %104 %34 
					                                 f32 %242 = OpLoad %241 
					                                 f32 %244 = OpFMul %242 %243 
					                        Private f32* %245 = OpAccessChain %55 %21 
					                                              OpStore %245 %244 
					                        Private f32* %247 = OpAccessChain %104 %34 
					                                 f32 %248 = OpLoad %247 
					                                 f32 %249 = OpExtInst %1 13 %248 
					                                              OpStore %246 %249 
					                                 f32 %250 = OpLoad %246 
					                                 f32 %252 = OpFMul %250 %251 
					                                              OpStore %246 %252 
					                                 f32 %253 = OpLoad %246 
					                                 f32 %254 = OpExtInst %1 10 %253 
					                                              OpStore %246 %254 
					                        Private f32* %256 = OpAccessChain %55 %21 
					                                 f32 %257 = OpLoad %256 
					                        Private f32* %258 = OpAccessChain %55 %21 
					                                 f32 %259 = OpLoad %258 
					                                 f32 %260 = OpFNegate %259 
					                                bool %261 = OpFOrdGreaterThanEqual %257 %260 
					                                              OpStore %255 %261 
					                        Private f32* %262 = OpAccessChain %55 %21 
					                                 f32 %263 = OpLoad %262 
					                                 f32 %264 = OpExtInst %1 4 %263 
					                                 f32 %265 = OpExtInst %1 10 %264 
					                        Private f32* %266 = OpAccessChain %55 %21 
					                                              OpStore %266 %265 
					                                bool %267 = OpLoad %255 
					                                              OpSelectionMerge %270 None 
					                                              OpBranchConditional %267 %269 %273 
					                                     %269 = OpLabel 
					                        Private f32* %271 = OpAccessChain %55 %21 
					                                 f32 %272 = OpLoad %271 
					                                              OpStore %268 %272 
					                                              OpBranch %270 
					                                     %273 = OpLabel 
					                        Private f32* %274 = OpAccessChain %55 %21 
					                                 f32 %275 = OpLoad %274 
					                                 f32 %276 = OpFNegate %275 
					                                              OpStore %268 %276 
					                                              OpBranch %270 
					                                     %270 = OpLabel 
					                                 f32 %277 = OpLoad %268 
					                        Private f32* %278 = OpAccessChain %55 %21 
					                                              OpStore %278 %277 
					                        Private f32* %280 = OpAccessChain %55 %21 
					                                 f32 %281 = OpLoad %280 
					                                bool %282 = OpFOrdGreaterThanEqual %281 %243 
					                                              OpStore %279 %282 
					                                bool %283 = OpLoad %279 
					                                 f32 %284 = OpSelect %283 %18 %236 
					                        Private f32* %285 = OpAccessChain %55 %21 
					                                              OpStore %285 %284 
					                               f32_3 %286 = OpLoad %119 
					                               f32_2 %287 = OpVectorShuffle %286 %286 0 1 
					                               f32_3 %288 = OpLoad %55 
					                               f32_2 %289 = OpVectorShuffle %288 %288 0 0 
					                               f32_2 %290 = OpFMul %287 %289 
					                               f32_3 %291 = OpLoad %119 
					                               f32_3 %292 = OpVectorShuffle %291 %290 3 4 2 
					                                              OpStore %119 %292 
					                               f32_3 %293 = OpLoad %119 
					                               f32_2 %294 = OpVectorShuffle %293 %293 0 1 
					                                 f32 %295 = OpLoad %246 
					                               f32_2 %296 = OpCompositeConstruct %295 %295 
					                               f32_2 %297 = OpFMul %294 %296 
					                               f32_2 %298 = OpLoad %150 
					                               f32_2 %299 = OpFAdd %297 %298 
					                               f32_3 %300 = OpLoad %119 
					                               f32_3 %301 = OpVectorShuffle %300 %299 3 4 2 
					                                              OpStore %119 %301 
					                        Private f32* %302 = OpAccessChain %150 %34 
					                                 f32 %303 = OpLoad %302 
					                                 f32 %304 = OpExtInst %1 10 %303 
					                                              OpStore %246 %304 
					                                 f32 %305 = OpLoad %246 
					                                bool %307 = OpFOrdGreaterThanEqual %305 %306 
					                       Private bool* %308 = OpAccessChain %63 %188 
					                                              OpStore %308 %307 
					                               f32_3 %309 = OpLoad %119 
					                               f32_2 %310 = OpVectorShuffle %309 %309 0 1 
					                               f32_2 %311 = OpExtInst %1 8 %310 
					                               f32_3 %312 = OpLoad %55 
					                               f32_3 %313 = OpVectorShuffle %312 %311 3 4 2 
					                                              OpStore %55 %313 
					                               f32_3 %314 = OpLoad %55 
					                               f32_2 %315 = OpVectorShuffle %314 %314 0 1 
					                                 f32 %319 = OpDot %315 %318 
					                        Private f32* %320 = OpAccessChain %55 %21 
					                                              OpStore %320 %319 
					                        Private f32* %321 = OpAccessChain %55 %21 
					                                 f32 %322 = OpLoad %321 
					                                 f32 %323 = OpExtInst %1 13 %322 
					                        Private f32* %324 = OpAccessChain %55 %21 
					                                              OpStore %324 %323 
					                        Private f32* %325 = OpAccessChain %55 %21 
					                                 f32 %326 = OpLoad %325 
					                                 f32 %328 = OpFMul %326 %327 
					                        Private f32* %329 = OpAccessChain %55 %21 
					                                              OpStore %329 %328 
					                        Private f32* %330 = OpAccessChain %55 %21 
					                                 f32 %331 = OpLoad %330 
					                                 f32 %332 = OpExtInst %1 10 %331 
					                        Private f32* %333 = OpAccessChain %55 %21 
					                                              OpStore %333 %332 
					                        Private f32* %334 = OpAccessChain %9 %21 
					                                 f32 %335 = OpLoad %334 
					                        Private f32* %336 = OpAccessChain %55 %21 
					                                 f32 %337 = OpLoad %336 
					                                 f32 %338 = OpFMul %335 %337 
					                        Private f32* %339 = OpAccessChain %55 %34 
					                                              OpStore %339 %338 
					                               f32_3 %341 = OpLoad %119 
					                               f32_4 %342 = OpVectorShuffle %341 %341 0 1 0 1 
					                               f32_4 %346 = OpFAdd %342 %345 
					                                              OpStore %340 %346 
					                        Private f32* %347 = OpAccessChain %119 %21 
					                                 f32 %348 = OpLoad %347 
					                                 f32 %349 = OpExtInst %1 10 %348 
					                        Private f32* %350 = OpAccessChain %119 %21 
					                                              OpStore %350 %349 
					                        Private f32* %351 = OpAccessChain %119 %21 
					                                 f32 %352 = OpLoad %351 
					                                bool %353 = OpFOrdGreaterThanEqual %352 %306 
					                       Private bool* %354 = OpAccessChain %63 %21 
					                                              OpStore %354 %353 
					                              bool_3 %355 = OpLoad %63 
					                              bool_2 %356 = OpVectorShuffle %355 %355 0 2 
					                               f32_2 %357 = OpSelect %356 %198 %197 
					                               f32_2 %358 = OpExtInst %1 46 %197 %198 %357 
					                               f32_3 %359 = OpLoad %119 
					                               f32_3 %360 = OpVectorShuffle %359 %358 3 1 4 
					                                              OpStore %119 %360 
					                        Private f32* %361 = OpAccessChain %119 %188 
					                                 f32 %362 = OpLoad %361 
					                        Private f32* %363 = OpAccessChain %119 %21 
					                                 f32 %364 = OpLoad %363 
					                                 f32 %365 = OpFMul %362 %364 
					                        Private f32* %366 = OpAccessChain %119 %21 
					                                              OpStore %366 %365 
					                               f32_4 %367 = OpLoad %340 
					                               f32_4 %368 = OpExtInst %1 8 %367 
					                                              OpStore %340 %368 
					                               f32_4 %369 = OpLoad %340 
					                               f32_2 %370 = OpVectorShuffle %369 %369 0 1 
					                                 f32 %371 = OpDot %370 %318 
					                        Private f32* %372 = OpAccessChain %104 %21 
					                                              OpStore %372 %371 
					                               f32_4 %373 = OpLoad %340 
					                               f32_2 %374 = OpVectorShuffle %373 %373 2 3 
					                                 f32 %375 = OpDot %374 %318 
					                        Private f32* %376 = OpAccessChain %104 %34 
					                                              OpStore %376 %375 
					                               f32_2 %377 = OpLoad %104 
					                               f32_2 %378 = OpExtInst %1 13 %377 
					                                              OpStore %104 %378 
					                               f32_2 %379 = OpLoad %104 
					                               f32_2 %381 = OpFMul %379 %380 
					                                              OpStore %104 %381 
					                               f32_2 %382 = OpLoad %104 
					                               f32_2 %383 = OpExtInst %1 10 %382 
					                                              OpStore %104 %383 
					                               f32_2 %384 = OpLoad %104 
					                               f32_4 %385 = OpLoad %9 
					                               f32_2 %386 = OpVectorShuffle %385 %385 0 0 
					                               f32_2 %387 = OpFMul %384 %386 
					                               f32_3 %388 = OpLoad %55 
					                               f32_3 %389 = OpVectorShuffle %388 %387 3 1 4 
					                                              OpStore %55 %389 
					                               f32_3 %390 = OpLoad %55 
					                               f32_3 %391 = OpLoad %55 
					                               f32_3 %392 = OpFMul %390 %391 
					                               f32_4 %393 = OpLoad %9 
					                               f32_4 %394 = OpVectorShuffle %393 %392 4 1 5 6 
					                                              OpStore %9 %394 
					                               f32_4 %395 = OpLoad %9 
					                               f32_3 %396 = OpVectorShuffle %395 %395 0 2 3 
					                               f32_3 %399 = OpFMul %396 %398 
					                               f32_4 %400 = OpLoad %9 
					                               f32_4 %401 = OpVectorShuffle %400 %399 4 1 5 6 
					                                              OpStore %9 %401 
					                               f32_4 %402 = OpLoad %9 
					                               f32_3 %403 = OpVectorShuffle %402 %402 0 2 3 
					                               f32_3 %405 = OpExtInst %1 37 %403 %404 
					                               f32_4 %406 = OpLoad %9 
					                               f32_4 %407 = OpVectorShuffle %406 %405 4 1 5 6 
					                                              OpStore %9 %407 
					                               f32_4 %408 = OpLoad %9 
					                               f32_3 %409 = OpVectorShuffle %408 %408 0 2 3 
					                               f32_3 %412 = OpFMul %409 %411 
					                               f32_3 %415 = OpFAdd %412 %414 
					                                              OpStore %55 %415 
					                               f32_4 %416 = OpLoad %9 
					                               f32_3 %417 = OpVectorShuffle %416 %416 0 2 3 
					                               f32_4 %418 = OpLoad %9 
					                               f32_3 %419 = OpVectorShuffle %418 %418 0 2 3 
					                               f32_3 %420 = OpFMul %417 %419 
					                               f32_4 %421 = OpLoad %9 
					                               f32_4 %422 = OpVectorShuffle %421 %420 4 1 5 6 
					                                              OpStore %9 %422 
					                               f32_4 %423 = OpLoad %9 
					                               f32_3 %424 = OpVectorShuffle %423 %423 0 2 3 
					                               f32_3 %425 = OpLoad %55 
					                               f32_3 %426 = OpFMul %424 %425 
					                               f32_4 %427 = OpLoad %9 
					                               f32_4 %428 = OpVectorShuffle %427 %426 4 1 5 6 
					                                              OpStore %9 %428 
					                               f32_4 %429 = OpLoad %9 
					                               f32_4 %430 = OpVectorShuffle %429 %429 0 0 2 3 
					                              bool_4 %433 = OpFOrdGreaterThanEqual %430 %432 
					                              bool_3 %434 = OpVectorShuffle %433 %433 0 2 3 
					                              bool_4 %435 = OpLoad %182 
					                              bool_4 %436 = OpVectorShuffle %435 %434 4 1 5 6 
					                                              OpStore %182 %436 
					                              bool_4 %438 = OpLoad %182 
					                              bool_3 %439 = OpVectorShuffle %438 %438 0 2 3 
					                               f32_3 %440 = OpSelect %439 %404 %437 
					                               f32_3 %441 = OpExtInst %1 46 %437 %404 %440 
					                               f32_4 %442 = OpLoad %9 
					                               f32_4 %443 = OpVectorShuffle %442 %441 4 1 5 6 
					                                              OpStore %9 %443 
					                               f32_4 %446 = OpLoad %9 
					                               f32_3 %447 = OpVectorShuffle %446 %446 0 2 3 
					                               f32_3 %448 = OpLoad %119 
					                               f32_3 %449 = OpVectorShuffle %448 %448 0 0 0 
					                               f32_3 %450 = OpFMul %447 %449 
					                               f32_3 %451 = OpLoad %154 
					                               f32_3 %452 = OpFAdd %450 %451 
					                               f32_4 %453 = OpLoad %445 
					                               f32_4 %454 = OpVectorShuffle %453 %452 4 5 6 3 
					                                              OpStore %445 %454 
					                         Output f32* %457 = OpAccessChain %445 %455 
					                                              OpStore %457 %18 
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
						vec4 unused_0_3[2];
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat10_2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					bvec3 u_xlatb4;
					bool u_xlatb5;
					vec2 u_xlat8;
					vec2 u_xlat9;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _TimeX + 1.0;
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.y = _Value * _TimeX;
					    u_xlat0.x = u_xlat0.y * 50.0 + u_xlat0.x;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.00066666666, 10.0);
					    u_xlat1.x = floor(u_xlat0.y);
					    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat0.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * 30.0;
					    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
					    u_xlat8.x = fract(abs(u_xlat0.x));
					    u_xlat0.x = floor(u_xlat0.x);
					    u_xlat0.x = (-u_xlat0.x) + 30.0;
					    u_xlat4.x = (u_xlatb4.x) ? u_xlat8.x : (-u_xlat8.x);
					    u_xlat4.x = u_xlat4.x * 50.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat9.xy = u_xlat8.xy * vec2(50.0, 30.0);
					    u_xlat10_2 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8.xy = floor(u_xlat9.xy);
					    u_xlatb4.x = u_xlat8.x>=u_xlat4.x;
					    u_xlat8.x = u_xlat8.y + 1.0;
					    u_xlatb0.z = u_xlat8.x>=u_xlat0.x;
					    u_xlatb0.x = u_xlat8.y>=u_xlat0.x;
					    u_xlat0.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xz));
					    u_xlat4.x = (u_xlatb4.x) ? 0.0 : u_xlat0.z;
					    u_xlat0.x = u_xlat4.x + u_xlat0.x;
					    u_xlat0.x = min(u_xlat0.x, 1.0);
					    u_xlat4.x = _TimeX * 10.0;
					    u_xlat1.y = floor(u_xlat4.x);
					    u_xlat4.xy = u_xlat1.xy * vec2(-1.0, 0.0);
					    u_xlat1.x = u_xlat8.y * 0.5;
					    u_xlat12 = sin(u_xlat8.y);
					    u_xlat12 = u_xlat12 * 10000.0;
					    u_xlat12 = fract(u_xlat12);
					    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
					    u_xlat1.x = fract(abs(u_xlat1.x));
					    u_xlat1.x = (u_xlatb5) ? u_xlat1.x : (-u_xlat1.x);
					    u_xlatb1 = u_xlat1.x>=0.5;
					    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
					    u_xlat4.xy = u_xlat4.xy * u_xlat1.xx;
					    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat12) + u_xlat9.xy;
					    u_xlat12 = fract(u_xlat9.y);
					    u_xlatb4.z = u_xlat12>=0.100000001;
					    u_xlat1.xy = floor(u_xlat4.xy);
					    u_xlat1.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
					    u_xlat1.x = sin(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * 43758.5469;
					    u_xlat1.x = fract(u_xlat1.x);
					    u_xlat1.y = u_xlat0.x * u_xlat1.x;
					    u_xlat3 = u_xlat4.xyxy + vec4(0.100000001, 0.0, -0.100000001, -0.0);
					    u_xlat4.x = fract(u_xlat4.x);
					    u_xlatb4.x = u_xlat4.x>=0.100000001;
					    u_xlat4.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xz));
					    u_xlat4.x = u_xlat4.z * u_xlat4.x;
					    u_xlat3 = floor(u_xlat3);
					    u_xlat8.x = dot(u_xlat3.xy, vec2(12.9898005, 78.2330017));
					    u_xlat8.y = dot(u_xlat3.zw, vec2(12.9898005, 78.2330017));
					    u_xlat8.xy = sin(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
					    u_xlat8.xy = fract(u_xlat8.xy);
					    u_xlat1.xz = u_xlat8.xy * u_xlat0.xx;
					    u_xlat0.xzw = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat0.xzw = u_xlat0.xzw * vec3(4.0, 4.0, 4.0);
					    u_xlat0.xzw = min(u_xlat0.xzw, vec3(1.0, 1.0, 1.0));
					    u_xlat1.xyz = u_xlat0.xzw * vec3(-2.0, -2.0, -2.0) + vec3(3.0, 3.0, 3.0);
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat0.xzw;
					    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xyz;
					    u_xlatb0.xzw = greaterThanEqual(u_xlat0.xxzw, vec4(0.25, 0.0, 0.25, 0.25)).xzw;
					    u_xlat0.xzw = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb0.xzw));
					    SV_Target0.xyz = u_xlat0.xzw * u_xlat4.xxx + u_xlat10_2.xyz;
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