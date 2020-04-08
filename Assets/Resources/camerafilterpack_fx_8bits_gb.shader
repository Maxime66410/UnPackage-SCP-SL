Shader "CameraFilterPack/FX_8bits_gb" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_ScreenX ("Time", Range(0, 2000)) = 1
		_ScreenY ("Time", Range(0, 2000)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 6995
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
					uniform 	float _Distortion;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					bool u_xlatb6;
					bool u_xlatb12;
					float u_xlat18;
					bool u_xlatb18;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.x = floor(_TimeX);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat1 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat0.xy = u_xlat1.zw * vec2(0.5, 0.5) + u_xlat0.xx;
					    u_xlat0.z = dot(u_xlat0.xy, vec2(17.0, 0.100000001));
					    u_xlat0.x = u_xlat0.y * 13.0 + u_xlat0.x;
					    u_xlat0.xy = sin(u_xlat0.xz);
					    u_xlat0.x = abs(u_xlat0.x) + 0.100000001;
					    u_xlat6.x = u_xlat0.y * 10000.0;
					    u_xlat0.x = u_xlat0.x * u_xlat6.x;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.z = 1000.0;
					    u_xlat6.xy = u_xlat1.xy * vec2(1.0, 0.99999994);
					    u_xlat18 = u_xlat1.w + u_xlat1.z;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-2.69999982e-05, -0.00409599999, -0.0359370038);
					    u_xlat6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat2.y = min(u_xlat6.x, 1000.0);
					    u_xlatb6 = u_xlat6.x<1000.0;
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.0299999993, 0.159999996, 0.330000013), vec3(bvec3(u_xlatb6)));
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-0.00219699973, -0.0795070007, -0.0506530032);
					    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb6 = u_xlat2.x<u_xlat2.y;
					    u_xlat2.yz = (bool(u_xlatb6)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-0.103822999, -0.328509003, -0.0740879923);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-0.314432025, -0.493039042, -0.0196830016);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb12 = u_xlat2.x<u_xlat2.y;
					    u_xlat1.yz = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlatb19 = u_xlat1.x<u_xlat1.y;
					    u_xlat1.xy = (bool(u_xlatb19)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat1.x = u_xlat1.y / u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.75 + u_xlat1.x;
					    u_xlat1.x = u_xlat18 * 0.5;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat18 = (-u_xlat1.x) * 2.0 + u_xlat18;
					    u_xlatb0 = u_xlat0.x<u_xlat18;
					    u_xlat1.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(bvec3(u_xlatb6)));
					    u_xlat2.xyz = (bool(u_xlatb6)) ? vec3(0.129999995, 0.430000007, 0.370000005) : u_xlat4.xyz;
					    u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat2.xyz : u_xlat1.xyz;
					    u_xlat6.xyz = (bool(u_xlatb12)) ? vec3(0.469999999, 0.689999998, 0.419999987) : u_xlat2.xyz;
					    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat6.xyz : u_xlat1.xyz;
					    u_xlat6.xyz = (bool(u_xlatb19)) ? vec3(0.680000007, 0.790000021, 0.270000011) : u_xlat6.xyz;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat6.xyz;
					    u_xlatb18 = u_xlat0.x==0.0;
					    SV_Target0.xyz = (bool(u_xlatb18)) ? vec3(0.0299999993, 0.159999996, 0.330000013) : u_xlat0.xyz;
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
					; Bound: 420
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %36 %407 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpMemberDecorate %11 2 RelaxedPrecision 
					                                              OpMemberDecorate %11 2 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD0 Location 36 
					                                              OpDecorate %42 RelaxedPrecision 
					                                              OpDecorate %43 RelaxedPrecision 
					                                              OpDecorate %46 RelaxedPrecision 
					                                              OpDecorate %47 RelaxedPrecision 
					                                              OpDecorate %120 RelaxedPrecision 
					                                              OpDecorate %123 RelaxedPrecision 
					                                              OpDecorate %123 DescriptorSet 123 
					                                              OpDecorate %123 Binding 123 
					                                              OpDecorate %124 RelaxedPrecision 
					                                              OpDecorate %127 RelaxedPrecision 
					                                              OpDecorate %127 DescriptorSet 127 
					                                              OpDecorate %127 Binding 127 
					                                              OpDecorate %128 RelaxedPrecision 
					                                              OpDecorate %134 RelaxedPrecision 
					                                              OpDecorate %135 RelaxedPrecision 
					                                              OpDecorate %143 RelaxedPrecision 
					                                              OpDecorate %144 RelaxedPrecision 
					                                              OpDecorate %145 RelaxedPrecision 
					                                              OpDecorate %146 RelaxedPrecision 
					                                              OpDecorate %147 RelaxedPrecision 
					                                              OpDecorate %148 RelaxedPrecision 
					                                              OpDecorate %407 Location 407 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 3 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_3* %9 = OpVariable Private 
					                                      %10 = OpTypeVector %6 4 
					                                      %11 = OpTypeStruct %6 %6 %10 
					                                      %12 = OpTypePointer Uniform %11 
					   Uniform struct {f32; f32; f32_4;}* %13 = OpVariable Uniform 
					                                      %14 = OpTypeInt 32 1 
					                                  i32 %15 = OpConstant 0 
					                                      %16 = OpTypePointer Uniform %6 
					                                      %20 = OpTypeInt 32 0 
					                                  u32 %21 = OpConstant 0 
					                                      %22 = OpTypePointer Private %6 
					                                      %32 = OpTypePointer Private %10 
					                       Private f32_4* %33 = OpVariable Private 
					                                      %34 = OpTypeVector %6 2 
					                                      %35 = OpTypePointer Input %34 
					                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                  i32 %39 = OpConstant 2 
					                                      %40 = OpTypePointer Uniform %10 
					                                  f32 %51 = OpConstant 3,674022E-40 
					                                f32_2 %52 = OpConstantComposite %51 %51 
					                                  f32 %61 = OpConstant 3,674022E-40 
					                                  f32 %62 = OpConstant 3,674022E-40 
					                                f32_2 %63 = OpConstantComposite %61 %62 
					                                  u32 %65 = OpConstant 2 
					                                  u32 %67 = OpConstant 1 
					                                  f32 %70 = OpConstant 3,674022E-40 
					                       Private f32_3* %86 = OpVariable Private 
					                                  f32 %89 = OpConstant 3,674022E-40 
					                      Private f32_3* %102 = OpVariable Private 
					                                 f32 %103 = OpConstant 3,674022E-40 
					                                 f32 %107 = OpConstant 3,674022E-40 
					                                 f32 %108 = OpConstant 3,674022E-40 
					                               f32_2 %109 = OpConstantComposite %107 %108 
					                        Private f32* %113 = OpVariable Private 
					                                 u32 %114 = OpConstant 3 
					                      Private f32_3* %120 = OpVariable Private 
					                                     %121 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %122 = OpTypePointer UniformConstant %121 
					UniformConstant read_only Texture2D* %123 = OpVariable UniformConstant 
					                                     %125 = OpTypeSampler 
					                                     %126 = OpTypePointer UniformConstant %125 
					            UniformConstant sampler* %127 = OpVariable UniformConstant 
					                                     %129 = OpTypeSampledImage %121 
					                                 i32 %136 = OpConstant 1 
					                      Private f32_3* %151 = OpVariable Private 
					                      Private f32_3* %157 = OpVariable Private 
					                                 f32 %162 = OpConstant 3,674022E-40 
					                                 f32 %163 = OpConstant 3,674022E-40 
					                                 f32 %164 = OpConstant 3,674022E-40 
					                               f32_3 %165 = OpConstantComposite %162 %163 %164 
					                                     %175 = OpTypeBool 
					                                     %176 = OpTypePointer Private %175 
					                       Private bool* %177 = OpVariable Private 
					                                 f32 %181 = OpConstant 3,674022E-40 
					                               f32_3 %182 = OpConstantComposite %181 %181 %181 
					                                 f32 %183 = OpConstant 3,674022E-40 
					                                 f32 %184 = OpConstant 3,674022E-40 
					                                 f32 %185 = OpConstant 3,674022E-40 
					                               f32_3 %186 = OpConstantComposite %183 %184 %185 
					                                     %188 = OpTypeVector %175 3 
					                               f32_3 %190 = OpConstantComposite %107 %107 %107 
					                      Private f32_3* %193 = OpVariable Private 
					                                 f32 %198 = OpConstant 3,674022E-40 
					                                 f32 %199 = OpConstant 3,674022E-40 
					                                 f32 %200 = OpConstant 3,674022E-40 
					                               f32_3 %201 = OpConstantComposite %198 %199 %200 
					                                     %213 = OpTypePointer Function %34 
					                                 f32 %229 = OpConstant 3,674022E-40 
					                                 f32 %230 = OpConstant 3,674022E-40 
					                                 f32 %231 = OpConstant 3,674022E-40 
					                               f32_3 %232 = OpConstantComposite %229 %230 %231 
					                                 f32 %238 = OpConstant 3,674022E-40 
					                                 f32 %239 = OpConstant 3,674022E-40 
					                                 f32 %240 = OpConstant 3,674022E-40 
					                               f32_3 %241 = OpConstantComposite %238 %239 %240 
					                       Private bool* %255 = OpVariable Private 
					                       Private bool* %273 = OpVariable Private 
					                                 f32 %305 = OpConstant 3,674022E-40 
					                                 f32 %321 = OpConstant 3,674022E-40 
					                       Private bool* %325 = OpVariable Private 
					                                     %338 = OpTypePointer Function %7 
					                                 f32 %342 = OpConstant 3,674022E-40 
					                                 f32 %343 = OpConstant 3,674022E-40 
					                                 f32 %344 = OpConstant 3,674022E-40 
					                               f32_3 %345 = OpConstantComposite %342 %343 %344 
					                                 f32 %364 = OpConstant 3,674022E-40 
					                                 f32 %365 = OpConstant 3,674022E-40 
					                                 f32 %366 = OpConstant 3,674022E-40 
					                               f32_3 %367 = OpConstantComposite %364 %365 %366 
					                                 f32 %386 = OpConstant 3,674022E-40 
					                                 f32 %387 = OpConstant 3,674022E-40 
					                                 f32 %388 = OpConstant 3,674022E-40 
					                               f32_3 %389 = OpConstantComposite %386 %387 %388 
					                       Private bool* %402 = OpVariable Private 
					                                     %406 = OpTypePointer Output %10 
					                       Output f32_4* %407 = OpVariable Output 
					                                     %417 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                     Function f32_2* %214 = OpVariable Function 
					                     Function f32_2* %262 = OpVariable Function 
					                     Function f32_2* %280 = OpVariable Function 
					                     Function f32_3* %339 = OpVariable Function 
					                     Function f32_3* %350 = OpVariable Function 
					                     Function f32_3* %361 = OpVariable Function 
					                     Function f32_3* %372 = OpVariable Function 
					                     Function f32_3* %383 = OpVariable Function 
					                     Function f32_3* %394 = OpVariable Function 
					                     Function f32_3* %409 = OpVariable Function 
					                         Uniform f32* %17 = OpAccessChain %13 %15 
					                                  f32 %18 = OpLoad %17 
					                                  f32 %19 = OpExtInst %1 8 %18 
					                         Private f32* %23 = OpAccessChain %9 %21 
					                                              OpStore %23 %19 
					                         Private f32* %24 = OpAccessChain %9 %21 
					                                  f32 %25 = OpLoad %24 
					                                  f32 %26 = OpExtInst %1 13 %25 
					                         Private f32* %27 = OpAccessChain %9 %21 
					                                              OpStore %27 %26 
					                         Private f32* %28 = OpAccessChain %9 %21 
					                                  f32 %29 = OpLoad %28 
					                                  f32 %30 = OpExtInst %1 10 %29 
					                         Private f32* %31 = OpAccessChain %9 %21 
					                                              OpStore %31 %30 
					                                f32_2 %37 = OpLoad vs_TEXCOORD0 
					                                f32_4 %38 = OpVectorShuffle %37 %37 0 1 0 1 
					                       Uniform f32_4* %41 = OpAccessChain %13 %39 
					                                f32_4 %42 = OpLoad %41 
					                                f32_4 %43 = OpVectorShuffle %42 %42 0 1 0 1 
					                                f32_4 %44 = OpFMul %38 %43 
					                       Uniform f32_4* %45 = OpAccessChain %13 %39 
					                                f32_4 %46 = OpLoad %45 
					                                f32_4 %47 = OpVectorShuffle %46 %46 2 3 2 3 
					                                f32_4 %48 = OpFAdd %44 %47 
					                                              OpStore %33 %48 
					                                f32_4 %49 = OpLoad %33 
					                                f32_2 %50 = OpVectorShuffle %49 %49 2 3 
					                                f32_2 %53 = OpFMul %50 %52 
					                                f32_3 %54 = OpLoad %9 
					                                f32_2 %55 = OpVectorShuffle %54 %54 0 0 
					                                f32_2 %56 = OpFAdd %53 %55 
					                                f32_3 %57 = OpLoad %9 
					                                f32_3 %58 = OpVectorShuffle %57 %56 3 4 2 
					                                              OpStore %9 %58 
					                                f32_3 %59 = OpLoad %9 
					                                f32_2 %60 = OpVectorShuffle %59 %59 0 1 
					                                  f32 %64 = OpDot %60 %63 
					                         Private f32* %66 = OpAccessChain %9 %65 
					                                              OpStore %66 %64 
					                         Private f32* %68 = OpAccessChain %9 %67 
					                                  f32 %69 = OpLoad %68 
					                                  f32 %71 = OpFMul %69 %70 
					                         Private f32* %72 = OpAccessChain %9 %21 
					                                  f32 %73 = OpLoad %72 
					                                  f32 %74 = OpFAdd %71 %73 
					                         Private f32* %75 = OpAccessChain %9 %21 
					                                              OpStore %75 %74 
					                                f32_3 %76 = OpLoad %9 
					                                f32_2 %77 = OpVectorShuffle %76 %76 0 2 
					                                f32_2 %78 = OpExtInst %1 13 %77 
					                                f32_3 %79 = OpLoad %9 
					                                f32_3 %80 = OpVectorShuffle %79 %78 3 4 2 
					                                              OpStore %9 %80 
					                         Private f32* %81 = OpAccessChain %9 %21 
					                                  f32 %82 = OpLoad %81 
					                                  f32 %83 = OpExtInst %1 4 %82 
					                                  f32 %84 = OpFAdd %83 %62 
					                         Private f32* %85 = OpAccessChain %9 %21 
					                                              OpStore %85 %84 
					                         Private f32* %87 = OpAccessChain %9 %67 
					                                  f32 %88 = OpLoad %87 
					                                  f32 %90 = OpFMul %88 %89 
					                         Private f32* %91 = OpAccessChain %86 %21 
					                                              OpStore %91 %90 
					                         Private f32* %92 = OpAccessChain %9 %21 
					                                  f32 %93 = OpLoad %92 
					                         Private f32* %94 = OpAccessChain %86 %21 
					                                  f32 %95 = OpLoad %94 
					                                  f32 %96 = OpFMul %93 %95 
					                         Private f32* %97 = OpAccessChain %9 %21 
					                                              OpStore %97 %96 
					                         Private f32* %98 = OpAccessChain %9 %21 
					                                  f32 %99 = OpLoad %98 
					                                 f32 %100 = OpExtInst %1 10 %99 
					                        Private f32* %101 = OpAccessChain %9 %21 
					                                              OpStore %101 %100 
					                        Private f32* %104 = OpAccessChain %102 %65 
					                                              OpStore %104 %103 
					                               f32_4 %105 = OpLoad %33 
					                               f32_2 %106 = OpVectorShuffle %105 %105 0 1 
					                               f32_2 %110 = OpFMul %106 %109 
					                               f32_3 %111 = OpLoad %86 
					                               f32_3 %112 = OpVectorShuffle %111 %110 3 4 2 
					                                              OpStore %86 %112 
					                        Private f32* %115 = OpAccessChain %33 %114 
					                                 f32 %116 = OpLoad %115 
					                        Private f32* %117 = OpAccessChain %33 %65 
					                                 f32 %118 = OpLoad %117 
					                                 f32 %119 = OpFAdd %116 %118 
					                                              OpStore %113 %119 
					                 read_only Texture2D %124 = OpLoad %123 
					                             sampler %128 = OpLoad %127 
					          read_only Texture2DSampled %130 = OpSampledImage %124 %128 
					                               f32_3 %131 = OpLoad %86 
					                               f32_2 %132 = OpVectorShuffle %131 %131 0 1 
					                               f32_4 %133 = OpImageSampleImplicitLod %130 %132 
					                               f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
					                                              OpStore %120 %134 
					                               f32_3 %135 = OpLoad %120 
					                        Uniform f32* %137 = OpAccessChain %13 %136 
					                                 f32 %138 = OpLoad %137 
					                        Uniform f32* %139 = OpAccessChain %13 %136 
					                                 f32 %140 = OpLoad %139 
					                        Uniform f32* %141 = OpAccessChain %13 %136 
					                                 f32 %142 = OpLoad %141 
					                               f32_3 %143 = OpCompositeConstruct %138 %140 %142 
					                                 f32 %144 = OpCompositeExtract %143 0 
					                                 f32 %145 = OpCompositeExtract %143 1 
					                                 f32 %146 = OpCompositeExtract %143 2 
					                               f32_3 %147 = OpCompositeConstruct %144 %145 %146 
					                               f32_3 %148 = OpFAdd %135 %147 
					                               f32_4 %149 = OpLoad %33 
					                               f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
					                                              OpStore %33 %150 
					                               f32_4 %152 = OpLoad %33 
					                               f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
					                               f32_4 %154 = OpLoad %33 
					                               f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
					                               f32_3 %156 = OpFMul %153 %155 
					                                              OpStore %151 %156 
					                               f32_4 %158 = OpLoad %33 
					                               f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
					                               f32_3 %160 = OpLoad %151 
					                               f32_3 %161 = OpFMul %159 %160 
					                               f32_3 %166 = OpFAdd %161 %165 
					                                              OpStore %157 %166 
					                               f32_3 %167 = OpLoad %157 
					                               f32_3 %168 = OpLoad %157 
					                                 f32 %169 = OpDot %167 %168 
					                        Private f32* %170 = OpAccessChain %86 %21 
					                                              OpStore %170 %169 
					                        Private f32* %171 = OpAccessChain %86 %21 
					                                 f32 %172 = OpLoad %171 
					                                 f32 %173 = OpExtInst %1 37 %172 %103 
					                        Private f32* %174 = OpAccessChain %102 %67 
					                                              OpStore %174 %173 
					                        Private f32* %178 = OpAccessChain %86 %21 
					                                 f32 %179 = OpLoad %178 
					                                bool %180 = OpFOrdLessThan %179 %103 
					                                              OpStore %177 %180 
					                                bool %187 = OpLoad %177 
					                              bool_3 %189 = OpCompositeConstruct %187 %187 %187 
					                               f32_3 %191 = OpSelect %189 %190 %182 
					                               f32_3 %192 = OpExtInst %1 46 %182 %186 %191 
					                                              OpStore %157 %192 
					                               f32_4 %194 = OpLoad %33 
					                               f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
					                               f32_3 %196 = OpLoad %151 
					                               f32_3 %197 = OpFMul %195 %196 
					                               f32_3 %202 = OpFAdd %197 %201 
					                                              OpStore %193 %202 
					                               f32_3 %203 = OpLoad %193 
					                               f32_3 %204 = OpLoad %193 
					                                 f32 %205 = OpDot %203 %204 
					                        Private f32* %206 = OpAccessChain %102 %21 
					                                              OpStore %206 %205 
					                        Private f32* %207 = OpAccessChain %102 %21 
					                                 f32 %208 = OpLoad %207 
					                        Private f32* %209 = OpAccessChain %102 %67 
					                                 f32 %210 = OpLoad %209 
					                                bool %211 = OpFOrdLessThan %208 %210 
					                                              OpStore %177 %211 
					                                bool %212 = OpLoad %177 
					                                              OpSelectionMerge %216 None 
					                                              OpBranchConditional %212 %215 %219 
					                                     %215 = OpLabel 
					                               f32_3 %217 = OpLoad %102 
					                               f32_2 %218 = OpVectorShuffle %217 %217 0 1 
					                                              OpStore %214 %218 
					                                              OpBranch %216 
					                                     %219 = OpLabel 
					                               f32_3 %220 = OpLoad %102 
					                               f32_2 %221 = OpVectorShuffle %220 %220 1 2 
					                                              OpStore %214 %221 
					                                              OpBranch %216 
					                                     %216 = OpLabel 
					                               f32_2 %222 = OpLoad %214 
					                               f32_3 %223 = OpLoad %102 
					                               f32_3 %224 = OpVectorShuffle %223 %222 0 3 4 
					                                              OpStore %102 %224 
					                               f32_4 %225 = OpLoad %33 
					                               f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
					                               f32_3 %227 = OpLoad %151 
					                               f32_3 %228 = OpFMul %226 %227 
					                               f32_3 %233 = OpFAdd %228 %232 
					                                              OpStore %193 %233 
					                               f32_4 %234 = OpLoad %33 
					                               f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
					                               f32_3 %236 = OpLoad %151 
					                               f32_3 %237 = OpFMul %235 %236 
					                               f32_3 %242 = OpFAdd %237 %241 
					                               f32_4 %243 = OpLoad %33 
					                               f32_4 %244 = OpVectorShuffle %243 %242 4 5 6 3 
					                                              OpStore %33 %244 
					                               f32_4 %245 = OpLoad %33 
					                               f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
					                               f32_4 %247 = OpLoad %33 
					                               f32_3 %248 = OpVectorShuffle %247 %247 0 1 2 
					                                 f32 %249 = OpDot %246 %248 
					                        Private f32* %250 = OpAccessChain %33 %21 
					                                              OpStore %250 %249 
					                               f32_3 %251 = OpLoad %193 
					                               f32_3 %252 = OpLoad %193 
					                                 f32 %253 = OpDot %251 %252 
					                        Private f32* %254 = OpAccessChain %102 %21 
					                                              OpStore %254 %253 
					                        Private f32* %256 = OpAccessChain %102 %21 
					                                 f32 %257 = OpLoad %256 
					                        Private f32* %258 = OpAccessChain %102 %67 
					                                 f32 %259 = OpLoad %258 
					                                bool %260 = OpFOrdLessThan %257 %259 
					                                              OpStore %255 %260 
					                                bool %261 = OpLoad %255 
					                                              OpSelectionMerge %264 None 
					                                              OpBranchConditional %261 %263 %267 
					                                     %263 = OpLabel 
					                               f32_3 %265 = OpLoad %102 
					                               f32_2 %266 = OpVectorShuffle %265 %265 0 1 
					                                              OpStore %262 %266 
					                                              OpBranch %264 
					                                     %267 = OpLabel 
					                               f32_3 %268 = OpLoad %102 
					                               f32_2 %269 = OpVectorShuffle %268 %268 1 2 
					                                              OpStore %262 %269 
					                                              OpBranch %264 
					                                     %264 = OpLabel 
					                               f32_2 %270 = OpLoad %262 
					                               f32_4 %271 = OpLoad %33 
					                               f32_4 %272 = OpVectorShuffle %271 %270 0 4 5 3 
					                                              OpStore %33 %272 
					                        Private f32* %274 = OpAccessChain %33 %21 
					                                 f32 %275 = OpLoad %274 
					                        Private f32* %276 = OpAccessChain %33 %67 
					                                 f32 %277 = OpLoad %276 
					                                bool %278 = OpFOrdLessThan %275 %277 
					                                              OpStore %273 %278 
					                                bool %279 = OpLoad %273 
					                                              OpSelectionMerge %282 None 
					                                              OpBranchConditional %279 %281 %285 
					                                     %281 = OpLabel 
					                               f32_4 %283 = OpLoad %33 
					                               f32_2 %284 = OpVectorShuffle %283 %283 0 1 
					                                              OpStore %280 %284 
					                                              OpBranch %282 
					                                     %285 = OpLabel 
					                               f32_4 %286 = OpLoad %33 
					                               f32_2 %287 = OpVectorShuffle %286 %286 1 2 
					                                              OpStore %280 %287 
					                                              OpBranch %282 
					                                     %282 = OpLabel 
					                               f32_2 %288 = OpLoad %280 
					                               f32_4 %289 = OpLoad %33 
					                               f32_4 %290 = OpVectorShuffle %289 %288 4 5 2 3 
					                                              OpStore %33 %290 
					                        Private f32* %291 = OpAccessChain %33 %67 
					                                 f32 %292 = OpLoad %291 
					                        Private f32* %293 = OpAccessChain %33 %21 
					                                 f32 %294 = OpLoad %293 
					                                 f32 %295 = OpFAdd %292 %294 
					                        Private f32* %296 = OpAccessChain %33 %21 
					                                              OpStore %296 %295 
					                        Private f32* %297 = OpAccessChain %33 %67 
					                                 f32 %298 = OpLoad %297 
					                        Private f32* %299 = OpAccessChain %33 %21 
					                                 f32 %300 = OpLoad %299 
					                                 f32 %301 = OpFDiv %298 %300 
					                        Private f32* %302 = OpAccessChain %33 %21 
					                                              OpStore %302 %301 
					                        Private f32* %303 = OpAccessChain %9 %21 
					                                 f32 %304 = OpLoad %303 
					                                 f32 %306 = OpFMul %304 %305 
					                        Private f32* %307 = OpAccessChain %33 %21 
					                                 f32 %308 = OpLoad %307 
					                                 f32 %309 = OpFAdd %306 %308 
					                        Private f32* %310 = OpAccessChain %9 %21 
					                                              OpStore %310 %309 
					                                 f32 %311 = OpLoad %113 
					                                 f32 %312 = OpFMul %311 %51 
					                        Private f32* %313 = OpAccessChain %33 %21 
					                                              OpStore %313 %312 
					                        Private f32* %314 = OpAccessChain %33 %21 
					                                 f32 %315 = OpLoad %314 
					                                 f32 %316 = OpExtInst %1 8 %315 
					                        Private f32* %317 = OpAccessChain %33 %21 
					                                              OpStore %317 %316 
					                        Private f32* %318 = OpAccessChain %33 %21 
					                                 f32 %319 = OpLoad %318 
					                                 f32 %320 = OpFNegate %319 
					                                 f32 %322 = OpFMul %320 %321 
					                                 f32 %323 = OpLoad %113 
					                                 f32 %324 = OpFAdd %322 %323 
					                                              OpStore %113 %324 
					                        Private f32* %326 = OpAccessChain %9 %21 
					                                 f32 %327 = OpLoad %326 
					                                 f32 %328 = OpLoad %113 
					                                bool %329 = OpFOrdLessThan %327 %328 
					                                              OpStore %325 %329 
					                               f32_3 %330 = OpLoad %157 
					                                bool %331 = OpLoad %177 
					                              bool_3 %332 = OpCompositeConstruct %331 %331 %331 
					                               f32_3 %333 = OpSelect %332 %190 %182 
					                               f32_3 %334 = OpExtInst %1 46 %182 %330 %333 
					                               f32_4 %335 = OpLoad %33 
					                               f32_4 %336 = OpVectorShuffle %335 %334 4 5 6 3 
					                                              OpStore %33 %336 
					                                bool %337 = OpLoad %177 
					                                              OpSelectionMerge %341 None 
					                                              OpBranchConditional %337 %340 %346 
					                                     %340 = OpLabel 
					                                              OpStore %339 %345 
					                                              OpBranch %341 
					                                     %346 = OpLabel 
					                               f32_3 %347 = OpLoad %157 
					                                              OpStore %339 %347 
					                                              OpBranch %341 
					                                     %341 = OpLabel 
					                               f32_3 %348 = OpLoad %339 
					                                              OpStore %102 %348 
					                                bool %349 = OpLoad %255 
					                                              OpSelectionMerge %352 None 
					                                              OpBranchConditional %349 %351 %354 
					                                     %351 = OpLabel 
					                               f32_3 %353 = OpLoad %102 
					                                              OpStore %350 %353 
					                                              OpBranch %352 
					                                     %354 = OpLabel 
					                               f32_4 %355 = OpLoad %33 
					                               f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
					                                              OpStore %350 %356 
					                                              OpBranch %352 
					                                     %352 = OpLabel 
					                               f32_3 %357 = OpLoad %350 
					                               f32_4 %358 = OpLoad %33 
					                               f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
					                                              OpStore %33 %359 
					                                bool %360 = OpLoad %255 
					                                              OpSelectionMerge %363 None 
					                                              OpBranchConditional %360 %362 %368 
					                                     %362 = OpLabel 
					                                              OpStore %361 %367 
					                                              OpBranch %363 
					                                     %368 = OpLabel 
					                               f32_3 %369 = OpLoad %102 
					                                              OpStore %361 %369 
					                                              OpBranch %363 
					                                     %363 = OpLabel 
					                               f32_3 %370 = OpLoad %361 
					                                              OpStore %86 %370 
					                                bool %371 = OpLoad %273 
					                                              OpSelectionMerge %374 None 
					                                              OpBranchConditional %371 %373 %376 
					                                     %373 = OpLabel 
					                               f32_3 %375 = OpLoad %86 
					                                              OpStore %372 %375 
					                                              OpBranch %374 
					                                     %376 = OpLabel 
					                               f32_4 %377 = OpLoad %33 
					                               f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
					                                              OpStore %372 %378 
					                                              OpBranch %374 
					                                     %374 = OpLabel 
					                               f32_3 %379 = OpLoad %372 
					                               f32_4 %380 = OpLoad %33 
					                               f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
					                                              OpStore %33 %381 
					                                bool %382 = OpLoad %273 
					                                              OpSelectionMerge %385 None 
					                                              OpBranchConditional %382 %384 %390 
					                                     %384 = OpLabel 
					                                              OpStore %383 %389 
					                                              OpBranch %385 
					                                     %390 = OpLabel 
					                               f32_3 %391 = OpLoad %86 
					                                              OpStore %383 %391 
					                                              OpBranch %385 
					                                     %385 = OpLabel 
					                               f32_3 %392 = OpLoad %383 
					                                              OpStore %86 %392 
					                                bool %393 = OpLoad %325 
					                                              OpSelectionMerge %396 None 
					                                              OpBranchConditional %393 %395 %399 
					                                     %395 = OpLabel 
					                               f32_4 %397 = OpLoad %33 
					                               f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
					                                              OpStore %394 %398 
					                                              OpBranch %396 
					                                     %399 = OpLabel 
					                               f32_3 %400 = OpLoad %86 
					                                              OpStore %394 %400 
					                                              OpBranch %396 
					                                     %396 = OpLabel 
					                               f32_3 %401 = OpLoad %394 
					                                              OpStore %9 %401 
					                        Private f32* %403 = OpAccessChain %9 %21 
					                                 f32 %404 = OpLoad %403 
					                                bool %405 = OpFOrdEqual %404 %181 
					                                              OpStore %402 %405 
					                                bool %408 = OpLoad %402 
					                                              OpSelectionMerge %411 None 
					                                              OpBranchConditional %408 %410 %412 
					                                     %410 = OpLabel 
					                                              OpStore %409 %186 
					                                              OpBranch %411 
					                                     %412 = OpLabel 
					                               f32_3 %413 = OpLoad %9 
					                                              OpStore %409 %413 
					                                              OpBranch %411 
					                                     %411 = OpLabel 
					                               f32_3 %414 = OpLoad %409 
					                               f32_4 %415 = OpLoad %407 
					                               f32_4 %416 = OpVectorShuffle %415 %414 4 5 6 3 
					                                              OpStore %407 %416 
					                         Output f32* %418 = OpAccessChain %407 %114 
					                                              OpStore %418 %107 
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
						float _Distortion;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					bool u_xlatb6;
					bool u_xlatb12;
					float u_xlat18;
					bool u_xlatb18;
					bool u_xlatb19;
					void main()
					{
					    u_xlat0.x = floor(_TimeX);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat1 = vs_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
					    u_xlat0.xy = u_xlat1.zw * vec2(0.5, 0.5) + u_xlat0.xx;
					    u_xlat0.z = dot(u_xlat0.xy, vec2(17.0, 0.100000001));
					    u_xlat0.x = u_xlat0.y * 13.0 + u_xlat0.x;
					    u_xlat0.xy = sin(u_xlat0.xz);
					    u_xlat0.x = abs(u_xlat0.x) + 0.100000001;
					    u_xlat6.x = u_xlat0.y * 10000.0;
					    u_xlat0.x = u_xlat0.x * u_xlat6.x;
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlat2.z = 1000.0;
					    u_xlat6.xy = u_xlat1.xy * vec2(1.0, 0.99999994);
					    u_xlat18 = u_xlat1.w + u_xlat1.z;
					    u_xlat10_1 = texture(_MainTex, u_xlat6.xy);
					    u_xlat1.xyz = u_xlat10_1.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat1.xyz;
					    u_xlat4.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-2.69999982e-05, -0.00409599999, -0.0359370038);
					    u_xlat6.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat2.y = min(u_xlat6.x, 1000.0);
					    u_xlatb6 = u_xlat6.x<1000.0;
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.0299999993, 0.159999996, 0.330000013), vec3(bvec3(u_xlatb6)));
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-0.00219699973, -0.0795070007, -0.0506530032);
					    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb6 = u_xlat2.x<u_xlat2.y;
					    u_xlat2.yz = (bool(u_xlatb6)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlat5.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-0.103822999, -0.328509003, -0.0740879923);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(-0.314432025, -0.493039042, -0.0196830016);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat2.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb12 = u_xlat2.x<u_xlat2.y;
					    u_xlat1.yz = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlatb19 = u_xlat1.x<u_xlat1.y;
					    u_xlat1.xy = (bool(u_xlatb19)) ? u_xlat1.xy : u_xlat1.yz;
					    u_xlat1.x = u_xlat1.y + u_xlat1.x;
					    u_xlat1.x = u_xlat1.y / u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * 0.75 + u_xlat1.x;
					    u_xlat1.x = u_xlat18 * 0.5;
					    u_xlat1.x = floor(u_xlat1.x);
					    u_xlat18 = (-u_xlat1.x) * 2.0 + u_xlat18;
					    u_xlatb0 = u_xlat0.x<u_xlat18;
					    u_xlat1.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(bvec3(u_xlatb6)));
					    u_xlat2.xyz = (bool(u_xlatb6)) ? vec3(0.129999995, 0.430000007, 0.370000005) : u_xlat4.xyz;
					    u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat2.xyz : u_xlat1.xyz;
					    u_xlat6.xyz = (bool(u_xlatb12)) ? vec3(0.469999999, 0.689999998, 0.419999987) : u_xlat2.xyz;
					    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat6.xyz : u_xlat1.xyz;
					    u_xlat6.xyz = (bool(u_xlatb19)) ? vec3(0.680000007, 0.790000021, 0.270000011) : u_xlat6.xyz;
					    u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat6.xyz;
					    u_xlatb18 = u_xlat0.x==0.0;
					    SV_Target0.xyz = (bool(u_xlatb18)) ? vec3(0.0299999993, 0.159999996, 0.330000013) : u_xlat0.xyz;
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