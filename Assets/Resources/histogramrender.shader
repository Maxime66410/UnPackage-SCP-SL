Shader "Hidden/TonemappingColorGradingHistogram" {
	Properties {
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 20630
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					layout(binding = 1, std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					float ImmCB_0_0_0[4];
					float ImmCB_0_0_1[4];
					float ImmCB_0_0_2[4];
					float ImmCB_0_0_3[4];
					uniform 	vec2 _Size;
					uniform 	uint _Channel;
					uniform 	vec4 _ColorR;
					uniform 	vec4 _ColorG;
					uniform 	vec4 _ColorB;
					uniform 	vec4 _ColorL;
					 struct _Histogram_type {
						uint[4] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					uvec2 u_xlatu2;
					float u_xlat4;
					uint u_xlatu4;
					int u_xlati6;
					void main()
					{
						ImmCB_0_0_0[0] = 1.0;
						ImmCB_0_0_0[1] = 0.0;
						ImmCB_0_0_0[2] = 0.0;
						ImmCB_0_0_0[3] = 0.0;
						ImmCB_0_0_1[0] = 0.0;
						ImmCB_0_0_1[1] = 1.0;
						ImmCB_0_0_1[2] = 0.0;
						ImmCB_0_0_1[3] = 0.0;
						ImmCB_0_0_2[0] = 0.0;
						ImmCB_0_0_2[1] = 0.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = 0.0;
						ImmCB_0_0_3[0] = 0.0;
						ImmCB_0_0_3[1] = 0.0;
						ImmCB_0_0_3[2] = 0.0;
						ImmCB_0_0_3[3] = 1.0;
					    u_xlat0 = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0);
					    u_xlat0 = fract(u_xlat0);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu4 = min(u_xlatu4, 255u);
					    u_xlati6 = int(_Channel) << 2;
					    u_xlatu2.y = _Histogram_buf[u_xlatu4].value[(u_xlati6 >> 2) + 0];
					    u_xlatu2.x = _Histogram_buf[u_xlatu2.x].value[(u_xlati6 >> 2) + 0];
					    u_xlat2.xy = vec2(u_xlatu2.xy);
					    u_xlat4 = u_xlat0 * u_xlat2.y;
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat0 = u_xlat2.x * u_xlat0 + u_xlat4;
					    u_xlat2.x = vs_TEXCOORD0.y * _Size.y;
					    u_xlat2.x = roundEven(u_xlat2.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlat2.x = float(u_xlatu2.x);
					    u_xlatb0 = u_xlat0>=u_xlat2.x;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlatu2.x = _Channel;
					    u_xlat1 = _ColorR * ImmCB_0_0_0[int(u_xlatu2.x)];
					    u_xlat1 = ImmCB_0_0_1[int(u_xlatu2.x)] * _ColorG + u_xlat1;
					    u_xlat1 = ImmCB_0_0_2[int(u_xlatu2.x)] * _ColorB + u_xlat1;
					    u_xlat1 = ImmCB_0_0_3[int(u_xlatu2.x)] * _ColorL + u_xlat1;
					    SV_Target0 = vec4(u_xlat0) * u_xlat1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate vs_TEXCOORD0 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                         Input f32_4* %11 = OpVariable Input 
					                                      %14 = OpTypeInt 32 0 
					                                  u32 %15 = OpConstant 4 
					                                      %16 = OpTypeArray %7 %15 
					                                      %17 = OpTypeArray %7 %15 
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 0 
					                                  i32 %23 = OpConstant 1 
					                                      %24 = OpTypePointer Uniform %7 
					                                  i32 %35 = OpConstant 2 
					                                  i32 %44 = OpConstant 3 
					                       Private f32_4* %48 = OpVariable Private 
					                                  u32 %68 = OpConstant 1 
					                                      %69 = OpTypeArray %6 %68 
					                                      %70 = OpTypeStruct %7 %6 %69 
					                                      %71 = OpTypePointer Output %70 
					 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                      %80 = OpTypePointer Output %7 
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_4 %12 = OpLoad %11 
					                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                f32_4 %26 = OpLoad %25 
					                                f32_4 %27 = OpFMul %13 %26 
					                                              OpStore %9 %27 
					                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                f32_4 %29 = OpLoad %28 
					                                f32_4 %30 = OpLoad %11 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                f32_4 %32 = OpFMul %29 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpFAdd %32 %33 
					                                              OpStore %9 %34 
					                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                f32_4 %37 = OpLoad %36 
					                                f32_4 %38 = OpLoad %11 
					                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                f32_4 %40 = OpFMul %37 %39 
					                                f32_4 %41 = OpLoad %9 
					                                f32_4 %42 = OpFAdd %40 %41 
					                                              OpStore %9 %42 
					                                f32_4 %43 = OpLoad %9 
					                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                f32_4 %46 = OpLoad %45 
					                                f32_4 %47 = OpFAdd %43 %46 
					                                              OpStore %9 %47 
					                                f32_4 %49 = OpLoad %9 
					                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                f32_4 %52 = OpLoad %51 
					                                f32_4 %53 = OpFMul %50 %52 
					                                              OpStore %48 %53 
					                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                f32_4 %55 = OpLoad %54 
					                                f32_4 %56 = OpLoad %9 
					                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                f32_4 %58 = OpFMul %55 %57 
					                                f32_4 %59 = OpLoad %48 
					                                f32_4 %60 = OpFAdd %58 %59 
					                                              OpStore %48 %60 
					                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                f32_4 %62 = OpLoad %61 
					                                f32_4 %63 = OpLoad %9 
					                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                f32_4 %65 = OpFMul %62 %64 
					                                f32_4 %66 = OpLoad %48 
					                                f32_4 %67 = OpFAdd %65 %66 
					                                              OpStore %48 %67 
					                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                f32_4 %74 = OpLoad %73 
					                                f32_4 %75 = OpLoad %9 
					                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                f32_4 %77 = OpFMul %74 %76 
					                                f32_4 %78 = OpLoad %48 
					                                f32_4 %79 = OpFAdd %77 %78 
					                        Output f32_4* %81 = OpAccessChain %72 %22 
					                                              OpStore %81 %79 
					                                f32_2 %87 = OpLoad %86 
					                                              OpStore vs_TEXCOORD0 %87 
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 201
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %11 %195 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 11 
					                                                      OpMemberDecorate %46 0 Offset 46 
					                                                      OpMemberDecorate %46 1 Offset 46 
					                                                      OpMemberDecorate %46 2 Offset 46 
					                                                      OpMemberDecorate %46 3 Offset 46 
					                                                      OpMemberDecorate %46 4 Offset 46 
					                                                      OpMemberDecorate %46 5 Offset 46 
					                                                      OpDecorate %46 Block 
					                                                      OpDecorate %48 DescriptorSet 48 
					                                                      OpDecorate %48 Binding 48 
					                                                      OpDecorate %57 ArrayStride 57 
					                                                      OpMemberDecorate %58 0 Offset 58 
					                                                      OpDecorate %59 ArrayStride 59 
					                                                      OpMemberDecorate %60 0 NonWritable 
					                                                      OpMemberDecorate %60 0 Offset 60 
					                                                      OpDecorate %60 BufferBlock 
					                                                      OpDecorate %62 DescriptorSet 62 
					                                                      OpDecorate %62 Binding 62 
					                                                      OpDecorate %195 Location 195 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypePointer Private %6 
					                                  Private f32* %8 = OpVariable Private 
					                                               %9 = OpTypeVector %6 2 
					                                              %10 = OpTypePointer Input %9 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %12 = OpTypeInt 32 0 
					                                          u32 %13 = OpConstant 0 
					                                              %14 = OpTypePointer Input %6 
					                                          f32 %17 = OpConstant 3,674022E-40 
					                                              %19 = OpTypePointer Private %9 
					                               Private f32_2* %20 = OpVariable Private 
					                                              %26 = OpTypeVector %12 2 
					                                              %27 = OpTypePointer Private %26 
					                               Private u32_2* %28 = OpVariable Private 
					                                              %32 = OpTypePointer Private %12 
					                                 Private u32* %34 = OpVariable Private 
					                                          u32 %37 = OpConstant 1 
					                                          u32 %40 = OpConstant 255 
					                                              %42 = OpTypeInt 32 1 
					                                              %43 = OpTypePointer Private %42 
					                                 Private i32* %44 = OpVariable Private 
					                                              %45 = OpTypeVector %6 4 
					                                              %46 = OpTypeStruct %9 %12 %45 %45 %45 %45 
					                                              %47 = OpTypePointer Uniform %46 
					Uniform struct {f32_2; u32; f32_4; f32_4; f32_4; f32_4;}* %48 = OpVariable Uniform 
					                                          i32 %49 = OpConstant 1 
					                                              %50 = OpTypePointer Uniform %12 
					                                          i32 %54 = OpConstant 2 
					                                          u32 %56 = OpConstant 4 
					                                              %57 = OpTypeArray %12 %56 
					                                              %58 = OpTypeStruct %57 
					                                              %59 = OpTypeRuntimeArray %58 
					                                              %60 = OpTypeStruct %59 
					                                              %61 = OpTypePointer Uniform %60 
					                          Uniform struct {;}* %62 = OpVariable Uniform 
					                                          i32 %63 = OpConstant 0 
					                                 Private f32* %81 = OpVariable Private 
					                                          f32 %88 = OpConstant 3,674022E-40 
					                                              %98 = OpTypePointer Uniform %6 
					                                             %115 = OpTypeBool 
					                                             %116 = OpTypePointer Private %115 
					                               Private bool* %117 = OpVariable Private 
					                                         f32 %123 = OpConstant 3,674022E-40 
					                                             %128 = OpTypePointer Private %45 
					                              Private f32_4* %129 = OpVariable Private 
					                                             %130 = OpTypePointer Uniform %45 
					                                             %133 = OpTypeVector %12 4 
					                                             %134 = OpTypeArray %133 %56 
					                                         u32 %135 = OpConstant 1065353216 
					                                       u32_4 %136 = OpConstantComposite %135 %13 %13 %13 
					                                       u32_4 %137 = OpConstantComposite %13 %135 %13 %13 
					                                       u32_4 %138 = OpConstantComposite %13 %13 %135 %13 
					                                       u32_4 %139 = OpConstantComposite %13 %13 %13 %135 
					                                    u32_4[4] %140 = OpConstantComposite %136 %137 %138 %139 
					                                             %144 = OpTypePointer Function %134 
					                                             %146 = OpTypePointer Function %133 
					                                         i32 %160 = OpConstant 3 
					                                         i32 %174 = OpConstant 4 
					                                         i32 %188 = OpConstant 5 
					                                             %194 = OpTypePointer Output %45 
					                               Output f32_4* %195 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          Function u32_4[4]* %145 = OpVariable Function 
					                          Function u32_4[4]* %155 = OpVariable Function 
					                          Function u32_4[4]* %169 = OpVariable Function 
					                          Function u32_4[4]* %183 = OpVariable Function 
					                                   Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
					                                          f32 %16 = OpLoad %15 
					                                          f32 %18 = OpFMul %16 %17 
					                                                      OpStore %8 %18 
					                                          f32 %21 = OpLoad %8 
					                                          f32 %22 = OpExtInst %1 8 %21 
					                                 Private f32* %23 = OpAccessChain %20 %13 
					                                                      OpStore %23 %22 
					                                          f32 %24 = OpLoad %8 
					                                          f32 %25 = OpExtInst %1 10 %24 
					                                                      OpStore %8 %25 
					                                 Private f32* %29 = OpAccessChain %20 %13 
					                                          f32 %30 = OpLoad %29 
					                                          u32 %31 = OpConvertFToU %30 
					                                 Private u32* %33 = OpAccessChain %28 %13 
					                                                      OpStore %33 %31 
					                                 Private u32* %35 = OpAccessChain %28 %13 
					                                          u32 %36 = OpLoad %35 
					                                          u32 %38 = OpIAdd %36 %37 
					                                                      OpStore %34 %38 
					                                          u32 %39 = OpLoad %34 
					                                          u32 %41 = OpExtInst %1 38 %39 %40 
					                                                      OpStore %34 %41 
					                                 Uniform u32* %51 = OpAccessChain %48 %49 
					                                          u32 %52 = OpLoad %51 
					                                          i32 %53 = OpBitcast %52 
					                                          i32 %55 = OpShiftLeftLogical %53 %54 
					                                                      OpStore %44 %55 
					                                          u32 %64 = OpLoad %34 
					                                          i32 %65 = OpLoad %44 
					                                          i32 %66 = OpShiftRightArithmetic %65 %54 
					                                          i32 %67 = OpIAdd %66 %63 
					                                 Uniform u32* %68 = OpAccessChain %62 %63 %64 %63 %67 
					                                          u32 %69 = OpLoad %68 
					                                 Private u32* %70 = OpAccessChain %28 %37 
					                                                      OpStore %70 %69 
					                                 Private u32* %71 = OpAccessChain %28 %13 
					                                          u32 %72 = OpLoad %71 
					                                          i32 %73 = OpLoad %44 
					                                          i32 %74 = OpShiftRightArithmetic %73 %54 
					                                          i32 %75 = OpIAdd %74 %63 
					                                 Uniform u32* %76 = OpAccessChain %62 %63 %72 %63 %75 
					                                          u32 %77 = OpLoad %76 
					                                 Private u32* %78 = OpAccessChain %28 %13 
					                                                      OpStore %78 %77 
					                                        u32_2 %79 = OpLoad %28 
					                                        f32_2 %80 = OpConvertUToF %79 
					                                                      OpStore %20 %80 
					                                          f32 %82 = OpLoad %8 
					                                 Private f32* %83 = OpAccessChain %20 %37 
					                                          f32 %84 = OpLoad %83 
					                                          f32 %85 = OpFMul %82 %84 
					                                                      OpStore %81 %85 
					                                          f32 %86 = OpLoad %8 
					                                          f32 %87 = OpFNegate %86 
					                                          f32 %89 = OpFAdd %87 %88 
					                                                      OpStore %8 %89 
					                                 Private f32* %90 = OpAccessChain %20 %13 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpLoad %8 
					                                          f32 %93 = OpFMul %91 %92 
					                                          f32 %94 = OpLoad %81 
					                                          f32 %95 = OpFAdd %93 %94 
					                                                      OpStore %8 %95 
					                                   Input f32* %96 = OpAccessChain vs_TEXCOORD0 %37 
					                                          f32 %97 = OpLoad %96 
					                                 Uniform f32* %99 = OpAccessChain %48 %63 %37 
					                                         f32 %100 = OpLoad %99 
					                                         f32 %101 = OpFMul %97 %100 
					                                Private f32* %102 = OpAccessChain %20 %13 
					                                                      OpStore %102 %101 
					                                Private f32* %103 = OpAccessChain %20 %13 
					                                         f32 %104 = OpLoad %103 
					                                         f32 %105 = OpExtInst %1 2 %104 
					                                Private f32* %106 = OpAccessChain %20 %13 
					                                                      OpStore %106 %105 
					                                Private f32* %107 = OpAccessChain %20 %13 
					                                         f32 %108 = OpLoad %107 
					                                         u32 %109 = OpConvertFToU %108 
					                                Private u32* %110 = OpAccessChain %28 %13 
					                                                      OpStore %110 %109 
					                                Private u32* %111 = OpAccessChain %28 %13 
					                                         u32 %112 = OpLoad %111 
					                                         f32 %113 = OpConvertUToF %112 
					                                Private f32* %114 = OpAccessChain %20 %13 
					                                                      OpStore %114 %113 
					                                         f32 %118 = OpLoad %8 
					                                Private f32* %119 = OpAccessChain %20 %13 
					                                         f32 %120 = OpLoad %119 
					                                        bool %121 = OpFOrdGreaterThanEqual %118 %120 
					                                                      OpStore %117 %121 
					                                        bool %122 = OpLoad %117 
					                                         f32 %124 = OpSelect %122 %88 %123 
					                                                      OpStore %8 %124 
					                                Uniform u32* %125 = OpAccessChain %48 %49 
					                                         u32 %126 = OpLoad %125 
					                                Private u32* %127 = OpAccessChain %28 %13 
					                                                      OpStore %127 %126 
					                              Uniform f32_4* %131 = OpAccessChain %48 %54 
					                                       f32_4 %132 = OpLoad %131 
					                                Private u32* %141 = OpAccessChain %28 %13 
					                                         u32 %142 = OpLoad %141 
					                                         i32 %143 = OpBitcast %142 
					                                                      OpStore %145 %140 
					                             Function u32_4* %147 = OpAccessChain %145 %143 
					                                       u32_4 %148 = OpLoad %147 
					                                       u32_4 %149 = OpVectorShuffle %148 %148 0 0 0 0 
					                                       f32_4 %150 = OpBitcast %149 
					                                       f32_4 %151 = OpFMul %132 %150 
					                                                      OpStore %129 %151 
					                                Private u32* %152 = OpAccessChain %28 %13 
					                                         u32 %153 = OpLoad %152 
					                                         i32 %154 = OpBitcast %153 
					                                                      OpStore %155 %140 
					                             Function u32_4* %156 = OpAccessChain %155 %154 
					                                       u32_4 %157 = OpLoad %156 
					                                       u32_4 %158 = OpVectorShuffle %157 %157 1 1 1 1 
					                                       f32_4 %159 = OpBitcast %158 
					                              Uniform f32_4* %161 = OpAccessChain %48 %160 
					                                       f32_4 %162 = OpLoad %161 
					                                       f32_4 %163 = OpFMul %159 %162 
					                                       f32_4 %164 = OpLoad %129 
					                                       f32_4 %165 = OpFAdd %163 %164 
					                                                      OpStore %129 %165 
					                                Private u32* %166 = OpAccessChain %28 %13 
					                                         u32 %167 = OpLoad %166 
					                                         i32 %168 = OpBitcast %167 
					                                                      OpStore %169 %140 
					                             Function u32_4* %170 = OpAccessChain %169 %168 
					                                       u32_4 %171 = OpLoad %170 
					                                       u32_4 %172 = OpVectorShuffle %171 %171 2 2 2 2 
					                                       f32_4 %173 = OpBitcast %172 
					                              Uniform f32_4* %175 = OpAccessChain %48 %174 
					                                       f32_4 %176 = OpLoad %175 
					                                       f32_4 %177 = OpFMul %173 %176 
					                                       f32_4 %178 = OpLoad %129 
					                                       f32_4 %179 = OpFAdd %177 %178 
					                                                      OpStore %129 %179 
					                                Private u32* %180 = OpAccessChain %28 %13 
					                                         u32 %181 = OpLoad %180 
					                                         i32 %182 = OpBitcast %181 
					                                                      OpStore %183 %140 
					                             Function u32_4* %184 = OpAccessChain %183 %182 
					                                       u32_4 %185 = OpLoad %184 
					                                       u32_4 %186 = OpVectorShuffle %185 %185 3 3 3 3 
					                                       f32_4 %187 = OpBitcast %186 
					                              Uniform f32_4* %189 = OpAccessChain %48 %188 
					                                       f32_4 %190 = OpLoad %189 
					                                       f32_4 %191 = OpFMul %187 %190 
					                                       f32_4 %192 = OpLoad %129 
					                                       f32_4 %193 = OpFAdd %191 %192 
					                                                      OpStore %129 %193 
					                                         f32 %196 = OpLoad %8 
					                                       f32_4 %197 = OpCompositeConstruct %196 %196 %196 %196 
					                                       f32_4 %198 = OpLoad %129 
					                                       f32_4 %199 = OpFMul %197 %198 
					                                                      OpStore %195 %199 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					float ImmCB_0_0_0[4];
					float ImmCB_0_0_1[4];
					float ImmCB_0_0_2[4];
					float ImmCB_0_0_3[4];
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec2 _Size;
						int _Channel;
						vec4 _ColorR;
						vec4 _ColorG;
						vec4 _ColorB;
						vec4 _ColorL;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					int u_xlati2;
					uvec2 u_xlatu2;
					float u_xlat4;
					uint u_xlatu4;
					int u_xlati6;
					void main()
					{
						ImmCB_0_0_0[0] = 1.0;
						ImmCB_0_0_0[1] = 0.0;
						ImmCB_0_0_0[2] = 0.0;
						ImmCB_0_0_0[3] = 0.0;
						ImmCB_0_0_1[0] = 0.0;
						ImmCB_0_0_1[1] = 1.0;
						ImmCB_0_0_1[2] = 0.0;
						ImmCB_0_0_1[3] = 0.0;
						ImmCB_0_0_2[0] = 0.0;
						ImmCB_0_0_2[1] = 0.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = 0.0;
						ImmCB_0_0_3[0] = 0.0;
						ImmCB_0_0_3[1] = 0.0;
						ImmCB_0_0_3[2] = 0.0;
						ImmCB_0_0_3[3] = 1.0;
					    u_xlat0 = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0);
					    u_xlat0 = fract(u_xlat0);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu4 = min(u_xlatu4, 255u);
					    u_xlati6 = _Channel << 2;
					    u_xlatu2.y = _Histogram_buf[u_xlatu4].value[(u_xlati6 >> 2) + 0];
					    u_xlatu2.x = _Histogram_buf[u_xlatu2.x].value[(u_xlati6 >> 2) + 0];
					    u_xlat2.xy = vec2(u_xlatu2.xy);
					    u_xlat4 = u_xlat0 * u_xlat2.y;
					    u_xlat0 = (-u_xlat0) + 1.0;
					    u_xlat0 = u_xlat2.x * u_xlat0 + u_xlat4;
					    u_xlat2.x = vs_TEXCOORD0.y * _Size.y;
					    u_xlat2.x = roundEven(u_xlat2.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlat2.x = float(u_xlatu2.x);
					    u_xlatb0 = u_xlat0>=u_xlat2.x;
					    u_xlat0 = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlati2 = _Channel;
					    u_xlat1 = _ColorR * ImmCB_0_0_0[u_xlati2];
					    u_xlat1 = ImmCB_0_0_1[u_xlati2] * _ColorG + u_xlat1;
					    u_xlat1 = ImmCB_0_0_2[u_xlati2] * _ColorB + u_xlat1;
					    u_xlat1 = ImmCB_0_0_3[u_xlati2] * _ColorL + u_xlat1;
					    SV_Target0 = vec4(u_xlat0) * u_xlat1;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 112551
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						vec4 unused_0_1[7];
					};
					layout(binding = 1, std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x
					#ifdef VERTEX
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					
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
					in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 420
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_shading_language_420pack : require
					#ifdef GL_ARB_shader_storage_buffer_object
					#extension GL_ARB_shader_storage_buffer_object : enable
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
					uniform 	vec2 _Size;
					uniform 	vec4 _ColorR;
					uniform 	vec4 _ColorG;
					uniform 	vec4 _ColorB;
					 struct _Histogram_type {
						uint[4] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					uvec3 u_xlatu1;
					vec3 u_xlat2;
					uvec3 u_xlatu2;
					uint u_xlatu4;
					float u_xlat6;
					uint u_xlatu6;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu1.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat1.xyz = vec3(u_xlatu1.xyz);
					    u_xlatu2.x = min(u_xlatu4, 255u);
					    u_xlatu2.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat2.xyz = vec3(u_xlatu2.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat6 = vs_TEXCOORD0.y * _Size.y;
					    u_xlat6 = roundEven(u_xlat6);
					    u_xlatu6 = uint(u_xlat6);
					    u_xlat6 = float(u_xlatu6);
					    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(u_xlat6)).xyz;
					    u_xlat0.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb0.xyz));
					    u_xlat1 = u_xlat0.yyyy * _ColorG;
					    u_xlat1 = u_xlat0.xxxx * _ColorR + u_xlat1;
					    SV_Target0 = u_xlat0.zzzz * _ColorB + u_xlat1;
					    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 94
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
					                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                              OpDecorate %11 Location 11 
					                                              OpDecorate %16 ArrayStride 16 
					                                              OpDecorate %17 ArrayStride 17 
					                                              OpMemberDecorate %18 0 Offset 18 
					                                              OpMemberDecorate %18 1 Offset 18 
					                                              OpDecorate %18 Block 
					                                              OpDecorate %20 DescriptorSet 20 
					                                              OpDecorate %20 Binding 20 
					                                              OpMemberDecorate %70 0 BuiltIn 70 
					                                              OpMemberDecorate %70 1 BuiltIn 70 
					                                              OpMemberDecorate %70 2 BuiltIn 70 
					                                              OpDecorate %70 Block 
					                                              OpDecorate vs_TEXCOORD0 Location 84 
					                                              OpDecorate %86 RelaxedPrecision 
					                                              OpDecorate %86 Location 86 
					                                              OpDecorate %87 RelaxedPrecision 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypePointer Input %7 
					                         Input f32_4* %11 = OpVariable Input 
					                                      %14 = OpTypeInt 32 0 
					                                  u32 %15 = OpConstant 4 
					                                      %16 = OpTypeArray %7 %15 
					                                      %17 = OpTypeArray %7 %15 
					                                      %18 = OpTypeStruct %16 %17 
					                                      %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
					                                      %21 = OpTypeInt 32 1 
					                                  i32 %22 = OpConstant 0 
					                                  i32 %23 = OpConstant 1 
					                                      %24 = OpTypePointer Uniform %7 
					                                  i32 %35 = OpConstant 2 
					                                  i32 %44 = OpConstant 3 
					                       Private f32_4* %48 = OpVariable Private 
					                                  u32 %68 = OpConstant 1 
					                                      %69 = OpTypeArray %6 %68 
					                                      %70 = OpTypeStruct %7 %6 %69 
					                                      %71 = OpTypePointer Output %70 
					 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
					                                      %80 = OpTypePointer Output %7 
					                                      %82 = OpTypeVector %6 2 
					                                      %83 = OpTypePointer Output %82 
					               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                                      %85 = OpTypePointer Input %82 
					                         Input f32_2* %86 = OpVariable Input 
					                                      %88 = OpTypePointer Output %6 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                                f32_4 %12 = OpLoad %11 
					                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
					                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
					                                f32_4 %26 = OpLoad %25 
					                                f32_4 %27 = OpFMul %13 %26 
					                                              OpStore %9 %27 
					                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
					                                f32_4 %29 = OpLoad %28 
					                                f32_4 %30 = OpLoad %11 
					                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
					                                f32_4 %32 = OpFMul %29 %31 
					                                f32_4 %33 = OpLoad %9 
					                                f32_4 %34 = OpFAdd %32 %33 
					                                              OpStore %9 %34 
					                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
					                                f32_4 %37 = OpLoad %36 
					                                f32_4 %38 = OpLoad %11 
					                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
					                                f32_4 %40 = OpFMul %37 %39 
					                                f32_4 %41 = OpLoad %9 
					                                f32_4 %42 = OpFAdd %40 %41 
					                                              OpStore %9 %42 
					                                f32_4 %43 = OpLoad %9 
					                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
					                                f32_4 %46 = OpLoad %45 
					                                f32_4 %47 = OpFAdd %43 %46 
					                                              OpStore %9 %47 
					                                f32_4 %49 = OpLoad %9 
					                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
					                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
					                                f32_4 %52 = OpLoad %51 
					                                f32_4 %53 = OpFMul %50 %52 
					                                              OpStore %48 %53 
					                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
					                                f32_4 %55 = OpLoad %54 
					                                f32_4 %56 = OpLoad %9 
					                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
					                                f32_4 %58 = OpFMul %55 %57 
					                                f32_4 %59 = OpLoad %48 
					                                f32_4 %60 = OpFAdd %58 %59 
					                                              OpStore %48 %60 
					                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
					                                f32_4 %62 = OpLoad %61 
					                                f32_4 %63 = OpLoad %9 
					                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
					                                f32_4 %65 = OpFMul %62 %64 
					                                f32_4 %66 = OpLoad %48 
					                                f32_4 %67 = OpFAdd %65 %66 
					                                              OpStore %48 %67 
					                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
					                                f32_4 %74 = OpLoad %73 
					                                f32_4 %75 = OpLoad %9 
					                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
					                                f32_4 %77 = OpFMul %74 %76 
					                                f32_4 %78 = OpLoad %48 
					                                f32_4 %79 = OpFAdd %77 %78 
					                        Output f32_4* %81 = OpAccessChain %72 %22 
					                                              OpStore %81 %79 
					                                f32_2 %87 = OpLoad %86 
					                                              OpStore vs_TEXCOORD0 %87 
					                          Output f32* %89 = OpAccessChain %72 %22 %68 
					                                  f32 %90 = OpLoad %89 
					                                  f32 %91 = OpFNegate %90 
					                          Output f32* %92 = OpAccessChain %72 %22 %68 
					                                              OpStore %92 %91 
					                                              OpReturn
					                                              OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 175
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %161 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD0 Location 12 
					                                                      OpDecorate %46 ArrayStride 46 
					                                                      OpMemberDecorate %47 0 Offset 47 
					                                                      OpDecorate %48 ArrayStride 48 
					                                                      OpMemberDecorate %49 0 NonWritable 
					                                                      OpMemberDecorate %49 0 Offset 49 
					                                                      OpDecorate %49 BufferBlock 
					                                                      OpDecorate %51 DescriptorSet 51 
					                                                      OpDecorate %51 Binding 51 
					                                                      OpMemberDecorate %116 0 Offset 116 
					                                                      OpMemberDecorate %116 1 Offset 116 
					                                                      OpMemberDecorate %116 2 Offset 116 
					                                                      OpMemberDecorate %116 3 Offset 116 
					                                                      OpDecorate %116 Block 
					                                                      OpDecorate %118 DescriptorSet 118 
					                                                      OpDecorate %118 Binding 118 
					                                                      OpDecorate %161 Location 161 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 3 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_3* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                                              %13 = OpTypeInt 32 0 
					                                          u32 %14 = OpConstant 0 
					                                              %15 = OpTypePointer Input %6 
					                                          f32 %18 = OpConstant 3,674022E-40 
					                                              %20 = OpTypePointer Private %6 
					                               Private f32_3* %22 = OpVariable Private 
					                                              %31 = OpTypeVector %13 3 
					                                              %32 = OpTypePointer Private %31 
					                               Private u32_3* %33 = OpVariable Private 
					                                              %37 = OpTypePointer Private %13 
					                                 Private u32* %39 = OpVariable Private 
					                                          u32 %42 = OpConstant 1 
					                               Private u32_3* %44 = OpVariable Private 
					                                          u32 %45 = OpConstant 4 
					                                              %46 = OpTypeArray %13 %45 
					                                              %47 = OpTypeStruct %46 
					                                              %48 = OpTypeRuntimeArray %47 
					                                              %49 = OpTypeStruct %48 
					                                              %50 = OpTypePointer Uniform %49 
					                          Uniform struct {;}* %51 = OpVariable Uniform 
					                                              %52 = OpTypeInt 32 1 
					                                          i32 %53 = OpConstant 0 
					                                              %56 = OpTypePointer Uniform %13 
					                                          i32 %61 = OpConstant 1 
					                                          i32 %66 = OpConstant 2 
					                                              %70 = OpTypeVector %6 4 
					                                              %71 = OpTypePointer Private %70 
					                               Private f32_4* %72 = OpVariable Private 
					                                          u32 %78 = OpConstant 255 
					                                         f32 %103 = OpConstant 3,674022E-40 
					                                Private f32* %113 = OpVariable Private 
					                                             %116 = OpTypeStruct %10 %70 %70 %70 
					                                             %117 = OpTypePointer Uniform %116 
					Uniform struct {f32_2; f32_4; f32_4; f32_4;}* %118 = OpVariable Uniform 
					                                             %119 = OpTypePointer Uniform %6 
					                                Private u32* %125 = OpVariable Private 
					                                             %130 = OpTypeBool 
					                                             %131 = OpTypeVector %130 3 
					                                             %132 = OpTypePointer Private %131 
					                             Private bool_3* %133 = OpVariable Private 
					                                             %138 = OpTypeVector %130 4 
					                                         f32 %141 = OpConstant 3,674022E-40 
					                                       f32_3 %142 = OpConstantComposite %141 %141 %141 
					                                       f32_3 %143 = OpConstantComposite %103 %103 %103 
					                                             %149 = OpTypePointer Uniform %70 
					                                             %160 = OpTypePointer Output %70 
					                               Output f32_4* %161 = OpVariable Output 
					                                         i32 %164 = OpConstant 3 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                                   Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
					                                          f32 %17 = OpLoad %16 
					                                          f32 %19 = OpFMul %17 %18 
					                                 Private f32* %21 = OpAccessChain %9 %14 
					                                                      OpStore %21 %19 
					                                 Private f32* %23 = OpAccessChain %9 %14 
					                                          f32 %24 = OpLoad %23 
					                                          f32 %25 = OpExtInst %1 8 %24 
					                                 Private f32* %26 = OpAccessChain %22 %14 
					                                                      OpStore %26 %25 
					                                 Private f32* %27 = OpAccessChain %9 %14 
					                                          f32 %28 = OpLoad %27 
					                                          f32 %29 = OpExtInst %1 10 %28 
					                                 Private f32* %30 = OpAccessChain %9 %14 
					                                                      OpStore %30 %29 
					                                 Private f32* %34 = OpAccessChain %22 %14 
					                                          f32 %35 = OpLoad %34 
					                                          u32 %36 = OpConvertFToU %35 
					                                 Private u32* %38 = OpAccessChain %33 %14 
					                                                      OpStore %38 %36 
					                                 Private u32* %40 = OpAccessChain %33 %14 
					                                          u32 %41 = OpLoad %40 
					                                          u32 %43 = OpIAdd %41 %42 
					                                                      OpStore %39 %43 
					                                 Private u32* %54 = OpAccessChain %33 %14 
					                                          u32 %55 = OpLoad %54 
					                                 Uniform u32* %57 = OpAccessChain %51 %53 %55 %53 %53 
					                                          u32 %58 = OpLoad %57 
					                                 Private u32* %59 = OpAccessChain %33 %14 
					                                          u32 %60 = OpLoad %59 
					                                 Uniform u32* %62 = OpAccessChain %51 %53 %60 %53 %61 
					                                          u32 %63 = OpLoad %62 
					                                 Private u32* %64 = OpAccessChain %33 %14 
					                                          u32 %65 = OpLoad %64 
					                                 Uniform u32* %67 = OpAccessChain %51 %53 %65 %53 %66 
					                                          u32 %68 = OpLoad %67 
					                                        u32_3 %69 = OpCompositeConstruct %58 %63 %68 
					                                                      OpStore %44 %69 
					                                        u32_3 %73 = OpLoad %44 
					                                        f32_3 %74 = OpConvertUToF %73 
					                                        f32_4 %75 = OpLoad %72 
					                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
					                                                      OpStore %72 %76 
					                                          u32 %77 = OpLoad %39 
					                                          u32 %79 = OpExtInst %1 38 %77 %78 
					                                 Private u32* %80 = OpAccessChain %33 %14 
					                                                      OpStore %80 %79 
					                                 Private u32* %81 = OpAccessChain %33 %14 
					                                          u32 %82 = OpLoad %81 
					                                 Uniform u32* %83 = OpAccessChain %51 %53 %82 %53 %53 
					                                          u32 %84 = OpLoad %83 
					                                 Private u32* %85 = OpAccessChain %33 %14 
					                                          u32 %86 = OpLoad %85 
					                                 Uniform u32* %87 = OpAccessChain %51 %53 %86 %53 %61 
					                                          u32 %88 = OpLoad %87 
					                                 Private u32* %89 = OpAccessChain %33 %14 
					                                          u32 %90 = OpLoad %89 
					                                 Uniform u32* %91 = OpAccessChain %51 %53 %90 %53 %66 
					                                          u32 %92 = OpLoad %91 
					                                        u32_3 %93 = OpCompositeConstruct %84 %88 %92 
					                                                      OpStore %33 %93 
					                                        u32_3 %94 = OpLoad %33 
					                                        f32_3 %95 = OpConvertUToF %94 
					                                                      OpStore %22 %95 
					                                        f32_3 %96 = OpLoad %9 
					                                        f32_3 %97 = OpVectorShuffle %96 %96 0 0 0 
					                                        f32_3 %98 = OpLoad %22 
					                                        f32_3 %99 = OpFMul %97 %98 
					                                                      OpStore %22 %99 
					                                Private f32* %100 = OpAccessChain %9 %14 
					                                         f32 %101 = OpLoad %100 
					                                         f32 %102 = OpFNegate %101 
					                                         f32 %104 = OpFAdd %102 %103 
					                                Private f32* %105 = OpAccessChain %9 %14 
					                                                      OpStore %105 %104 
					                                       f32_4 %106 = OpLoad %72 
					                                       f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
					                                       f32_3 %108 = OpLoad %9 
					                                       f32_3 %109 = OpVectorShuffle %108 %108 0 0 0 
					                                       f32_3 %110 = OpFMul %107 %109 
					                                       f32_3 %111 = OpLoad %22 
					                                       f32_3 %112 = OpFAdd %110 %111 
					                                                      OpStore %9 %112 
					                                  Input f32* %114 = OpAccessChain vs_TEXCOORD0 %42 
					                                         f32 %115 = OpLoad %114 
					                                Uniform f32* %120 = OpAccessChain %118 %53 %42 
					                                         f32 %121 = OpLoad %120 
					                                         f32 %122 = OpFMul %115 %121 
					                                                      OpStore %113 %122 
					                                         f32 %123 = OpLoad %113 
					                                         f32 %124 = OpExtInst %1 2 %123 
					                                                      OpStore %113 %124 
					                                         f32 %126 = OpLoad %113 
					                                         u32 %127 = OpConvertFToU %126 
					                                                      OpStore %125 %127 
					                                         u32 %128 = OpLoad %125 
					                                         f32 %129 = OpConvertUToF %128 
					                                                      OpStore %113 %129 
					                                       f32_3 %134 = OpLoad %9 
					                                       f32_4 %135 = OpVectorShuffle %134 %134 0 1 2 0 
					                                         f32 %136 = OpLoad %113 
					                                       f32_4 %137 = OpCompositeConstruct %136 %136 %136 %136 
					                                      bool_4 %139 = OpFOrdGreaterThanEqual %135 %137 
					                                      bool_3 %140 = OpVectorShuffle %139 %139 0 1 2 
					                                                      OpStore %133 %140 
					                                      bool_3 %144 = OpLoad %133 
					                                       f32_3 %145 = OpSelect %144 %143 %142 
					                                       f32_3 %146 = OpExtInst %1 46 %142 %143 %145 
					                                                      OpStore %9 %146 
					                                       f32_3 %147 = OpLoad %9 
					                                       f32_4 %148 = OpVectorShuffle %147 %147 1 1 1 1 
					                              Uniform f32_4* %150 = OpAccessChain %118 %66 
					                                       f32_4 %151 = OpLoad %150 
					                                       f32_4 %152 = OpFMul %148 %151 
					                                                      OpStore %72 %152 
					                                       f32_3 %153 = OpLoad %9 
					                                       f32_4 %154 = OpVectorShuffle %153 %153 0 0 0 0 
					                              Uniform f32_4* %155 = OpAccessChain %118 %61 
					                                       f32_4 %156 = OpLoad %155 
					                                       f32_4 %157 = OpFMul %154 %156 
					                                       f32_4 %158 = OpLoad %72 
					                                       f32_4 %159 = OpFAdd %157 %158 
					                                                      OpStore %72 %159 
					                                       f32_3 %162 = OpLoad %9 
					                                       f32_4 %163 = OpVectorShuffle %162 %162 2 2 2 2 
					                              Uniform f32_4* %165 = OpAccessChain %118 %164 
					                                       f32_4 %166 = OpLoad %165 
					                                       f32_4 %167 = OpFMul %163 %166 
					                                       f32_4 %168 = OpLoad %72 
					                                       f32_4 %169 = OpFAdd %167 %168 
					                                                      OpStore %161 %169 
					                                       f32_4 %170 = OpLoad %161 
					                                       f32_4 %171 = OpCompositeConstruct %141 %141 %141 %141 
					                                       f32_4 %172 = OpCompositeConstruct %103 %103 %103 %103 
					                                       f32_4 %173 = OpExtInst %1 43 %170 %171 %172 
					                                                      OpStore %161 %173 
					                                                      OpReturn
					                                                      OpFunctionEnd"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(binding = 0, std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec2 _Size;
						vec4 _ColorR;
						vec4 _ColorG;
						vec4 _ColorB;
						vec4 unused_0_5;
					};
					 struct _Histogram_type {
						uint[1] value;
					};
					
					layout(std430, binding = 0) readonly buffer _Histogram {
						_Histogram_type _Histogram_buf[];
					};
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec3 u_xlatb0;
					vec4 u_xlat1;
					uvec3 u_xlatu1;
					vec3 u_xlat2;
					uvec3 u_xlatu2;
					uint u_xlatu4;
					float u_xlat6;
					uint u_xlatu6;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD0.x * 255.0;
					    u_xlat2.x = floor(u_xlat0.x);
					    u_xlat0.x = fract(u_xlat0.x);
					    u_xlatu2.x = uint(u_xlat2.x);
					    u_xlatu4 = u_xlatu2.x + 1u;
					    u_xlatu1.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat1.xyz = vec3(u_xlatu1.xyz);
					    u_xlatu2.x = min(u_xlatu4, 255u);
					    u_xlatu2.xyz = uvec3(_Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 0], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 1], _Histogram_buf[u_xlatu2.x].value[(0 >> 2) + 2]);
					    u_xlat2.xyz = vec3(u_xlatu2.xyz);
					    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat6 = vs_TEXCOORD0.y * _Size.y;
					    u_xlat6 = roundEven(u_xlat6);
					    u_xlatu6 = uint(u_xlat6);
					    u_xlat6 = float(u_xlatu6);
					    u_xlatb0.xyz = greaterThanEqual(u_xlat0.xyzx, vec4(u_xlat6)).xyz;
					    u_xlat0.xyz = mix(vec3(0.0, 0.0, 0.0), vec3(1.0, 1.0, 1.0), vec3(u_xlatb0.xyz));
					    u_xlat1 = u_xlat0.yyyy * _ColorG;
					    u_xlat1 = u_xlat0.xxxx * _ColorR + u_xlat1;
					    SV_Target0 = u_xlat0.zzzz * _ColorB + u_xlat1;
					    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
					    return;
					}"
				}
				SubProgram "glcore " {
					"!!!!GL4x"
				}
				SubProgram "vulkan " {
					"!!vulkan"
				}
			}
		}
	}
}