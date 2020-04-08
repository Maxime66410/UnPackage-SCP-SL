Shader "CameraFilterPack/FX_8bits" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_TimeX ("Time", Range(0, 1)) = 1
		_Distortion ("_Distortion", Range(1, 10)) = 1
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 6429
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
					uniform 	float _Distortion;
					uniform 	vec4 _MainTex_ST;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat8;
					vec2 u_xlat15;
					bool u_xlatb15;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat23;
					void main()
					{
					    u_xlat0.z = 1000.0;
					    u_xlat1.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.yx);
					    u_xlat2.xyz = u_xlat10_2.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat0.y = min(u_xlat21, 1000.0);
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.248746932, -0.0272114873, -0.0179268718);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.62890625, 0.30078125, 0.26171875), vec3(bvec3(u_xlatb21)));
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0709900856, -0.428501189, -0.476837158);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.253410816, -0.0392498374, -0.267751515);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb15 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb15)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(bvec3(u_xlatb21)));
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.4140625, 0.75390625, 0.78125) : u_xlat4.xyz;
					    u_xlat5.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb15)) ? vec3(0.6328125, 0.33984375, 0.64453125) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0464134216, -0.308615983, -0.0511035323);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.359375, 0.67578125, 0.37109375) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0293874145, -0.0187416077, -0.226284027);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.30859375, 0.265625, 0.609375) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.498618305, -0.584146023, -0.153264582);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.79296875, 0.8359375, 0.53515625) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.258132637, -0.0670471191, -0.0116295815);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.63671875, 0.40625, 0.2265625) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0793337822, -0.034081161, -7.93337822e-05);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.4296875, 0.32421875, 0.04296875) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.506023407, -0.122093141, -0.0979323387);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.796875, 0.49609375, 0.4609375) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0578343272, -0.0578343272, -0.0578343272);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.38671875, 0.38671875, 0.38671875) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.160075366, -0.160075366, -0.160075366);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.54296875, 0.54296875, 0.54296875) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.221960247, -0.697200477, -0.230663598);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.60546875, 0.88671875, 0.61328125) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.156645298, -0.122093141, -0.513501465);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.5390625, 0.49609375, 0.80078125) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.319443643, -0.319443643, -0.319443643);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat2.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat3.xyz = (bool(u_xlatb21)) ? vec3(0.68359375, 0.68359375, 0.68359375) : u_xlat4.xyz;
					    u_xlatb21 = u_xlat2.x<u_xlat2.y;
					    u_xlat15.xy = (bool(u_xlatb21)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat2.xyz = (bool(u_xlatb21)) ? vec3(1.0, 1.0, 1.0) : u_xlat3.xyz;
					    u_xlat21 = dot(u_xlat1.yx, vec2(8.5, 0.0500000007));
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 10000.0;
					    u_xlat23 = dot(u_xlat1.xy, vec2(6.5, 0.5));
					    u_xlat1.x = u_xlat1.x + u_xlat1.y;
					    u_xlat8 = sin(u_xlat23);
					    u_xlat8 = abs(u_xlat8) + 0.100000001;
					    u_xlat21 = u_xlat21 * u_xlat8;
					    u_xlat21 = fract(u_xlat21);
					    u_xlat8 = u_xlat15.y + u_xlat15.x;
					    u_xlat8 = u_xlat15.y / u_xlat8;
					    u_xlat21 = u_xlat21 * 0.75 + u_xlat8;
					    u_xlat8 = u_xlat1.x * 0.5;
					    u_xlat8 = floor(u_xlat8);
					    u_xlat1.x = (-u_xlat8) * 2.0 + u_xlat1.x;
					    u_xlatb21 = u_xlat21<u_xlat1.x;
					    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat2.xyz;
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
					; Bound: 865
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %19 %850 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                             OpDecorate vs_TEXCOORD0 Location 19 
					                                             OpMemberDecorate %23 0 Offset 23 
					                                             OpMemberDecorate %23 1 RelaxedPrecision 
					                                             OpMemberDecorate %23 1 Offset 23 
					                                             OpDecorate %23 Block 
					                                             OpDecorate %25 DescriptorSet 25 
					                                             OpDecorate %25 Binding 25 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %37 RelaxedPrecision 
					                                             OpDecorate %40 RelaxedPrecision 
					                                             OpDecorate %40 DescriptorSet 40 
					                                             OpDecorate %40 Binding 40 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %44 RelaxedPrecision 
					                                             OpDecorate %44 DescriptorSet 44 
					                                             OpDecorate %44 Binding 44 
					                                             OpDecorate %45 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %53 RelaxedPrecision 
					                                             OpDecorate %62 RelaxedPrecision 
					                                             OpDecorate %63 RelaxedPrecision 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %850 Location 850 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                 f32 %10 = OpConstant 3,674022E-40 
					                                     %11 = OpTypeInt 32 0 
					                                 u32 %12 = OpConstant 2 
					                                     %13 = OpTypePointer Private %6 
					                                     %15 = OpTypeVector %6 2 
					                                     %16 = OpTypePointer Private %15 
					                      Private f32_2* %17 = OpVariable Private 
					                                     %18 = OpTypePointer Input %15 
					               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                     %22 = OpTypeVector %6 4 
					                                     %23 = OpTypeStruct %6 %22 
					                                     %24 = OpTypePointer Uniform %23 
					       Uniform struct {f32; f32_4;}* %25 = OpVariable Uniform 
					                                     %26 = OpTypeInt 32 1 
					                                 i32 %27 = OpConstant 1 
					                                     %28 = OpTypePointer Uniform %22 
					                      Private f32_3* %37 = OpVariable Private 
					                                     %38 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %39 = OpTypePointer UniformConstant %38 
					UniformConstant read_only Texture2D* %40 = OpVariable UniformConstant 
					                                     %42 = OpTypeSampler 
					                                     %43 = OpTypePointer UniformConstant %42 
					            UniformConstant sampler* %44 = OpVariable UniformConstant 
					                                     %46 = OpTypeSampledImage %38 
					                      Private f32_3* %52 = OpVariable Private 
					                                 i32 %54 = OpConstant 0 
					                                     %55 = OpTypePointer Uniform %6 
					                      Private f32_3* %68 = OpVariable Private 
					                      Private f32_3* %72 = OpVariable Private 
					                        Private f32* %76 = OpVariable Private 
					                                 u32 %82 = OpConstant 1 
					                                 f32 %87 = OpConstant 3,674022E-40 
					                                 f32 %88 = OpConstant 3,674022E-40 
					                                 f32 %89 = OpConstant 3,674022E-40 
					                               f32_3 %90 = OpConstantComposite %87 %88 %89 
					                                 u32 %95 = OpConstant 0 
					                                     %97 = OpTypeBool 
					                                     %98 = OpTypePointer Private %97 
					                       Private bool* %99 = OpVariable Private 
					                                    %106 = OpTypePointer Function %15 
					                                f32 %118 = OpConstant 3,674022E-40 
					                              f32_3 %119 = OpConstantComposite %118 %118 %118 
					                                f32 %120 = OpConstant 3,674022E-40 
					                                f32 %121 = OpConstant 3,674022E-40 
					                                f32 %122 = OpConstant 3,674022E-40 
					                              f32_3 %123 = OpConstantComposite %120 %121 %122 
					                                    %125 = OpTypeVector %97 3 
					                                f32 %127 = OpConstant 3,674022E-40 
					                              f32_3 %128 = OpConstantComposite %127 %127 %127 
					                     Private f32_3* %131 = OpVariable Private 
					                                f32 %135 = OpConstant 3,674022E-40 
					                                f32 %136 = OpConstant 3,674022E-40 
					                                f32 %137 = OpConstant 3,674022E-40 
					                              f32_3 %138 = OpConstantComposite %135 %136 %137 
					                                f32 %164 = OpConstant 3,674022E-40 
					                                f32 %165 = OpConstant 3,674022E-40 
					                                f32 %166 = OpConstant 3,674022E-40 
					                              f32_3 %167 = OpConstantComposite %164 %165 %166 
					                      Private bool* %173 = OpVariable Private 
					                                    %197 = OpTypePointer Function %7 
					                                f32 %201 = OpConstant 3,674022E-40 
					                                f32 %202 = OpConstant 3,674022E-40 
					                                f32 %203 = OpConstant 3,674022E-40 
					                              f32_3 %204 = OpConstantComposite %201 %202 %203 
					                                f32 %220 = OpConstant 3,674022E-40 
					                                f32 %221 = OpConstant 3,674022E-40 
					                                f32 %222 = OpConstant 3,674022E-40 
					                              f32_3 %223 = OpConstantComposite %220 %221 %222 
					                     Private f32_3* %227 = OpVariable Private 
					                                f32 %231 = OpConstant 3,674022E-40 
					                                f32 %232 = OpConstant 3,674022E-40 
					                                f32 %233 = OpConstant 3,674022E-40 
					                              f32_3 %234 = OpConstantComposite %231 %232 %233 
					                                f32 %269 = OpConstant 3,674022E-40 
					                                f32 %270 = OpConstant 3,674022E-40 
					                                f32 %271 = OpConstant 3,674022E-40 
					                              f32_3 %272 = OpConstantComposite %269 %270 %271 
					                                f32 %279 = OpConstant 3,674022E-40 
					                                f32 %280 = OpConstant 3,674022E-40 
					                                f32 %281 = OpConstant 3,674022E-40 
					                              f32_3 %282 = OpConstantComposite %279 %280 %281 
					                                f32 %317 = OpConstant 3,674022E-40 
					                                f32 %318 = OpConstant 3,674022E-40 
					                                f32 %319 = OpConstant 3,674022E-40 
					                              f32_3 %320 = OpConstantComposite %317 %318 %319 
					                                f32 %327 = OpConstant 3,674022E-40 
					                                f32 %328 = OpConstant 3,674022E-40 
					                                f32 %329 = OpConstant 3,674022E-40 
					                              f32_3 %330 = OpConstantComposite %327 %328 %329 
					                                f32 %365 = OpConstant 3,674022E-40 
					                                f32 %366 = OpConstant 3,674022E-40 
					                                f32 %367 = OpConstant 3,674022E-40 
					                              f32_3 %368 = OpConstantComposite %365 %366 %367 
					                                f32 %375 = OpConstant 3,674022E-40 
					                                f32 %376 = OpConstant 3,674022E-40 
					                                f32 %377 = OpConstant 3,674022E-40 
					                              f32_3 %378 = OpConstantComposite %375 %376 %377 
					                                f32 %413 = OpConstant 3,674022E-40 
					                                f32 %414 = OpConstant 3,674022E-40 
					                                f32 %415 = OpConstant 3,674022E-40 
					                              f32_3 %416 = OpConstantComposite %413 %414 %415 
					                                f32 %423 = OpConstant 3,674022E-40 
					                                f32 %424 = OpConstant 3,674022E-40 
					                                f32 %425 = OpConstant 3,674022E-40 
					                              f32_3 %426 = OpConstantComposite %423 %424 %425 
					                                f32 %461 = OpConstant 3,674022E-40 
					                                f32 %462 = OpConstant 3,674022E-40 
					                                f32 %463 = OpConstant 3,674022E-40 
					                              f32_3 %464 = OpConstantComposite %461 %462 %463 
					                                f32 %471 = OpConstant 3,674022E-40 
					                                f32 %472 = OpConstant 3,674022E-40 
					                                f32 %473 = OpConstant 3,674022E-40 
					                              f32_3 %474 = OpConstantComposite %471 %472 %473 
					                                f32 %509 = OpConstant 3,674022E-40 
					                                f32 %510 = OpConstant 3,674022E-40 
					                                f32 %511 = OpConstant 3,674022E-40 
					                              f32_3 %512 = OpConstantComposite %509 %510 %511 
					                                f32 %519 = OpConstant 3,674022E-40 
					                              f32_3 %520 = OpConstantComposite %519 %519 %519 
					                                f32 %555 = OpConstant 3,674022E-40 
					                              f32_3 %556 = OpConstantComposite %555 %555 %555 
					                                f32 %563 = OpConstant 3,674022E-40 
					                              f32_3 %564 = OpConstantComposite %563 %563 %563 
					                                f32 %599 = OpConstant 3,674022E-40 
					                              f32_3 %600 = OpConstantComposite %599 %599 %599 
					                                f32 %607 = OpConstant 3,674022E-40 
					                                f32 %608 = OpConstant 3,674022E-40 
					                                f32 %609 = OpConstant 3,674022E-40 
					                              f32_3 %610 = OpConstantComposite %607 %608 %609 
					                                f32 %645 = OpConstant 3,674022E-40 
					                                f32 %646 = OpConstant 3,674022E-40 
					                                f32 %647 = OpConstant 3,674022E-40 
					                              f32_3 %648 = OpConstantComposite %645 %646 %647 
					                                f32 %655 = OpConstant 3,674022E-40 
					                                f32 %656 = OpConstant 3,674022E-40 
					                              f32_3 %657 = OpConstantComposite %655 %472 %656 
					                                f32 %692 = OpConstant 3,674022E-40 
					                                f32 %693 = OpConstant 3,674022E-40 
					                              f32_3 %694 = OpConstantComposite %692 %510 %693 
					                                f32 %701 = OpConstant 3,674022E-40 
					                              f32_3 %702 = OpConstantComposite %701 %701 %701 
					                                f32 %707 = OpConstant 3,674022E-40 
					                              f32_3 %708 = OpConstantComposite %707 %707 %707 
					                                f32 %747 = OpConstant 3,674022E-40 
					                              f32_3 %748 = OpConstantComposite %747 %747 %747 
					                     Private f32_2* %757 = OpVariable Private 
					                                f32 %785 = OpConstant 3,674022E-40 
					                                f32 %786 = OpConstant 3,674022E-40 
					                              f32_2 %787 = OpConstantComposite %785 %786 
					                                f32 %792 = OpConstant 3,674022E-40 
					                       Private f32* %794 = OpVariable Private 
					                                f32 %796 = OpConstant 3,674022E-40 
					                                f32 %797 = OpConstant 3,674022E-40 
					                              f32_2 %798 = OpConstantComposite %796 %797 
					                       Private f32* %806 = OpVariable Private 
					                                f32 %811 = OpConstant 3,674022E-40 
					                                f32 %828 = OpConstant 3,674022E-40 
					                                f32 %839 = OpConstant 3,674022E-40 
					                                    %849 = OpTypePointer Output %22 
					                      Output f32_4* %850 = OpVariable Output 
					                                u32 %861 = OpConstant 3 
					                                    %862 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_2* %107 = OpVariable Function 
					                    Function f32_2* %150 = OpVariable Function 
					                    Function f32_2* %180 = OpVariable Function 
					                    Function f32_3* %198 = OpVariable Function 
					                    Function f32_3* %209 = OpVariable Function 
					                    Function f32_3* %217 = OpVariable Function 
					                    Function f32_2* %246 = OpVariable Function 
					                    Function f32_3* %258 = OpVariable Function 
					                    Function f32_3* %266 = OpVariable Function 
					                    Function f32_2* %294 = OpVariable Function 
					                    Function f32_3* %306 = OpVariable Function 
					                    Function f32_3* %314 = OpVariable Function 
					                    Function f32_2* %342 = OpVariable Function 
					                    Function f32_3* %354 = OpVariable Function 
					                    Function f32_3* %362 = OpVariable Function 
					                    Function f32_2* %390 = OpVariable Function 
					                    Function f32_3* %402 = OpVariable Function 
					                    Function f32_3* %410 = OpVariable Function 
					                    Function f32_2* %438 = OpVariable Function 
					                    Function f32_3* %450 = OpVariable Function 
					                    Function f32_3* %458 = OpVariable Function 
					                    Function f32_2* %486 = OpVariable Function 
					                    Function f32_3* %498 = OpVariable Function 
					                    Function f32_3* %506 = OpVariable Function 
					                    Function f32_2* %532 = OpVariable Function 
					                    Function f32_3* %544 = OpVariable Function 
					                    Function f32_3* %552 = OpVariable Function 
					                    Function f32_2* %576 = OpVariable Function 
					                    Function f32_3* %588 = OpVariable Function 
					                    Function f32_3* %596 = OpVariable Function 
					                    Function f32_2* %622 = OpVariable Function 
					                    Function f32_3* %634 = OpVariable Function 
					                    Function f32_3* %642 = OpVariable Function 
					                    Function f32_2* %669 = OpVariable Function 
					                    Function f32_3* %681 = OpVariable Function 
					                    Function f32_3* %689 = OpVariable Function 
					                    Function f32_2* %724 = OpVariable Function 
					                    Function f32_3* %736 = OpVariable Function 
					                    Function f32_3* %744 = OpVariable Function 
					                    Function f32_2* %759 = OpVariable Function 
					                    Function f32_3* %769 = OpVariable Function 
					                    Function f32_3* %777 = OpVariable Function 
					                    Function f32_3* %852 = OpVariable Function 
					                        Private f32* %14 = OpAccessChain %9 %12 
					                                             OpStore %14 %10 
					                               f32_2 %20 = OpLoad vs_TEXCOORD0 
					                               f32_2 %21 = OpVectorShuffle %20 %20 1 0 
					                      Uniform f32_4* %29 = OpAccessChain %25 %27 
					                               f32_4 %30 = OpLoad %29 
					                               f32_2 %31 = OpVectorShuffle %30 %30 1 0 
					                               f32_2 %32 = OpFMul %21 %31 
					                      Uniform f32_4* %33 = OpAccessChain %25 %27 
					                               f32_4 %34 = OpLoad %33 
					                               f32_2 %35 = OpVectorShuffle %34 %34 3 2 
					                               f32_2 %36 = OpFAdd %32 %35 
					                                             OpStore %17 %36 
					                 read_only Texture2D %41 = OpLoad %40 
					                             sampler %45 = OpLoad %44 
					          read_only Texture2DSampled %47 = OpSampledImage %41 %45 
					                               f32_2 %48 = OpLoad %17 
					                               f32_2 %49 = OpVectorShuffle %48 %48 1 0 
					                               f32_4 %50 = OpImageSampleImplicitLod %47 %49 
					                               f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
					                                             OpStore %37 %51 
					                               f32_3 %53 = OpLoad %37 
					                        Uniform f32* %56 = OpAccessChain %25 %54 
					                                 f32 %57 = OpLoad %56 
					                        Uniform f32* %58 = OpAccessChain %25 %54 
					                                 f32 %59 = OpLoad %58 
					                        Uniform f32* %60 = OpAccessChain %25 %54 
					                                 f32 %61 = OpLoad %60 
					                               f32_3 %62 = OpCompositeConstruct %57 %59 %61 
					                                 f32 %63 = OpCompositeExtract %62 0 
					                                 f32 %64 = OpCompositeExtract %62 1 
					                                 f32 %65 = OpCompositeExtract %62 2 
					                               f32_3 %66 = OpCompositeConstruct %63 %64 %65 
					                               f32_3 %67 = OpFAdd %53 %66 
					                                             OpStore %52 %67 
					                               f32_3 %69 = OpLoad %52 
					                               f32_3 %70 = OpLoad %52 
					                               f32_3 %71 = OpFMul %69 %70 
					                                             OpStore %68 %71 
					                               f32_3 %73 = OpLoad %52 
					                               f32_3 %74 = OpLoad %68 
					                               f32_3 %75 = OpFMul %73 %74 
					                                             OpStore %72 %75 
					                               f32_3 %77 = OpLoad %72 
					                               f32_3 %78 = OpLoad %72 
					                                 f32 %79 = OpDot %77 %78 
					                                             OpStore %76 %79 
					                                 f32 %80 = OpLoad %76 
					                                 f32 %81 = OpExtInst %1 37 %80 %10 
					                        Private f32* %83 = OpAccessChain %9 %82 
					                                             OpStore %83 %81 
					                               f32_3 %84 = OpLoad %52 
					                               f32_3 %85 = OpLoad %68 
					                               f32_3 %86 = OpFMul %84 %85 
					                               f32_3 %91 = OpFAdd %86 %90 
					                                             OpStore %72 %91 
					                               f32_3 %92 = OpLoad %72 
					                               f32_3 %93 = OpLoad %72 
					                                 f32 %94 = OpDot %92 %93 
					                        Private f32* %96 = OpAccessChain %9 %95 
					                                             OpStore %96 %94 
					                       Private f32* %100 = OpAccessChain %9 %95 
					                                f32 %101 = OpLoad %100 
					                       Private f32* %102 = OpAccessChain %9 %82 
					                                f32 %103 = OpLoad %102 
					                               bool %104 = OpFOrdLessThan %101 %103 
					                                             OpStore %99 %104 
					                               bool %105 = OpLoad %99 
					                                             OpSelectionMerge %109 None 
					                                             OpBranchConditional %105 %108 %112 
					                                    %108 = OpLabel 
					                              f32_3 %110 = OpLoad %9 
					                              f32_2 %111 = OpVectorShuffle %110 %110 0 1 
					                                             OpStore %107 %111 
					                                             OpBranch %109 
					                                    %112 = OpLabel 
					                              f32_3 %113 = OpLoad %9 
					                              f32_2 %114 = OpVectorShuffle %113 %113 1 2 
					                                             OpStore %107 %114 
					                                             OpBranch %109 
					                                    %109 = OpLabel 
					                              f32_2 %115 = OpLoad %107 
					                              f32_3 %116 = OpLoad %9 
					                              f32_3 %117 = OpVectorShuffle %116 %115 0 3 4 
					                                             OpStore %9 %117 
					                               bool %124 = OpLoad %99 
					                             bool_3 %126 = OpCompositeConstruct %124 %124 %124 
					                              f32_3 %129 = OpSelect %126 %128 %119 
					                              f32_3 %130 = OpExtInst %1 46 %119 %123 %129 
					                                             OpStore %72 %130 
					                              f32_3 %132 = OpLoad %52 
					                              f32_3 %133 = OpLoad %68 
					                              f32_3 %134 = OpFMul %132 %133 
					                              f32_3 %139 = OpFAdd %134 %138 
					                                             OpStore %131 %139 
					                              f32_3 %140 = OpLoad %131 
					                              f32_3 %141 = OpLoad %131 
					                                f32 %142 = OpDot %140 %141 
					                       Private f32* %143 = OpAccessChain %9 %95 
					                                             OpStore %143 %142 
					                       Private f32* %144 = OpAccessChain %9 %95 
					                                f32 %145 = OpLoad %144 
					                       Private f32* %146 = OpAccessChain %9 %82 
					                                f32 %147 = OpLoad %146 
					                               bool %148 = OpFOrdLessThan %145 %147 
					                                             OpStore %99 %148 
					                               bool %149 = OpLoad %99 
					                                             OpSelectionMerge %152 None 
					                                             OpBranchConditional %149 %151 %155 
					                                    %151 = OpLabel 
					                              f32_3 %153 = OpLoad %9 
					                              f32_2 %154 = OpVectorShuffle %153 %153 0 1 
					                                             OpStore %150 %154 
					                                             OpBranch %152 
					                                    %155 = OpLabel 
					                              f32_3 %156 = OpLoad %9 
					                              f32_2 %157 = OpVectorShuffle %156 %156 1 2 
					                                             OpStore %150 %157 
					                                             OpBranch %152 
					                                    %152 = OpLabel 
					                              f32_2 %158 = OpLoad %150 
					                              f32_3 %159 = OpLoad %9 
					                              f32_3 %160 = OpVectorShuffle %159 %158 0 3 4 
					                                             OpStore %9 %160 
					                              f32_3 %161 = OpLoad %52 
					                              f32_3 %162 = OpLoad %68 
					                              f32_3 %163 = OpFMul %161 %162 
					                              f32_3 %168 = OpFAdd %163 %167 
					                                             OpStore %131 %168 
					                              f32_3 %169 = OpLoad %131 
					                              f32_3 %170 = OpLoad %131 
					                                f32 %171 = OpDot %169 %170 
					                       Private f32* %172 = OpAccessChain %9 %95 
					                                             OpStore %172 %171 
					                       Private f32* %174 = OpAccessChain %9 %95 
					                                f32 %175 = OpLoad %174 
					                       Private f32* %176 = OpAccessChain %9 %82 
					                                f32 %177 = OpLoad %176 
					                               bool %178 = OpFOrdLessThan %175 %177 
					                                             OpStore %173 %178 
					                               bool %179 = OpLoad %173 
					                                             OpSelectionMerge %182 None 
					                                             OpBranchConditional %179 %181 %185 
					                                    %181 = OpLabel 
					                              f32_3 %183 = OpLoad %9 
					                              f32_2 %184 = OpVectorShuffle %183 %183 0 1 
					                                             OpStore %180 %184 
					                                             OpBranch %182 
					                                    %185 = OpLabel 
					                              f32_3 %186 = OpLoad %9 
					                              f32_2 %187 = OpVectorShuffle %186 %186 1 2 
					                                             OpStore %180 %187 
					                                             OpBranch %182 
					                                    %182 = OpLabel 
					                              f32_2 %188 = OpLoad %180 
					                              f32_3 %189 = OpLoad %9 
					                              f32_3 %190 = OpVectorShuffle %189 %188 0 3 4 
					                                             OpStore %9 %190 
					                              f32_3 %191 = OpLoad %72 
					                               bool %192 = OpLoad %99 
					                             bool_3 %193 = OpCompositeConstruct %192 %192 %192 
					                              f32_3 %194 = OpSelect %193 %128 %119 
					                              f32_3 %195 = OpExtInst %1 46 %119 %191 %194 
					                                             OpStore %131 %195 
					                               bool %196 = OpLoad %99 
					                                             OpSelectionMerge %200 None 
					                                             OpBranchConditional %196 %199 %205 
					                                    %199 = OpLabel 
					                                             OpStore %198 %204 
					                                             OpBranch %200 
					                                    %205 = OpLabel 
					                              f32_3 %206 = OpLoad %72 
					                                             OpStore %198 %206 
					                                             OpBranch %200 
					                                    %200 = OpLabel 
					                              f32_3 %207 = OpLoad %198 
					                                             OpStore %72 %207 
					                               bool %208 = OpLoad %173 
					                                             OpSelectionMerge %211 None 
					                                             OpBranchConditional %208 %210 %213 
					                                    %210 = OpLabel 
					                              f32_3 %212 = OpLoad %72 
					                                             OpStore %209 %212 
					                                             OpBranch %211 
					                                    %213 = OpLabel 
					                              f32_3 %214 = OpLoad %131 
					                                             OpStore %209 %214 
					                                             OpBranch %211 
					                                    %211 = OpLabel 
					                              f32_3 %215 = OpLoad %209 
					                                             OpStore %131 %215 
					                               bool %216 = OpLoad %173 
					                                             OpSelectionMerge %219 None 
					                                             OpBranchConditional %216 %218 %224 
					                                    %218 = OpLabel 
					                                             OpStore %217 %223 
					                                             OpBranch %219 
					                                    %224 = OpLabel 
					                              f32_3 %225 = OpLoad %72 
					                                             OpStore %217 %225 
					                                             OpBranch %219 
					                                    %219 = OpLabel 
					                              f32_3 %226 = OpLoad %217 
					                                             OpStore %72 %226 
					                              f32_3 %228 = OpLoad %52 
					                              f32_3 %229 = OpLoad %68 
					                              f32_3 %230 = OpFMul %228 %229 
					                              f32_3 %235 = OpFAdd %230 %234 
					                                             OpStore %227 %235 
					                              f32_3 %236 = OpLoad %227 
					                              f32_3 %237 = OpLoad %227 
					                                f32 %238 = OpDot %236 %237 
					                       Private f32* %239 = OpAccessChain %9 %95 
					                                             OpStore %239 %238 
					                       Private f32* %240 = OpAccessChain %9 %95 
					                                f32 %241 = OpLoad %240 
					                       Private f32* %242 = OpAccessChain %9 %82 
					                                f32 %243 = OpLoad %242 
					                               bool %244 = OpFOrdLessThan %241 %243 
					                                             OpStore %99 %244 
					                               bool %245 = OpLoad %99 
					                                             OpSelectionMerge %248 None 
					                                             OpBranchConditional %245 %247 %251 
					                                    %247 = OpLabel 
					                              f32_3 %249 = OpLoad %9 
					                              f32_2 %250 = OpVectorShuffle %249 %249 0 1 
					                                             OpStore %246 %250 
					                                             OpBranch %248 
					                                    %251 = OpLabel 
					                              f32_3 %252 = OpLoad %9 
					                              f32_2 %253 = OpVectorShuffle %252 %252 1 2 
					                                             OpStore %246 %253 
					                                             OpBranch %248 
					                                    %248 = OpLabel 
					                              f32_2 %254 = OpLoad %246 
					                              f32_3 %255 = OpLoad %9 
					                              f32_3 %256 = OpVectorShuffle %255 %254 0 3 4 
					                                             OpStore %9 %256 
					                               bool %257 = OpLoad %99 
					                                             OpSelectionMerge %260 None 
					                                             OpBranchConditional %257 %259 %262 
					                                    %259 = OpLabel 
					                              f32_3 %261 = OpLoad %72 
					                                             OpStore %258 %261 
					                                             OpBranch %260 
					                                    %262 = OpLabel 
					                              f32_3 %263 = OpLoad %131 
					                                             OpStore %258 %263 
					                                             OpBranch %260 
					                                    %260 = OpLabel 
					                              f32_3 %264 = OpLoad %258 
					                                             OpStore %131 %264 
					                               bool %265 = OpLoad %99 
					                                             OpSelectionMerge %268 None 
					                                             OpBranchConditional %265 %267 %273 
					                                    %267 = OpLabel 
					                                             OpStore %266 %272 
					                                             OpBranch %268 
					                                    %273 = OpLabel 
					                              f32_3 %274 = OpLoad %72 
					                                             OpStore %266 %274 
					                                             OpBranch %268 
					                                    %268 = OpLabel 
					                              f32_3 %275 = OpLoad %266 
					                                             OpStore %72 %275 
					                              f32_3 %276 = OpLoad %52 
					                              f32_3 %277 = OpLoad %68 
					                              f32_3 %278 = OpFMul %276 %277 
					                              f32_3 %283 = OpFAdd %278 %282 
					                                             OpStore %227 %283 
					                              f32_3 %284 = OpLoad %227 
					                              f32_3 %285 = OpLoad %227 
					                                f32 %286 = OpDot %284 %285 
					                       Private f32* %287 = OpAccessChain %9 %95 
					                                             OpStore %287 %286 
					                       Private f32* %288 = OpAccessChain %9 %95 
					                                f32 %289 = OpLoad %288 
					                       Private f32* %290 = OpAccessChain %9 %82 
					                                f32 %291 = OpLoad %290 
					                               bool %292 = OpFOrdLessThan %289 %291 
					                                             OpStore %99 %292 
					                               bool %293 = OpLoad %99 
					                                             OpSelectionMerge %296 None 
					                                             OpBranchConditional %293 %295 %299 
					                                    %295 = OpLabel 
					                              f32_3 %297 = OpLoad %9 
					                              f32_2 %298 = OpVectorShuffle %297 %297 0 1 
					                                             OpStore %294 %298 
					                                             OpBranch %296 
					                                    %299 = OpLabel 
					                              f32_3 %300 = OpLoad %9 
					                              f32_2 %301 = OpVectorShuffle %300 %300 1 2 
					                                             OpStore %294 %301 
					                                             OpBranch %296 
					                                    %296 = OpLabel 
					                              f32_2 %302 = OpLoad %294 
					                              f32_3 %303 = OpLoad %9 
					                              f32_3 %304 = OpVectorShuffle %303 %302 0 3 4 
					                                             OpStore %9 %304 
					                               bool %305 = OpLoad %99 
					                                             OpSelectionMerge %308 None 
					                                             OpBranchConditional %305 %307 %310 
					                                    %307 = OpLabel 
					                              f32_3 %309 = OpLoad %72 
					                                             OpStore %306 %309 
					                                             OpBranch %308 
					                                    %310 = OpLabel 
					                              f32_3 %311 = OpLoad %131 
					                                             OpStore %306 %311 
					                                             OpBranch %308 
					                                    %308 = OpLabel 
					                              f32_3 %312 = OpLoad %306 
					                                             OpStore %131 %312 
					                               bool %313 = OpLoad %99 
					                                             OpSelectionMerge %316 None 
					                                             OpBranchConditional %313 %315 %321 
					                                    %315 = OpLabel 
					                                             OpStore %314 %320 
					                                             OpBranch %316 
					                                    %321 = OpLabel 
					                              f32_3 %322 = OpLoad %72 
					                                             OpStore %314 %322 
					                                             OpBranch %316 
					                                    %316 = OpLabel 
					                              f32_3 %323 = OpLoad %314 
					                                             OpStore %72 %323 
					                              f32_3 %324 = OpLoad %52 
					                              f32_3 %325 = OpLoad %68 
					                              f32_3 %326 = OpFMul %324 %325 
					                              f32_3 %331 = OpFAdd %326 %330 
					                                             OpStore %227 %331 
					                              f32_3 %332 = OpLoad %227 
					                              f32_3 %333 = OpLoad %227 
					                                f32 %334 = OpDot %332 %333 
					                       Private f32* %335 = OpAccessChain %9 %95 
					                                             OpStore %335 %334 
					                       Private f32* %336 = OpAccessChain %9 %95 
					                                f32 %337 = OpLoad %336 
					                       Private f32* %338 = OpAccessChain %9 %82 
					                                f32 %339 = OpLoad %338 
					                               bool %340 = OpFOrdLessThan %337 %339 
					                                             OpStore %99 %340 
					                               bool %341 = OpLoad %99 
					                                             OpSelectionMerge %344 None 
					                                             OpBranchConditional %341 %343 %347 
					                                    %343 = OpLabel 
					                              f32_3 %345 = OpLoad %9 
					                              f32_2 %346 = OpVectorShuffle %345 %345 0 1 
					                                             OpStore %342 %346 
					                                             OpBranch %344 
					                                    %347 = OpLabel 
					                              f32_3 %348 = OpLoad %9 
					                              f32_2 %349 = OpVectorShuffle %348 %348 1 2 
					                                             OpStore %342 %349 
					                                             OpBranch %344 
					                                    %344 = OpLabel 
					                              f32_2 %350 = OpLoad %342 
					                              f32_3 %351 = OpLoad %9 
					                              f32_3 %352 = OpVectorShuffle %351 %350 0 3 4 
					                                             OpStore %9 %352 
					                               bool %353 = OpLoad %99 
					                                             OpSelectionMerge %356 None 
					                                             OpBranchConditional %353 %355 %358 
					                                    %355 = OpLabel 
					                              f32_3 %357 = OpLoad %72 
					                                             OpStore %354 %357 
					                                             OpBranch %356 
					                                    %358 = OpLabel 
					                              f32_3 %359 = OpLoad %131 
					                                             OpStore %354 %359 
					                                             OpBranch %356 
					                                    %356 = OpLabel 
					                              f32_3 %360 = OpLoad %354 
					                                             OpStore %131 %360 
					                               bool %361 = OpLoad %99 
					                                             OpSelectionMerge %364 None 
					                                             OpBranchConditional %361 %363 %369 
					                                    %363 = OpLabel 
					                                             OpStore %362 %368 
					                                             OpBranch %364 
					                                    %369 = OpLabel 
					                              f32_3 %370 = OpLoad %72 
					                                             OpStore %362 %370 
					                                             OpBranch %364 
					                                    %364 = OpLabel 
					                              f32_3 %371 = OpLoad %362 
					                                             OpStore %72 %371 
					                              f32_3 %372 = OpLoad %52 
					                              f32_3 %373 = OpLoad %68 
					                              f32_3 %374 = OpFMul %372 %373 
					                              f32_3 %379 = OpFAdd %374 %378 
					                                             OpStore %227 %379 
					                              f32_3 %380 = OpLoad %227 
					                              f32_3 %381 = OpLoad %227 
					                                f32 %382 = OpDot %380 %381 
					                       Private f32* %383 = OpAccessChain %9 %95 
					                                             OpStore %383 %382 
					                       Private f32* %384 = OpAccessChain %9 %95 
					                                f32 %385 = OpLoad %384 
					                       Private f32* %386 = OpAccessChain %9 %82 
					                                f32 %387 = OpLoad %386 
					                               bool %388 = OpFOrdLessThan %385 %387 
					                                             OpStore %99 %388 
					                               bool %389 = OpLoad %99 
					                                             OpSelectionMerge %392 None 
					                                             OpBranchConditional %389 %391 %395 
					                                    %391 = OpLabel 
					                              f32_3 %393 = OpLoad %9 
					                              f32_2 %394 = OpVectorShuffle %393 %393 0 1 
					                                             OpStore %390 %394 
					                                             OpBranch %392 
					                                    %395 = OpLabel 
					                              f32_3 %396 = OpLoad %9 
					                              f32_2 %397 = OpVectorShuffle %396 %396 1 2 
					                                             OpStore %390 %397 
					                                             OpBranch %392 
					                                    %392 = OpLabel 
					                              f32_2 %398 = OpLoad %390 
					                              f32_3 %399 = OpLoad %9 
					                              f32_3 %400 = OpVectorShuffle %399 %398 0 3 4 
					                                             OpStore %9 %400 
					                               bool %401 = OpLoad %99 
					                                             OpSelectionMerge %404 None 
					                                             OpBranchConditional %401 %403 %406 
					                                    %403 = OpLabel 
					                              f32_3 %405 = OpLoad %72 
					                                             OpStore %402 %405 
					                                             OpBranch %404 
					                                    %406 = OpLabel 
					                              f32_3 %407 = OpLoad %131 
					                                             OpStore %402 %407 
					                                             OpBranch %404 
					                                    %404 = OpLabel 
					                              f32_3 %408 = OpLoad %402 
					                                             OpStore %131 %408 
					                               bool %409 = OpLoad %99 
					                                             OpSelectionMerge %412 None 
					                                             OpBranchConditional %409 %411 %417 
					                                    %411 = OpLabel 
					                                             OpStore %410 %416 
					                                             OpBranch %412 
					                                    %417 = OpLabel 
					                              f32_3 %418 = OpLoad %72 
					                                             OpStore %410 %418 
					                                             OpBranch %412 
					                                    %412 = OpLabel 
					                              f32_3 %419 = OpLoad %410 
					                                             OpStore %72 %419 
					                              f32_3 %420 = OpLoad %52 
					                              f32_3 %421 = OpLoad %68 
					                              f32_3 %422 = OpFMul %420 %421 
					                              f32_3 %427 = OpFAdd %422 %426 
					                                             OpStore %227 %427 
					                              f32_3 %428 = OpLoad %227 
					                              f32_3 %429 = OpLoad %227 
					                                f32 %430 = OpDot %428 %429 
					                       Private f32* %431 = OpAccessChain %9 %95 
					                                             OpStore %431 %430 
					                       Private f32* %432 = OpAccessChain %9 %95 
					                                f32 %433 = OpLoad %432 
					                       Private f32* %434 = OpAccessChain %9 %82 
					                                f32 %435 = OpLoad %434 
					                               bool %436 = OpFOrdLessThan %433 %435 
					                                             OpStore %99 %436 
					                               bool %437 = OpLoad %99 
					                                             OpSelectionMerge %440 None 
					                                             OpBranchConditional %437 %439 %443 
					                                    %439 = OpLabel 
					                              f32_3 %441 = OpLoad %9 
					                              f32_2 %442 = OpVectorShuffle %441 %441 0 1 
					                                             OpStore %438 %442 
					                                             OpBranch %440 
					                                    %443 = OpLabel 
					                              f32_3 %444 = OpLoad %9 
					                              f32_2 %445 = OpVectorShuffle %444 %444 1 2 
					                                             OpStore %438 %445 
					                                             OpBranch %440 
					                                    %440 = OpLabel 
					                              f32_2 %446 = OpLoad %438 
					                              f32_3 %447 = OpLoad %9 
					                              f32_3 %448 = OpVectorShuffle %447 %446 0 3 4 
					                                             OpStore %9 %448 
					                               bool %449 = OpLoad %99 
					                                             OpSelectionMerge %452 None 
					                                             OpBranchConditional %449 %451 %454 
					                                    %451 = OpLabel 
					                              f32_3 %453 = OpLoad %72 
					                                             OpStore %450 %453 
					                                             OpBranch %452 
					                                    %454 = OpLabel 
					                              f32_3 %455 = OpLoad %131 
					                                             OpStore %450 %455 
					                                             OpBranch %452 
					                                    %452 = OpLabel 
					                              f32_3 %456 = OpLoad %450 
					                                             OpStore %131 %456 
					                               bool %457 = OpLoad %99 
					                                             OpSelectionMerge %460 None 
					                                             OpBranchConditional %457 %459 %465 
					                                    %459 = OpLabel 
					                                             OpStore %458 %464 
					                                             OpBranch %460 
					                                    %465 = OpLabel 
					                              f32_3 %466 = OpLoad %72 
					                                             OpStore %458 %466 
					                                             OpBranch %460 
					                                    %460 = OpLabel 
					                              f32_3 %467 = OpLoad %458 
					                                             OpStore %72 %467 
					                              f32_3 %468 = OpLoad %52 
					                              f32_3 %469 = OpLoad %68 
					                              f32_3 %470 = OpFMul %468 %469 
					                              f32_3 %475 = OpFAdd %470 %474 
					                                             OpStore %227 %475 
					                              f32_3 %476 = OpLoad %227 
					                              f32_3 %477 = OpLoad %227 
					                                f32 %478 = OpDot %476 %477 
					                       Private f32* %479 = OpAccessChain %9 %95 
					                                             OpStore %479 %478 
					                       Private f32* %480 = OpAccessChain %9 %95 
					                                f32 %481 = OpLoad %480 
					                       Private f32* %482 = OpAccessChain %9 %82 
					                                f32 %483 = OpLoad %482 
					                               bool %484 = OpFOrdLessThan %481 %483 
					                                             OpStore %99 %484 
					                               bool %485 = OpLoad %99 
					                                             OpSelectionMerge %488 None 
					                                             OpBranchConditional %485 %487 %491 
					                                    %487 = OpLabel 
					                              f32_3 %489 = OpLoad %9 
					                              f32_2 %490 = OpVectorShuffle %489 %489 0 1 
					                                             OpStore %486 %490 
					                                             OpBranch %488 
					                                    %491 = OpLabel 
					                              f32_3 %492 = OpLoad %9 
					                              f32_2 %493 = OpVectorShuffle %492 %492 1 2 
					                                             OpStore %486 %493 
					                                             OpBranch %488 
					                                    %488 = OpLabel 
					                              f32_2 %494 = OpLoad %486 
					                              f32_3 %495 = OpLoad %9 
					                              f32_3 %496 = OpVectorShuffle %495 %494 0 3 4 
					                                             OpStore %9 %496 
					                               bool %497 = OpLoad %99 
					                                             OpSelectionMerge %500 None 
					                                             OpBranchConditional %497 %499 %502 
					                                    %499 = OpLabel 
					                              f32_3 %501 = OpLoad %72 
					                                             OpStore %498 %501 
					                                             OpBranch %500 
					                                    %502 = OpLabel 
					                              f32_3 %503 = OpLoad %131 
					                                             OpStore %498 %503 
					                                             OpBranch %500 
					                                    %500 = OpLabel 
					                              f32_3 %504 = OpLoad %498 
					                                             OpStore %131 %504 
					                               bool %505 = OpLoad %99 
					                                             OpSelectionMerge %508 None 
					                                             OpBranchConditional %505 %507 %513 
					                                    %507 = OpLabel 
					                                             OpStore %506 %512 
					                                             OpBranch %508 
					                                    %513 = OpLabel 
					                              f32_3 %514 = OpLoad %72 
					                                             OpStore %506 %514 
					                                             OpBranch %508 
					                                    %508 = OpLabel 
					                              f32_3 %515 = OpLoad %506 
					                                             OpStore %72 %515 
					                              f32_3 %516 = OpLoad %52 
					                              f32_3 %517 = OpLoad %68 
					                              f32_3 %518 = OpFMul %516 %517 
					                              f32_3 %521 = OpFAdd %518 %520 
					                                             OpStore %227 %521 
					                              f32_3 %522 = OpLoad %227 
					                              f32_3 %523 = OpLoad %227 
					                                f32 %524 = OpDot %522 %523 
					                       Private f32* %525 = OpAccessChain %9 %95 
					                                             OpStore %525 %524 
					                       Private f32* %526 = OpAccessChain %9 %95 
					                                f32 %527 = OpLoad %526 
					                       Private f32* %528 = OpAccessChain %9 %82 
					                                f32 %529 = OpLoad %528 
					                               bool %530 = OpFOrdLessThan %527 %529 
					                                             OpStore %99 %530 
					                               bool %531 = OpLoad %99 
					                                             OpSelectionMerge %534 None 
					                                             OpBranchConditional %531 %533 %537 
					                                    %533 = OpLabel 
					                              f32_3 %535 = OpLoad %9 
					                              f32_2 %536 = OpVectorShuffle %535 %535 0 1 
					                                             OpStore %532 %536 
					                                             OpBranch %534 
					                                    %537 = OpLabel 
					                              f32_3 %538 = OpLoad %9 
					                              f32_2 %539 = OpVectorShuffle %538 %538 1 2 
					                                             OpStore %532 %539 
					                                             OpBranch %534 
					                                    %534 = OpLabel 
					                              f32_2 %540 = OpLoad %532 
					                              f32_3 %541 = OpLoad %9 
					                              f32_3 %542 = OpVectorShuffle %541 %540 0 3 4 
					                                             OpStore %9 %542 
					                               bool %543 = OpLoad %99 
					                                             OpSelectionMerge %546 None 
					                                             OpBranchConditional %543 %545 %548 
					                                    %545 = OpLabel 
					                              f32_3 %547 = OpLoad %72 
					                                             OpStore %544 %547 
					                                             OpBranch %546 
					                                    %548 = OpLabel 
					                              f32_3 %549 = OpLoad %131 
					                                             OpStore %544 %549 
					                                             OpBranch %546 
					                                    %546 = OpLabel 
					                              f32_3 %550 = OpLoad %544 
					                                             OpStore %131 %550 
					                               bool %551 = OpLoad %99 
					                                             OpSelectionMerge %554 None 
					                                             OpBranchConditional %551 %553 %557 
					                                    %553 = OpLabel 
					                                             OpStore %552 %556 
					                                             OpBranch %554 
					                                    %557 = OpLabel 
					                              f32_3 %558 = OpLoad %72 
					                                             OpStore %552 %558 
					                                             OpBranch %554 
					                                    %554 = OpLabel 
					                              f32_3 %559 = OpLoad %552 
					                                             OpStore %72 %559 
					                              f32_3 %560 = OpLoad %52 
					                              f32_3 %561 = OpLoad %68 
					                              f32_3 %562 = OpFMul %560 %561 
					                              f32_3 %565 = OpFAdd %562 %564 
					                                             OpStore %227 %565 
					                              f32_3 %566 = OpLoad %227 
					                              f32_3 %567 = OpLoad %227 
					                                f32 %568 = OpDot %566 %567 
					                       Private f32* %569 = OpAccessChain %9 %95 
					                                             OpStore %569 %568 
					                       Private f32* %570 = OpAccessChain %9 %95 
					                                f32 %571 = OpLoad %570 
					                       Private f32* %572 = OpAccessChain %9 %82 
					                                f32 %573 = OpLoad %572 
					                               bool %574 = OpFOrdLessThan %571 %573 
					                                             OpStore %99 %574 
					                               bool %575 = OpLoad %99 
					                                             OpSelectionMerge %578 None 
					                                             OpBranchConditional %575 %577 %581 
					                                    %577 = OpLabel 
					                              f32_3 %579 = OpLoad %9 
					                              f32_2 %580 = OpVectorShuffle %579 %579 0 1 
					                                             OpStore %576 %580 
					                                             OpBranch %578 
					                                    %581 = OpLabel 
					                              f32_3 %582 = OpLoad %9 
					                              f32_2 %583 = OpVectorShuffle %582 %582 1 2 
					                                             OpStore %576 %583 
					                                             OpBranch %578 
					                                    %578 = OpLabel 
					                              f32_2 %584 = OpLoad %576 
					                              f32_3 %585 = OpLoad %9 
					                              f32_3 %586 = OpVectorShuffle %585 %584 0 3 4 
					                                             OpStore %9 %586 
					                               bool %587 = OpLoad %99 
					                                             OpSelectionMerge %590 None 
					                                             OpBranchConditional %587 %589 %592 
					                                    %589 = OpLabel 
					                              f32_3 %591 = OpLoad %72 
					                                             OpStore %588 %591 
					                                             OpBranch %590 
					                                    %592 = OpLabel 
					                              f32_3 %593 = OpLoad %131 
					                                             OpStore %588 %593 
					                                             OpBranch %590 
					                                    %590 = OpLabel 
					                              f32_3 %594 = OpLoad %588 
					                                             OpStore %131 %594 
					                               bool %595 = OpLoad %99 
					                                             OpSelectionMerge %598 None 
					                                             OpBranchConditional %595 %597 %601 
					                                    %597 = OpLabel 
					                                             OpStore %596 %600 
					                                             OpBranch %598 
					                                    %601 = OpLabel 
					                              f32_3 %602 = OpLoad %72 
					                                             OpStore %596 %602 
					                                             OpBranch %598 
					                                    %598 = OpLabel 
					                              f32_3 %603 = OpLoad %596 
					                                             OpStore %72 %603 
					                              f32_3 %604 = OpLoad %52 
					                              f32_3 %605 = OpLoad %68 
					                              f32_3 %606 = OpFMul %604 %605 
					                              f32_3 %611 = OpFAdd %606 %610 
					                                             OpStore %227 %611 
					                              f32_3 %612 = OpLoad %227 
					                              f32_3 %613 = OpLoad %227 
					                                f32 %614 = OpDot %612 %613 
					                       Private f32* %615 = OpAccessChain %9 %95 
					                                             OpStore %615 %614 
					                       Private f32* %616 = OpAccessChain %9 %95 
					                                f32 %617 = OpLoad %616 
					                       Private f32* %618 = OpAccessChain %9 %82 
					                                f32 %619 = OpLoad %618 
					                               bool %620 = OpFOrdLessThan %617 %619 
					                                             OpStore %99 %620 
					                               bool %621 = OpLoad %99 
					                                             OpSelectionMerge %624 None 
					                                             OpBranchConditional %621 %623 %627 
					                                    %623 = OpLabel 
					                              f32_3 %625 = OpLoad %9 
					                              f32_2 %626 = OpVectorShuffle %625 %625 0 1 
					                                             OpStore %622 %626 
					                                             OpBranch %624 
					                                    %627 = OpLabel 
					                              f32_3 %628 = OpLoad %9 
					                              f32_2 %629 = OpVectorShuffle %628 %628 1 2 
					                                             OpStore %622 %629 
					                                             OpBranch %624 
					                                    %624 = OpLabel 
					                              f32_2 %630 = OpLoad %622 
					                              f32_3 %631 = OpLoad %9 
					                              f32_3 %632 = OpVectorShuffle %631 %630 0 3 4 
					                                             OpStore %9 %632 
					                               bool %633 = OpLoad %99 
					                                             OpSelectionMerge %636 None 
					                                             OpBranchConditional %633 %635 %638 
					                                    %635 = OpLabel 
					                              f32_3 %637 = OpLoad %72 
					                                             OpStore %634 %637 
					                                             OpBranch %636 
					                                    %638 = OpLabel 
					                              f32_3 %639 = OpLoad %131 
					                                             OpStore %634 %639 
					                                             OpBranch %636 
					                                    %636 = OpLabel 
					                              f32_3 %640 = OpLoad %634 
					                                             OpStore %131 %640 
					                               bool %641 = OpLoad %99 
					                                             OpSelectionMerge %644 None 
					                                             OpBranchConditional %641 %643 %649 
					                                    %643 = OpLabel 
					                                             OpStore %642 %648 
					                                             OpBranch %644 
					                                    %649 = OpLabel 
					                              f32_3 %650 = OpLoad %72 
					                                             OpStore %642 %650 
					                                             OpBranch %644 
					                                    %644 = OpLabel 
					                              f32_3 %651 = OpLoad %642 
					                                             OpStore %72 %651 
					                              f32_3 %652 = OpLoad %52 
					                              f32_3 %653 = OpLoad %68 
					                              f32_3 %654 = OpFMul %652 %653 
					                              f32_3 %658 = OpFAdd %654 %657 
					                                             OpStore %227 %658 
					                              f32_3 %659 = OpLoad %227 
					                              f32_3 %660 = OpLoad %227 
					                                f32 %661 = OpDot %659 %660 
					                       Private f32* %662 = OpAccessChain %9 %95 
					                                             OpStore %662 %661 
					                       Private f32* %663 = OpAccessChain %9 %95 
					                                f32 %664 = OpLoad %663 
					                       Private f32* %665 = OpAccessChain %9 %82 
					                                f32 %666 = OpLoad %665 
					                               bool %667 = OpFOrdLessThan %664 %666 
					                                             OpStore %99 %667 
					                               bool %668 = OpLoad %99 
					                                             OpSelectionMerge %671 None 
					                                             OpBranchConditional %668 %670 %674 
					                                    %670 = OpLabel 
					                              f32_3 %672 = OpLoad %9 
					                              f32_2 %673 = OpVectorShuffle %672 %672 0 1 
					                                             OpStore %669 %673 
					                                             OpBranch %671 
					                                    %674 = OpLabel 
					                              f32_3 %675 = OpLoad %9 
					                              f32_2 %676 = OpVectorShuffle %675 %675 1 2 
					                                             OpStore %669 %676 
					                                             OpBranch %671 
					                                    %671 = OpLabel 
					                              f32_2 %677 = OpLoad %669 
					                              f32_3 %678 = OpLoad %9 
					                              f32_3 %679 = OpVectorShuffle %678 %677 0 3 4 
					                                             OpStore %9 %679 
					                               bool %680 = OpLoad %99 
					                                             OpSelectionMerge %683 None 
					                                             OpBranchConditional %680 %682 %685 
					                                    %682 = OpLabel 
					                              f32_3 %684 = OpLoad %72 
					                                             OpStore %681 %684 
					                                             OpBranch %683 
					                                    %685 = OpLabel 
					                              f32_3 %686 = OpLoad %131 
					                                             OpStore %681 %686 
					                                             OpBranch %683 
					                                    %683 = OpLabel 
					                              f32_3 %687 = OpLoad %681 
					                                             OpStore %131 %687 
					                               bool %688 = OpLoad %99 
					                                             OpSelectionMerge %691 None 
					                                             OpBranchConditional %688 %690 %695 
					                                    %690 = OpLabel 
					                                             OpStore %689 %694 
					                                             OpBranch %691 
					                                    %695 = OpLabel 
					                              f32_3 %696 = OpLoad %72 
					                                             OpStore %689 %696 
					                                             OpBranch %691 
					                                    %691 = OpLabel 
					                              f32_3 %697 = OpLoad %689 
					                                             OpStore %72 %697 
					                              f32_3 %698 = OpLoad %52 
					                              f32_3 %699 = OpLoad %68 
					                              f32_3 %700 = OpFMul %698 %699 
					                              f32_3 %703 = OpFAdd %700 %702 
					                                             OpStore %227 %703 
					                              f32_3 %704 = OpLoad %52 
					                              f32_3 %705 = OpLoad %68 
					                              f32_3 %706 = OpFMul %704 %705 
					                              f32_3 %709 = OpFAdd %706 %708 
					                                             OpStore %52 %709 
					                              f32_3 %710 = OpLoad %52 
					                              f32_3 %711 = OpLoad %52 
					                                f32 %712 = OpDot %710 %711 
					                       Private f32* %713 = OpAccessChain %52 %95 
					                                             OpStore %713 %712 
					                              f32_3 %714 = OpLoad %227 
					                              f32_3 %715 = OpLoad %227 
					                                f32 %716 = OpDot %714 %715 
					                       Private f32* %717 = OpAccessChain %9 %95 
					                                             OpStore %717 %716 
					                       Private f32* %718 = OpAccessChain %9 %95 
					                                f32 %719 = OpLoad %718 
					                       Private f32* %720 = OpAccessChain %9 %82 
					                                f32 %721 = OpLoad %720 
					                               bool %722 = OpFOrdLessThan %719 %721 
					                                             OpStore %99 %722 
					                               bool %723 = OpLoad %99 
					                                             OpSelectionMerge %726 None 
					                                             OpBranchConditional %723 %725 %729 
					                                    %725 = OpLabel 
					                              f32_3 %727 = OpLoad %9 
					                              f32_2 %728 = OpVectorShuffle %727 %727 0 1 
					                                             OpStore %724 %728 
					                                             OpBranch %726 
					                                    %729 = OpLabel 
					                              f32_3 %730 = OpLoad %9 
					                              f32_2 %731 = OpVectorShuffle %730 %730 1 2 
					                                             OpStore %724 %731 
					                                             OpBranch %726 
					                                    %726 = OpLabel 
					                              f32_2 %732 = OpLoad %724 
					                              f32_3 %733 = OpLoad %52 
					                              f32_3 %734 = OpVectorShuffle %733 %732 0 3 4 
					                                             OpStore %52 %734 
					                               bool %735 = OpLoad %99 
					                                             OpSelectionMerge %738 None 
					                                             OpBranchConditional %735 %737 %740 
					                                    %737 = OpLabel 
					                              f32_3 %739 = OpLoad %72 
					                                             OpStore %736 %739 
					                                             OpBranch %738 
					                                    %740 = OpLabel 
					                              f32_3 %741 = OpLoad %131 
					                                             OpStore %736 %741 
					                                             OpBranch %738 
					                                    %738 = OpLabel 
					                              f32_3 %742 = OpLoad %736 
					                                             OpStore %9 %742 
					                               bool %743 = OpLoad %99 
					                                             OpSelectionMerge %746 None 
					                                             OpBranchConditional %743 %745 %749 
					                                    %745 = OpLabel 
					                                             OpStore %744 %748 
					                                             OpBranch %746 
					                                    %749 = OpLabel 
					                              f32_3 %750 = OpLoad %72 
					                                             OpStore %744 %750 
					                                             OpBranch %746 
					                                    %746 = OpLabel 
					                              f32_3 %751 = OpLoad %744 
					                                             OpStore %68 %751 
					                       Private f32* %752 = OpAccessChain %52 %95 
					                                f32 %753 = OpLoad %752 
					                       Private f32* %754 = OpAccessChain %52 %82 
					                                f32 %755 = OpLoad %754 
					                               bool %756 = OpFOrdLessThan %753 %755 
					                                             OpStore %99 %756 
					                               bool %758 = OpLoad %99 
					                                             OpSelectionMerge %761 None 
					                                             OpBranchConditional %758 %760 %764 
					                                    %760 = OpLabel 
					                              f32_3 %762 = OpLoad %52 
					                              f32_2 %763 = OpVectorShuffle %762 %762 0 1 
					                                             OpStore %759 %763 
					                                             OpBranch %761 
					                                    %764 = OpLabel 
					                              f32_3 %765 = OpLoad %52 
					                              f32_2 %766 = OpVectorShuffle %765 %765 1 2 
					                                             OpStore %759 %766 
					                                             OpBranch %761 
					                                    %761 = OpLabel 
					                              f32_2 %767 = OpLoad %759 
					                                             OpStore %757 %767 
					                               bool %768 = OpLoad %99 
					                                             OpSelectionMerge %771 None 
					                                             OpBranchConditional %768 %770 %773 
					                                    %770 = OpLabel 
					                              f32_3 %772 = OpLoad %68 
					                                             OpStore %769 %772 
					                                             OpBranch %771 
					                                    %773 = OpLabel 
					                              f32_3 %774 = OpLoad %9 
					                                             OpStore %769 %774 
					                                             OpBranch %771 
					                                    %771 = OpLabel 
					                              f32_3 %775 = OpLoad %769 
					                                             OpStore %9 %775 
					                               bool %776 = OpLoad %99 
					                                             OpSelectionMerge %779 None 
					                                             OpBranchConditional %776 %778 %780 
					                                    %778 = OpLabel 
					                                             OpStore %777 %128 
					                                             OpBranch %779 
					                                    %780 = OpLabel 
					                              f32_3 %781 = OpLoad %68 
					                                             OpStore %777 %781 
					                                             OpBranch %779 
					                                    %779 = OpLabel 
					                              f32_3 %782 = OpLoad %777 
					                                             OpStore %52 %782 
					                              f32_2 %783 = OpLoad %17 
					                              f32_2 %784 = OpVectorShuffle %783 %783 1 0 
					                                f32 %788 = OpDot %784 %787 
					                                             OpStore %76 %788 
					                                f32 %789 = OpLoad %76 
					                                f32 %790 = OpExtInst %1 13 %789 
					                                             OpStore %76 %790 
					                                f32 %791 = OpLoad %76 
					                                f32 %793 = OpFMul %791 %792 
					                                             OpStore %76 %793 
					                              f32_2 %795 = OpLoad %17 
					                                f32 %799 = OpDot %795 %798 
					                                             OpStore %794 %799 
					                       Private f32* %800 = OpAccessChain %17 %95 
					                                f32 %801 = OpLoad %800 
					                       Private f32* %802 = OpAccessChain %17 %82 
					                                f32 %803 = OpLoad %802 
					                                f32 %804 = OpFAdd %801 %803 
					                       Private f32* %805 = OpAccessChain %17 %95 
					                                             OpStore %805 %804 
					                                f32 %807 = OpLoad %794 
					                                f32 %808 = OpExtInst %1 13 %807 
					                                             OpStore %806 %808 
					                                f32 %809 = OpLoad %806 
					                                f32 %810 = OpExtInst %1 4 %809 
					                                f32 %812 = OpFAdd %810 %811 
					                                             OpStore %806 %812 
					                                f32 %813 = OpLoad %76 
					                                f32 %814 = OpLoad %806 
					                                f32 %815 = OpFMul %813 %814 
					                                             OpStore %76 %815 
					                                f32 %816 = OpLoad %76 
					                                f32 %817 = OpExtInst %1 10 %816 
					                                             OpStore %76 %817 
					                       Private f32* %818 = OpAccessChain %757 %82 
					                                f32 %819 = OpLoad %818 
					                       Private f32* %820 = OpAccessChain %757 %95 
					                                f32 %821 = OpLoad %820 
					                                f32 %822 = OpFAdd %819 %821 
					                                             OpStore %806 %822 
					                       Private f32* %823 = OpAccessChain %757 %82 
					                                f32 %824 = OpLoad %823 
					                                f32 %825 = OpLoad %806 
					                                f32 %826 = OpFDiv %824 %825 
					                                             OpStore %806 %826 
					                                f32 %827 = OpLoad %76 
					                                f32 %829 = OpFMul %827 %828 
					                                f32 %830 = OpLoad %806 
					                                f32 %831 = OpFAdd %829 %830 
					                                             OpStore %76 %831 
					                       Private f32* %832 = OpAccessChain %17 %95 
					                                f32 %833 = OpLoad %832 
					                                f32 %834 = OpFMul %833 %797 
					                                             OpStore %806 %834 
					                                f32 %835 = OpLoad %806 
					                                f32 %836 = OpExtInst %1 8 %835 
					                                             OpStore %806 %836 
					                                f32 %837 = OpLoad %806 
					                                f32 %838 = OpFNegate %837 
					                                f32 %840 = OpFMul %838 %839 
					                       Private f32* %841 = OpAccessChain %17 %95 
					                                f32 %842 = OpLoad %841 
					                                f32 %843 = OpFAdd %840 %842 
					                       Private f32* %844 = OpAccessChain %17 %95 
					                                             OpStore %844 %843 
					                                f32 %845 = OpLoad %76 
					                       Private f32* %846 = OpAccessChain %17 %95 
					                                f32 %847 = OpLoad %846 
					                               bool %848 = OpFOrdLessThan %845 %847 
					                                             OpStore %99 %848 
					                               bool %851 = OpLoad %99 
					                                             OpSelectionMerge %854 None 
					                                             OpBranchConditional %851 %853 %856 
					                                    %853 = OpLabel 
					                              f32_3 %855 = OpLoad %9 
					                                             OpStore %852 %855 
					                                             OpBranch %854 
					                                    %856 = OpLabel 
					                              f32_3 %857 = OpLoad %52 
					                                             OpStore %852 %857 
					                                             OpBranch %854 
					                                    %854 = OpLabel 
					                              f32_3 %858 = OpLoad %852 
					                              f32_4 %859 = OpLoad %850 
					                              f32_4 %860 = OpVectorShuffle %859 %858 4 5 6 3 
					                                             OpStore %850 %860 
					                        Output f32* %863 = OpAccessChain %850 %861 
					                                             OpStore %863 %127 
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
						float _Distortion;
						vec4 _MainTex_ST;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec3 u_xlat5;
					vec3 u_xlat6;
					float u_xlat8;
					vec2 u_xlat15;
					bool u_xlatb15;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat23;
					void main()
					{
					    u_xlat0.z = 1000.0;
					    u_xlat1.xy = vs_TEXCOORD0.yx * _MainTex_ST.yx + _MainTex_ST.wz;
					    u_xlat10_2 = texture(_MainTex, u_xlat1.yx);
					    u_xlat2.xyz = u_xlat10_2.xyz + vec3(vec3(_Distortion, _Distortion, _Distortion));
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat2.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
					    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat0.y = min(u_xlat21, 1000.0);
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.248746932, -0.0272114873, -0.0179268718);
					    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat4.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(0.62890625, 0.30078125, 0.26171875), vec3(bvec3(u_xlatb21)));
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0709900856, -0.428501189, -0.476837158);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.253410816, -0.0392498374, -0.267751515);
					    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
					    u_xlatb15 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb15)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat4.xyz, vec3(bvec3(u_xlatb21)));
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.4140625, 0.75390625, 0.78125) : u_xlat4.xyz;
					    u_xlat5.xyz = (bool(u_xlatb15)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb15)) ? vec3(0.6328125, 0.33984375, 0.64453125) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0464134216, -0.308615983, -0.0511035323);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.359375, 0.67578125, 0.37109375) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0293874145, -0.0187416077, -0.226284027);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.30859375, 0.265625, 0.609375) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.498618305, -0.584146023, -0.153264582);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.79296875, 0.8359375, 0.53515625) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.258132637, -0.0670471191, -0.0116295815);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.63671875, 0.40625, 0.2265625) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0793337822, -0.034081161, -7.93337822e-05);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.4296875, 0.32421875, 0.04296875) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.506023407, -0.122093141, -0.0979323387);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.796875, 0.49609375, 0.4609375) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.0578343272, -0.0578343272, -0.0578343272);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.38671875, 0.38671875, 0.38671875) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.160075366, -0.160075366, -0.160075366);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.54296875, 0.54296875, 0.54296875) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.221960247, -0.697200477, -0.230663598);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.60546875, 0.88671875, 0.61328125) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.156645298, -0.122093141, -0.513501465);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat0.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat4.xyz = (bool(u_xlatb21)) ? vec3(0.5390625, 0.49609375, 0.80078125) : u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-0.319443643, -0.319443643, -0.319443643);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
					    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
					    u_xlatb21 = u_xlat0.x<u_xlat0.y;
					    u_xlat2.yz = (bool(u_xlatb21)) ? u_xlat0.xy : u_xlat0.yz;
					    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : u_xlat5.xyz;
					    u_xlat3.xyz = (bool(u_xlatb21)) ? vec3(0.68359375, 0.68359375, 0.68359375) : u_xlat4.xyz;
					    u_xlatb21 = u_xlat2.x<u_xlat2.y;
					    u_xlat15.xy = (bool(u_xlatb21)) ? u_xlat2.xy : u_xlat2.yz;
					    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat3.xyz : u_xlat0.xyz;
					    u_xlat2.xyz = (bool(u_xlatb21)) ? vec3(1.0, 1.0, 1.0) : u_xlat3.xyz;
					    u_xlat21 = dot(u_xlat1.yx, vec2(8.5, 0.0500000007));
					    u_xlat21 = sin(u_xlat21);
					    u_xlat21 = u_xlat21 * 10000.0;
					    u_xlat23 = dot(u_xlat1.xy, vec2(6.5, 0.5));
					    u_xlat1.x = u_xlat1.x + u_xlat1.y;
					    u_xlat8 = sin(u_xlat23);
					    u_xlat8 = abs(u_xlat8) + 0.100000001;
					    u_xlat21 = u_xlat21 * u_xlat8;
					    u_xlat21 = fract(u_xlat21);
					    u_xlat8 = u_xlat15.y + u_xlat15.x;
					    u_xlat8 = u_xlat15.y / u_xlat8;
					    u_xlat21 = u_xlat21 * 0.75 + u_xlat8;
					    u_xlat8 = u_xlat1.x * 0.5;
					    u_xlat8 = floor(u_xlat8);
					    u_xlat1.x = (-u_xlat8) * 2.0 + u_xlat1.x;
					    u_xlatb21 = u_xlat21<u_xlat1.x;
					    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat2.xyz;
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