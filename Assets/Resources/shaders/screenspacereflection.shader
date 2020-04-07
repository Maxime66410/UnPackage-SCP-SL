Shader "Hidden/Post FX/Screen Space Reflection" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 32157
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _ProjInfo;
					uniform 	vec4 hlslcc_mtx4x4_WorldToCameraMatrix[4];
					uniform 	vec4 hlslcc_mtx4x4_CameraToWorldMatrix[4];
					uniform 	vec4 hlslcc_mtx4x4_ProjectToPixelMatrix[4];
					uniform 	vec2 _ScreenSize;
					uniform 	float _RayStepSize;
					uniform 	float _MaxRayTraceDistance;
					uniform 	float _LayerThickness;
					uniform 	float _FresnelFade;
					uniform 	float _FresnelFadePower;
					uniform 	int _TreatBackfaceHitAsMiss;
					uniform 	int _AllowBackwardsRays;
					uniform 	float _ScreenEdgeFading;
					uniform 	int _MaxSteps;
					uniform 	float _FadeDistance;
					uniform 	int _TraceBehindObjects;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _CameraGBufferTexture1;
					UNITY_LOCATION(2) uniform  sampler2D _CameraGBufferTexture2;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					bvec2 u_xlatb9;
					vec2 u_xlat10;
					vec2 u_xlat11;
					vec4 u_xlat10_12;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					bool u_xlatb13;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat22;
					float u_xlat26;
					bool u_xlatb26;
					vec2 u_xlat30;
					vec2 u_xlat32;
					bool u_xlatb32;
					vec2 u_xlat33;
					int u_xlati33;
					vec2 u_xlat35;
					int u_xlati35;
					bvec2 u_xlatb35;
					vec2 u_xlat36;
					float u_xlat39;
					bool u_xlatb39;
					float u_xlat40;
					bool u_xlatb40;
					float u_xlat41;
					bool u_xlatb41;
					float u_xlat42;
					bool u_xlatb42;
					float u_xlat44;
					int u_xlati44;
					int u_xlati45;
					int u_xlati46;
					int u_xlati47;
					float u_xlat48;
					int u_xlati48;
					bool u_xlatb48;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.z = (-u_xlat0.x);
					    u_xlat10_2 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    u_xlatb13 = u_xlat1.z<-100.0;
					    u_xlatb26 = u_xlat10_2.w==0.0;
					    u_xlatb13 = u_xlatb26 || u_xlatb13;
					    if(!u_xlatb13){
					        u_xlat13.xy = vs_TEXCOORD1.xy * _MainTex_TexelSize.zw;
					        u_xlat13.xy = u_xlat13.xy * _ProjInfo.xy + _ProjInfo.zw;
					        u_xlat1.xy = u_xlat1.zz * u_xlat13.xy;
					        u_xlat10_2 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					        u_xlat16_13.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat2.xyz = u_xlat16_13.yyy * hlslcc_mtx4x4_WorldToCameraMatrix[1].xyz;
					        u_xlat2.xyz = hlslcc_mtx4x4_WorldToCameraMatrix[0].xyz * u_xlat16_13.xxx + u_xlat2.xyz;
					        u_xlat13.xyz = hlslcc_mtx4x4_WorldToCameraMatrix[2].xyz * u_xlat16_13.zzz + u_xlat2.xyz;
					        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
					        u_xlat40 = inversesqrt(u_xlat40);
					        u_xlat2.xyz = vec3(u_xlat40) * u_xlat1.xyz;
					        u_xlat40 = dot(u_xlat13.xyz, (-u_xlat2.xyz));
					        u_xlat40 = u_xlat40 + u_xlat40;
					        u_xlat3.xyz = u_xlat13.xyz * vec3(u_xlat40) + u_xlat2.xyz;
					        u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat40 = inversesqrt(u_xlat40);
					        u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
					        u_xlatb40 = _AllowBackwardsRays==0;
					        u_xlatb41 = 0.0<u_xlat3.z;
					        u_xlatb40 = u_xlatb40 && u_xlatb41;
					        if(!u_xlatb40){
					            u_xlat0.x = u_xlat0.x * 0.00999999978;
					            u_xlat0.x = max(u_xlat0.x, 0.00100000005);
					            u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat1.xyz;
					            u_xlatb39 = _TraceBehindObjects==1;
					            u_xlat4.xy = vec2(1.0, 1.0) / _ScreenSize.xy;
					            u_xlat40 = u_xlat3.z * _MaxRayTraceDistance + u_xlat0.z;
					            u_xlatb40 = -0.00999999978<u_xlat40;
					            u_xlat41 = (-u_xlat0.z) + -0.00999999978;
					            u_xlat41 = u_xlat41 / u_xlat3.z;
					            u_xlat40 = (u_xlatb40) ? u_xlat41 : _MaxRayTraceDistance;
					            u_xlat5.xyz = u_xlat3.xyz * vec3(u_xlat40) + u_xlat0.xyz;
					            u_xlat6.xyz = u_xlat0.yyy * hlslcc_mtx4x4_ProjectToPixelMatrix[1].xyw;
					            u_xlat6.xyz = hlslcc_mtx4x4_ProjectToPixelMatrix[0].xyw * u_xlat0.xxx + u_xlat6.xyz;
					            u_xlat6.xyz = hlslcc_mtx4x4_ProjectToPixelMatrix[2].xyw * u_xlat0.zzz + u_xlat6.xyz;
					            u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4_ProjectToPixelMatrix[3].xyw;
					            u_xlat7.xyz = u_xlat5.yyy * hlslcc_mtx4x4_ProjectToPixelMatrix[1].xyw;
					            u_xlat7.xyz = hlslcc_mtx4x4_ProjectToPixelMatrix[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					            u_xlat7.xyz = hlslcc_mtx4x4_ProjectToPixelMatrix[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					            u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4_ProjectToPixelMatrix[3].xyw;
					            u_xlat40 = float(1.0) / u_xlat6.z;
					            u_xlat41 = float(1.0) / u_xlat7.z;
					            u_xlat30.xy = vec2(u_xlat40) * u_xlat6.yx;
					            u_xlat32.xy = vec2(u_xlat41) * u_xlat7.xy;
					            u_xlat8.xyz = u_xlat0.xyz * vec3(u_xlat40);
					            u_xlat5.xyz = vec3(u_xlat41) * u_xlat5.xyz;
					            u_xlat33.xy = _ScreenSize.yx + vec2(-0.5, -0.5);
					            u_xlatb9.xy = lessThan(u_xlat33.xyxx, u_xlat32.yxyy).xy;
					            u_xlatb35.xy = lessThan(u_xlat32.yxyx, vec4(0.5, 0.5, 0.5, 0.5)).xy;
					            u_xlatb35.x = u_xlatb35.x || u_xlatb9.x;
					            u_xlatb35.y = u_xlatb35.y || u_xlatb9.y;
					            {
					                vec2 hlslcc_movcTemp = u_xlat33;
					                hlslcc_movcTemp.x = (u_xlatb9.x) ? (-u_xlat33.x) : float(-0.5);
					                hlslcc_movcTemp.y = (u_xlatb9.y) ? (-u_xlat33.y) : float(-0.5);
					                u_xlat33 = hlslcc_movcTemp;
					            }
					            u_xlat33.xy = u_xlat7.yx * vec2(u_xlat41) + u_xlat33.xy;
					            u_xlat7.xy = u_xlat7.yx * vec2(u_xlat41) + (-u_xlat30.xy);
					            u_xlat7.xy = u_xlat33.xy / u_xlat7.xy;
					            u_xlat42 = u_xlatb35.x ? u_xlat7.x : float(0.0);
					            u_xlat44 = max(u_xlat7.y, u_xlat42);
					            u_xlat42 = (u_xlatb35.y) ? u_xlat44 : u_xlat42;
					            u_xlat7.xy = u_xlat6.xy * vec2(u_xlat40) + (-u_xlat32.xy);
					            u_xlat32.xy = vec2(u_xlat42) * u_xlat7.xy + u_xlat32.xy;
					            u_xlat44 = u_xlat40 + (-u_xlat41);
					            u_xlat41 = u_xlat42 * u_xlat44 + u_xlat41;
					            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat40) + (-u_xlat5.xyz);
					            u_xlat5.xyz = vec3(u_xlat42) * u_xlat7.xyz + u_xlat5.xyz;
					            u_xlat7.xy = u_xlat6.xy * vec2(u_xlat40) + (-u_xlat32.xy);
					            u_xlat42 = dot(u_xlat7.xy, u_xlat7.xy);
					            u_xlatb42 = u_xlat42<9.99999975e-05;
					            u_xlat7.xy = u_xlat6.xy * vec2(u_xlat40) + vec2(0.00999999978, 0.00999999978);
					            u_xlat7.xy = (bool(u_xlatb42)) ? u_xlat7.xy : u_xlat32.xy;
					            u_xlat7.zw = (-u_xlat6.xy) * vec2(u_xlat40) + u_xlat7.xy;
					            u_xlatb42 = abs(u_xlat7.z)<abs(u_xlat7.w);
					            u_xlat30.xy = (bool(u_xlatb42)) ? u_xlat30.xy : u_xlat30.yx;
					            u_xlat6.xyz = (bool(u_xlatb42)) ? u_xlat7.ywz : u_xlat7.xzw;
					            u_xlati44 = int((0.0<u_xlat6.y) ? 0xFFFFFFFFu : uint(0));
					            u_xlati45 = int((u_xlat6.y<0.0) ? 0xFFFFFFFFu : uint(0));
					            u_xlati44 = (-u_xlati44) + u_xlati45;
					            u_xlat7.x = float(u_xlati44);
					            u_xlat44 = u_xlat7.x / u_xlat6.y;
					            u_xlat7.y = u_xlat6.z * u_xlat44;
					            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat40) + u_xlat5.xyz;
					            u_xlat5.xyz = vec3(u_xlat44) * u_xlat5.xyz;
					            u_xlat0.x = (-u_xlat40) + u_xlat41;
					            u_xlat0.x = u_xlat44 * u_xlat0.x;
					            u_xlat13.x = trunc(_RayStepSize);
					            u_xlat5.xyw = u_xlat13.xxx * u_xlat5.xyz;
					            u_xlat41 = u_xlat13.x * u_xlat0.x;
					            u_xlat6.x = u_xlat6.x * u_xlat7.x;
					            u_xlat19 = (-_LayerThickness) + 100000.0;
					            u_xlatb19 = u_xlat0.z>=u_xlat19;
					            u_xlatb32 = 100000.0>=u_xlat0.z;
					            u_xlatb19 = u_xlatb32 && u_xlatb19;
					            u_xlat9 = u_xlat8.z;
					            u_xlat22 = u_xlat40;
					            u_xlat32.x = float(-1.0);
					            u_xlat32.y = float(-1.0);
					            u_xlat10.xy = u_xlat30.xy;
					            u_xlati33 = 0;
					            u_xlati46 = int(u_xlatb19);
					            u_xlat11.y = u_xlat0.z;
					            u_xlati47 = int(u_xlatb19);
					            while(true){
					                u_xlat35.x = u_xlat7.x * u_xlat10.x;
					                u_xlatb35.x = u_xlat6.x>=u_xlat35.x;
					                u_xlatb48 = u_xlati33<_MaxSteps;
					                u_xlatb35.x = u_xlatb48 && u_xlatb35.x;
					                u_xlati48 = ~(u_xlati47);
					                u_xlati35 = u_xlatb35.x ? u_xlati48 : int(0);
					                if(u_xlati35 == 0) {break;}
					                u_xlat35.x = u_xlat5.w * 0.5 + u_xlat9;
					                u_xlat48 = u_xlat41 * 0.5 + u_xlat22;
					                u_xlat11.x = u_xlat35.x / u_xlat48;
					                u_xlatb35.x = u_xlat11.x<u_xlat11.y;
					                u_xlat35.xy = (u_xlatb35.x) ? u_xlat11.xy : u_xlat11.yx;
					                u_xlat32.xy = (bool(u_xlatb42)) ? u_xlat10.yx : u_xlat10.xy;
					                u_xlat36.xy = u_xlat4.xy * u_xlat32.xy;
					                u_xlat10_12 = textureLod(_CameraDepthTexture, u_xlat36.xy, 0.0);
					                u_xlat36.x = _ZBufferParams.z * u_xlat10_12.x + _ZBufferParams.w;
					                u_xlat36.x = float(1.0) / u_xlat36.x;
					                u_xlati35 = int(((-u_xlat36.x)>=u_xlat35.x) ? 0xFFFFFFFFu : uint(0));
					                u_xlat36.x = (-u_xlat36.x) + (-_LayerThickness);
					                u_xlatb48 = u_xlat35.y>=u_xlat36.x;
					                u_xlati46 = u_xlatb48 ? u_xlati35 : int(0);
					                u_xlati47 = (u_xlatb39) ? u_xlati46 : u_xlati35;
					                u_xlat10.xy = u_xlat7.xy * u_xlat13.xx + u_xlat10.xy;
					                u_xlat9 = u_xlat5.z * u_xlat13.x + u_xlat9;
					                u_xlat22 = u_xlat0.x * u_xlat13.x + u_xlat22;
					                u_xlati33 = u_xlati33 + 1;
					                u_xlat11.y = u_xlat11.x;
					            }
					            u_xlat4.z = (-u_xlat5.z) * u_xlat13.x + u_xlat9;
					            u_xlat0.x = (-u_xlat0.x) * u_xlat13.x + u_xlat22;
					            u_xlat13.x = float(u_xlati33);
					            u_xlat4.xy = u_xlat5.xy * u_xlat13.xx + u_xlat8.xy;
					            u_xlat0.x = float(1.0) / u_xlat0.x;
					            u_xlat5.xy = u_xlat32.xy / _ScreenSize.xy;
					            u_xlat0.xzw = u_xlat4.xyz * u_xlat0.xxx + (-u_xlat1.xyz);
					            u_xlat5.z = dot(u_xlat0.xzw, u_xlat3.xyz);
					            if(u_xlati46 != 0) {
					                u_xlat0.x = u_xlat13.x + u_xlat13.x;
					                u_xlat13.x = float(_MaxSteps);
					                u_xlat0.x = u_xlat0.x / u_xlat13.x;
					                u_xlat0.x = u_xlat0.x + -1.0;
					                u_xlat0.x = max(u_xlat0.x, 0.0);
					                u_xlat0.x = (-u_xlat0.x) + 1.0;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat13.x = (-u_xlat5.z) + _MaxRayTraceDistance;
					                u_xlat13.x = u_xlat13.x / _FadeDistance;
					                u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
					                u_xlat0.x = u_xlat13.x * u_xlat0.x;
					                u_xlat13.x = dot(u_xlat3.xyz, u_xlat2.xyz);
					                u_xlat13.x = log2(abs(u_xlat13.x));
					                u_xlat13.x = u_xlat13.x * _FresnelFadePower;
					                u_xlat13.x = exp2(u_xlat13.x);
					                u_xlat26 = (-_FresnelFade) + 1.0;
					                u_xlat39 = (-u_xlat13.x) + 1.0;
					                u_xlat13.x = u_xlat26 * u_xlat39 + u_xlat13.x;
					                u_xlat13.x = max(u_xlat13.x, 0.0);
					                u_xlat0.x = u_xlat13.x * u_xlat0.x;
					                u_xlatb13 = 0<_TreatBackfaceHitAsMiss;
					                if(u_xlatb13){
					                    u_xlat10_1 = textureLod(_CameraGBufferTexture2, u_xlat5.xy, 0.0);
					                    u_xlat16_13.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					                    u_xlat1.xyz = u_xlat3.yyy * hlslcc_mtx4x4_CameraToWorldMatrix[1].xyz;
					                    u_xlat1.xyz = hlslcc_mtx4x4_CameraToWorldMatrix[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
					                    u_xlat1.xyz = hlslcc_mtx4x4_CameraToWorldMatrix[2].xyz * u_xlat3.zzz + u_xlat1.xyz;
					                    u_xlat13.x = dot(u_xlat16_13.xyz, u_xlat1.xyz);
					                    u_xlatb13 = 0.0<u_xlat13.x;
					                    u_xlat0.x = (u_xlatb13) ? 0.0 : u_xlat0.x;
					                }
					            } else {
					                u_xlat0.x = 0.0;
					            }
					            u_xlat13.xy = (-u_xlat5.xy) + vec2(1.0, 1.0);
					            u_xlat13.x = min(u_xlat13.y, u_xlat13.x);
					            u_xlat26 = min(u_xlat5.x, u_xlat5.x);
					            u_xlat13.x = min(u_xlat26, u_xlat13.x);
					            u_xlat26 = _ScreenEdgeFading * 0.100000001 + 0.00100000005;
					            u_xlat13.x = u_xlat13.x / u_xlat26;
					            u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
					            u_xlat13.x = log2(u_xlat13.x);
					            u_xlat13.x = u_xlat13.x * 0.200000003;
					            u_xlat13.x = exp2(u_xlat13.x);
					            u_xlat13.x = u_xlat13.x * u_xlat13.x;
					            SV_Target0.w = u_xlat0.x * u_xlat13.x;
					            SV_Target0.xyz = u_xlat5.xyz;
					        } else {
					            SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					        }
					    } else {
					        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 1195
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %22 %1179 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %12 DescriptorSet 12 
					                                                      OpDecorate %12 Binding 12 
					                                                      OpDecorate %16 DescriptorSet 16 
					                                                      OpDecorate %16 Binding 16 
					                                                      OpDecorate vs_TEXCOORD1 Location 22 
					                                                      OpDecorate %31 ArrayStride 31 
					                                                      OpDecorate %32 ArrayStride 32 
					                                                      OpDecorate %33 ArrayStride 33 
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
					                                                      OpMemberDecorate %35 11 Offset 35 
					                                                      OpMemberDecorate %35 12 Offset 35 
					                                                      OpMemberDecorate %35 13 Offset 35 
					                                                      OpMemberDecorate %35 14 Offset 35 
					                                                      OpMemberDecorate %35 15 Offset 35 
					                                                      OpMemberDecorate %35 16 Offset 35 
					                                                      OpMemberDecorate %35 17 Offset 35 
					                                                      OpDecorate %35 Block 
					                                                      OpDecorate %37 DescriptorSet 37 
					                                                      OpDecorate %37 Binding 37 
					                                                      OpDecorate %64 RelaxedPrecision 
					                                                      OpDecorate %64 DescriptorSet 64 
					                                                      OpDecorate %64 Binding 64 
					                                                      OpDecorate %65 RelaxedPrecision 
					                                                      OpDecorate %66 RelaxedPrecision 
					                                                      OpDecorate %66 DescriptorSet 66 
					                                                      OpDecorate %66 Binding 66 
					                                                      OpDecorate %67 RelaxedPrecision 
					                                                      OpDecorate %121 RelaxedPrecision 
					                                                      OpDecorate %122 RelaxedPrecision 
					                                                      OpDecorate %122 DescriptorSet 122 
					                                                      OpDecorate %122 Binding 122 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %124 RelaxedPrecision 
					                                                      OpDecorate %124 DescriptorSet 124 
					                                                      OpDecorate %124 Binding 124 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %129 RelaxedPrecision 
					                                                      OpDecorate %130 RelaxedPrecision 
					                                                      OpDecorate %131 RelaxedPrecision 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %137 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %157 RelaxedPrecision 
					                                                      OpDecorate %158 RelaxedPrecision 
					                                                      OpDecorate %987 RelaxedPrecision 
					                                                      OpDecorate %1013 RelaxedPrecision 
					                                                      OpDecorate %1071 RelaxedPrecision 
					                                                      OpDecorate %1072 RelaxedPrecision 
					                                                      OpDecorate %1077 RelaxedPrecision 
					                                                      OpDecorate %1078 RelaxedPrecision 
					                                                      OpDecorate %1079 RelaxedPrecision 
					                                                      OpDecorate %1080 RelaxedPrecision 
					                                                      OpDecorate %1104 RelaxedPrecision 
					                                                      OpDecorate %1179 Location 1179 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %11 = OpTypePointer UniformConstant %10 
					         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                              %14 = OpTypeSampler 
					                                              %15 = OpTypePointer UniformConstant %14 
					                     UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                              %18 = OpTypeSampledImage %10 
					                                              %20 = OpTypeVector %6 2 
					                                              %21 = OpTypePointer Input %20 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                              %25 = OpTypeInt 32 0 
					                                          u32 %26 = OpConstant 0 
					                                              %28 = OpTypePointer Private %6 
					                                          u32 %30 = OpConstant 4 
					                                              %31 = OpTypeArray %7 %30 
					                                              %32 = OpTypeArray %7 %30 
					                                              %33 = OpTypeArray %7 %30 
					                                              %34 = OpTypeInt 32 1 
					                                              %35 = OpTypeStruct %7 %7 %7 %31 %32 %33 %20 %6 %6 %6 %6 %6 %34 %34 %6 %34 %6 %34 
					                                              %36 = OpTypePointer Uniform %35 
					Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_2; f32; f32; f32; f32; f32; i32; i32; f32; i32; f32; i32;}* %37 = OpVariable Uniform 
					                                          i32 %38 = OpConstant 0 
					                                          u32 %39 = OpConstant 2 
					                                              %40 = OpTypePointer Uniform %6 
					                                          u32 %46 = OpConstant 3 
					                                          f32 %51 = OpConstant 3,674022E-40 
					                                              %56 = OpTypeVector %6 3 
					                                              %57 = OpTypePointer Private %56 
					                               Private f32_3* %58 = OpVariable Private 
					                               Private f32_3* %63 = OpVariable Private 
					         UniformConstant read_only Texture2D* %64 = OpVariable UniformConstant 
					                     UniformConstant sampler* %66 = OpVariable UniformConstant 
					                                              %73 = OpTypeBool 
					                                              %74 = OpTypePointer Private %73 
					                                Private bool* %75 = OpVariable Private 
					                                          f32 %78 = OpConstant 3,674022E-40 
					                                Private bool* %80 = OpVariable Private 
					                                          f32 %83 = OpConstant 3,674022E-40 
					                                          i32 %93 = OpConstant 1 
					                                              %94 = OpTypePointer Uniform %7 
					                                         i32 %103 = OpConstant 2 
					                              Private f32_3* %121 = OpVariable Private 
					        UniformConstant read_only Texture2D* %122 = OpVariable UniformConstant 
					                    UniformConstant sampler* %124 = OpVariable UniformConstant 
					                              Private f32_3* %130 = OpVariable Private 
					                                         f32 %132 = OpConstant 3,674022E-40 
					                                       f32_3 %133 = OpConstantComposite %132 %132 %132 
					                                         f32 %135 = OpConstant 3,674022E-40 
					                                       f32_3 %136 = OpConstantComposite %135 %135 %135 
					                              Private f32_3* %138 = OpVariable Private 
					                                         i32 %141 = OpConstant 3 
					                                Private f32* %162 = OpVariable Private 
					                              Private f32_3* %179 = OpVariable Private 
					                               Private bool* %195 = OpVariable Private 
					                                         i32 %196 = OpConstant 13 
					                                             %197 = OpTypePointer Uniform %34 
					                               Private bool* %201 = OpVariable Private 
					                                         f32 %214 = OpConstant 3,674022E-40 
					                                         f32 %219 = OpConstant 3,674022E-40 
					                               Private bool* %230 = OpVariable Private 
					                                         i32 %231 = OpConstant 17 
					                              Private f32_3* %235 = OpVariable Private 
					                                       f32_2 %236 = OpConstantComposite %51 %51 
					                                         i32 %237 = OpConstant 6 
					                                             %238 = OpTypePointer Uniform %20 
					                                         i32 %246 = OpConstant 8 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                Private f32* %256 = OpVariable Private 
					                                             %266 = OpTypePointer Function %6 
					                              Private f32_4* %275 = OpVariable Private 
					                              Private f32_3* %285 = OpVariable Private 
					                                         i32 %288 = OpConstant 5 
					                              Private f32_4* %314 = OpVariable Private 
					                                             %359 = OpTypePointer Private %20 
					                              Private f32_2* %360 = OpVariable Private 
					                              Private f32_2* %366 = OpVariable Private 
					                              Private f32_3* %372 = OpVariable Private 
					                              Private f32_2* %385 = OpVariable Private 
					                                         f32 %389 = OpConstant 3,674022E-40 
					                                       f32_2 %390 = OpConstantComposite %389 %389 
					                                             %392 = OpTypeVector %73 2 
					                                             %393 = OpTypePointer Private %392 
					                             Private bool_2* %394 = OpVariable Private 
					                                             %399 = OpTypeVector %73 4 
					                             Private bool_2* %402 = OpVariable Private 
					                                         f32 %405 = OpConstant 3,674022E-40 
					                                       f32_4 %406 = OpConstantComposite %405 %405 %405 %405 
					                                         u32 %415 = OpConstant 1 
					                                             %422 = OpTypePointer Function %20 
					                                Private f32* %471 = OpVariable Private 
					                                Private f32* %481 = OpVariable Private 
					                               Private bool* %553 = OpVariable Private 
					                                         f32 %555 = OpConstant 3,674022E-40 
					                                       f32_2 %562 = OpConstantComposite %214 %214 
					                                             %605 = OpTypePointer Function %56 
					                                             %615 = OpTypePointer Private %34 
					                                Private i32* %616 = OpVariable Private 
					                                         u32 %620 = OpConstant 4294967295 
					                                Private i32* %623 = OpVariable Private 
					                                         i32 %674 = OpConstant 7 
					                                Private f32* %697 = OpVariable Private 
					                                         i32 %698 = OpConstant 9 
					                                         f32 %702 = OpConstant 3,674022E-40 
					                               Private bool* %704 = OpVariable Private 
					                               Private bool* %709 = OpVariable Private 
					                                Private f32* %716 = OpVariable Private 
					                                Private f32* %719 = OpVariable Private 
					                              Private f32_2* %723 = OpVariable Private 
					                                Private i32* %725 = OpVariable Private 
					                                Private i32* %726 = OpVariable Private 
					                              Private f32_2* %729 = OpVariable Private 
					                                Private i32* %733 = OpVariable Private 
					                                        bool %741 = OpConstantTrue 
					                              Private f32_2* %742 = OpVariable Private 
					                               Private bool* %755 = OpVariable Private 
					                                         i32 %757 = OpConstant 15 
					                                Private i32* %766 = OpVariable Private 
					                                Private i32* %769 = OpVariable Private 
					                                Private f32* %785 = OpVariable Private 
					                              Private f32_2* %820 = OpVariable Private 
					                                Private f32* %987 = OpVariable Private 
					                                        i32 %1002 = OpConstant 16 
					                                        i32 %1027 = OpConstant 11 
					                               Private f32* %1036 = OpVariable Private 
					                                        i32 %1037 = OpConstant 10 
					                               Private f32* %1042 = OpVariable Private 
					                                        i32 %1064 = OpConstant 12 
					                                        i32 %1083 = OpConstant 4 
					                                        i32 %1144 = OpConstant 14 
					                                        f32 %1147 = OpConstant 3,674022E-40 
					                                        f32 %1165 = OpConstant 3,674022E-40 
					                                            %1178 = OpTypePointer Output %7 
					                              Output f32_4* %1179 = OpVariable Output 
					                                            %1185 = OpTypePointer Output %6 
					                                      f32_4 %1192 = OpConstantComposite %83 %83 %83 %83 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                               Function f32* %267 = OpVariable Function 
					                             Function f32_2* %423 = OpVariable Function 
					                               Function f32* %427 = OpVariable Function 
					                               Function f32* %438 = OpVariable Function 
					                               Function f32* %474 = OpVariable Function 
					                             Function f32_2* %567 = OpVariable Function 
					                             Function f32_2* %596 = OpVariable Function 
					                             Function f32_3* %606 = OpVariable Function 
					                             Function f32_2* %803 = OpVariable Function 
					                             Function f32_2* %812 = OpVariable Function 
					                              Function f32* %1112 = OpVariable Function 
					                          read_only Texture2D %13 = OpLoad %12 
					                                      sampler %17 = OpLoad %16 
					                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                                        f32_2 %23 = OpLoad vs_TEXCOORD1 
					                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
					                                          f32 %27 = OpCompositeExtract %24 0 
					                                 Private f32* %29 = OpAccessChain %9 %26 
					                                                      OpStore %29 %27 
					                                 Uniform f32* %41 = OpAccessChain %37 %38 %39 
					                                          f32 %42 = OpLoad %41 
					                                 Private f32* %43 = OpAccessChain %9 %26 
					                                          f32 %44 = OpLoad %43 
					                                          f32 %45 = OpFMul %42 %44 
					                                 Uniform f32* %47 = OpAccessChain %37 %38 %46 
					                                          f32 %48 = OpLoad %47 
					                                          f32 %49 = OpFAdd %45 %48 
					                                 Private f32* %50 = OpAccessChain %9 %26 
					                                                      OpStore %50 %49 
					                                 Private f32* %52 = OpAccessChain %9 %26 
					                                          f32 %53 = OpLoad %52 
					                                          f32 %54 = OpFDiv %51 %53 
					                                 Private f32* %55 = OpAccessChain %9 %26 
					                                                      OpStore %55 %54 
					                                 Private f32* %59 = OpAccessChain %9 %26 
					                                          f32 %60 = OpLoad %59 
					                                          f32 %61 = OpFNegate %60 
					                                 Private f32* %62 = OpAccessChain %58 %39 
					                                                      OpStore %62 %61 
					                          read_only Texture2D %65 = OpLoad %64 
					                                      sampler %67 = OpLoad %66 
					                   read_only Texture2DSampled %68 = OpSampledImage %65 %67 
					                                        f32_2 %69 = OpLoad vs_TEXCOORD1 
					                                        f32_4 %70 = OpImageSampleImplicitLod %68 %69 
					                                          f32 %71 = OpCompositeExtract %70 3 
					                                 Private f32* %72 = OpAccessChain %63 %26 
					                                                      OpStore %72 %71 
					                                 Private f32* %76 = OpAccessChain %58 %39 
					                                          f32 %77 = OpLoad %76 
					                                         bool %79 = OpFOrdLessThan %77 %78 
					                                                      OpStore %75 %79 
					                                 Private f32* %81 = OpAccessChain %63 %26 
					                                          f32 %82 = OpLoad %81 
					                                         bool %84 = OpFOrdEqual %82 %83 
					                                                      OpStore %80 %84 
					                                         bool %85 = OpLoad %80 
					                                         bool %86 = OpLoad %75 
					                                         bool %87 = OpLogicalOr %85 %86 
					                                                      OpStore %80 %87 
					                                         bool %88 = OpLoad %80 
					                                         bool %89 = OpLogicalNot %88 
					                                                      OpSelectionMerge %91 None 
					                                                      OpBranchConditional %89 %90 %1193 
					                                              %90 = OpLabel 
					                                        f32_2 %92 = OpLoad vs_TEXCOORD1 
					                               Uniform f32_4* %95 = OpAccessChain %37 %93 
					                                        f32_4 %96 = OpLoad %95 
					                                        f32_2 %97 = OpVectorShuffle %96 %96 2 3 
					                                        f32_2 %98 = OpFMul %92 %97 
					                                        f32_3 %99 = OpLoad %63 
					                                       f32_3 %100 = OpVectorShuffle %99 %98 3 4 2 
					                                                      OpStore %63 %100 
					                                       f32_3 %101 = OpLoad %63 
					                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
					                              Uniform f32_4* %104 = OpAccessChain %37 %103 
					                                       f32_4 %105 = OpLoad %104 
					                                       f32_2 %106 = OpVectorShuffle %105 %105 0 1 
					                                       f32_2 %107 = OpFMul %102 %106 
					                              Uniform f32_4* %108 = OpAccessChain %37 %103 
					                                       f32_4 %109 = OpLoad %108 
					                                       f32_2 %110 = OpVectorShuffle %109 %109 2 3 
					                                       f32_2 %111 = OpFAdd %107 %110 
					                                       f32_3 %112 = OpLoad %63 
					                                       f32_3 %113 = OpVectorShuffle %112 %111 3 4 2 
					                                                      OpStore %63 %113 
					                                       f32_3 %114 = OpLoad %58 
					                                       f32_2 %115 = OpVectorShuffle %114 %114 2 2 
					                                       f32_3 %116 = OpLoad %63 
					                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
					                                       f32_2 %118 = OpFMul %115 %117 
					                                       f32_3 %119 = OpLoad %58 
					                                       f32_3 %120 = OpVectorShuffle %119 %118 3 4 2 
					                                                      OpStore %58 %120 
					                         read_only Texture2D %123 = OpLoad %122 
					                                     sampler %125 = OpLoad %124 
					                  read_only Texture2DSampled %126 = OpSampledImage %123 %125 
					                                       f32_2 %127 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %128 = OpImageSampleImplicitLod %126 %127 
					                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
					                                                      OpStore %121 %129 
					                                       f32_3 %131 = OpLoad %121 
					                                       f32_3 %134 = OpFMul %131 %133 
					                                       f32_3 %137 = OpFAdd %134 %136 
					                                                      OpStore %130 %137 
					                                       f32_3 %139 = OpLoad %130 
					                                       f32_3 %140 = OpVectorShuffle %139 %139 1 1 1 
					                              Uniform f32_4* %142 = OpAccessChain %37 %141 %93 
					                                       f32_4 %143 = OpLoad %142 
					                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
					                                       f32_3 %145 = OpFMul %140 %144 
					                                                      OpStore %138 %145 
					                              Uniform f32_4* %146 = OpAccessChain %37 %141 %38 
					                                       f32_4 %147 = OpLoad %146 
					                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
					                                       f32_3 %149 = OpLoad %130 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 0 0 0 
					                                       f32_3 %151 = OpFMul %148 %150 
					                                       f32_3 %152 = OpLoad %138 
					                                       f32_3 %153 = OpFAdd %151 %152 
					                                                      OpStore %138 %153 
					                              Uniform f32_4* %154 = OpAccessChain %37 %141 %103 
					                                       f32_4 %155 = OpLoad %154 
					                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
					                                       f32_3 %157 = OpLoad %130 
					                                       f32_3 %158 = OpVectorShuffle %157 %157 2 2 2 
					                                       f32_3 %159 = OpFMul %156 %158 
					                                       f32_3 %160 = OpLoad %138 
					                                       f32_3 %161 = OpFAdd %159 %160 
					                                                      OpStore %63 %161 
					                                       f32_3 %163 = OpLoad %58 
					                                       f32_3 %164 = OpLoad %58 
					                                         f32 %165 = OpDot %163 %164 
					                                                      OpStore %162 %165 
					                                         f32 %166 = OpLoad %162 
					                                         f32 %167 = OpExtInst %1 32 %166 
					                                                      OpStore %162 %167 
					                                         f32 %168 = OpLoad %162 
					                                       f32_3 %169 = OpCompositeConstruct %168 %168 %168 
					                                       f32_3 %170 = OpLoad %58 
					                                       f32_3 %171 = OpFMul %169 %170 
					                                                      OpStore %138 %171 
					                                       f32_3 %172 = OpLoad %63 
					                                       f32_3 %173 = OpLoad %138 
					                                       f32_3 %174 = OpFNegate %173 
					                                         f32 %175 = OpDot %172 %174 
					                                                      OpStore %162 %175 
					                                         f32 %176 = OpLoad %162 
					                                         f32 %177 = OpLoad %162 
					                                         f32 %178 = OpFAdd %176 %177 
					                                                      OpStore %162 %178 
					                                       f32_3 %180 = OpLoad %63 
					                                         f32 %181 = OpLoad %162 
					                                       f32_3 %182 = OpCompositeConstruct %181 %181 %181 
					                                       f32_3 %183 = OpFMul %180 %182 
					                                       f32_3 %184 = OpLoad %138 
					                                       f32_3 %185 = OpFAdd %183 %184 
					                                                      OpStore %179 %185 
					                                       f32_3 %186 = OpLoad %179 
					                                       f32_3 %187 = OpLoad %179 
					                                         f32 %188 = OpDot %186 %187 
					                                                      OpStore %162 %188 
					                                         f32 %189 = OpLoad %162 
					                                         f32 %190 = OpExtInst %1 32 %189 
					                                                      OpStore %162 %190 
					                                         f32 %191 = OpLoad %162 
					                                       f32_3 %192 = OpCompositeConstruct %191 %191 %191 
					                                       f32_3 %193 = OpLoad %179 
					                                       f32_3 %194 = OpFMul %192 %193 
					                                                      OpStore %179 %194 
					                                Uniform i32* %198 = OpAccessChain %37 %196 
					                                         i32 %199 = OpLoad %198 
					                                        bool %200 = OpIEqual %199 %38 
					                                                      OpStore %195 %200 
					                                Private f32* %202 = OpAccessChain %179 %39 
					                                         f32 %203 = OpLoad %202 
					                                        bool %204 = OpFOrdLessThan %83 %203 
					                                                      OpStore %201 %204 
					                                        bool %205 = OpLoad %195 
					                                        bool %206 = OpLoad %201 
					                                        bool %207 = OpLogicalAnd %205 %206 
					                                                      OpStore %195 %207 
					                                        bool %208 = OpLoad %195 
					                                        bool %209 = OpLogicalNot %208 
					                                                      OpSelectionMerge %211 None 
					                                                      OpBranchConditional %209 %210 %1191 
					                                             %210 = OpLabel 
					                                Private f32* %212 = OpAccessChain %9 %26 
					                                         f32 %213 = OpLoad %212 
					                                         f32 %215 = OpFMul %213 %214 
					                                Private f32* %216 = OpAccessChain %9 %26 
					                                                      OpStore %216 %215 
					                                Private f32* %217 = OpAccessChain %9 %26 
					                                         f32 %218 = OpLoad %217 
					                                         f32 %220 = OpExtInst %1 40 %218 %219 
					                                Private f32* %221 = OpAccessChain %9 %26 
					                                                      OpStore %221 %220 
					                                       f32_3 %222 = OpLoad %63 
					                                       f32_4 %223 = OpLoad %9 
					                                       f32_3 %224 = OpVectorShuffle %223 %223 0 0 0 
					                                       f32_3 %225 = OpFMul %222 %224 
					                                       f32_3 %226 = OpLoad %58 
					                                       f32_3 %227 = OpFAdd %225 %226 
					                                       f32_4 %228 = OpLoad %9 
					                                       f32_4 %229 = OpVectorShuffle %228 %227 4 5 6 3 
					                                                      OpStore %9 %229 
					                                Uniform i32* %232 = OpAccessChain %37 %231 
					                                         i32 %233 = OpLoad %232 
					                                        bool %234 = OpIEqual %233 %93 
					                                                      OpStore %230 %234 
					                              Uniform f32_2* %239 = OpAccessChain %37 %237 
					                                       f32_2 %240 = OpLoad %239 
					                                       f32_2 %241 = OpFDiv %236 %240 
					                                       f32_3 %242 = OpLoad %235 
					                                       f32_3 %243 = OpVectorShuffle %242 %241 3 4 2 
					                                                      OpStore %235 %243 
					                                Private f32* %244 = OpAccessChain %179 %39 
					                                         f32 %245 = OpLoad %244 
					                                Uniform f32* %247 = OpAccessChain %37 %246 
					                                         f32 %248 = OpLoad %247 
					                                         f32 %249 = OpFMul %245 %248 
					                                Private f32* %250 = OpAccessChain %9 %39 
					                                         f32 %251 = OpLoad %250 
					                                         f32 %252 = OpFAdd %249 %251 
					                                                      OpStore %162 %252 
					                                         f32 %254 = OpLoad %162 
					                                        bool %255 = OpFOrdLessThan %253 %254 
					                                                      OpStore %195 %255 
					                                Private f32* %257 = OpAccessChain %9 %39 
					                                         f32 %258 = OpLoad %257 
					                                         f32 %259 = OpFNegate %258 
					                                         f32 %260 = OpFAdd %259 %253 
					                                                      OpStore %256 %260 
					                                         f32 %261 = OpLoad %256 
					                                Private f32* %262 = OpAccessChain %179 %39 
					                                         f32 %263 = OpLoad %262 
					                                         f32 %264 = OpFDiv %261 %263 
					                                                      OpStore %256 %264 
					                                        bool %265 = OpLoad %195 
					                                                      OpSelectionMerge %269 None 
					                                                      OpBranchConditional %265 %268 %271 
					                                             %268 = OpLabel 
					                                         f32 %270 = OpLoad %256 
					                                                      OpStore %267 %270 
					                                                      OpBranch %269 
					                                             %271 = OpLabel 
					                                Uniform f32* %272 = OpAccessChain %37 %246 
					                                         f32 %273 = OpLoad %272 
					                                                      OpStore %267 %273 
					                                                      OpBranch %269 
					                                             %269 = OpLabel 
					                                         f32 %274 = OpLoad %267 
					                                                      OpStore %162 %274 
					                                       f32_3 %276 = OpLoad %179 
					                                         f32 %277 = OpLoad %162 
					                                       f32_3 %278 = OpCompositeConstruct %277 %277 %277 
					                                       f32_3 %279 = OpFMul %276 %278 
					                                       f32_4 %280 = OpLoad %9 
					                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
					                                       f32_3 %282 = OpFAdd %279 %281 
					                                       f32_4 %283 = OpLoad %275 
					                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
					                                                      OpStore %275 %284 
					                                       f32_4 %286 = OpLoad %9 
					                                       f32_3 %287 = OpVectorShuffle %286 %286 1 1 1 
					                              Uniform f32_4* %289 = OpAccessChain %37 %288 %93 
					                                       f32_4 %290 = OpLoad %289 
					                                       f32_3 %291 = OpVectorShuffle %290 %290 0 1 3 
					                                       f32_3 %292 = OpFMul %287 %291 
					                                                      OpStore %285 %292 
					                              Uniform f32_4* %293 = OpAccessChain %37 %288 %38 
					                                       f32_4 %294 = OpLoad %293 
					                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 3 
					                                       f32_4 %296 = OpLoad %9 
					                                       f32_3 %297 = OpVectorShuffle %296 %296 0 0 0 
					                                       f32_3 %298 = OpFMul %295 %297 
					                                       f32_3 %299 = OpLoad %285 
					                                       f32_3 %300 = OpFAdd %298 %299 
					                                                      OpStore %285 %300 
					                              Uniform f32_4* %301 = OpAccessChain %37 %288 %103 
					                                       f32_4 %302 = OpLoad %301 
					                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 3 
					                                       f32_4 %304 = OpLoad %9 
					                                       f32_3 %305 = OpVectorShuffle %304 %304 2 2 2 
					                                       f32_3 %306 = OpFMul %303 %305 
					                                       f32_3 %307 = OpLoad %285 
					                                       f32_3 %308 = OpFAdd %306 %307 
					                                                      OpStore %285 %308 
					                                       f32_3 %309 = OpLoad %285 
					                              Uniform f32_4* %310 = OpAccessChain %37 %288 %141 
					                                       f32_4 %311 = OpLoad %310 
					                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 3 
					                                       f32_3 %313 = OpFAdd %309 %312 
					                                                      OpStore %285 %313 
					                                       f32_4 %315 = OpLoad %275 
					                                       f32_3 %316 = OpVectorShuffle %315 %315 1 1 1 
					                              Uniform f32_4* %317 = OpAccessChain %37 %288 %93 
					                                       f32_4 %318 = OpLoad %317 
					                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 3 
					                                       f32_3 %320 = OpFMul %316 %319 
					                                       f32_4 %321 = OpLoad %314 
					                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
					                                                      OpStore %314 %322 
					                              Uniform f32_4* %323 = OpAccessChain %37 %288 %38 
					                                       f32_4 %324 = OpLoad %323 
					                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 3 
					                                       f32_4 %326 = OpLoad %275 
					                                       f32_3 %327 = OpVectorShuffle %326 %326 0 0 0 
					                                       f32_3 %328 = OpFMul %325 %327 
					                                       f32_4 %329 = OpLoad %314 
					                                       f32_3 %330 = OpVectorShuffle %329 %329 0 1 2 
					                                       f32_3 %331 = OpFAdd %328 %330 
					                                       f32_4 %332 = OpLoad %314 
					                                       f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
					                                                      OpStore %314 %333 
					                              Uniform f32_4* %334 = OpAccessChain %37 %288 %103 
					                                       f32_4 %335 = OpLoad %334 
					                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 3 
					                                       f32_4 %337 = OpLoad %275 
					                                       f32_3 %338 = OpVectorShuffle %337 %337 2 2 2 
					                                       f32_3 %339 = OpFMul %336 %338 
					                                       f32_4 %340 = OpLoad %314 
					                                       f32_3 %341 = OpVectorShuffle %340 %340 0 1 2 
					                                       f32_3 %342 = OpFAdd %339 %341 
					                                       f32_4 %343 = OpLoad %314 
					                                       f32_4 %344 = OpVectorShuffle %343 %342 4 5 6 3 
					                                                      OpStore %314 %344 
					                                       f32_4 %345 = OpLoad %314 
					                                       f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
					                              Uniform f32_4* %347 = OpAccessChain %37 %288 %141 
					                                       f32_4 %348 = OpLoad %347 
					                                       f32_3 %349 = OpVectorShuffle %348 %348 0 1 3 
					                                       f32_3 %350 = OpFAdd %346 %349 
					                                       f32_4 %351 = OpLoad %314 
					                                       f32_4 %352 = OpVectorShuffle %351 %350 4 5 6 3 
					                                                      OpStore %314 %352 
					                                Private f32* %353 = OpAccessChain %285 %39 
					                                         f32 %354 = OpLoad %353 
					                                         f32 %355 = OpFDiv %51 %354 
					                                                      OpStore %162 %355 
					                                Private f32* %356 = OpAccessChain %314 %39 
					                                         f32 %357 = OpLoad %356 
					                                         f32 %358 = OpFDiv %51 %357 
					                                                      OpStore %256 %358 
					                                         f32 %361 = OpLoad %162 
					                                       f32_2 %362 = OpCompositeConstruct %361 %361 
					                                       f32_3 %363 = OpLoad %285 
					                                       f32_2 %364 = OpVectorShuffle %363 %363 1 0 
					                                       f32_2 %365 = OpFMul %362 %364 
					                                                      OpStore %360 %365 
					                                         f32 %367 = OpLoad %256 
					                                       f32_2 %368 = OpCompositeConstruct %367 %367 
					                                       f32_4 %369 = OpLoad %314 
					                                       f32_2 %370 = OpVectorShuffle %369 %369 0 1 
					                                       f32_2 %371 = OpFMul %368 %370 
					                                                      OpStore %366 %371 
					                                       f32_4 %373 = OpLoad %9 
					                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
					                                         f32 %375 = OpLoad %162 
					                                       f32_3 %376 = OpCompositeConstruct %375 %375 %375 
					                                       f32_3 %377 = OpFMul %374 %376 
					                                                      OpStore %372 %377 
					                                         f32 %378 = OpLoad %256 
					                                       f32_3 %379 = OpCompositeConstruct %378 %378 %378 
					                                       f32_4 %380 = OpLoad %275 
					                                       f32_3 %381 = OpVectorShuffle %380 %380 0 1 2 
					                                       f32_3 %382 = OpFMul %379 %381 
					                                       f32_4 %383 = OpLoad %275 
					                                       f32_4 %384 = OpVectorShuffle %383 %382 4 5 6 3 
					                                                      OpStore %275 %384 
					                              Uniform f32_2* %386 = OpAccessChain %37 %237 
					                                       f32_2 %387 = OpLoad %386 
					                                       f32_2 %388 = OpVectorShuffle %387 %387 1 0 
					                                       f32_2 %391 = OpFAdd %388 %390 
					                                                      OpStore %385 %391 
					                                       f32_2 %395 = OpLoad %385 
					                                       f32_4 %396 = OpVectorShuffle %395 %395 0 1 0 0 
					                                       f32_2 %397 = OpLoad %366 
					                                       f32_4 %398 = OpVectorShuffle %397 %397 1 0 1 1 
					                                      bool_4 %400 = OpFOrdLessThan %396 %398 
					                                      bool_2 %401 = OpVectorShuffle %400 %400 0 1 
					                                                      OpStore %394 %401 
					                                       f32_2 %403 = OpLoad %366 
					                                       f32_4 %404 = OpVectorShuffle %403 %403 1 0 1 0 
					                                      bool_4 %407 = OpFOrdLessThan %404 %406 
					                                      bool_2 %408 = OpVectorShuffle %407 %407 0 1 
					                                                      OpStore %402 %408 
					                               Private bool* %409 = OpAccessChain %402 %26 
					                                        bool %410 = OpLoad %409 
					                               Private bool* %411 = OpAccessChain %394 %26 
					                                        bool %412 = OpLoad %411 
					                                        bool %413 = OpLogicalOr %410 %412 
					                               Private bool* %414 = OpAccessChain %402 %26 
					                                                      OpStore %414 %413 
					                               Private bool* %416 = OpAccessChain %402 %415 
					                                        bool %417 = OpLoad %416 
					                               Private bool* %418 = OpAccessChain %394 %415 
					                                        bool %419 = OpLoad %418 
					                                        bool %420 = OpLogicalOr %417 %419 
					                               Private bool* %421 = OpAccessChain %402 %415 
					                                                      OpStore %421 %420 
					                                       f32_2 %424 = OpLoad %385 
					                                                      OpStore %423 %424 
					                               Private bool* %425 = OpAccessChain %394 %26 
					                                        bool %426 = OpLoad %425 
					                                                      OpSelectionMerge %429 None 
					                                                      OpBranchConditional %426 %428 %433 
					                                             %428 = OpLabel 
					                                Private f32* %430 = OpAccessChain %385 %26 
					                                         f32 %431 = OpLoad %430 
					                                         f32 %432 = OpFNegate %431 
					                                                      OpStore %427 %432 
					                                                      OpBranch %429 
					                                             %433 = OpLabel 
					                                                      OpStore %427 %389 
					                                                      OpBranch %429 
					                                             %429 = OpLabel 
					                                         f32 %434 = OpLoad %427 
					                               Function f32* %435 = OpAccessChain %423 %26 
					                                                      OpStore %435 %434 
					                               Private bool* %436 = OpAccessChain %394 %415 
					                                        bool %437 = OpLoad %436 
					                                                      OpSelectionMerge %440 None 
					                                                      OpBranchConditional %437 %439 %444 
					                                             %439 = OpLabel 
					                                Private f32* %441 = OpAccessChain %385 %415 
					                                         f32 %442 = OpLoad %441 
					                                         f32 %443 = OpFNegate %442 
					                                                      OpStore %438 %443 
					                                                      OpBranch %440 
					                                             %444 = OpLabel 
					                                                      OpStore %438 %389 
					                                                      OpBranch %440 
					                                             %440 = OpLabel 
					                                         f32 %445 = OpLoad %438 
					                               Function f32* %446 = OpAccessChain %423 %415 
					                                                      OpStore %446 %445 
					                                       f32_2 %447 = OpLoad %423 
					                                                      OpStore %385 %447 
					                                       f32_4 %448 = OpLoad %314 
					                                       f32_2 %449 = OpVectorShuffle %448 %448 1 0 
					                                         f32 %450 = OpLoad %256 
					                                       f32_2 %451 = OpCompositeConstruct %450 %450 
					                                       f32_2 %452 = OpFMul %449 %451 
					                                       f32_2 %453 = OpLoad %385 
					                                       f32_2 %454 = OpFAdd %452 %453 
					                                                      OpStore %385 %454 
					                                       f32_4 %455 = OpLoad %314 
					                                       f32_2 %456 = OpVectorShuffle %455 %455 1 0 
					                                         f32 %457 = OpLoad %256 
					                                       f32_2 %458 = OpCompositeConstruct %457 %457 
					                                       f32_2 %459 = OpFMul %456 %458 
					                                       f32_2 %460 = OpLoad %360 
					                                       f32_2 %461 = OpFNegate %460 
					                                       f32_2 %462 = OpFAdd %459 %461 
					                                       f32_4 %463 = OpLoad %314 
					                                       f32_4 %464 = OpVectorShuffle %463 %462 4 5 2 3 
					                                                      OpStore %314 %464 
					                                       f32_2 %465 = OpLoad %385 
					                                       f32_4 %466 = OpLoad %314 
					                                       f32_2 %467 = OpVectorShuffle %466 %466 0 1 
					                                       f32_2 %468 = OpFDiv %465 %467 
					                                       f32_4 %469 = OpLoad %314 
					                                       f32_4 %470 = OpVectorShuffle %469 %468 4 5 2 3 
					                                                      OpStore %314 %470 
					                               Private bool* %472 = OpAccessChain %402 %26 
					                                        bool %473 = OpLoad %472 
					                                                      OpSelectionMerge %476 None 
					                                                      OpBranchConditional %473 %475 %479 
					                                             %475 = OpLabel 
					                                Private f32* %477 = OpAccessChain %314 %26 
					                                         f32 %478 = OpLoad %477 
					                                                      OpStore %474 %478 
					                                                      OpBranch %476 
					                                             %479 = OpLabel 
					                                                      OpStore %474 %83 
					                                                      OpBranch %476 
					                                             %476 = OpLabel 
					                                         f32 %480 = OpLoad %474 
					                                                      OpStore %471 %480 
					                                Private f32* %482 = OpAccessChain %314 %415 
					                                         f32 %483 = OpLoad %482 
					                                         f32 %484 = OpLoad %471 
					                                         f32 %485 = OpExtInst %1 40 %483 %484 
					                                                      OpStore %481 %485 
					                               Private bool* %486 = OpAccessChain %402 %415 
					                                        bool %487 = OpLoad %486 
					                                         f32 %488 = OpLoad %481 
					                                         f32 %489 = OpLoad %471 
					                                         f32 %490 = OpSelect %487 %488 %489 
					                                                      OpStore %471 %490 
					                                       f32_3 %491 = OpLoad %285 
					                                       f32_2 %492 = OpVectorShuffle %491 %491 0 1 
					                                         f32 %493 = OpLoad %162 
					                                       f32_2 %494 = OpCompositeConstruct %493 %493 
					                                       f32_2 %495 = OpFMul %492 %494 
					                                       f32_2 %496 = OpLoad %366 
					                                       f32_2 %497 = OpFNegate %496 
					                                       f32_2 %498 = OpFAdd %495 %497 
					                                       f32_4 %499 = OpLoad %314 
					                                       f32_4 %500 = OpVectorShuffle %499 %498 4 5 2 3 
					                                                      OpStore %314 %500 
					                                         f32 %501 = OpLoad %471 
					                                       f32_2 %502 = OpCompositeConstruct %501 %501 
					                                       f32_4 %503 = OpLoad %314 
					                                       f32_2 %504 = OpVectorShuffle %503 %503 0 1 
					                                       f32_2 %505 = OpFMul %502 %504 
					                                       f32_2 %506 = OpLoad %366 
					                                       f32_2 %507 = OpFAdd %505 %506 
					                                                      OpStore %366 %507 
					                                         f32 %508 = OpLoad %162 
					                                         f32 %509 = OpLoad %256 
					                                         f32 %510 = OpFNegate %509 
					                                         f32 %511 = OpFAdd %508 %510 
					                                                      OpStore %481 %511 
					                                         f32 %512 = OpLoad %471 
					                                         f32 %513 = OpLoad %481 
					                                         f32 %514 = OpFMul %512 %513 
					                                         f32 %515 = OpLoad %256 
					                                         f32 %516 = OpFAdd %514 %515 
					                                                      OpStore %256 %516 
					                                       f32_4 %517 = OpLoad %9 
					                                       f32_3 %518 = OpVectorShuffle %517 %517 0 1 2 
					                                         f32 %519 = OpLoad %162 
					                                       f32_3 %520 = OpCompositeConstruct %519 %519 %519 
					                                       f32_3 %521 = OpFMul %518 %520 
					                                       f32_4 %522 = OpLoad %275 
					                                       f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
					                                       f32_3 %524 = OpFNegate %523 
					                                       f32_3 %525 = OpFAdd %521 %524 
					                                       f32_4 %526 = OpLoad %314 
					                                       f32_4 %527 = OpVectorShuffle %526 %525 4 5 6 3 
					                                                      OpStore %314 %527 
					                                         f32 %528 = OpLoad %471 
					                                       f32_3 %529 = OpCompositeConstruct %528 %528 %528 
					                                       f32_4 %530 = OpLoad %314 
					                                       f32_3 %531 = OpVectorShuffle %530 %530 0 1 2 
					                                       f32_3 %532 = OpFMul %529 %531 
					                                       f32_4 %533 = OpLoad %275 
					                                       f32_3 %534 = OpVectorShuffle %533 %533 0 1 2 
					                                       f32_3 %535 = OpFAdd %532 %534 
					                                       f32_4 %536 = OpLoad %275 
					                                       f32_4 %537 = OpVectorShuffle %536 %535 4 5 6 3 
					                                                      OpStore %275 %537 
					                                       f32_3 %538 = OpLoad %285 
					                                       f32_2 %539 = OpVectorShuffle %538 %538 0 1 
					                                         f32 %540 = OpLoad %162 
					                                       f32_2 %541 = OpCompositeConstruct %540 %540 
					                                       f32_2 %542 = OpFMul %539 %541 
					                                       f32_2 %543 = OpLoad %366 
					                                       f32_2 %544 = OpFNegate %543 
					                                       f32_2 %545 = OpFAdd %542 %544 
					                                       f32_4 %546 = OpLoad %314 
					                                       f32_4 %547 = OpVectorShuffle %546 %545 4 5 2 3 
					                                                      OpStore %314 %547 
					                                       f32_4 %548 = OpLoad %314 
					                                       f32_2 %549 = OpVectorShuffle %548 %548 0 1 
					                                       f32_4 %550 = OpLoad %314 
					                                       f32_2 %551 = OpVectorShuffle %550 %550 0 1 
					                                         f32 %552 = OpDot %549 %551 
					                                                      OpStore %471 %552 
					                                         f32 %554 = OpLoad %471 
					                                        bool %556 = OpFOrdLessThan %554 %555 
					                                                      OpStore %553 %556 
					                                       f32_3 %557 = OpLoad %285 
					                                       f32_2 %558 = OpVectorShuffle %557 %557 0 1 
					                                         f32 %559 = OpLoad %162 
					                                       f32_2 %560 = OpCompositeConstruct %559 %559 
					                                       f32_2 %561 = OpFMul %558 %560 
					                                       f32_2 %563 = OpFAdd %561 %562 
					                                       f32_4 %564 = OpLoad %314 
					                                       f32_4 %565 = OpVectorShuffle %564 %563 4 5 2 3 
					                                                      OpStore %314 %565 
					                                        bool %566 = OpLoad %553 
					                                                      OpSelectionMerge %569 None 
					                                                      OpBranchConditional %566 %568 %572 
					                                             %568 = OpLabel 
					                                       f32_4 %570 = OpLoad %314 
					                                       f32_2 %571 = OpVectorShuffle %570 %570 0 1 
					                                                      OpStore %567 %571 
					                                                      OpBranch %569 
					                                             %572 = OpLabel 
					                                       f32_2 %573 = OpLoad %366 
					                                                      OpStore %567 %573 
					                                                      OpBranch %569 
					                                             %569 = OpLabel 
					                                       f32_2 %574 = OpLoad %567 
					                                       f32_4 %575 = OpLoad %314 
					                                       f32_4 %576 = OpVectorShuffle %575 %574 4 5 2 3 
					                                                      OpStore %314 %576 
					                                       f32_3 %577 = OpLoad %285 
					                                       f32_2 %578 = OpVectorShuffle %577 %577 0 1 
					                                       f32_2 %579 = OpFNegate %578 
					                                         f32 %580 = OpLoad %162 
					                                       f32_2 %581 = OpCompositeConstruct %580 %580 
					                                       f32_2 %582 = OpFMul %579 %581 
					                                       f32_4 %583 = OpLoad %314 
					                                       f32_2 %584 = OpVectorShuffle %583 %583 0 1 
					                                       f32_2 %585 = OpFAdd %582 %584 
					                                       f32_4 %586 = OpLoad %314 
					                                       f32_4 %587 = OpVectorShuffle %586 %585 0 1 4 5 
					                                                      OpStore %314 %587 
					                                Private f32* %588 = OpAccessChain %314 %39 
					                                         f32 %589 = OpLoad %588 
					                                         f32 %590 = OpExtInst %1 4 %589 
					                                Private f32* %591 = OpAccessChain %314 %46 
					                                         f32 %592 = OpLoad %591 
					                                         f32 %593 = OpExtInst %1 4 %592 
					                                        bool %594 = OpFOrdLessThan %590 %593 
					                                                      OpStore %553 %594 
					                                        bool %595 = OpLoad %553 
					                                                      OpSelectionMerge %598 None 
					                                                      OpBranchConditional %595 %597 %600 
					                                             %597 = OpLabel 
					                                       f32_2 %599 = OpLoad %360 
					                                                      OpStore %596 %599 
					                                                      OpBranch %598 
					                                             %600 = OpLabel 
					                                       f32_2 %601 = OpLoad %360 
					                                       f32_2 %602 = OpVectorShuffle %601 %601 1 0 
					                                                      OpStore %596 %602 
					                                                      OpBranch %598 
					                                             %598 = OpLabel 
					                                       f32_2 %603 = OpLoad %596 
					                                                      OpStore %360 %603 
					                                        bool %604 = OpLoad %553 
					                                                      OpSelectionMerge %608 None 
					                                                      OpBranchConditional %604 %607 %611 
					                                             %607 = OpLabel 
					                                       f32_4 %609 = OpLoad %314 
					                                       f32_3 %610 = OpVectorShuffle %609 %609 1 3 2 
					                                                      OpStore %606 %610 
					                                                      OpBranch %608 
					                                             %611 = OpLabel 
					                                       f32_4 %612 = OpLoad %314 
					                                       f32_3 %613 = OpVectorShuffle %612 %612 0 2 3 
					                                                      OpStore %606 %613 
					                                                      OpBranch %608 
					                                             %608 = OpLabel 
					                                       f32_3 %614 = OpLoad %606 
					                                                      OpStore %285 %614 
					                                Private f32* %617 = OpAccessChain %285 %415 
					                                         f32 %618 = OpLoad %617 
					                                        bool %619 = OpFOrdLessThan %83 %618 
					                                         u32 %621 = OpSelect %619 %620 %26 
					                                         i32 %622 = OpBitcast %621 
					                                                      OpStore %616 %622 
					                                Private f32* %624 = OpAccessChain %285 %415 
					                                         f32 %625 = OpLoad %624 
					                                        bool %626 = OpFOrdLessThan %625 %83 
					                                         u32 %627 = OpSelect %626 %620 %26 
					                                         i32 %628 = OpBitcast %627 
					                                                      OpStore %623 %628 
					                                         i32 %629 = OpLoad %616 
					                                         i32 %630 = OpSNegate %629 
					                                         i32 %631 = OpLoad %623 
					                                         i32 %632 = OpIAdd %630 %631 
					                                                      OpStore %616 %632 
					                                         i32 %633 = OpLoad %616 
					                                         f32 %634 = OpConvertSToF %633 
					                                Private f32* %635 = OpAccessChain %314 %26 
					                                                      OpStore %635 %634 
					                                Private f32* %636 = OpAccessChain %314 %26 
					                                         f32 %637 = OpLoad %636 
					                                Private f32* %638 = OpAccessChain %285 %415 
					                                         f32 %639 = OpLoad %638 
					                                         f32 %640 = OpFDiv %637 %639 
					                                                      OpStore %481 %640 
					                                Private f32* %641 = OpAccessChain %285 %39 
					                                         f32 %642 = OpLoad %641 
					                                         f32 %643 = OpLoad %481 
					                                         f32 %644 = OpFMul %642 %643 
					                                Private f32* %645 = OpAccessChain %314 %415 
					                                                      OpStore %645 %644 
					                                       f32_4 %646 = OpLoad %9 
					                                       f32_3 %647 = OpVectorShuffle %646 %646 0 1 2 
					                                       f32_3 %648 = OpFNegate %647 
					                                         f32 %649 = OpLoad %162 
					                                       f32_3 %650 = OpCompositeConstruct %649 %649 %649 
					                                       f32_3 %651 = OpFMul %648 %650 
					                                       f32_4 %652 = OpLoad %275 
					                                       f32_3 %653 = OpVectorShuffle %652 %652 0 1 2 
					                                       f32_3 %654 = OpFAdd %651 %653 
					                                       f32_4 %655 = OpLoad %275 
					                                       f32_4 %656 = OpVectorShuffle %655 %654 4 5 6 3 
					                                                      OpStore %275 %656 
					                                         f32 %657 = OpLoad %481 
					                                       f32_3 %658 = OpCompositeConstruct %657 %657 %657 
					                                       f32_4 %659 = OpLoad %275 
					                                       f32_3 %660 = OpVectorShuffle %659 %659 0 1 2 
					                                       f32_3 %661 = OpFMul %658 %660 
					                                       f32_4 %662 = OpLoad %275 
					                                       f32_4 %663 = OpVectorShuffle %662 %661 4 5 6 3 
					                                                      OpStore %275 %663 
					                                         f32 %664 = OpLoad %162 
					                                         f32 %665 = OpFNegate %664 
					                                         f32 %666 = OpLoad %256 
					                                         f32 %667 = OpFAdd %665 %666 
					                                Private f32* %668 = OpAccessChain %9 %26 
					                                                      OpStore %668 %667 
					                                         f32 %669 = OpLoad %481 
					                                Private f32* %670 = OpAccessChain %9 %26 
					                                         f32 %671 = OpLoad %670 
					                                         f32 %672 = OpFMul %669 %671 
					                                Private f32* %673 = OpAccessChain %9 %26 
					                                                      OpStore %673 %672 
					                                Uniform f32* %675 = OpAccessChain %37 %674 
					                                         f32 %676 = OpLoad %675 
					                                         f32 %677 = OpExtInst %1 3 %676 
					                                Private f32* %678 = OpAccessChain %63 %26 
					                                                      OpStore %678 %677 
					                                       f32_3 %679 = OpLoad %63 
					                                       f32_3 %680 = OpVectorShuffle %679 %679 0 0 0 
					                                       f32_4 %681 = OpLoad %275 
					                                       f32_3 %682 = OpVectorShuffle %681 %681 0 1 2 
					                                       f32_3 %683 = OpFMul %680 %682 
					                                       f32_4 %684 = OpLoad %275 
					                                       f32_4 %685 = OpVectorShuffle %684 %683 4 5 2 6 
					                                                      OpStore %275 %685 
					                                Private f32* %686 = OpAccessChain %63 %26 
					                                         f32 %687 = OpLoad %686 
					                                Private f32* %688 = OpAccessChain %9 %26 
					                                         f32 %689 = OpLoad %688 
					                                         f32 %690 = OpFMul %687 %689 
					                                                      OpStore %256 %690 
					                                Private f32* %691 = OpAccessChain %285 %26 
					                                         f32 %692 = OpLoad %691 
					                                Private f32* %693 = OpAccessChain %314 %26 
					                                         f32 %694 = OpLoad %693 
					                                         f32 %695 = OpFMul %692 %694 
					                                Private f32* %696 = OpAccessChain %285 %26 
					                                                      OpStore %696 %695 
					                                Uniform f32* %699 = OpAccessChain %37 %698 
					                                         f32 %700 = OpLoad %699 
					                                         f32 %701 = OpFNegate %700 
					                                         f32 %703 = OpFAdd %701 %702 
					                                                      OpStore %697 %703 
					                                Private f32* %705 = OpAccessChain %9 %39 
					                                         f32 %706 = OpLoad %705 
					                                         f32 %707 = OpLoad %697 
					                                        bool %708 = OpFOrdGreaterThanEqual %706 %707 
					                                                      OpStore %704 %708 
					                                Private f32* %710 = OpAccessChain %9 %39 
					                                         f32 %711 = OpLoad %710 
					                                        bool %712 = OpFOrdGreaterThanEqual %702 %711 
					                                                      OpStore %709 %712 
					                                        bool %713 = OpLoad %709 
					                                        bool %714 = OpLoad %704 
					                                        bool %715 = OpLogicalAnd %713 %714 
					                                                      OpStore %704 %715 
					                                Private f32* %717 = OpAccessChain %372 %39 
					                                         f32 %718 = OpLoad %717 
					                                                      OpStore %716 %718 
					                                         f32 %720 = OpLoad %162 
					                                                      OpStore %719 %720 
					                                Private f32* %721 = OpAccessChain %366 %26 
					                                                      OpStore %721 %135 
					                                Private f32* %722 = OpAccessChain %366 %415 
					                                                      OpStore %722 %135 
					                                       f32_2 %724 = OpLoad %360 
					                                                      OpStore %723 %724 
					                                                      OpStore %725 %38 
					                                        bool %727 = OpLoad %704 
					                                         i32 %728 = OpSelect %727 %93 %38 
					                                                      OpStore %726 %728 
					                                Private f32* %730 = OpAccessChain %9 %39 
					                                         f32 %731 = OpLoad %730 
					                                Private f32* %732 = OpAccessChain %729 %415 
					                                                      OpStore %732 %731 
					                                        bool %734 = OpLoad %704 
					                                         i32 %735 = OpSelect %734 %93 %38 
					                                                      OpStore %733 %735 
					                                                      OpBranch %736 
					                                             %736 = OpLabel 
					                                                      OpLoopMerge %738 %739 None 
					                                                      OpBranch %740 
					                                             %740 = OpLabel 
					                                                      OpBranchConditional %741 %737 %738 
					                                             %737 = OpLabel 
					                                Private f32* %743 = OpAccessChain %314 %26 
					                                         f32 %744 = OpLoad %743 
					                                Private f32* %745 = OpAccessChain %723 %26 
					                                         f32 %746 = OpLoad %745 
					                                         f32 %747 = OpFMul %744 %746 
					                                Private f32* %748 = OpAccessChain %742 %26 
					                                                      OpStore %748 %747 
					                                Private f32* %749 = OpAccessChain %285 %26 
					                                         f32 %750 = OpLoad %749 
					                                Private f32* %751 = OpAccessChain %742 %26 
					                                         f32 %752 = OpLoad %751 
					                                        bool %753 = OpFOrdGreaterThanEqual %750 %752 
					                               Private bool* %754 = OpAccessChain %402 %26 
					                                                      OpStore %754 %753 
					                                         i32 %756 = OpLoad %725 
					                                Uniform i32* %758 = OpAccessChain %37 %757 
					                                         i32 %759 = OpLoad %758 
					                                        bool %760 = OpSLessThan %756 %759 
					                                                      OpStore %755 %760 
					                                        bool %761 = OpLoad %755 
					                               Private bool* %762 = OpAccessChain %402 %26 
					                                        bool %763 = OpLoad %762 
					                                        bool %764 = OpLogicalAnd %761 %763 
					                               Private bool* %765 = OpAccessChain %402 %26 
					                                                      OpStore %765 %764 
					                                         i32 %767 = OpLoad %733 
					                                         i32 %768 = OpNot %767 
					                                                      OpStore %766 %768 
					                               Private bool* %770 = OpAccessChain %402 %26 
					                                        bool %771 = OpLoad %770 
					                                         i32 %772 = OpLoad %766 
					                                         i32 %773 = OpSelect %771 %772 %38 
					                                                      OpStore %769 %773 
					                                         i32 %774 = OpLoad %769 
					                                        bool %775 = OpIEqual %774 %38 
					                                                      OpSelectionMerge %777 None 
					                                                      OpBranchConditional %775 %776 %777 
					                                             %776 = OpLabel 
					                                                      OpBranch %738 
					                                             %777 = OpLabel 
					                                Private f32* %779 = OpAccessChain %275 %46 
					                                         f32 %780 = OpLoad %779 
					                                         f32 %781 = OpFMul %780 %405 
					                                         f32 %782 = OpLoad %716 
					                                         f32 %783 = OpFAdd %781 %782 
					                                Private f32* %784 = OpAccessChain %742 %26 
					                                                      OpStore %784 %783 
					                                         f32 %786 = OpLoad %256 
					                                         f32 %787 = OpFMul %786 %405 
					                                         f32 %788 = OpLoad %719 
					                                         f32 %789 = OpFAdd %787 %788 
					                                                      OpStore %785 %789 
					                                Private f32* %790 = OpAccessChain %742 %26 
					                                         f32 %791 = OpLoad %790 
					                                         f32 %792 = OpLoad %785 
					                                         f32 %793 = OpFDiv %791 %792 
					                                Private f32* %794 = OpAccessChain %729 %26 
					                                                      OpStore %794 %793 
					                                Private f32* %795 = OpAccessChain %729 %26 
					                                         f32 %796 = OpLoad %795 
					                                Private f32* %797 = OpAccessChain %729 %415 
					                                         f32 %798 = OpLoad %797 
					                                        bool %799 = OpFOrdLessThan %796 %798 
					                               Private bool* %800 = OpAccessChain %402 %26 
					                                                      OpStore %800 %799 
					                               Private bool* %801 = OpAccessChain %402 %26 
					                                        bool %802 = OpLoad %801 
					                                                      OpSelectionMerge %805 None 
					                                                      OpBranchConditional %802 %804 %807 
					                                             %804 = OpLabel 
					                                       f32_2 %806 = OpLoad %729 
					                                                      OpStore %803 %806 
					                                                      OpBranch %805 
					                                             %807 = OpLabel 
					                                       f32_2 %808 = OpLoad %729 
					                                       f32_2 %809 = OpVectorShuffle %808 %808 1 0 
					                                                      OpStore %803 %809 
					                                                      OpBranch %805 
					                                             %805 = OpLabel 
					                                       f32_2 %810 = OpLoad %803 
					                                                      OpStore %742 %810 
					                                        bool %811 = OpLoad %553 
					                                                      OpSelectionMerge %814 None 
					                                                      OpBranchConditional %811 %813 %817 
					                                             %813 = OpLabel 
					                                       f32_2 %815 = OpLoad %723 
					                                       f32_2 %816 = OpVectorShuffle %815 %815 1 0 
					                                                      OpStore %812 %816 
					                                                      OpBranch %814 
					                                             %817 = OpLabel 
					                                       f32_2 %818 = OpLoad %723 
					                                                      OpStore %812 %818 
					                                                      OpBranch %814 
					                                             %814 = OpLabel 
					                                       f32_2 %819 = OpLoad %812 
					                                                      OpStore %366 %819 
					                                       f32_3 %821 = OpLoad %235 
					                                       f32_2 %822 = OpVectorShuffle %821 %821 0 1 
					                                       f32_2 %823 = OpLoad %366 
					                                       f32_2 %824 = OpFMul %822 %823 
					                                                      OpStore %820 %824 
					                         read_only Texture2D %825 = OpLoad %12 
					                                     sampler %826 = OpLoad %16 
					                  read_only Texture2DSampled %827 = OpSampledImage %825 %826 
					                                       f32_2 %828 = OpLoad %820 
					                                       f32_4 %829 = OpImageSampleExplicitLod %827 %828 Lod %7 
					                                         f32 %830 = OpCompositeExtract %829 0 
					                                Private f32* %831 = OpAccessChain %820 %26 
					                                                      OpStore %831 %830 
					                                Uniform f32* %832 = OpAccessChain %37 %38 %39 
					                                         f32 %833 = OpLoad %832 
					                                Private f32* %834 = OpAccessChain %820 %26 
					                                         f32 %835 = OpLoad %834 
					                                         f32 %836 = OpFMul %833 %835 
					                                Uniform f32* %837 = OpAccessChain %37 %38 %46 
					                                         f32 %838 = OpLoad %837 
					                                         f32 %839 = OpFAdd %836 %838 
					                                Private f32* %840 = OpAccessChain %820 %26 
					                                                      OpStore %840 %839 
					                                Private f32* %841 = OpAccessChain %820 %26 
					                                         f32 %842 = OpLoad %841 
					                                         f32 %843 = OpFDiv %51 %842 
					                                Private f32* %844 = OpAccessChain %820 %26 
					                                                      OpStore %844 %843 
					                                Private f32* %845 = OpAccessChain %820 %26 
					                                         f32 %846 = OpLoad %845 
					                                         f32 %847 = OpFNegate %846 
					                                Private f32* %848 = OpAccessChain %742 %26 
					                                         f32 %849 = OpLoad %848 
					                                        bool %850 = OpFOrdGreaterThanEqual %847 %849 
					                                         u32 %851 = OpSelect %850 %620 %26 
					                                         i32 %852 = OpBitcast %851 
					                                                      OpStore %769 %852 
					                                Private f32* %853 = OpAccessChain %820 %26 
					                                         f32 %854 = OpLoad %853 
					                                         f32 %855 = OpFNegate %854 
					                                Uniform f32* %856 = OpAccessChain %37 %698 
					                                         f32 %857 = OpLoad %856 
					                                         f32 %858 = OpFNegate %857 
					                                         f32 %859 = OpFAdd %855 %858 
					                                Private f32* %860 = OpAccessChain %820 %26 
					                                                      OpStore %860 %859 
					                                Private f32* %861 = OpAccessChain %742 %415 
					                                         f32 %862 = OpLoad %861 
					                                Private f32* %863 = OpAccessChain %820 %26 
					                                         f32 %864 = OpLoad %863 
					                                        bool %865 = OpFOrdGreaterThanEqual %862 %864 
					                                                      OpStore %755 %865 
					                                        bool %866 = OpLoad %755 
					                                         i32 %867 = OpLoad %769 
					                                         i32 %868 = OpSelect %866 %867 %38 
					                                                      OpStore %726 %868 
					                                        bool %869 = OpLoad %230 
					                                         i32 %870 = OpLoad %726 
					                                         i32 %871 = OpLoad %769 
					                                         i32 %872 = OpSelect %869 %870 %871 
					                                                      OpStore %733 %872 
					                                       f32_4 %873 = OpLoad %314 
					                                       f32_2 %874 = OpVectorShuffle %873 %873 0 1 
					                                       f32_3 %875 = OpLoad %63 
					                                       f32_2 %876 = OpVectorShuffle %875 %875 0 0 
					                                       f32_2 %877 = OpFMul %874 %876 
					                                       f32_2 %878 = OpLoad %723 
					                                       f32_2 %879 = OpFAdd %877 %878 
					                                                      OpStore %723 %879 
					                                Private f32* %880 = OpAccessChain %275 %39 
					                                         f32 %881 = OpLoad %880 
					                                Private f32* %882 = OpAccessChain %63 %26 
					                                         f32 %883 = OpLoad %882 
					                                         f32 %884 = OpFMul %881 %883 
					                                         f32 %885 = OpLoad %716 
					                                         f32 %886 = OpFAdd %884 %885 
					                                                      OpStore %716 %886 
					                                Private f32* %887 = OpAccessChain %9 %26 
					                                         f32 %888 = OpLoad %887 
					                                Private f32* %889 = OpAccessChain %63 %26 
					                                         f32 %890 = OpLoad %889 
					                                         f32 %891 = OpFMul %888 %890 
					                                         f32 %892 = OpLoad %719 
					                                         f32 %893 = OpFAdd %891 %892 
					                                                      OpStore %719 %893 
					                                         i32 %894 = OpLoad %725 
					                                         i32 %895 = OpIAdd %894 %93 
					                                                      OpStore %725 %895 
					                                Private f32* %896 = OpAccessChain %729 %26 
					                                         f32 %897 = OpLoad %896 
					                                Private f32* %898 = OpAccessChain %729 %415 
					                                                      OpStore %898 %897 
					                                                      OpBranch %739 
					                                             %739 = OpLabel 
					                                                      OpBranch %736 
					                                             %738 = OpLabel 
					                                Private f32* %899 = OpAccessChain %275 %39 
					                                         f32 %900 = OpLoad %899 
					                                         f32 %901 = OpFNegate %900 
					                                Private f32* %902 = OpAccessChain %63 %26 
					                                         f32 %903 = OpLoad %902 
					                                         f32 %904 = OpFMul %901 %903 
					                                         f32 %905 = OpLoad %716 
					                                         f32 %906 = OpFAdd %904 %905 
					                                Private f32* %907 = OpAccessChain %235 %39 
					                                                      OpStore %907 %906 
					                                Private f32* %908 = OpAccessChain %9 %26 
					                                         f32 %909 = OpLoad %908 
					                                         f32 %910 = OpFNegate %909 
					                                Private f32* %911 = OpAccessChain %63 %26 
					                                         f32 %912 = OpLoad %911 
					                                         f32 %913 = OpFMul %910 %912 
					                                         f32 %914 = OpLoad %719 
					                                         f32 %915 = OpFAdd %913 %914 
					                                Private f32* %916 = OpAccessChain %9 %26 
					                                                      OpStore %916 %915 
					                                         i32 %917 = OpLoad %725 
					                                         f32 %918 = OpConvertSToF %917 
					                                Private f32* %919 = OpAccessChain %63 %26 
					                                                      OpStore %919 %918 
					                                       f32_4 %920 = OpLoad %275 
					                                       f32_2 %921 = OpVectorShuffle %920 %920 0 1 
					                                       f32_3 %922 = OpLoad %63 
					                                       f32_2 %923 = OpVectorShuffle %922 %922 0 0 
					                                       f32_2 %924 = OpFMul %921 %923 
					                                       f32_3 %925 = OpLoad %372 
					                                       f32_2 %926 = OpVectorShuffle %925 %925 0 1 
					                                       f32_2 %927 = OpFAdd %924 %926 
					                                       f32_3 %928 = OpLoad %235 
					                                       f32_3 %929 = OpVectorShuffle %928 %927 3 4 2 
					                                                      OpStore %235 %929 
					                                Private f32* %930 = OpAccessChain %9 %26 
					                                         f32 %931 = OpLoad %930 
					                                         f32 %932 = OpFDiv %51 %931 
					                                Private f32* %933 = OpAccessChain %9 %26 
					                                                      OpStore %933 %932 
					                                       f32_2 %934 = OpLoad %366 
					                              Uniform f32_2* %935 = OpAccessChain %37 %237 
					                                       f32_2 %936 = OpLoad %935 
					                                       f32_2 %937 = OpFDiv %934 %936 
					                                       f32_4 %938 = OpLoad %275 
					                                       f32_4 %939 = OpVectorShuffle %938 %937 4 5 2 3 
					                                                      OpStore %275 %939 
					                                       f32_3 %940 = OpLoad %235 
					                                       f32_4 %941 = OpLoad %9 
					                                       f32_3 %942 = OpVectorShuffle %941 %941 0 0 0 
					                                       f32_3 %943 = OpFMul %940 %942 
					                                       f32_3 %944 = OpLoad %58 
					                                       f32_3 %945 = OpFNegate %944 
					                                       f32_3 %946 = OpFAdd %943 %945 
					                                       f32_4 %947 = OpLoad %9 
					                                       f32_4 %948 = OpVectorShuffle %947 %946 4 1 5 6 
					                                                      OpStore %9 %948 
					                                       f32_4 %949 = OpLoad %9 
					                                       f32_3 %950 = OpVectorShuffle %949 %949 0 2 3 
					                                       f32_3 %951 = OpLoad %179 
					                                         f32 %952 = OpDot %950 %951 
					                                Private f32* %953 = OpAccessChain %275 %39 
					                                                      OpStore %953 %952 
					                                         i32 %954 = OpLoad %726 
					                                        bool %955 = OpINotEqual %954 %38 
					                                                      OpSelectionMerge %957 None 
					                                                      OpBranchConditional %955 %956 %1120 
					                                             %956 = OpLabel 
					                                Private f32* %958 = OpAccessChain %63 %26 
					                                         f32 %959 = OpLoad %958 
					                                Private f32* %960 = OpAccessChain %63 %26 
					                                         f32 %961 = OpLoad %960 
					                                         f32 %962 = OpFAdd %959 %961 
					                                Private f32* %963 = OpAccessChain %9 %26 
					                                                      OpStore %963 %962 
					                                Uniform i32* %964 = OpAccessChain %37 %757 
					                                         i32 %965 = OpLoad %964 
					                                         f32 %966 = OpConvertSToF %965 
					                                Private f32* %967 = OpAccessChain %63 %26 
					                                                      OpStore %967 %966 
					                                Private f32* %968 = OpAccessChain %9 %26 
					                                         f32 %969 = OpLoad %968 
					                                Private f32* %970 = OpAccessChain %63 %26 
					                                         f32 %971 = OpLoad %970 
					                                         f32 %972 = OpFDiv %969 %971 
					                                Private f32* %973 = OpAccessChain %9 %26 
					                                                      OpStore %973 %972 
					                                Private f32* %974 = OpAccessChain %9 %26 
					                                         f32 %975 = OpLoad %974 
					                                         f32 %976 = OpFAdd %975 %135 
					                                Private f32* %977 = OpAccessChain %9 %26 
					                                                      OpStore %977 %976 
					                                Private f32* %978 = OpAccessChain %9 %26 
					                                         f32 %979 = OpLoad %978 
					                                         f32 %980 = OpExtInst %1 40 %979 %83 
					                                Private f32* %981 = OpAccessChain %9 %26 
					                                                      OpStore %981 %980 
					                                Private f32* %982 = OpAccessChain %9 %26 
					                                         f32 %983 = OpLoad %982 
					                                         f32 %984 = OpFNegate %983 
					                                         f32 %985 = OpFAdd %984 %51 
					                                Private f32* %986 = OpAccessChain %9 %26 
					                                                      OpStore %986 %985 
					                                Private f32* %988 = OpAccessChain %9 %26 
					                                         f32 %989 = OpLoad %988 
					                                Private f32* %990 = OpAccessChain %9 %26 
					                                         f32 %991 = OpLoad %990 
					                                         f32 %992 = OpFMul %989 %991 
					                                                      OpStore %987 %992 
					                                Private f32* %993 = OpAccessChain %275 %39 
					                                         f32 %994 = OpLoad %993 
					                                         f32 %995 = OpFNegate %994 
					                                Uniform f32* %996 = OpAccessChain %37 %246 
					                                         f32 %997 = OpLoad %996 
					                                         f32 %998 = OpFAdd %995 %997 
					                                Private f32* %999 = OpAccessChain %9 %26 
					                                                      OpStore %999 %998 
					                               Private f32* %1000 = OpAccessChain %9 %26 
					                                        f32 %1001 = OpLoad %1000 
					                               Uniform f32* %1003 = OpAccessChain %37 %1002 
					                                        f32 %1004 = OpLoad %1003 
					                                        f32 %1005 = OpFDiv %1001 %1004 
					                               Private f32* %1006 = OpAccessChain %9 %26 
					                                                      OpStore %1006 %1005 
					                               Private f32* %1007 = OpAccessChain %9 %26 
					                                        f32 %1008 = OpLoad %1007 
					                                        f32 %1009 = OpExtInst %1 43 %1008 %83 %51 
					                               Private f32* %1010 = OpAccessChain %9 %26 
					                                                      OpStore %1010 %1009 
					                               Private f32* %1011 = OpAccessChain %9 %26 
					                                        f32 %1012 = OpLoad %1011 
					                                        f32 %1013 = OpLoad %987 
					                                        f32 %1014 = OpFMul %1012 %1013 
					                               Private f32* %1015 = OpAccessChain %9 %26 
					                                                      OpStore %1015 %1014 
					                                      f32_3 %1016 = OpLoad %179 
					                                      f32_3 %1017 = OpLoad %138 
					                                        f32 %1018 = OpDot %1016 %1017 
					                               Private f32* %1019 = OpAccessChain %63 %26 
					                                                      OpStore %1019 %1018 
					                               Private f32* %1020 = OpAccessChain %63 %26 
					                                        f32 %1021 = OpLoad %1020 
					                                        f32 %1022 = OpExtInst %1 4 %1021 
					                                        f32 %1023 = OpExtInst %1 30 %1022 
					                               Private f32* %1024 = OpAccessChain %63 %26 
					                                                      OpStore %1024 %1023 
					                               Private f32* %1025 = OpAccessChain %63 %26 
					                                        f32 %1026 = OpLoad %1025 
					                               Uniform f32* %1028 = OpAccessChain %37 %1027 
					                                        f32 %1029 = OpLoad %1028 
					                                        f32 %1030 = OpFMul %1026 %1029 
					                               Private f32* %1031 = OpAccessChain %63 %26 
					                                                      OpStore %1031 %1030 
					                               Private f32* %1032 = OpAccessChain %63 %26 
					                                        f32 %1033 = OpLoad %1032 
					                                        f32 %1034 = OpExtInst %1 29 %1033 
					                               Private f32* %1035 = OpAccessChain %63 %26 
					                                                      OpStore %1035 %1034 
					                               Uniform f32* %1038 = OpAccessChain %37 %1037 
					                                        f32 %1039 = OpLoad %1038 
					                                        f32 %1040 = OpFNegate %1039 
					                                        f32 %1041 = OpFAdd %1040 %51 
					                                                      OpStore %1036 %1041 
					                               Private f32* %1043 = OpAccessChain %63 %26 
					                                        f32 %1044 = OpLoad %1043 
					                                        f32 %1045 = OpFNegate %1044 
					                                        f32 %1046 = OpFAdd %1045 %51 
					                                                      OpStore %1042 %1046 
					                                        f32 %1047 = OpLoad %1036 
					                                        f32 %1048 = OpLoad %1042 
					                                        f32 %1049 = OpFMul %1047 %1048 
					                               Private f32* %1050 = OpAccessChain %63 %26 
					                                        f32 %1051 = OpLoad %1050 
					                                        f32 %1052 = OpFAdd %1049 %1051 
					                               Private f32* %1053 = OpAccessChain %63 %26 
					                                                      OpStore %1053 %1052 
					                               Private f32* %1054 = OpAccessChain %63 %26 
					                                        f32 %1055 = OpLoad %1054 
					                                        f32 %1056 = OpExtInst %1 40 %1055 %83 
					                               Private f32* %1057 = OpAccessChain %63 %26 
					                                                      OpStore %1057 %1056 
					                               Private f32* %1058 = OpAccessChain %63 %26 
					                                        f32 %1059 = OpLoad %1058 
					                               Private f32* %1060 = OpAccessChain %9 %26 
					                                        f32 %1061 = OpLoad %1060 
					                                        f32 %1062 = OpFMul %1059 %1061 
					                               Private f32* %1063 = OpAccessChain %9 %26 
					                                                      OpStore %1063 %1062 
					                               Uniform i32* %1065 = OpAccessChain %37 %1064 
					                                        i32 %1066 = OpLoad %1065 
					                                       bool %1067 = OpSLessThan %38 %1066 
					                                                      OpStore %80 %1067 
					                                       bool %1068 = OpLoad %80 
					                                                      OpSelectionMerge %1070 None 
					                                                      OpBranchConditional %1068 %1069 %1070 
					                                            %1069 = OpLabel 
					                        read_only Texture2D %1071 = OpLoad %122 
					                                    sampler %1072 = OpLoad %124 
					                 read_only Texture2DSampled %1073 = OpSampledImage %1071 %1072 
					                                      f32_4 %1074 = OpLoad %275 
					                                      f32_2 %1075 = OpVectorShuffle %1074 %1074 0 1 
					                                      f32_4 %1076 = OpImageSampleExplicitLod %1073 %1075 Lod %7 
					                                      f32_3 %1077 = OpVectorShuffle %1076 %1076 0 1 2 
					                                                      OpStore %121 %1077 
					                                      f32_3 %1078 = OpLoad %121 
					                                      f32_3 %1079 = OpFMul %1078 %133 
					                                      f32_3 %1080 = OpFAdd %1079 %136 
					                                                      OpStore %130 %1080 
					                                      f32_3 %1081 = OpLoad %179 
					                                      f32_3 %1082 = OpVectorShuffle %1081 %1081 1 1 1 
					                             Uniform f32_4* %1084 = OpAccessChain %37 %1083 %93 
					                                      f32_4 %1085 = OpLoad %1084 
					                                      f32_3 %1086 = OpVectorShuffle %1085 %1085 0 1 2 
					                                      f32_3 %1087 = OpFMul %1082 %1086 
					                                                      OpStore %58 %1087 
					                             Uniform f32_4* %1088 = OpAccessChain %37 %1083 %38 
					                                      f32_4 %1089 = OpLoad %1088 
					                                      f32_3 %1090 = OpVectorShuffle %1089 %1089 0 1 2 
					                                      f32_3 %1091 = OpLoad %179 
					                                      f32_3 %1092 = OpVectorShuffle %1091 %1091 0 0 0 
					                                      f32_3 %1093 = OpFMul %1090 %1092 
					                                      f32_3 %1094 = OpLoad %58 
					                                      f32_3 %1095 = OpFAdd %1093 %1094 
					                                                      OpStore %58 %1095 
					                             Uniform f32_4* %1096 = OpAccessChain %37 %1083 %103 
					                                      f32_4 %1097 = OpLoad %1096 
					                                      f32_3 %1098 = OpVectorShuffle %1097 %1097 0 1 2 
					                                      f32_3 %1099 = OpLoad %179 
					                                      f32_3 %1100 = OpVectorShuffle %1099 %1099 2 2 2 
					                                      f32_3 %1101 = OpFMul %1098 %1100 
					                                      f32_3 %1102 = OpLoad %58 
					                                      f32_3 %1103 = OpFAdd %1101 %1102 
					                                                      OpStore %58 %1103 
					                                      f32_3 %1104 = OpLoad %130 
					                                      f32_3 %1105 = OpLoad %58 
					                                        f32 %1106 = OpDot %1104 %1105 
					                               Private f32* %1107 = OpAccessChain %63 %26 
					                                                      OpStore %1107 %1106 
					                               Private f32* %1108 = OpAccessChain %63 %26 
					                                        f32 %1109 = OpLoad %1108 
					                                       bool %1110 = OpFOrdLessThan %83 %1109 
					                                                      OpStore %80 %1110 
					                                       bool %1111 = OpLoad %80 
					                                                      OpSelectionMerge %1114 None 
					                                                      OpBranchConditional %1111 %1113 %1115 
					                                            %1113 = OpLabel 
					                                                      OpStore %1112 %83 
					                                                      OpBranch %1114 
					                                            %1115 = OpLabel 
					                               Private f32* %1116 = OpAccessChain %9 %26 
					                                        f32 %1117 = OpLoad %1116 
					                                                      OpStore %1112 %1117 
					                                                      OpBranch %1114 
					                                            %1114 = OpLabel 
					                                        f32 %1118 = OpLoad %1112 
					                               Private f32* %1119 = OpAccessChain %9 %26 
					                                                      OpStore %1119 %1118 
					                                                      OpBranch %1070 
					                                            %1070 = OpLabel 
					                                                      OpBranch %957 
					                                            %1120 = OpLabel 
					                               Private f32* %1121 = OpAccessChain %9 %26 
					                                                      OpStore %1121 %83 
					                                                      OpBranch %957 
					                                             %957 = OpLabel 
					                                      f32_4 %1122 = OpLoad %275 
					                                      f32_2 %1123 = OpVectorShuffle %1122 %1122 0 1 
					                                      f32_2 %1124 = OpFNegate %1123 
					                                      f32_2 %1125 = OpFAdd %1124 %236 
					                                      f32_3 %1126 = OpLoad %63 
					                                      f32_3 %1127 = OpVectorShuffle %1126 %1125 3 4 2 
					                                                      OpStore %63 %1127 
					                               Private f32* %1128 = OpAccessChain %63 %415 
					                                        f32 %1129 = OpLoad %1128 
					                               Private f32* %1130 = OpAccessChain %63 %26 
					                                        f32 %1131 = OpLoad %1130 
					                                        f32 %1132 = OpExtInst %1 37 %1129 %1131 
					                               Private f32* %1133 = OpAccessChain %63 %26 
					                                                      OpStore %1133 %1132 
					                               Private f32* %1134 = OpAccessChain %275 %26 
					                                        f32 %1135 = OpLoad %1134 
					                               Private f32* %1136 = OpAccessChain %275 %26 
					                                        f32 %1137 = OpLoad %1136 
					                                        f32 %1138 = OpExtInst %1 37 %1135 %1137 
					                                                      OpStore %1036 %1138 
					                                        f32 %1139 = OpLoad %1036 
					                               Private f32* %1140 = OpAccessChain %63 %26 
					                                        f32 %1141 = OpLoad %1140 
					                                        f32 %1142 = OpExtInst %1 37 %1139 %1141 
					                               Private f32* %1143 = OpAccessChain %63 %26 
					                                                      OpStore %1143 %1142 
					                               Uniform f32* %1145 = OpAccessChain %37 %1144 
					                                        f32 %1146 = OpLoad %1145 
					                                        f32 %1148 = OpFMul %1146 %1147 
					                                        f32 %1149 = OpFAdd %1148 %219 
					                                                      OpStore %1036 %1149 
					                               Private f32* %1150 = OpAccessChain %63 %26 
					                                        f32 %1151 = OpLoad %1150 
					                                        f32 %1152 = OpLoad %1036 
					                                        f32 %1153 = OpFDiv %1151 %1152 
					                               Private f32* %1154 = OpAccessChain %63 %26 
					                                                      OpStore %1154 %1153 
					                               Private f32* %1155 = OpAccessChain %63 %26 
					                                        f32 %1156 = OpLoad %1155 
					                                        f32 %1157 = OpExtInst %1 43 %1156 %83 %51 
					                               Private f32* %1158 = OpAccessChain %63 %26 
					                                                      OpStore %1158 %1157 
					                               Private f32* %1159 = OpAccessChain %63 %26 
					                                        f32 %1160 = OpLoad %1159 
					                                        f32 %1161 = OpExtInst %1 30 %1160 
					                               Private f32* %1162 = OpAccessChain %63 %26 
					                                                      OpStore %1162 %1161 
					                               Private f32* %1163 = OpAccessChain %63 %26 
					                                        f32 %1164 = OpLoad %1163 
					                                        f32 %1166 = OpFMul %1164 %1165 
					                               Private f32* %1167 = OpAccessChain %63 %26 
					                                                      OpStore %1167 %1166 
					                               Private f32* %1168 = OpAccessChain %63 %26 
					                                        f32 %1169 = OpLoad %1168 
					                                        f32 %1170 = OpExtInst %1 29 %1169 
					                               Private f32* %1171 = OpAccessChain %63 %26 
					                                                      OpStore %1171 %1170 
					                               Private f32* %1172 = OpAccessChain %63 %26 
					                                        f32 %1173 = OpLoad %1172 
					                               Private f32* %1174 = OpAccessChain %63 %26 
					                                        f32 %1175 = OpLoad %1174 
					                                        f32 %1176 = OpFMul %1173 %1175 
					                               Private f32* %1177 = OpAccessChain %63 %26 
					                                                      OpStore %1177 %1176 
					                               Private f32* %1180 = OpAccessChain %9 %26 
					                                        f32 %1181 = OpLoad %1180 
					                               Private f32* %1182 = OpAccessChain %63 %26 
					                                        f32 %1183 = OpLoad %1182 
					                                        f32 %1184 = OpFMul %1181 %1183 
					                                Output f32* %1186 = OpAccessChain %1179 %46 
					                                                      OpStore %1186 %1184 
					                                      f32_4 %1187 = OpLoad %275 
					                                      f32_3 %1188 = OpVectorShuffle %1187 %1187 0 1 2 
					                                      f32_4 %1189 = OpLoad %1179 
					                                      f32_4 %1190 = OpVectorShuffle %1189 %1188 4 5 6 3 
					                                                      OpStore %1179 %1190 
					                                                      OpBranch %211 
					                                            %1191 = OpLabel 
					                                                      OpStore %1179 %1192 
					                                                      OpBranch %211 
					                                             %211 = OpLabel 
					                                                      OpBranch %91 
					                                            %1193 = OpLabel 
					                                                      OpStore %1179 %1192 
					                                                      OpBranch %91 
					                                              %91 = OpLabel 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
						vec4 _ProjInfo;
						mat4x4 _WorldToCameraMatrix;
						mat4x4 _CameraToWorldMatrix;
						mat4x4 _ProjectToPixelMatrix;
						vec2 _ScreenSize;
						vec4 unused_0_8[2];
						float _RayStepSize;
						float _MaxRayTraceDistance;
						float _LayerThickness;
						float _FresnelFade;
						float _FresnelFadePower;
						int _TreatBackfaceHitAsMiss;
						int _AllowBackwardsRays;
						float _ScreenEdgeFading;
						int _MaxSteps;
						vec4 unused_0_18;
						float _FadeDistance;
						int _TraceBehindObjects;
						vec4 unused_0_21[8];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _CameraGBufferTexture1;
					uniform  sampler2D _CameraGBufferTexture2;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat10_0;
					vec3 u_xlat1;
					vec4 u_xlat10_1;
					vec3 u_xlat2;
					vec4 u_xlat10_2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					float u_xlat9;
					bvec2 u_xlatb9;
					vec2 u_xlat10;
					vec2 u_xlat11;
					vec4 u_xlat10_12;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					bool u_xlatb13;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat22;
					float u_xlat26;
					bool u_xlatb26;
					vec2 u_xlat30;
					vec2 u_xlat32;
					bool u_xlatb32;
					vec2 u_xlat33;
					int u_xlati33;
					vec2 u_xlat35;
					int u_xlati35;
					bvec2 u_xlatb35;
					vec2 u_xlat36;
					float u_xlat39;
					bool u_xlatb39;
					float u_xlat40;
					bool u_xlatb40;
					float u_xlat41;
					bool u_xlatb41;
					float u_xlat42;
					bool u_xlatb42;
					float u_xlat44;
					int u_xlati44;
					int u_xlati45;
					int u_xlati46;
					int u_xlati47;
					float u_xlat48;
					int u_xlati48;
					bool u_xlatb48;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0.x = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1.z = (-u_xlat0.x);
					    u_xlat10_2 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    u_xlatb13 = u_xlat1.z<-100.0;
					    u_xlatb26 = u_xlat10_2.w==0.0;
					    u_xlatb13 = u_xlatb26 || u_xlatb13;
					    if(!u_xlatb13){
					        u_xlat13.xy = vs_TEXCOORD1.xy * _MainTex_TexelSize.zw;
					        u_xlat13.xy = u_xlat13.xy * _ProjInfo.xy + _ProjInfo.zw;
					        u_xlat1.xy = u_xlat1.zz * u_xlat13.xy;
					        u_xlat10_2 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					        u_xlat16_13.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat2.xyz = u_xlat16_13.yyy * _WorldToCameraMatrix[1].xyz;
					        u_xlat2.xyz = _WorldToCameraMatrix[0].xyz * u_xlat16_13.xxx + u_xlat2.xyz;
					        u_xlat13.xyz = _WorldToCameraMatrix[2].xyz * u_xlat16_13.zzz + u_xlat2.xyz;
					        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
					        u_xlat40 = inversesqrt(u_xlat40);
					        u_xlat2.xyz = vec3(u_xlat40) * u_xlat1.xyz;
					        u_xlat40 = dot(u_xlat13.xyz, (-u_xlat2.xyz));
					        u_xlat40 = u_xlat40 + u_xlat40;
					        u_xlat3.xyz = u_xlat13.xyz * vec3(u_xlat40) + u_xlat2.xyz;
					        u_xlat40 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat40 = inversesqrt(u_xlat40);
					        u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
					        u_xlatb40 = _AllowBackwardsRays==0;
					        u_xlatb41 = 0.0<u_xlat3.z;
					        u_xlatb40 = u_xlatb40 && u_xlatb41;
					        if(!u_xlatb40){
					            u_xlat0.x = u_xlat0.x * 0.00999999978;
					            u_xlat0.x = max(u_xlat0.x, 0.00100000005);
					            u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat1.xyz;
					            u_xlatb39 = floatBitsToInt(unused_0_18).z==1;
					            u_xlat4.xy = vec2(1.0, 1.0) / _ScreenSize.xy;
					            u_xlat40 = u_xlat3.z * _MaxRayTraceDistance + u_xlat0.z;
					            u_xlatb40 = -0.00999999978<u_xlat40;
					            u_xlat41 = (-u_xlat0.z) + -0.00999999978;
					            u_xlat41 = u_xlat41 / u_xlat3.z;
					            u_xlat40 = (u_xlatb40) ? u_xlat41 : _MaxRayTraceDistance;
					            u_xlat5.xyz = u_xlat3.xyz * vec3(u_xlat40) + u_xlat0.xyz;
					            u_xlat6.xyz = u_xlat0.yyy * _ProjectToPixelMatrix[1].xyw;
					            u_xlat6.xyz = _ProjectToPixelMatrix[0].xyw * u_xlat0.xxx + u_xlat6.xyz;
					            u_xlat6.xyz = _ProjectToPixelMatrix[2].xyw * u_xlat0.zzz + u_xlat6.xyz;
					            u_xlat6.xyz = u_xlat6.xyz + _ProjectToPixelMatrix[3].xyw;
					            u_xlat7.xyz = u_xlat5.yyy * _ProjectToPixelMatrix[1].xyw;
					            u_xlat7.xyz = _ProjectToPixelMatrix[0].xyw * u_xlat5.xxx + u_xlat7.xyz;
					            u_xlat7.xyz = _ProjectToPixelMatrix[2].xyw * u_xlat5.zzz + u_xlat7.xyz;
					            u_xlat7.xyz = u_xlat7.xyz + _ProjectToPixelMatrix[3].xyw;
					            u_xlat40 = float(1.0) / u_xlat6.z;
					            u_xlat41 = float(1.0) / u_xlat7.z;
					            u_xlat30.xy = vec2(u_xlat40) * u_xlat6.yx;
					            u_xlat32.xy = vec2(u_xlat41) * u_xlat7.xy;
					            u_xlat8.xyz = u_xlat0.xyz * vec3(u_xlat40);
					            u_xlat5.xyz = vec3(u_xlat41) * u_xlat5.xyz;
					            u_xlat33.xy = _ScreenSize.yx + vec2(-0.5, -0.5);
					            u_xlatb9.xy = lessThan(u_xlat33.xyxx, u_xlat32.yxyy).xy;
					            u_xlatb35.xy = lessThan(u_xlat32.yxyx, vec4(0.5, 0.5, 0.5, 0.5)).xy;
					            u_xlatb35.x = u_xlatb35.x || u_xlatb9.x;
					            u_xlatb35.y = u_xlatb35.y || u_xlatb9.y;
					            {
					                vec2 hlslcc_movcTemp = u_xlat33;
					                hlslcc_movcTemp.x = (u_xlatb9.x) ? (-u_xlat33.x) : float(-0.5);
					                hlslcc_movcTemp.y = (u_xlatb9.y) ? (-u_xlat33.y) : float(-0.5);
					                u_xlat33 = hlslcc_movcTemp;
					            }
					            u_xlat33.xy = u_xlat7.yx * vec2(u_xlat41) + u_xlat33.xy;
					            u_xlat7.xy = u_xlat7.yx * vec2(u_xlat41) + (-u_xlat30.xy);
					            u_xlat7.xy = u_xlat33.xy / u_xlat7.xy;
					            u_xlat42 = u_xlatb35.x ? u_xlat7.x : float(0.0);
					            u_xlat44 = max(u_xlat7.y, u_xlat42);
					            u_xlat42 = (u_xlatb35.y) ? u_xlat44 : u_xlat42;
					            u_xlat7.xy = u_xlat6.xy * vec2(u_xlat40) + (-u_xlat32.xy);
					            u_xlat32.xy = vec2(u_xlat42) * u_xlat7.xy + u_xlat32.xy;
					            u_xlat44 = u_xlat40 + (-u_xlat41);
					            u_xlat41 = u_xlat42 * u_xlat44 + u_xlat41;
					            u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat40) + (-u_xlat5.xyz);
					            u_xlat5.xyz = vec3(u_xlat42) * u_xlat7.xyz + u_xlat5.xyz;
					            u_xlat7.xy = u_xlat6.xy * vec2(u_xlat40) + (-u_xlat32.xy);
					            u_xlat42 = dot(u_xlat7.xy, u_xlat7.xy);
					            u_xlatb42 = u_xlat42<9.99999975e-05;
					            u_xlat7.xy = u_xlat6.xy * vec2(u_xlat40) + vec2(0.00999999978, 0.00999999978);
					            u_xlat7.xy = (bool(u_xlatb42)) ? u_xlat7.xy : u_xlat32.xy;
					            u_xlat7.zw = (-u_xlat6.xy) * vec2(u_xlat40) + u_xlat7.xy;
					            u_xlatb42 = abs(u_xlat7.z)<abs(u_xlat7.w);
					            u_xlat30.xy = (bool(u_xlatb42)) ? u_xlat30.xy : u_xlat30.yx;
					            u_xlat6.xyz = (bool(u_xlatb42)) ? u_xlat7.ywz : u_xlat7.xzw;
					            u_xlati44 = int((0.0<u_xlat6.y) ? 0xFFFFFFFFu : uint(0));
					            u_xlati45 = int((u_xlat6.y<0.0) ? 0xFFFFFFFFu : uint(0));
					            u_xlati44 = (-u_xlati44) + u_xlati45;
					            u_xlat7.x = float(u_xlati44);
					            u_xlat44 = u_xlat7.x / u_xlat6.y;
					            u_xlat7.y = u_xlat6.z * u_xlat44;
					            u_xlat5.xyz = (-u_xlat0.xyz) * vec3(u_xlat40) + u_xlat5.xyz;
					            u_xlat5.xyz = vec3(u_xlat44) * u_xlat5.xyz;
					            u_xlat0.x = (-u_xlat40) + u_xlat41;
					            u_xlat0.x = u_xlat44 * u_xlat0.x;
					            u_xlat13.x = trunc(_RayStepSize);
					            u_xlat5.xyw = u_xlat13.xxx * u_xlat5.xyz;
					            u_xlat41 = u_xlat13.x * u_xlat0.x;
					            u_xlat6.x = u_xlat6.x * u_xlat7.x;
					            u_xlat19 = (-_LayerThickness) + 100000.0;
					            u_xlatb19 = u_xlat0.z>=u_xlat19;
					            u_xlatb32 = 100000.0>=u_xlat0.z;
					            u_xlatb19 = u_xlatb32 && u_xlatb19;
					            u_xlat9 = u_xlat8.z;
					            u_xlat22 = u_xlat40;
					            u_xlat32.x = float(-1.0);
					            u_xlat32.y = float(-1.0);
					            u_xlat10.xy = u_xlat30.xy;
					            u_xlati33 = 0;
					            u_xlati46 = int(u_xlatb19);
					            u_xlat11.y = u_xlat0.z;
					            u_xlati47 = int(u_xlatb19);
					            while(true){
					                u_xlat35.x = u_xlat7.x * u_xlat10.x;
					                u_xlatb35.x = u_xlat6.x>=u_xlat35.x;
					                u_xlatb48 = u_xlati33<_MaxSteps;
					                u_xlatb35.x = u_xlatb48 && u_xlatb35.x;
					                u_xlati48 = ~u_xlati47;
					                u_xlati35 = u_xlatb35.x ? u_xlati48 : int(0);
					                if(u_xlati35 == 0) {break;}
					                u_xlat35.x = u_xlat5.w * 0.5 + u_xlat9;
					                u_xlat48 = u_xlat41 * 0.5 + u_xlat22;
					                u_xlat11.x = u_xlat35.x / u_xlat48;
					                u_xlatb35.x = u_xlat11.x<u_xlat11.y;
					                u_xlat35.xy = (u_xlatb35.x) ? u_xlat11.xy : u_xlat11.yx;
					                u_xlat32.xy = (bool(u_xlatb42)) ? u_xlat10.yx : u_xlat10.xy;
					                u_xlat36.xy = u_xlat4.xy * u_xlat32.xy;
					                u_xlat10_12 = textureLod(_CameraDepthTexture, u_xlat36.xy, 0.0);
					                u_xlat36.x = _ZBufferParams.z * u_xlat10_12.x + _ZBufferParams.w;
					                u_xlat36.x = float(1.0) / u_xlat36.x;
					                u_xlati35 = int(((-u_xlat36.x)>=u_xlat35.x) ? 0xFFFFFFFFu : uint(0));
					                u_xlat36.x = (-u_xlat36.x) + (-_LayerThickness);
					                u_xlatb48 = u_xlat35.y>=u_xlat36.x;
					                u_xlati46 = u_xlatb48 ? u_xlati35 : int(0);
					                u_xlati47 = (u_xlatb39) ? u_xlati46 : u_xlati35;
					                u_xlat10.xy = u_xlat7.xy * u_xlat13.xx + u_xlat10.xy;
					                u_xlat9 = u_xlat5.z * u_xlat13.x + u_xlat9;
					                u_xlat22 = u_xlat0.x * u_xlat13.x + u_xlat22;
					                u_xlati33 = u_xlati33 + 1;
					                u_xlat11.y = u_xlat11.x;
					            }
					            u_xlat4.z = (-u_xlat5.z) * u_xlat13.x + u_xlat9;
					            u_xlat0.x = (-u_xlat0.x) * u_xlat13.x + u_xlat22;
					            u_xlat13.x = float(u_xlati33);
					            u_xlat4.xy = u_xlat5.xy * u_xlat13.xx + u_xlat8.xy;
					            u_xlat0.x = float(1.0) / u_xlat0.x;
					            u_xlat5.xy = u_xlat32.xy / _ScreenSize.xy;
					            u_xlat0.xzw = u_xlat4.xyz * u_xlat0.xxx + (-u_xlat1.xyz);
					            u_xlat5.z = dot(u_xlat0.xzw, u_xlat3.xyz);
					            if(u_xlati46 != 0) {
					                u_xlat0.x = u_xlat13.x + u_xlat13.x;
					                u_xlat13.x = float(_MaxSteps);
					                u_xlat0.x = u_xlat0.x / u_xlat13.x;
					                u_xlat0.x = u_xlat0.x + -1.0;
					                u_xlat0.x = max(u_xlat0.x, 0.0);
					                u_xlat0.x = (-u_xlat0.x) + 1.0;
					                u_xlat0.x = u_xlat0.x * u_xlat0.x;
					                u_xlat13.x = (-u_xlat5.z) + _MaxRayTraceDistance;
					                u_xlat13.x = u_xlat13.x / unused_0_18.y;
					                u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
					                u_xlat0.x = u_xlat13.x * u_xlat0.x;
					                u_xlat13.x = dot(u_xlat3.xyz, u_xlat2.xyz);
					                u_xlat13.x = log2(abs(u_xlat13.x));
					                u_xlat13.x = u_xlat13.x * _FresnelFadePower;
					                u_xlat13.x = exp2(u_xlat13.x);
					                u_xlat26 = (-_FresnelFade) + 1.0;
					                u_xlat39 = (-u_xlat13.x) + 1.0;
					                u_xlat13.x = u_xlat26 * u_xlat39 + u_xlat13.x;
					                u_xlat13.x = max(u_xlat13.x, 0.0);
					                u_xlat0.x = u_xlat13.x * u_xlat0.x;
					                u_xlatb13 = 0<_TreatBackfaceHitAsMiss;
					                if(u_xlatb13){
					                    u_xlat10_1 = textureLod(_CameraGBufferTexture2, u_xlat5.xy, 0.0);
					                    u_xlat16_13.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					                    u_xlat1.xyz = u_xlat3.yyy * _CameraToWorldMatrix[1].xyz;
					                    u_xlat1.xyz = _CameraToWorldMatrix[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
					                    u_xlat1.xyz = _CameraToWorldMatrix[2].xyz * u_xlat3.zzz + u_xlat1.xyz;
					                    u_xlat13.x = dot(u_xlat16_13.xyz, u_xlat1.xyz);
					                    u_xlatb13 = 0.0<u_xlat13.x;
					                    u_xlat0.x = (u_xlatb13) ? 0.0 : u_xlat0.x;
					                //ENDIF
					                }
					            } else {
					                u_xlat0.x = 0.0;
					            //ENDIF
					            }
					            u_xlat13.xy = (-u_xlat5.xy) + vec2(1.0, 1.0);
					            u_xlat13.x = min(u_xlat13.y, u_xlat13.x);
					            u_xlat26 = min(u_xlat5.x, u_xlat5.x);
					            u_xlat13.x = min(u_xlat26, u_xlat13.x);
					            u_xlat26 = _ScreenEdgeFading * 0.100000001 + 0.00100000005;
					            u_xlat13.x = u_xlat13.x / u_xlat26;
					            u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
					            u_xlat13.x = log2(u_xlat13.x);
					            u_xlat13.x = u_xlat13.x * 0.200000003;
					            u_xlat13.x = exp2(u_xlat13.x);
					            u_xlat13.x = u_xlat13.x * u_xlat13.x;
					            SV_Target0.w = u_xlat0.x * u_xlat13.x;
					            SV_Target0.xyz = u_xlat5.xyz;
					        } else {
					            SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					        //ENDIF
					        }
					    } else {
					        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    //ENDIF
					    }
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 115347
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _ProjInfo;
					uniform 	vec4 hlslcc_mtx4x4_CameraToWorldMatrix[4];
					uniform 	int _AdditiveReflection;
					uniform 	float _SSRMultiplier;
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					UNITY_LOCATION(2) uniform  sampler2D _CameraGBufferTexture1;
					UNITY_LOCATION(3) uniform  sampler2D _FinalReflectionTexture;
					UNITY_LOCATION(4) uniform  sampler2D _CameraGBufferTexture0;
					UNITY_LOCATION(5) uniform  sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(6) uniform  sampler2D _CameraReflectionsTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					vec3 u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat16_4;
					float u_xlat6;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_TexelSize.zw;
					    u_xlat0.xy = u_xlat0.xy * _ProjInfo.xy + _ProjInfo.zw;
					    u_xlat10_1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat6 = _ZBufferParams.z * u_xlat10_1.x + _ZBufferParams.w;
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat1.z = (-u_xlat6);
					    u_xlat1.xy = u_xlat0.xy * u_xlat1.zz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_CameraToWorldMatrix[1].xyz;
					    u_xlat0.xyw = hlslcc_mtx4x4_CameraToWorldMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = hlslcc_mtx4x4_CameraToWorldMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat10_1 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.x = dot(u_xlat16_1.xyz, (-u_xlat0.xyz));
					    u_xlat0.x = -abs(u_xlat0.x) + 1.0;
					    u_xlat3 = u_xlat0.x * u_xlat0.x;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat10_1 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    u_xlat16_3.x = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_3.x = max(u_xlat10_1.z, u_xlat16_3.x);
					    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
					    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
					    u_xlat16_3.x = u_xlat16_3.x + u_xlat10_1.w;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + u_xlat16_3.xxx;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat16_9 = (-u_xlat10_1.w) + 1.0;
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_9 = max(u_xlat16_9, 0.00200000009);
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_9 + 1.0;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat10_1 = texture(_FinalReflectionTexture, vs_TEXCOORD1.xy).wxyz;
					    u_xlat16_4.xyz = vec3(u_xlat16_9) * u_xlat10_1.yzw;
					    u_xlat16_1.x = u_xlat10_1.x;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
					    u_xlat4.xyz = u_xlat0.xyz * vec3(_SSRMultiplier);
					    u_xlat4.xyz = u_xlat16_1.xxx * u_xlat4.xyz;
					    u_xlat2 = texture(_CameraReflectionsTexture, vs_TEXCOORD1.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_SSRMultiplier) + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (int(_AdditiveReflection) != 0) ? u_xlat4.xyz : u_xlat0.xyz;
					    u_xlat10_1 = texture(_CameraGBufferTexture0, vs_TEXCOORD1.xy);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.www;
					    u_xlat2.w = 0.0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = (-u_xlat2) + u_xlat1;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = (int(_AdditiveReflection) != 0) ? u_xlat1 : u_xlat2;
					    u_xlat0.w = 0.0;
					    SV_Target0 = u_xlat0 + u_xlat1;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 392
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %12 %366 %387 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                      OpDecorate vs_TEXCOORD1 Location 12 
					                                                      OpDecorate %16 ArrayStride 16 
					                                                      OpMemberDecorate %18 0 Offset 18 
					                                                      OpMemberDecorate %18 1 Offset 18 
					                                                      OpMemberDecorate %18 2 Offset 18 
					                                                      OpMemberDecorate %18 3 Offset 18 
					                                                      OpMemberDecorate %18 4 Offset 18 
					                                                      OpMemberDecorate %18 5 Offset 18 
					                                                      OpDecorate %18 Block 
					                                                      OpDecorate %20 DescriptorSet 20 
					                                                      OpDecorate %20 Binding 20 
					                                                      OpDecorate %46 DescriptorSet 46 
					                                                      OpDecorate %46 Binding 46 
					                                                      OpDecorate %50 DescriptorSet 50 
					                                                      OpDecorate %50 Binding 50 
					                                                      OpDecorate %132 RelaxedPrecision 
					                                                      OpDecorate %133 RelaxedPrecision 
					                                                      OpDecorate %133 DescriptorSet 133 
					                                                      OpDecorate %133 Binding 133 
					                                                      OpDecorate %134 RelaxedPrecision 
					                                                      OpDecorate %135 RelaxedPrecision 
					                                                      OpDecorate %135 DescriptorSet 135 
					                                                      OpDecorate %135 Binding 135 
					                                                      OpDecorate %136 RelaxedPrecision 
					                                                      OpDecorate %140 RelaxedPrecision 
					                                                      OpDecorate %144 RelaxedPrecision 
					                                                      OpDecorate %145 RelaxedPrecision 
					                                                      OpDecorate %146 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %152 RelaxedPrecision 
					                                                      OpDecorate %153 RelaxedPrecision 
					                                                      OpDecorate %159 RelaxedPrecision 
					                                                      OpDecorate %166 RelaxedPrecision 
					                                                      OpDecorate %168 RelaxedPrecision 
					                                                      OpDecorate %170 RelaxedPrecision 
					                                                      OpDecorate %171 RelaxedPrecision 
					                                                      OpDecorate %174 RelaxedPrecision 
					                                                      OpDecorate %176 RelaxedPrecision 
					                                                      OpDecorate %177 RelaxedPrecision 
					                                                      OpDecorate %180 RelaxedPrecision 
					                                                      OpDecorate %182 RelaxedPrecision 
					                                                      OpDecorate %183 RelaxedPrecision 
					                                                      OpDecorate %185 RelaxedPrecision 
					                                                      OpDecorate %186 RelaxedPrecision 
					                                                      OpDecorate %186 DescriptorSet 186 
					                                                      OpDecorate %186 Binding 186 
					                                                      OpDecorate %187 RelaxedPrecision 
					                                                      OpDecorate %188 RelaxedPrecision 
					                                                      OpDecorate %188 DescriptorSet 188 
					                                                      OpDecorate %188 Binding 188 
					                                                      OpDecorate %189 RelaxedPrecision 
					                                                      OpDecorate %195 RelaxedPrecision 
					                                                      OpDecorate %197 RelaxedPrecision 
					                                                      OpDecorate %198 RelaxedPrecision 
					                                                      OpDecorate %201 RelaxedPrecision 
					                                                      OpDecorate %203 RelaxedPrecision 
					                                                      OpDecorate %204 RelaxedPrecision 
					                                                      OpDecorate %207 RelaxedPrecision 
					                                                      OpDecorate %208 RelaxedPrecision 
					                                                      OpDecorate %209 RelaxedPrecision 
					                                                      OpDecorate %212 RelaxedPrecision 
					                                                      OpDecorate %213 RelaxedPrecision 
					                                                      OpDecorate %214 RelaxedPrecision 
					                                                      OpDecorate %217 RelaxedPrecision 
					                                                      OpDecorate %219 RelaxedPrecision 
					                                                      OpDecorate %220 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %225 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %233 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %235 RelaxedPrecision 
					                                                      OpDecorate %236 RelaxedPrecision 
					                                                      OpDecorate %237 RelaxedPrecision 
					                                                      OpDecorate %238 RelaxedPrecision 
					                                                      OpDecorate %239 RelaxedPrecision 
					                                                      OpDecorate %240 RelaxedPrecision 
					                                                      OpDecorate %242 RelaxedPrecision 
					                                                      OpDecorate %243 RelaxedPrecision 
					                                                      OpDecorate %244 RelaxedPrecision 
					                                                      OpDecorate %245 RelaxedPrecision 
					                                                      OpDecorate %246 RelaxedPrecision 
					                                                      OpDecorate %247 RelaxedPrecision 
					                                                      OpDecorate %248 RelaxedPrecision 
					                                                      OpDecorate %250 RelaxedPrecision 
					                                                      OpDecorate %251 RelaxedPrecision 
					                                                      OpDecorate %252 RelaxedPrecision 
					                                                      OpDecorate %253 RelaxedPrecision 
					                                                      OpDecorate %254 RelaxedPrecision 
					                                                      OpDecorate %255 RelaxedPrecision 
					                                                      OpDecorate %256 RelaxedPrecision 
					                                                      OpDecorate %257 RelaxedPrecision 
					                                                      OpDecorate %257 DescriptorSet 257 
					                                                      OpDecorate %257 Binding 257 
					                                                      OpDecorate %258 RelaxedPrecision 
					                                                      OpDecorate %259 RelaxedPrecision 
					                                                      OpDecorate %259 DescriptorSet 259 
					                                                      OpDecorate %259 Binding 259 
					                                                      OpDecorate %260 RelaxedPrecision 
					                                                      OpDecorate %264 RelaxedPrecision 
					                                                      OpDecorate %265 RelaxedPrecision 
					                                                      OpDecorate %266 RelaxedPrecision 
					                                                      OpDecorate %267 RelaxedPrecision 
					                                                      OpDecorate %268 RelaxedPrecision 
					                                                      OpDecorate %269 RelaxedPrecision 
					                                                      OpDecorate %270 RelaxedPrecision 
					                                                      OpDecorate %272 RelaxedPrecision 
					                                                      OpDecorate %275 RelaxedPrecision 
					                                                      OpDecorate %276 RelaxedPrecision 
					                                                      OpDecorate %278 RelaxedPrecision 
					                                                      OpDecorate %279 RelaxedPrecision 
					                                                      OpDecorate %280 RelaxedPrecision 
					                                                      OpDecorate %281 RelaxedPrecision 
					                                                      OpDecorate %285 RelaxedPrecision 
					                                                      OpDecorate %286 RelaxedPrecision 
					                                                      OpDecorate %289 RelaxedPrecision 
					                                                      OpDecorate %290 RelaxedPrecision 
					                                                      OpDecorate %297 RelaxedPrecision 
					                                                      OpDecorate %297 DescriptorSet 297 
					                                                      OpDecorate %297 Binding 297 
					                                                      OpDecorate %298 RelaxedPrecision 
					                                                      OpDecorate %299 RelaxedPrecision 
					                                                      OpDecorate %299 DescriptorSet 299 
					                                                      OpDecorate %299 Binding 299 
					                                                      OpDecorate %300 RelaxedPrecision 
					                                                      OpDecorate %308 RelaxedPrecision 
					                                                      OpDecorate %311 RelaxedPrecision 
					                                                      OpDecorate %312 RelaxedPrecision 
					                                                      OpDecorate %317 RelaxedPrecision 
					                                                      OpDecorate %318 RelaxedPrecision 
					                                                      OpDecorate %344 RelaxedPrecision 
					                                                      OpDecorate %345 RelaxedPrecision 
					                                                      OpDecorate %345 DescriptorSet 345 
					                                                      OpDecorate %345 Binding 345 
					                                                      OpDecorate %346 RelaxedPrecision 
					                                                      OpDecorate %347 RelaxedPrecision 
					                                                      OpDecorate %347 DescriptorSet 347 
					                                                      OpDecorate %347 Binding 347 
					                                                      OpDecorate %348 RelaxedPrecision 
					                                                      OpDecorate %352 RelaxedPrecision 
					                                                      OpDecorate %353 RelaxedPrecision 
					                                                      OpDecorate %361 RelaxedPrecision 
					                                                      OpDecorate %361 DescriptorSet 361 
					                                                      OpDecorate %361 Binding 361 
					                                                      OpDecorate %362 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %363 DescriptorSet 363 
					                                                      OpDecorate %363 Binding 363 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD0 Location 366 
					                                                      OpDecorate %387 Location 387 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypeVector %6 4 
					                                               %8 = OpTypePointer Private %7 
					                                Private f32_4* %9 = OpVariable Private 
					                                              %10 = OpTypeVector %6 2 
					                                              %11 = OpTypePointer Input %10 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                              %14 = OpTypeInt 32 0 
					                                          u32 %15 = OpConstant 4 
					                                              %16 = OpTypeArray %7 %15 
					                                              %17 = OpTypeInt 32 1 
					                                              %18 = OpTypeStruct %7 %7 %7 %16 %17 %6 
					                                              %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; i32; f32;}* %20 = OpVariable Uniform 
					                                          i32 %21 = OpConstant 1 
					                                              %22 = OpTypePointer Uniform %7 
					                                          i32 %31 = OpConstant 2 
					                                              %42 = OpTypePointer Private %6 
					                                 Private f32* %43 = OpVariable Private 
					                                              %44 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %45 = OpTypePointer UniformConstant %44 
					         UniformConstant read_only Texture2D* %46 = OpVariable UniformConstant 
					                                              %48 = OpTypeSampler 
					                                              %49 = OpTypePointer UniformConstant %48 
					                     UniformConstant sampler* %50 = OpVariable UniformConstant 
					                                              %52 = OpTypeSampledImage %44 
					                                          u32 %56 = OpConstant 0 
					                                          i32 %58 = OpConstant 0 
					                                          u32 %59 = OpConstant 2 
					                                              %60 = OpTypePointer Uniform %6 
					                                          u32 %65 = OpConstant 3 
					                                          f32 %69 = OpConstant 3,674022E-40 
					                               Private f32_4* %72 = OpVariable Private 
					                                              %83 = OpTypeVector %6 3 
					                                         i32 %103 = OpConstant 3 
					                              Private f32_4* %132 = OpVariable Private 
					        UniformConstant read_only Texture2D* %133 = OpVariable UniformConstant 
					                    UniformConstant sampler* %135 = OpVariable UniformConstant 
					                                             %143 = OpTypePointer Private %83 
					                              Private f32_3* %144 = OpVariable Private 
					                                         f32 %147 = OpConstant 3,674022E-40 
					                                       f32_3 %148 = OpConstantComposite %147 %147 %147 
					                                         f32 %150 = OpConstant 3,674022E-40 
					                                       f32_3 %151 = OpConstantComposite %150 %150 %150 
					                              Private f32_3* %159 = OpVariable Private 
					                              Private f32_3* %166 = OpVariable Private 
					                              Private f32_4* %185 = OpVariable Private 
					        UniformConstant read_only Texture2D* %186 = OpVariable UniformConstant 
					                    UniformConstant sampler* %188 = OpVariable UniformConstant 
					                                         u32 %193 = OpConstant 1 
					                                         f32 %224 = OpConstant 3,674022E-40 
					                                Private f32* %240 = OpVariable Private 
					                                         f32 %249 = OpConstant 3,674022E-40 
					        UniformConstant read_only Texture2D* %257 = OpVariable UniformConstant 
					                    UniformConstant sampler* %259 = OpVariable UniformConstant 
					                              Private f32_3* %265 = OpVariable Private 
					                                         i32 %282 = OpConstant 5 
					                              Private f32_4* %296 = OpVariable Private 
					        UniformConstant read_only Texture2D* %297 = OpVariable UniformConstant 
					                    UniformConstant sampler* %299 = OpVariable UniformConstant 
					                              Private f32_3* %307 = OpVariable Private 
					                                         i32 %326 = OpConstant 4 
					                                             %327 = OpTypePointer Uniform %17 
					                                             %330 = OpTypeBool 
					                                             %332 = OpTypePointer Function %83 
					                                Private f32* %344 = OpVariable Private 
					        UniformConstant read_only Texture2D* %345 = OpVariable UniformConstant 
					                    UniformConstant sampler* %347 = OpVariable UniformConstant 
					        UniformConstant read_only Texture2D* %361 = OpVariable UniformConstant 
					                    UniformConstant sampler* %363 = OpVariable UniformConstant 
					                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
					                              Private f32_4* %369 = OpVariable Private 
					                                       f32_4 %375 = OpConstantComposite %224 %224 %224 %224 
					                                             %382 = OpTypeVector %330 4 
					                                             %386 = OpTypePointer Output %7 
					                               Output f32_4* %387 = OpVariable Output 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                             Function f32_3* %333 = OpVariable Function 
					                                        f32_2 %13 = OpLoad vs_TEXCOORD1 
					                               Uniform f32_4* %23 = OpAccessChain %20 %21 
					                                        f32_4 %24 = OpLoad %23 
					                                        f32_2 %25 = OpVectorShuffle %24 %24 2 3 
					                                        f32_2 %26 = OpFMul %13 %25 
					                                        f32_4 %27 = OpLoad %9 
					                                        f32_4 %28 = OpVectorShuffle %27 %26 4 5 2 3 
					                                                      OpStore %9 %28 
					                                        f32_4 %29 = OpLoad %9 
					                                        f32_2 %30 = OpVectorShuffle %29 %29 0 1 
					                               Uniform f32_4* %32 = OpAccessChain %20 %31 
					                                        f32_4 %33 = OpLoad %32 
					                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
					                                        f32_2 %35 = OpFMul %30 %34 
					                               Uniform f32_4* %36 = OpAccessChain %20 %31 
					                                        f32_4 %37 = OpLoad %36 
					                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
					                                        f32_2 %39 = OpFAdd %35 %38 
					                                        f32_4 %40 = OpLoad %9 
					                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 2 3 
					                                                      OpStore %9 %41 
					                          read_only Texture2D %47 = OpLoad %46 
					                                      sampler %51 = OpLoad %50 
					                   read_only Texture2DSampled %53 = OpSampledImage %47 %51 
					                                        f32_2 %54 = OpLoad vs_TEXCOORD1 
					                                        f32_4 %55 = OpImageSampleImplicitLod %53 %54 
					                                          f32 %57 = OpCompositeExtract %55 0 
					                                                      OpStore %43 %57 
					                                 Uniform f32* %61 = OpAccessChain %20 %58 %59 
					                                          f32 %62 = OpLoad %61 
					                                          f32 %63 = OpLoad %43 
					                                          f32 %64 = OpFMul %62 %63 
					                                 Uniform f32* %66 = OpAccessChain %20 %58 %65 
					                                          f32 %67 = OpLoad %66 
					                                          f32 %68 = OpFAdd %64 %67 
					                                                      OpStore %43 %68 
					                                          f32 %70 = OpLoad %43 
					                                          f32 %71 = OpFDiv %69 %70 
					                                                      OpStore %43 %71 
					                                          f32 %73 = OpLoad %43 
					                                          f32 %74 = OpFNegate %73 
					                                 Private f32* %75 = OpAccessChain %72 %59 
					                                                      OpStore %75 %74 
					                                        f32_4 %76 = OpLoad %9 
					                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
					                                        f32_4 %78 = OpLoad %72 
					                                        f32_2 %79 = OpVectorShuffle %78 %78 2 2 
					                                        f32_2 %80 = OpFMul %77 %79 
					                                        f32_4 %81 = OpLoad %72 
					                                        f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
					                                                      OpStore %72 %82 
					                                        f32_4 %84 = OpLoad %72 
					                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
					                                        f32_4 %86 = OpLoad %72 
					                                        f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
					                                          f32 %88 = OpDot %85 %87 
					                                 Private f32* %89 = OpAccessChain %9 %56 
					                                                      OpStore %89 %88 
					                                 Private f32* %90 = OpAccessChain %9 %56 
					                                          f32 %91 = OpLoad %90 
					                                          f32 %92 = OpExtInst %1 32 %91 
					                                 Private f32* %93 = OpAccessChain %9 %56 
					                                                      OpStore %93 %92 
					                                        f32_4 %94 = OpLoad %9 
					                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
					                                        f32_4 %96 = OpLoad %72 
					                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
					                                        f32_3 %98 = OpFMul %95 %97 
					                                        f32_4 %99 = OpLoad %9 
					                                       f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
					                                                      OpStore %9 %100 
					                                       f32_4 %101 = OpLoad %9 
					                                       f32_3 %102 = OpVectorShuffle %101 %101 1 1 1 
					                              Uniform f32_4* %104 = OpAccessChain %20 %103 %21 
					                                       f32_4 %105 = OpLoad %104 
					                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
					                                       f32_3 %107 = OpFMul %102 %106 
					                                       f32_4 %108 = OpLoad %72 
					                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
					                                                      OpStore %72 %109 
					                              Uniform f32_4* %110 = OpAccessChain %20 %103 %58 
					                                       f32_4 %111 = OpLoad %110 
					                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
					                                       f32_4 %113 = OpLoad %9 
					                                       f32_3 %114 = OpVectorShuffle %113 %113 0 0 0 
					                                       f32_3 %115 = OpFMul %112 %114 
					                                       f32_4 %116 = OpLoad %72 
					                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
					                                       f32_3 %118 = OpFAdd %115 %117 
					                                       f32_4 %119 = OpLoad %9 
					                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 6 
					                                                      OpStore %9 %120 
					                              Uniform f32_4* %121 = OpAccessChain %20 %103 %31 
					                                       f32_4 %122 = OpLoad %121 
					                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
					                                       f32_4 %124 = OpLoad %9 
					                                       f32_3 %125 = OpVectorShuffle %124 %124 2 2 2 
					                                       f32_3 %126 = OpFMul %123 %125 
					                                       f32_4 %127 = OpLoad %9 
					                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 3 
					                                       f32_3 %129 = OpFAdd %126 %128 
					                                       f32_4 %130 = OpLoad %9 
					                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
					                                                      OpStore %9 %131 
					                         read_only Texture2D %134 = OpLoad %133 
					                                     sampler %136 = OpLoad %135 
					                  read_only Texture2DSampled %137 = OpSampledImage %134 %136 
					                                       f32_2 %138 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %139 = OpImageSampleImplicitLod %137 %138 
					                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
					                                       f32_4 %141 = OpLoad %132 
					                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
					                                                      OpStore %132 %142 
					                                       f32_4 %145 = OpLoad %132 
					                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
					                                       f32_3 %149 = OpFMul %146 %148 
					                                       f32_3 %152 = OpFAdd %149 %151 
					                                                      OpStore %144 %152 
					                                       f32_3 %153 = OpLoad %144 
					                                       f32_4 %154 = OpLoad %9 
					                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
					                                       f32_3 %156 = OpFNegate %155 
					                                         f32 %157 = OpDot %153 %156 
					                                Private f32* %158 = OpAccessChain %9 %56 
					                                                      OpStore %158 %157 
					                                Private f32* %160 = OpAccessChain %9 %56 
					                                         f32 %161 = OpLoad %160 
					                                         f32 %162 = OpExtInst %1 4 %161 
					                                         f32 %163 = OpFNegate %162 
					                                         f32 %164 = OpFAdd %163 %69 
					                                Private f32* %165 = OpAccessChain %159 %56 
					                                                      OpStore %165 %164 
					                                Private f32* %167 = OpAccessChain %159 %56 
					                                         f32 %168 = OpLoad %167 
					                                Private f32* %169 = OpAccessChain %159 %56 
					                                         f32 %170 = OpLoad %169 
					                                         f32 %171 = OpFMul %168 %170 
					                                Private f32* %172 = OpAccessChain %166 %56 
					                                                      OpStore %172 %171 
					                                Private f32* %173 = OpAccessChain %166 %56 
					                                         f32 %174 = OpLoad %173 
					                                Private f32* %175 = OpAccessChain %166 %56 
					                                         f32 %176 = OpLoad %175 
					                                         f32 %177 = OpFMul %174 %176 
					                                Private f32* %178 = OpAccessChain %166 %56 
					                                                      OpStore %178 %177 
					                                Private f32* %179 = OpAccessChain %159 %56 
					                                         f32 %180 = OpLoad %179 
					                                Private f32* %181 = OpAccessChain %166 %56 
					                                         f32 %182 = OpLoad %181 
					                                         f32 %183 = OpFMul %180 %182 
					                                Private f32* %184 = OpAccessChain %159 %56 
					                                                      OpStore %184 %183 
					                         read_only Texture2D %187 = OpLoad %186 
					                                     sampler %189 = OpLoad %188 
					                  read_only Texture2DSampled %190 = OpSampledImage %187 %189 
					                                       f32_2 %191 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %192 = OpImageSampleImplicitLod %190 %191 
					                                                      OpStore %185 %192 
					                                Private f32* %194 = OpAccessChain %185 %193 
					                                         f32 %195 = OpLoad %194 
					                                Private f32* %196 = OpAccessChain %185 %56 
					                                         f32 %197 = OpLoad %196 
					                                         f32 %198 = OpExtInst %1 40 %195 %197 
					                                Private f32* %199 = OpAccessChain %166 %56 
					                                                      OpStore %199 %198 
					                                Private f32* %200 = OpAccessChain %185 %59 
					                                         f32 %201 = OpLoad %200 
					                                Private f32* %202 = OpAccessChain %166 %56 
					                                         f32 %203 = OpLoad %202 
					                                         f32 %204 = OpExtInst %1 40 %201 %203 
					                                Private f32* %205 = OpAccessChain %166 %56 
					                                                      OpStore %205 %204 
					                                Private f32* %206 = OpAccessChain %166 %56 
					                                         f32 %207 = OpLoad %206 
					                                         f32 %208 = OpFNegate %207 
					                                         f32 %209 = OpFAdd %208 %69 
					                                Private f32* %210 = OpAccessChain %166 %56 
					                                                      OpStore %210 %209 
					                                Private f32* %211 = OpAccessChain %166 %56 
					                                         f32 %212 = OpLoad %211 
					                                         f32 %213 = OpFNegate %212 
					                                         f32 %214 = OpFAdd %213 %69 
					                                Private f32* %215 = OpAccessChain %166 %56 
					                                                      OpStore %215 %214 
					                                Private f32* %216 = OpAccessChain %185 %65 
					                                         f32 %217 = OpLoad %216 
					                                Private f32* %218 = OpAccessChain %166 %56 
					                                         f32 %219 = OpLoad %218 
					                                         f32 %220 = OpFAdd %217 %219 
					                                Private f32* %221 = OpAccessChain %166 %56 
					                                                      OpStore %221 %220 
					                                Private f32* %222 = OpAccessChain %166 %56 
					                                         f32 %223 = OpLoad %222 
					                                         f32 %225 = OpExtInst %1 43 %223 %224 %69 
					                                Private f32* %226 = OpAccessChain %166 %56 
					                                                      OpStore %226 %225 
					                                       f32_4 %227 = OpLoad %185 
					                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
					                                       f32_3 %229 = OpFNegate %228 
					                                       f32_3 %230 = OpLoad %166 
					                                       f32_3 %231 = OpVectorShuffle %230 %230 0 0 0 
					                                       f32_3 %232 = OpFAdd %229 %231 
					                                                      OpStore %166 %232 
					                                       f32_3 %233 = OpLoad %159 
					                                       f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
					                                       f32_3 %235 = OpLoad %166 
					                                       f32_3 %236 = OpFMul %234 %235 
					                                       f32_4 %237 = OpLoad %185 
					                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
					                                       f32_3 %239 = OpFAdd %236 %238 
					                                                      OpStore %159 %239 
					                                Private f32* %241 = OpAccessChain %185 %65 
					                                         f32 %242 = OpLoad %241 
					                                         f32 %243 = OpFNegate %242 
					                                         f32 %244 = OpFAdd %243 %69 
					                                                      OpStore %240 %244 
					                                         f32 %245 = OpLoad %240 
					                                         f32 %246 = OpLoad %240 
					                                         f32 %247 = OpFMul %245 %246 
					                                                      OpStore %240 %247 
					                                         f32 %248 = OpLoad %240 
					                                         f32 %250 = OpExtInst %1 40 %248 %249 
					                                                      OpStore %240 %250 
					                                         f32 %251 = OpLoad %240 
					                                         f32 %252 = OpLoad %240 
					                                         f32 %253 = OpFMul %251 %252 
					                                         f32 %254 = OpFAdd %253 %69 
					                                                      OpStore %240 %254 
					                                         f32 %255 = OpLoad %240 
					                                         f32 %256 = OpFDiv %69 %255 
					                                                      OpStore %240 %256 
					                         read_only Texture2D %258 = OpLoad %257 
					                                     sampler %260 = OpLoad %259 
					                  read_only Texture2DSampled %261 = OpSampledImage %258 %260 
					                                       f32_2 %262 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %263 = OpImageSampleImplicitLod %261 %262 
					                                       f32_4 %264 = OpVectorShuffle %263 %263 3 0 1 2 
					                                                      OpStore %132 %264 
					                                         f32 %266 = OpLoad %240 
					                                       f32_3 %267 = OpCompositeConstruct %266 %266 %266 
					                                       f32_4 %268 = OpLoad %132 
					                                       f32_3 %269 = OpVectorShuffle %268 %268 1 2 3 
					                                       f32_3 %270 = OpFMul %267 %269 
					                                                      OpStore %265 %270 
					                                Private f32* %271 = OpAccessChain %132 %56 
					                                         f32 %272 = OpLoad %271 
					                                Private f32* %273 = OpAccessChain %144 %56 
					                                                      OpStore %273 %272 
					                                Private f32* %274 = OpAccessChain %144 %56 
					                                         f32 %275 = OpLoad %274 
					                                         f32 %276 = OpExtInst %1 43 %275 %224 %69 
					                                Private f32* %277 = OpAccessChain %144 %56 
					                                                      OpStore %277 %276 
					                                       f32_3 %278 = OpLoad %159 
					                                       f32_3 %279 = OpLoad %265 
					                                       f32_3 %280 = OpFMul %278 %279 
					                                                      OpStore %159 %280 
					                                       f32_3 %281 = OpLoad %159 
					                                Uniform f32* %283 = OpAccessChain %20 %282 
					                                         f32 %284 = OpLoad %283 
					                                       f32_3 %285 = OpCompositeConstruct %284 %284 %284 
					                                       f32_3 %286 = OpFMul %281 %285 
					                                       f32_4 %287 = OpLoad %9 
					                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 6 3 
					                                                      OpStore %9 %288 
					                                       f32_3 %289 = OpLoad %144 
					                                       f32_3 %290 = OpVectorShuffle %289 %289 0 0 0 
					                                       f32_4 %291 = OpLoad %9 
					                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
					                                       f32_3 %293 = OpFMul %290 %292 
					                                       f32_4 %294 = OpLoad %9 
					                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
					                                                      OpStore %9 %295 
					                         read_only Texture2D %298 = OpLoad %297 
					                                     sampler %300 = OpLoad %299 
					                  read_only Texture2DSampled %301 = OpSampledImage %298 %300 
					                                       f32_2 %302 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %303 = OpImageSampleImplicitLod %301 %302 
					                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
					                                       f32_4 %305 = OpLoad %296 
					                                       f32_4 %306 = OpVectorShuffle %305 %304 4 5 6 3 
					                                                      OpStore %296 %306 
					                                       f32_3 %308 = OpLoad %159 
					                                Uniform f32* %309 = OpAccessChain %20 %282 
					                                         f32 %310 = OpLoad %309 
					                                       f32_3 %311 = OpCompositeConstruct %310 %310 %310 
					                                       f32_3 %312 = OpFMul %308 %311 
					                                       f32_4 %313 = OpLoad %296 
					                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
					                                       f32_3 %315 = OpFNegate %314 
					                                       f32_3 %316 = OpFAdd %312 %315 
					                                                      OpStore %307 %316 
					                                       f32_3 %317 = OpLoad %144 
					                                       f32_3 %318 = OpVectorShuffle %317 %317 0 0 0 
					                                       f32_3 %319 = OpLoad %307 
					                                       f32_3 %320 = OpFMul %318 %319 
					                                       f32_4 %321 = OpLoad %296 
					                                       f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
					                                       f32_3 %323 = OpFAdd %320 %322 
					                                       f32_4 %324 = OpLoad %72 
					                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
					                                                      OpStore %72 %325 
					                                Uniform i32* %328 = OpAccessChain %20 %326 
					                                         i32 %329 = OpLoad %328 
					                                        bool %331 = OpINotEqual %329 %58 
					                                                      OpSelectionMerge %335 None 
					                                                      OpBranchConditional %331 %334 %338 
					                                             %334 = OpLabel 
					                                       f32_4 %336 = OpLoad %9 
					                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
					                                                      OpStore %333 %337 
					                                                      OpBranch %335 
					                                             %338 = OpLabel 
					                                       f32_4 %339 = OpLoad %72 
					                                       f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
					                                                      OpStore %333 %340 
					                                                      OpBranch %335 
					                                             %335 = OpLabel 
					                                       f32_3 %341 = OpLoad %333 
					                                       f32_4 %342 = OpLoad %9 
					                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 6 3 
					                                                      OpStore %9 %343 
					                         read_only Texture2D %346 = OpLoad %345 
					                                     sampler %348 = OpLoad %347 
					                  read_only Texture2DSampled %349 = OpSampledImage %346 %348 
					                                       f32_2 %350 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %351 = OpImageSampleImplicitLod %349 %350 
					                                         f32 %352 = OpCompositeExtract %351 3 
					                                                      OpStore %344 %352 
					                                         f32 %353 = OpLoad %344 
					                                       f32_3 %354 = OpCompositeConstruct %353 %353 %353 
					                                       f32_4 %355 = OpLoad %9 
					                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
					                                       f32_3 %357 = OpFMul %354 %356 
					                                       f32_4 %358 = OpLoad %9 
					                                       f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
					                                                      OpStore %9 %359 
					                                Private f32* %360 = OpAccessChain %296 %65 
					                                                      OpStore %360 %224 
					                         read_only Texture2D %362 = OpLoad %361 
					                                     sampler %364 = OpLoad %363 
					                  read_only Texture2DSampled %365 = OpSampledImage %362 %364 
					                                       f32_2 %367 = OpLoad vs_TEXCOORD0 
					                                       f32_4 %368 = OpImageSampleImplicitLod %365 %367 
					                                                      OpStore %72 %368 
					                                       f32_4 %370 = OpLoad %296 
					                                       f32_4 %371 = OpFNegate %370 
					                                       f32_4 %372 = OpLoad %72 
					                                       f32_4 %373 = OpFAdd %371 %372 
					                                                      OpStore %369 %373 
					                                       f32_4 %374 = OpLoad %369 
					                                       f32_4 %376 = OpExtInst %1 40 %374 %375 
					                                                      OpStore %369 %376 
					                                Uniform i32* %377 = OpAccessChain %20 %326 
					                                         i32 %378 = OpLoad %377 
					                                        bool %379 = OpINotEqual %378 %58 
					                                       f32_4 %380 = OpLoad %72 
					                                       f32_4 %381 = OpLoad %369 
					                                      bool_4 %383 = OpCompositeConstruct %379 %379 %379 %379 
					                                       f32_4 %384 = OpSelect %383 %380 %381 
					                                                      OpStore %72 %384 
					                                Private f32* %385 = OpAccessChain %9 %65 
					                                                      OpStore %385 %224 
					                                       f32_4 %388 = OpLoad %9 
					                                       f32_4 %389 = OpLoad %72 
					                                       f32_4 %390 = OpFAdd %388 %389 
					                                                      OpStore %387 %390 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
						vec4 _ProjInfo;
						vec4 unused_0_4[4];
						mat4x4 _CameraToWorldMatrix;
						vec4 unused_0_6[9];
						int _AdditiveReflection;
						vec4 unused_0_8;
						float _SSRMultiplier;
						vec4 unused_0_10[8];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraGBufferTexture1;
					uniform  sampler2D _FinalReflectionTexture;
					uniform  sampler2D _CameraGBufferTexture0;
					uniform  sampler2D _CameraGBufferTexture2;
					uniform  sampler2D _CameraReflectionsTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat2;
					float u_xlat3;
					vec3 u_xlat16_3;
					vec3 u_xlat4;
					vec3 u_xlat16_4;
					float u_xlat6;
					float u_xlat16_9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_TexelSize.zw;
					    u_xlat0.xy = u_xlat0.xy * _ProjInfo.xy + _ProjInfo.zw;
					    u_xlat10_1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat6 = _ZBufferParams.z * u_xlat10_1.x + _ZBufferParams.w;
					    u_xlat6 = float(1.0) / u_xlat6;
					    u_xlat1.z = (-u_xlat6);
					    u_xlat1.xy = u_xlat0.xy * u_xlat1.zz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * _CameraToWorldMatrix[1].xyz;
					    u_xlat0.xyw = _CameraToWorldMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = _CameraToWorldMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat10_1 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					    u_xlat16_1.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat0.x = dot(u_xlat16_1.xyz, (-u_xlat0.xyz));
					    u_xlat0.x = -abs(u_xlat0.x) + 1.0;
					    u_xlat3 = u_xlat0.x * u_xlat0.x;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat0.x = u_xlat0.x * u_xlat3;
					    u_xlat10_1 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    u_xlat16_3.x = max(u_xlat10_1.y, u_xlat10_1.x);
					    u_xlat16_3.x = max(u_xlat10_1.z, u_xlat16_3.x);
					    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
					    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
					    u_xlat16_3.x = u_xlat16_3.x + u_xlat10_1.w;
					    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
					    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + u_xlat16_3.xxx;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_1.xyz;
					    u_xlat16_9 = (-u_xlat10_1.w) + 1.0;
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_9;
					    u_xlat16_9 = max(u_xlat16_9, 0.00200000009);
					    u_xlat16_9 = u_xlat16_9 * u_xlat16_9 + 1.0;
					    u_xlat16_9 = float(1.0) / u_xlat16_9;
					    u_xlat10_1 = texture(_FinalReflectionTexture, vs_TEXCOORD1.xy).wxyz;
					    u_xlat16_4.xyz = vec3(u_xlat16_9) * u_xlat10_1.yzw;
					    u_xlat16_1.x = u_xlat10_1.x;
					    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
					    u_xlat4.xyz = u_xlat0.xyz * vec3(_SSRMultiplier);
					    u_xlat4.xyz = u_xlat16_1.xxx * u_xlat4.xyz;
					    u_xlat2 = texture(_CameraReflectionsTexture, vs_TEXCOORD1.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(_SSRMultiplier) + (-u_xlat2.xyz);
					    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = (int(_AdditiveReflection) != 0) ? u_xlat4.xyz : u_xlat0.xyz;
					    u_xlat10_1 = texture(_CameraGBufferTexture0, vs_TEXCOORD1.xy);
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.www;
					    u_xlat2.w = 0.0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2 = (-u_xlat2) + u_xlat1;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = (int(_AdditiveReflection) != 0) ? u_xlat1 : u_xlat2;
					    u_xlat0.w = 0.0;
					    SV_Target0 = u_xlat0 + u_xlat1;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 194299
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	int _HighlightSuppression;
					uniform 	vec4 _Axis;
					UNITY_LOCATION(0) uniform  sampler2D _NormalAndRoughnessTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					float u_xlat8;
					vec4 u_xlat9;
					vec4 u_xlat10;
					vec3 u_xlat16_10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat12;
					vec3 u_xlat16_12;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec3 u_xlat16_13;
					vec4 u_xlat10_13;
					vec3 u_xlat14;
					vec3 u_xlat16;
					vec3 u_xlat16_16;
					vec3 u_xlat22;
					vec3 u_xlat16_22;
					bool u_xlatb28;
					float u_xlat29;
					float u_xlat16_29;
					float u_xlat30;
					float u_xlat36;
					float u_xlat42;
					float u_xlat43;
					float u_xlat44;
					float u_xlat50;
					void main()
					{
					    u_xlat10_0 = texture(_NormalAndRoughnessTexture, vs_TEXCOORD1.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xy = _MainTex_TexelSize.xy * _Axis.xy;
					    u_xlat2 = u_xlat1.xyxy * vec4(-8.0, -8.0, -6.0, -6.0) + vs_TEXCOORD1.xyxy;
					    u_xlat3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat42 = u_xlat3.w * 0.0524999984;
					    u_xlat10_4 = texture(_NormalAndRoughnessTexture, u_xlat2.xy);
					    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_29 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
					    u_xlat43 = u_xlat42 * u_xlat16_29;
					    u_xlat4.xyz = u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat3.xyz / u_xlat4.xyz;
					    u_xlat3.xyz = (_HighlightSuppression != 0) ? u_xlat4.xyz : u_xlat3.xyz;
					    u_xlat4 = texture(_MainTex, u_xlat2.zw);
					    u_xlat2.x = u_xlat4.w * 0.075000003;
					    u_xlat10_5 = texture(_NormalAndRoughnessTexture, u_xlat2.zw);
					    u_xlat16_16.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_16.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat2.x = u_xlat16_16.x * u_xlat2.x;
					    u_xlat42 = u_xlat42 * u_xlat16_29 + u_xlat2.x;
					    u_xlat16.xyz = u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat16.xyz = u_xlat4.xyz / u_xlat16.xyz;
					    u_xlat4.xyz = (_HighlightSuppression != 0) ? u_xlat16.xyz : u_xlat4.xyz;
					    u_xlat5 = u_xlat1.xyxy * vec4(-4.0, -4.0, -2.0, -2.0) + vs_TEXCOORD1.xyxy;
					    u_xlat6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat29 = u_xlat6.w * 0.109999999;
					    u_xlat10_7 = texture(_NormalAndRoughnessTexture, u_xlat5.xy);
					    u_xlat16_16.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_16.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat30 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat7.xyz = u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat6.xyz / u_xlat7.xyz;
					    u_xlat6.xyz = (_HighlightSuppression != 0) ? u_xlat7.xyz : u_xlat6.xyz;
					    u_xlat7 = texture(_MainTex, u_xlat5.zw);
					    u_xlat29 = u_xlat7.w * 0.150000006;
					    u_xlat10_5 = texture(_NormalAndRoughnessTexture, u_xlat5.zw);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat44 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat5.xyz = u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat5.xyz = u_xlat7.xyz / u_xlat5.xyz;
					    u_xlat7.xyz = (_HighlightSuppression != 0) ? u_xlat5.xyz : u_xlat7.xyz;
					    u_xlat5 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat29 = u_xlat5.w * 0.224999994;
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_16.x = min(u_xlat16_16.x, 1.0);
					    u_xlat8 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat22.xyz = u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat22.xyz = u_xlat5.xyz / u_xlat22.xyz;
					    u_xlat5.xyz = (_HighlightSuppression != 0) ? u_xlat22.xyz : u_xlat5.xyz;
					    u_xlat22.xy = u_xlat1.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat9 = texture(_MainTex, u_xlat22.xy);
					    u_xlat29 = u_xlat9.w * 0.150000006;
					    u_xlat10_10 = texture(_NormalAndRoughnessTexture, u_xlat22.xy);
					    u_xlat16_22.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_22.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat22.x = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat10.xyz = u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = u_xlat9.xyz / u_xlat10.xyz;
					    u_xlat9.xyz = (_HighlightSuppression != 0) ? u_xlat10.xyz : u_xlat9.xyz;
					    u_xlat10 = u_xlat1.xyxy * vec4(4.0, 4.0, 6.0, 6.0) + vs_TEXCOORD1.xyxy;
					    u_xlat11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat29 = u_xlat11.w * 0.109999999;
					    u_xlat10_12 = texture(_NormalAndRoughnessTexture, u_xlat10.xy);
					    u_xlat16_12.xyz = u_xlat10_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_12.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat36 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat12.xyz = u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat12.xyz = u_xlat11.xyz / u_xlat12.xyz;
					    u_xlat11.xyz = (_HighlightSuppression != 0) ? u_xlat12.xyz : u_xlat11.xyz;
					    u_xlat12 = texture(_MainTex, u_xlat10.zw);
					    u_xlat29 = u_xlat12.w * 0.075000003;
					    u_xlat10_10 = texture(_NormalAndRoughnessTexture, u_xlat10.zw);
					    u_xlat16_10.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat50 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat10.xyz = u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = u_xlat12.xyz / u_xlat10.xyz;
					    u_xlat12.xyz = (_HighlightSuppression != 0) ? u_xlat10.xyz : u_xlat12.xyz;
					    u_xlat1.xy = u_xlat1.xy * vec2(8.0, 8.0) + vs_TEXCOORD1.xy;
					    u_xlat10 = texture(_MainTex, u_xlat1.xy);
					    u_xlat29 = u_xlat10.w * 0.0524999984;
					    u_xlat10_13 = texture(_NormalAndRoughnessTexture, u_xlat1.xy);
					    u_xlat16_13.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat16_13.xyz);
					    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
					    u_xlat14.x = u_xlat16_0.x * u_xlat29;
					    u_xlat0.x = u_xlat29 * u_xlat16_0.x + u_xlat42;
					    u_xlat1.xyz = u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat10.xyz / u_xlat1.xyz;
					    u_xlat10.xyz = (_HighlightSuppression != 0) ? u_xlat1.xyz : u_xlat10.xyz;
					    u_xlatb28 = 0.00999999978<u_xlat0.x;
					    if(u_xlatb28){
					        u_xlat13 = u_xlat2.xxxx * u_xlat4;
					        u_xlat1 = u_xlat3 * vec4(u_xlat43) + u_xlat13;
					        u_xlat1 = u_xlat6 * vec4(u_xlat30) + u_xlat1;
					        u_xlat1 = u_xlat7 * vec4(u_xlat44) + u_xlat1;
					        u_xlat1 = u_xlat5 * vec4(u_xlat8) + u_xlat1;
					        u_xlat1 = u_xlat9 * u_xlat22.xxxx + u_xlat1;
					        u_xlat1 = u_xlat11 * vec4(u_xlat36) + u_xlat1;
					        u_xlat1 = u_xlat12 * vec4(u_xlat50) + u_xlat1;
					        u_xlat1 = u_xlat10 * u_xlat14.xxxx + u_xlat1;
					        u_xlat0.x = float(1.0) / u_xlat0.x;
					        u_xlat14.x = max(u_xlat0.x, 2.0);
					        u_xlat14.x = sqrt(u_xlat14.x);
					        u_xlat14.x = u_xlat14.x * u_xlat1.w;
					        SV_Target0.w = min(u_xlat14.x, 1.0);
					        u_xlat14.xyz = u_xlat0.xxx * u_xlat1.xyz;
					        u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat0.xxx + vec3(1.0, 1.0, 1.0);
					        u_xlat1.xyz = u_xlat14.xyz / u_xlat1.xyz;
					        SV_Target0.xyz = (_HighlightSuppression != 0) ? u_xlat1.xyz : u_xlat14.xyz;
					        return;
					    } else {
					        u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
					        u_xlat0.xyz = u_xlat6.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat7.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat9.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat11.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat12.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat10.xyz + u_xlat0.xyz;
					        u_xlat1.xyz = u_xlat0.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.111111112, 0.111111112, 0.111111112) + vec3(1.0, 1.0, 1.0);
					        u_xlat0.xyz = u_xlat1.xyz / u_xlat0.xyz;
					        SV_Target0.xyz = (_HighlightSuppression != 0) ? u_xlat0.xyz : u_xlat1.xyz;
					        SV_Target0.w = 0.0;
					        return;
					    }
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 877
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %773 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpDecorate %9 RelaxedPrecision 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 22 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %27 RelaxedPrecision 
					                                             OpDecorate %28 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpMemberDecorate %38 0 Offset 38 
					                                             OpMemberDecorate %38 1 Offset 38 
					                                             OpMemberDecorate %38 2 Offset 38 
					                                             OpDecorate %38 Block 
					                                             OpDecorate %40 DescriptorSet 40 
					                                             OpDecorate %40 Binding 40 
					                                             OpDecorate %64 RelaxedPrecision 
					                                             OpDecorate %64 DescriptorSet 64 
					                                             OpDecorate %64 Binding 64 
					                                             OpDecorate %65 RelaxedPrecision 
					                                             OpDecorate %66 RelaxedPrecision 
					                                             OpDecorate %66 DescriptorSet 66 
					                                             OpDecorate %66 Binding 66 
					                                             OpDecorate %67 RelaxedPrecision 
					                                             OpDecorate %80 RelaxedPrecision 
					                                             OpDecorate %81 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %87 RelaxedPrecision 
					                                             OpDecorate %88 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %92 RelaxedPrecision 
					                                             OpDecorate %93 RelaxedPrecision 
					                                             OpDecorate %94 RelaxedPrecision 
					                                             OpDecorate %95 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %99 RelaxedPrecision 
					                                             OpDecorate %102 RelaxedPrecision 
					                                             OpDecorate %136 RelaxedPrecision 
					                                             OpDecorate %137 RelaxedPrecision 
					                                             OpDecorate %148 RelaxedPrecision 
					                                             OpDecorate %149 RelaxedPrecision 
					                                             OpDecorate %150 RelaxedPrecision 
					                                             OpDecorate %155 RelaxedPrecision 
					                                             OpDecorate %156 RelaxedPrecision 
					                                             OpDecorate %157 RelaxedPrecision 
					                                             OpDecorate %158 RelaxedPrecision 
					                                             OpDecorate %159 RelaxedPrecision 
					                                             OpDecorate %160 RelaxedPrecision 
					                                             OpDecorate %161 RelaxedPrecision 
					                                             OpDecorate %162 RelaxedPrecision 
					                                             OpDecorate %165 RelaxedPrecision 
					                                             OpDecorate %166 RelaxedPrecision 
					                                             OpDecorate %169 RelaxedPrecision 
					                                             OpDecorate %175 RelaxedPrecision 
					                                             OpDecorate %212 RelaxedPrecision 
					                                             OpDecorate %213 RelaxedPrecision 
					                                             OpDecorate %223 RelaxedPrecision 
					                                             OpDecorate %224 RelaxedPrecision 
					                                             OpDecorate %229 RelaxedPrecision 
					                                             OpDecorate %230 RelaxedPrecision 
					                                             OpDecorate %231 RelaxedPrecision 
					                                             OpDecorate %232 RelaxedPrecision 
					                                             OpDecorate %233 RelaxedPrecision 
					                                             OpDecorate %234 RelaxedPrecision 
					                                             OpDecorate %235 RelaxedPrecision 
					                                             OpDecorate %238 RelaxedPrecision 
					                                             OpDecorate %239 RelaxedPrecision 
					                                             OpDecorate %244 RelaxedPrecision 
					                                             OpDecorate %248 RelaxedPrecision 
					                                             OpDecorate %279 RelaxedPrecision 
					                                             OpDecorate %280 RelaxedPrecision 
					                                             OpDecorate %289 RelaxedPrecision 
					                                             OpDecorate %290 RelaxedPrecision 
					                                             OpDecorate %291 RelaxedPrecision 
					                                             OpDecorate %296 RelaxedPrecision 
					                                             OpDecorate %297 RelaxedPrecision 
					                                             OpDecorate %298 RelaxedPrecision 
					                                             OpDecorate %299 RelaxedPrecision 
					                                             OpDecorate %300 RelaxedPrecision 
					                                             OpDecorate %301 RelaxedPrecision 
					                                             OpDecorate %302 RelaxedPrecision 
					                                             OpDecorate %303 RelaxedPrecision 
					                                             OpDecorate %306 RelaxedPrecision 
					                                             OpDecorate %307 RelaxedPrecision 
					                                             OpDecorate %312 RelaxedPrecision 
					                                             OpDecorate %316 RelaxedPrecision 
					                                             OpDecorate %346 RelaxedPrecision 
					                                             OpDecorate %347 RelaxedPrecision 
					                                             OpDecorate %355 RelaxedPrecision 
					                                             OpDecorate %356 RelaxedPrecision 
					                                             OpDecorate %357 RelaxedPrecision 
					                                             OpDecorate %360 RelaxedPrecision 
					                                             OpDecorate %361 RelaxedPrecision 
					                                             OpDecorate %366 RelaxedPrecision 
					                                             OpDecorate %370 RelaxedPrecision 
					                                             OpDecorate %404 RelaxedPrecision 
					                                             OpDecorate %405 RelaxedPrecision 
					                                             OpDecorate %413 RelaxedPrecision 
					                                             OpDecorate %414 RelaxedPrecision 
					                                             OpDecorate %415 RelaxedPrecision 
					                                             OpDecorate %420 RelaxedPrecision 
					                                             OpDecorate %421 RelaxedPrecision 
					                                             OpDecorate %422 RelaxedPrecision 
					                                             OpDecorate %423 RelaxedPrecision 
					                                             OpDecorate %424 RelaxedPrecision 
					                                             OpDecorate %425 RelaxedPrecision 
					                                             OpDecorate %426 RelaxedPrecision 
					                                             OpDecorate %427 RelaxedPrecision 
					                                             OpDecorate %430 RelaxedPrecision 
					                                             OpDecorate %431 RelaxedPrecision 
					                                             OpDecorate %435 RelaxedPrecision 
					                                             OpDecorate %440 RelaxedPrecision 
					                                             OpDecorate %481 RelaxedPrecision 
					                                             OpDecorate %482 RelaxedPrecision 
					                                             OpDecorate %490 RelaxedPrecision 
					                                             OpDecorate %491 RelaxedPrecision 
					                                             OpDecorate %492 RelaxedPrecision 
					                                             OpDecorate %497 RelaxedPrecision 
					                                             OpDecorate %498 RelaxedPrecision 
					                                             OpDecorate %499 RelaxedPrecision 
					                                             OpDecorate %500 RelaxedPrecision 
					                                             OpDecorate %501 RelaxedPrecision 
					                                             OpDecorate %502 RelaxedPrecision 
					                                             OpDecorate %503 RelaxedPrecision 
					                                             OpDecorate %504 RelaxedPrecision 
					                                             OpDecorate %507 RelaxedPrecision 
					                                             OpDecorate %508 RelaxedPrecision 
					                                             OpDecorate %513 RelaxedPrecision 
					                                             OpDecorate %517 RelaxedPrecision 
					                                             OpDecorate %548 RelaxedPrecision 
					                                             OpDecorate %549 RelaxedPrecision 
					                                             OpDecorate %557 RelaxedPrecision 
					                                             OpDecorate %558 RelaxedPrecision 
					                                             OpDecorate %559 RelaxedPrecision 
					                                             OpDecorate %564 RelaxedPrecision 
					                                             OpDecorate %565 RelaxedPrecision 
					                                             OpDecorate %566 RelaxedPrecision 
					                                             OpDecorate %567 RelaxedPrecision 
					                                             OpDecorate %568 RelaxedPrecision 
					                                             OpDecorate %569 RelaxedPrecision 
					                                             OpDecorate %570 RelaxedPrecision 
					                                             OpDecorate %571 RelaxedPrecision 
					                                             OpDecorate %574 RelaxedPrecision 
					                                             OpDecorate %575 RelaxedPrecision 
					                                             OpDecorate %580 RelaxedPrecision 
					                                             OpDecorate %584 RelaxedPrecision 
					                                             OpDecorate %623 RelaxedPrecision 
					                                             OpDecorate %624 RelaxedPrecision 
					                                             OpDecorate %632 RelaxedPrecision 
					                                             OpDecorate %633 RelaxedPrecision 
					                                             OpDecorate %634 RelaxedPrecision 
					                                             OpDecorate %639 RelaxedPrecision 
					                                             OpDecorate %640 RelaxedPrecision 
					                                             OpDecorate %641 RelaxedPrecision 
					                                             OpDecorate %642 RelaxedPrecision 
					                                             OpDecorate %643 RelaxedPrecision 
					                                             OpDecorate %644 RelaxedPrecision 
					                                             OpDecorate %645 RelaxedPrecision 
					                                             OpDecorate %646 RelaxedPrecision 
					                                             OpDecorate %649 RelaxedPrecision 
					                                             OpDecorate %650 RelaxedPrecision 
					                                             OpDecorate %654 RelaxedPrecision 
					                                             OpDecorate %661 RelaxedPrecision 
					                                             OpDecorate %773 Location 773 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                      Private f32_3* %27 = OpVariable Private 
					                                 f32 %29 = OpConstant 3,674022E-40 
					                               f32_3 %30 = OpConstantComposite %29 %29 %29 
					                                 f32 %32 = OpConstant 3,674022E-40 
					                               f32_3 %33 = OpConstantComposite %32 %32 %32 
					                                     %35 = OpTypePointer Private %24 
					                      Private f32_4* %36 = OpVariable Private 
					                                     %37 = OpTypeInt 32 1 
					                                     %38 = OpTypeStruct %24 %37 %24 
					                                     %39 = OpTypePointer Uniform %38 
					Uniform struct {f32_4; i32; f32_4;}* %40 = OpVariable Uniform 
					                                 i32 %41 = OpConstant 0 
					                                     %42 = OpTypePointer Uniform %24 
					                                 i32 %46 = OpConstant 2 
					                      Private f32_4* %53 = OpVariable Private 
					                                 f32 %56 = OpConstant 3,674022E-40 
					                                 f32 %57 = OpConstant 3,674022E-40 
					                               f32_4 %58 = OpConstantComposite %56 %56 %57 %57 
					                      Private f32_4* %63 = OpVariable Private 
					UniformConstant read_only Texture2D* %64 = OpVariable UniformConstant 
					            UniformConstant sampler* %66 = OpVariable UniformConstant 
					                                     %72 = OpTypePointer Private %6 
					                        Private f32* %73 = OpVariable Private 
					                                     %74 = OpTypeInt 32 0 
					                                 u32 %75 = OpConstant 3 
					                                 f32 %78 = OpConstant 3,674022E-40 
					                      Private f32_3* %80 = OpVariable Private 
					                      Private f32_3* %88 = OpVariable Private 
					                        Private f32* %92 = OpVariable Private 
					                                 f32 %97 = OpConstant 3,674022E-40 
					                                 f32 %98 = OpConstant 3,674022E-40 
					                       Private f32* %100 = OpVariable Private 
					                     Private f32_4* %104 = OpVariable Private 
					                              f32_3 %107 = OpConstantComposite %98 %98 %98 
					                                i32 %118 = OpConstant 1 
					                                    %119 = OpTypePointer Uniform %37 
					                                    %122 = OpTypeBool 
					                                    %124 = OpTypePointer Function %7 
					                                f32 %144 = OpConstant 3,674022E-40 
					                                u32 %146 = OpConstant 0 
					                     Private f32_3* %148 = OpVariable Private 
					                     Private f32_3* %156 = OpVariable Private 
					                     Private f32_3* %180 = OpVariable Private 
					                     Private f32_4* %201 = OpVariable Private 
					                                f32 %204 = OpConstant 3,674022E-40 
					                                f32 %205 = OpConstant 3,674022E-40 
					                              f32_4 %206 = OpConstantComposite %204 %204 %205 %205 
					                     Private f32_4* %211 = OpVariable Private 
					                       Private f32* %218 = OpVariable Private 
					                                f32 %221 = OpConstant 3,674022E-40 
					                       Private f32* %241 = OpVariable Private 
					                     Private f32_4* %252 = OpVariable Private 
					                                f32 %287 = OpConstant 3,674022E-40 
					                     Private f32_3* %289 = OpVariable Private 
					                     Private f32_3* %297 = OpVariable Private 
					                       Private f32* %309 = OpVariable Private 
					                                f32 %353 = OpConstant 3,674022E-40 
					                       Private f32* %363 = OpVariable Private 
					                     Private f32_3* %374 = OpVariable Private 
					                              f32_2 %397 = OpConstantComposite %29 %29 
					                     Private f32_4* %403 = OpVariable Private 
					                     Private f32_3* %413 = OpVariable Private 
					                     Private f32_3* %421 = OpVariable Private 
					                     Private f32_4* %444 = OpVariable Private 
					                                f32 %473 = OpConstant 3,674022E-40 
					                                f32 %474 = OpConstant 3,674022E-40 
					                              f32_4 %475 = OpConstantComposite %473 %473 %474 %474 
					                     Private f32_4* %480 = OpVariable Private 
					                     Private f32_3* %490 = OpVariable Private 
					                     Private f32_3* %498 = OpVariable Private 
					                       Private f32* %510 = OpVariable Private 
					                     Private f32_4* %521 = OpVariable Private 
					                     Private f32_3* %557 = OpVariable Private 
					                     Private f32_3* %565 = OpVariable Private 
					                       Private f32* %577 = OpVariable Private 
					                                f32 %616 = OpConstant 3,674022E-40 
					                              f32_2 %617 = OpConstantComposite %616 %616 
					                     Private f32_3* %632 = OpVariable Private 
					                     Private f32_3* %640 = OpVariable Private 
					                     Private f32_3* %652 = OpVariable Private 
					                     Private f32_3* %658 = OpVariable Private 
					                                    %692 = OpTypePointer Private %122 
					                      Private bool* %693 = OpVariable Private 
					                                f32 %694 = OpConstant 3,674022E-40 
					                     Private f32_4* %701 = OpVariable Private 
					                                    %772 = OpTypePointer Output %24 
					                      Output f32_4* %773 = OpVariable Output 
					                                    %777 = OpTypePointer Output %6 
					                                f32 %848 = OpConstant 3,674022E-40 
					                              f32_3 %849 = OpConstantComposite %848 %848 %848 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                    Function f32_3* %125 = OpVariable Function 
					                    Function f32_3* %191 = OpVariable Function 
					                    Function f32_3* %268 = OpVariable Function 
					                    Function f32_3* %335 = OpVariable Function 
					                    Function f32_3* %385 = OpVariable Function 
					                    Function f32_3* %460 = OpVariable Function 
					                    Function f32_3* %537 = OpVariable Function 
					                    Function f32_3* %603 = OpVariable Function 
					                    Function f32_3* %681 = OpVariable Function 
					                    Function f32_3* %802 = OpVariable Function 
					                    Function f32_3* %864 = OpVariable Function 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD1 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                               f32_3 %28 = OpLoad %9 
					                               f32_3 %31 = OpFMul %28 %30 
					                               f32_3 %34 = OpFAdd %31 %33 
					                                             OpStore %27 %34 
					                      Uniform f32_4* %43 = OpAccessChain %40 %41 
					                               f32_4 %44 = OpLoad %43 
					                               f32_2 %45 = OpVectorShuffle %44 %44 0 1 
					                      Uniform f32_4* %47 = OpAccessChain %40 %46 
					                               f32_4 %48 = OpLoad %47 
					                               f32_2 %49 = OpVectorShuffle %48 %48 0 1 
					                               f32_2 %50 = OpFMul %45 %49 
					                               f32_4 %51 = OpLoad %36 
					                               f32_4 %52 = OpVectorShuffle %51 %50 4 5 2 3 
					                                             OpStore %36 %52 
					                               f32_4 %54 = OpLoad %36 
					                               f32_4 %55 = OpVectorShuffle %54 %54 0 1 0 1 
					                               f32_4 %59 = OpFMul %55 %58 
					                               f32_2 %60 = OpLoad vs_TEXCOORD1 
					                               f32_4 %61 = OpVectorShuffle %60 %60 0 1 0 1 
					                               f32_4 %62 = OpFAdd %59 %61 
					                                             OpStore %53 %62 
					                 read_only Texture2D %65 = OpLoad %64 
					                             sampler %67 = OpLoad %66 
					          read_only Texture2DSampled %68 = OpSampledImage %65 %67 
					                               f32_4 %69 = OpLoad %53 
					                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
					                               f32_4 %71 = OpImageSampleImplicitLod %68 %70 
					                                             OpStore %63 %71 
					                        Private f32* %76 = OpAccessChain %63 %75 
					                                 f32 %77 = OpLoad %76 
					                                 f32 %79 = OpFMul %77 %78 
					                                             OpStore %73 %79 
					                 read_only Texture2D %81 = OpLoad %12 
					                             sampler %82 = OpLoad %16 
					          read_only Texture2DSampled %83 = OpSampledImage %81 %82 
					                               f32_4 %84 = OpLoad %53 
					                               f32_2 %85 = OpVectorShuffle %84 %84 0 1 
					                               f32_4 %86 = OpImageSampleImplicitLod %83 %85 
					                               f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
					                                             OpStore %80 %87 
					                               f32_3 %89 = OpLoad %80 
					                               f32_3 %90 = OpFMul %89 %30 
					                               f32_3 %91 = OpFAdd %90 %33 
					                                             OpStore %88 %91 
					                               f32_3 %93 = OpLoad %27 
					                               f32_3 %94 = OpLoad %88 
					                                 f32 %95 = OpDot %93 %94 
					                                             OpStore %92 %95 
					                                 f32 %96 = OpLoad %92 
					                                 f32 %99 = OpExtInst %1 43 %96 %97 %98 
					                                             OpStore %92 %99 
					                                f32 %101 = OpLoad %73 
					                                f32 %102 = OpLoad %92 
					                                f32 %103 = OpFMul %101 %102 
					                                             OpStore %100 %103 
					                              f32_4 %105 = OpLoad %63 
					                              f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
					                              f32_3 %108 = OpFAdd %106 %107 
					                              f32_4 %109 = OpLoad %104 
					                              f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
					                                             OpStore %104 %110 
					                              f32_4 %111 = OpLoad %63 
					                              f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
					                              f32_4 %113 = OpLoad %104 
					                              f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
					                              f32_3 %115 = OpFDiv %112 %114 
					                              f32_4 %116 = OpLoad %104 
					                              f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
					                                             OpStore %104 %117 
					                       Uniform i32* %120 = OpAccessChain %40 %118 
					                                i32 %121 = OpLoad %120 
					                               bool %123 = OpINotEqual %121 %41 
					                                             OpSelectionMerge %127 None 
					                                             OpBranchConditional %123 %126 %130 
					                                    %126 = OpLabel 
					                              f32_4 %128 = OpLoad %104 
					                              f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
					                                             OpStore %125 %129 
					                                             OpBranch %127 
					                                    %130 = OpLabel 
					                              f32_4 %131 = OpLoad %63 
					                              f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
					                                             OpStore %125 %132 
					                                             OpBranch %127 
					                                    %127 = OpLabel 
					                              f32_3 %133 = OpLoad %125 
					                              f32_4 %134 = OpLoad %63 
					                              f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
					                                             OpStore %63 %135 
					                read_only Texture2D %136 = OpLoad %64 
					                            sampler %137 = OpLoad %66 
					         read_only Texture2DSampled %138 = OpSampledImage %136 %137 
					                              f32_4 %139 = OpLoad %53 
					                              f32_2 %140 = OpVectorShuffle %139 %139 2 3 
					                              f32_4 %141 = OpImageSampleImplicitLod %138 %140 
					                                             OpStore %104 %141 
					                       Private f32* %142 = OpAccessChain %104 %75 
					                                f32 %143 = OpLoad %142 
					                                f32 %145 = OpFMul %143 %144 
					                       Private f32* %147 = OpAccessChain %53 %146 
					                                             OpStore %147 %145 
					                read_only Texture2D %149 = OpLoad %12 
					                            sampler %150 = OpLoad %16 
					         read_only Texture2DSampled %151 = OpSampledImage %149 %150 
					                              f32_4 %152 = OpLoad %53 
					                              f32_2 %153 = OpVectorShuffle %152 %152 2 3 
					                              f32_4 %154 = OpImageSampleImplicitLod %151 %153 
					                              f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
					                                             OpStore %148 %155 
					                              f32_3 %157 = OpLoad %148 
					                              f32_3 %158 = OpFMul %157 %30 
					                              f32_3 %159 = OpFAdd %158 %33 
					                                             OpStore %156 %159 
					                              f32_3 %160 = OpLoad %27 
					                              f32_3 %161 = OpLoad %156 
					                                f32 %162 = OpDot %160 %161 
					                       Private f32* %163 = OpAccessChain %156 %146 
					                                             OpStore %163 %162 
					                       Private f32* %164 = OpAccessChain %156 %146 
					                                f32 %165 = OpLoad %164 
					                                f32 %166 = OpExtInst %1 43 %165 %97 %98 
					                       Private f32* %167 = OpAccessChain %156 %146 
					                                             OpStore %167 %166 
					                       Private f32* %168 = OpAccessChain %156 %146 
					                                f32 %169 = OpLoad %168 
					                       Private f32* %170 = OpAccessChain %53 %146 
					                                f32 %171 = OpLoad %170 
					                                f32 %172 = OpFMul %169 %171 
					                       Private f32* %173 = OpAccessChain %53 %146 
					                                             OpStore %173 %172 
					                                f32 %174 = OpLoad %73 
					                                f32 %175 = OpLoad %92 
					                                f32 %176 = OpFMul %174 %175 
					                       Private f32* %177 = OpAccessChain %53 %146 
					                                f32 %178 = OpLoad %177 
					                                f32 %179 = OpFAdd %176 %178 
					                                             OpStore %73 %179 
					                              f32_4 %181 = OpLoad %104 
					                              f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
					                              f32_3 %183 = OpFAdd %182 %107 
					                                             OpStore %180 %183 
					                              f32_4 %184 = OpLoad %104 
					                              f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
					                              f32_3 %186 = OpLoad %180 
					                              f32_3 %187 = OpFDiv %185 %186 
					                                             OpStore %180 %187 
					                       Uniform i32* %188 = OpAccessChain %40 %118 
					                                i32 %189 = OpLoad %188 
					                               bool %190 = OpINotEqual %189 %41 
					                                             OpSelectionMerge %193 None 
					                                             OpBranchConditional %190 %192 %195 
					                                    %192 = OpLabel 
					                              f32_3 %194 = OpLoad %180 
					                                             OpStore %191 %194 
					                                             OpBranch %193 
					                                    %195 = OpLabel 
					                              f32_4 %196 = OpLoad %104 
					                              f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
					                                             OpStore %191 %197 
					                                             OpBranch %193 
					                                    %193 = OpLabel 
					                              f32_3 %198 = OpLoad %191 
					                              f32_4 %199 = OpLoad %104 
					                              f32_4 %200 = OpVectorShuffle %199 %198 4 5 6 3 
					                                             OpStore %104 %200 
					                              f32_4 %202 = OpLoad %36 
					                              f32_4 %203 = OpVectorShuffle %202 %202 0 1 0 1 
					                              f32_4 %207 = OpFMul %203 %206 
					                              f32_2 %208 = OpLoad vs_TEXCOORD1 
					                              f32_4 %209 = OpVectorShuffle %208 %208 0 1 0 1 
					                              f32_4 %210 = OpFAdd %207 %209 
					                                             OpStore %201 %210 
					                read_only Texture2D %212 = OpLoad %64 
					                            sampler %213 = OpLoad %66 
					         read_only Texture2DSampled %214 = OpSampledImage %212 %213 
					                              f32_4 %215 = OpLoad %201 
					                              f32_2 %216 = OpVectorShuffle %215 %215 0 1 
					                              f32_4 %217 = OpImageSampleImplicitLod %214 %216 
					                                             OpStore %211 %217 
					                       Private f32* %219 = OpAccessChain %211 %75 
					                                f32 %220 = OpLoad %219 
					                                f32 %222 = OpFMul %220 %221 
					                                             OpStore %218 %222 
					                read_only Texture2D %223 = OpLoad %12 
					                            sampler %224 = OpLoad %16 
					         read_only Texture2DSampled %225 = OpSampledImage %223 %224 
					                              f32_4 %226 = OpLoad %201 
					                              f32_2 %227 = OpVectorShuffle %226 %226 0 1 
					                              f32_4 %228 = OpImageSampleImplicitLod %225 %227 
					                              f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
					                                             OpStore %148 %229 
					                              f32_3 %230 = OpLoad %148 
					                              f32_3 %231 = OpFMul %230 %30 
					                              f32_3 %232 = OpFAdd %231 %33 
					                                             OpStore %156 %232 
					                              f32_3 %233 = OpLoad %27 
					                              f32_3 %234 = OpLoad %156 
					                                f32 %235 = OpDot %233 %234 
					                       Private f32* %236 = OpAccessChain %156 %146 
					                                             OpStore %236 %235 
					                       Private f32* %237 = OpAccessChain %156 %146 
					                                f32 %238 = OpLoad %237 
					                                f32 %239 = OpExtInst %1 43 %238 %97 %98 
					                       Private f32* %240 = OpAccessChain %156 %146 
					                                             OpStore %240 %239 
					                                f32 %242 = OpLoad %218 
					                       Private f32* %243 = OpAccessChain %156 %146 
					                                f32 %244 = OpLoad %243 
					                                f32 %245 = OpFMul %242 %244 
					                                             OpStore %241 %245 
					                                f32 %246 = OpLoad %218 
					                       Private f32* %247 = OpAccessChain %156 %146 
					                                f32 %248 = OpLoad %247 
					                                f32 %249 = OpFMul %246 %248 
					                                f32 %250 = OpLoad %73 
					                                f32 %251 = OpFAdd %249 %250 
					                                             OpStore %73 %251 
					                              f32_4 %253 = OpLoad %211 
					                              f32_3 %254 = OpVectorShuffle %253 %253 0 1 2 
					                              f32_3 %255 = OpFAdd %254 %107 
					                              f32_4 %256 = OpLoad %252 
					                              f32_4 %257 = OpVectorShuffle %256 %255 4 5 6 3 
					                                             OpStore %252 %257 
					                              f32_4 %258 = OpLoad %211 
					                              f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
					                              f32_4 %260 = OpLoad %252 
					                              f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
					                              f32_3 %262 = OpFDiv %259 %261 
					                              f32_4 %263 = OpLoad %252 
					                              f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
					                                             OpStore %252 %264 
					                       Uniform i32* %265 = OpAccessChain %40 %118 
					                                i32 %266 = OpLoad %265 
					                               bool %267 = OpINotEqual %266 %41 
					                                             OpSelectionMerge %270 None 
					                                             OpBranchConditional %267 %269 %273 
					                                    %269 = OpLabel 
					                              f32_4 %271 = OpLoad %252 
					                              f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
					                                             OpStore %268 %272 
					                                             OpBranch %270 
					                                    %273 = OpLabel 
					                              f32_4 %274 = OpLoad %211 
					                              f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
					                                             OpStore %268 %275 
					                                             OpBranch %270 
					                                    %270 = OpLabel 
					                              f32_3 %276 = OpLoad %268 
					                              f32_4 %277 = OpLoad %211 
					                              f32_4 %278 = OpVectorShuffle %277 %276 4 5 6 3 
					                                             OpStore %211 %278 
					                read_only Texture2D %279 = OpLoad %64 
					                            sampler %280 = OpLoad %66 
					         read_only Texture2DSampled %281 = OpSampledImage %279 %280 
					                              f32_4 %282 = OpLoad %201 
					                              f32_2 %283 = OpVectorShuffle %282 %282 2 3 
					                              f32_4 %284 = OpImageSampleImplicitLod %281 %283 
					                                             OpStore %252 %284 
					                       Private f32* %285 = OpAccessChain %252 %75 
					                                f32 %286 = OpLoad %285 
					                                f32 %288 = OpFMul %286 %287 
					                                             OpStore %218 %288 
					                read_only Texture2D %290 = OpLoad %12 
					                            sampler %291 = OpLoad %16 
					         read_only Texture2DSampled %292 = OpSampledImage %290 %291 
					                              f32_4 %293 = OpLoad %201 
					                              f32_2 %294 = OpVectorShuffle %293 %293 2 3 
					                              f32_4 %295 = OpImageSampleImplicitLod %292 %294 
					                              f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
					                                             OpStore %289 %296 
					                              f32_3 %298 = OpLoad %289 
					                              f32_3 %299 = OpFMul %298 %30 
					                              f32_3 %300 = OpFAdd %299 %33 
					                                             OpStore %297 %300 
					                              f32_3 %301 = OpLoad %27 
					                              f32_3 %302 = OpLoad %297 
					                                f32 %303 = OpDot %301 %302 
					                       Private f32* %304 = OpAccessChain %156 %146 
					                                             OpStore %304 %303 
					                       Private f32* %305 = OpAccessChain %156 %146 
					                                f32 %306 = OpLoad %305 
					                                f32 %307 = OpExtInst %1 43 %306 %97 %98 
					                       Private f32* %308 = OpAccessChain %156 %146 
					                                             OpStore %308 %307 
					                                f32 %310 = OpLoad %218 
					                       Private f32* %311 = OpAccessChain %156 %146 
					                                f32 %312 = OpLoad %311 
					                                f32 %313 = OpFMul %310 %312 
					                                             OpStore %309 %313 
					                                f32 %314 = OpLoad %218 
					                       Private f32* %315 = OpAccessChain %156 %146 
					                                f32 %316 = OpLoad %315 
					                                f32 %317 = OpFMul %314 %316 
					                                f32 %318 = OpLoad %73 
					                                f32 %319 = OpFAdd %317 %318 
					                                             OpStore %73 %319 
					                              f32_4 %320 = OpLoad %252 
					                              f32_3 %321 = OpVectorShuffle %320 %320 0 1 2 
					                              f32_3 %322 = OpFAdd %321 %107 
					                              f32_4 %323 = OpLoad %201 
					                              f32_4 %324 = OpVectorShuffle %323 %322 4 5 6 3 
					                                             OpStore %201 %324 
					                              f32_4 %325 = OpLoad %252 
					                              f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
					                              f32_4 %327 = OpLoad %201 
					                              f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
					                              f32_3 %329 = OpFDiv %326 %328 
					                              f32_4 %330 = OpLoad %201 
					                              f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
					                                             OpStore %201 %331 
					                       Uniform i32* %332 = OpAccessChain %40 %118 
					                                i32 %333 = OpLoad %332 
					                               bool %334 = OpINotEqual %333 %41 
					                                             OpSelectionMerge %337 None 
					                                             OpBranchConditional %334 %336 %340 
					                                    %336 = OpLabel 
					                              f32_4 %338 = OpLoad %201 
					                              f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
					                                             OpStore %335 %339 
					                                             OpBranch %337 
					                                    %340 = OpLabel 
					                              f32_4 %341 = OpLoad %252 
					                              f32_3 %342 = OpVectorShuffle %341 %341 0 1 2 
					                                             OpStore %335 %342 
					                                             OpBranch %337 
					                                    %337 = OpLabel 
					                              f32_3 %343 = OpLoad %335 
					                              f32_4 %344 = OpLoad %252 
					                              f32_4 %345 = OpVectorShuffle %344 %343 4 5 6 3 
					                                             OpStore %252 %345 
					                read_only Texture2D %346 = OpLoad %64 
					                            sampler %347 = OpLoad %66 
					         read_only Texture2DSampled %348 = OpSampledImage %346 %347 
					                              f32_2 %349 = OpLoad vs_TEXCOORD1 
					                              f32_4 %350 = OpImageSampleImplicitLod %348 %349 
					                                             OpStore %201 %350 
					                       Private f32* %351 = OpAccessChain %201 %75 
					                                f32 %352 = OpLoad %351 
					                                f32 %354 = OpFMul %352 %353 
					                                             OpStore %218 %354 
					                              f32_3 %355 = OpLoad %27 
					                              f32_3 %356 = OpLoad %27 
					                                f32 %357 = OpDot %355 %356 
					                       Private f32* %358 = OpAccessChain %156 %146 
					                                             OpStore %358 %357 
					                       Private f32* %359 = OpAccessChain %156 %146 
					                                f32 %360 = OpLoad %359 
					                                f32 %361 = OpExtInst %1 37 %360 %98 
					                       Private f32* %362 = OpAccessChain %156 %146 
					                                             OpStore %362 %361 
					                                f32 %364 = OpLoad %218 
					                       Private f32* %365 = OpAccessChain %156 %146 
					                                f32 %366 = OpLoad %365 
					                                f32 %367 = OpFMul %364 %366 
					                                             OpStore %363 %367 
					                                f32 %368 = OpLoad %218 
					                       Private f32* %369 = OpAccessChain %156 %146 
					                                f32 %370 = OpLoad %369 
					                                f32 %371 = OpFMul %368 %370 
					                                f32 %372 = OpLoad %73 
					                                f32 %373 = OpFAdd %371 %372 
					                                             OpStore %73 %373 
					                              f32_4 %375 = OpLoad %201 
					                              f32_3 %376 = OpVectorShuffle %375 %375 0 1 2 
					                              f32_3 %377 = OpFAdd %376 %107 
					                                             OpStore %374 %377 
					                              f32_4 %378 = OpLoad %201 
					                              f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
					                              f32_3 %380 = OpLoad %374 
					                              f32_3 %381 = OpFDiv %379 %380 
					                                             OpStore %374 %381 
					                       Uniform i32* %382 = OpAccessChain %40 %118 
					                                i32 %383 = OpLoad %382 
					                               bool %384 = OpINotEqual %383 %41 
					                                             OpSelectionMerge %387 None 
					                                             OpBranchConditional %384 %386 %389 
					                                    %386 = OpLabel 
					                              f32_3 %388 = OpLoad %374 
					                                             OpStore %385 %388 
					                                             OpBranch %387 
					                                    %389 = OpLabel 
					                              f32_4 %390 = OpLoad %201 
					                              f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
					                                             OpStore %385 %391 
					                                             OpBranch %387 
					                                    %387 = OpLabel 
					                              f32_3 %392 = OpLoad %385 
					                              f32_4 %393 = OpLoad %201 
					                              f32_4 %394 = OpVectorShuffle %393 %392 4 5 6 3 
					                                             OpStore %201 %394 
					                              f32_4 %395 = OpLoad %36 
					                              f32_2 %396 = OpVectorShuffle %395 %395 0 1 
					                              f32_2 %398 = OpFMul %396 %397 
					                              f32_2 %399 = OpLoad vs_TEXCOORD1 
					                              f32_2 %400 = OpFAdd %398 %399 
					                              f32_3 %401 = OpLoad %374 
					                              f32_3 %402 = OpVectorShuffle %401 %400 3 4 2 
					                                             OpStore %374 %402 
					                read_only Texture2D %404 = OpLoad %64 
					                            sampler %405 = OpLoad %66 
					         read_only Texture2DSampled %406 = OpSampledImage %404 %405 
					                              f32_3 %407 = OpLoad %374 
					                              f32_2 %408 = OpVectorShuffle %407 %407 0 1 
					                              f32_4 %409 = OpImageSampleImplicitLod %406 %408 
					                                             OpStore %403 %409 
					                       Private f32* %410 = OpAccessChain %403 %75 
					                                f32 %411 = OpLoad %410 
					                                f32 %412 = OpFMul %411 %287 
					                                             OpStore %218 %412 
					                read_only Texture2D %414 = OpLoad %12 
					                            sampler %415 = OpLoad %16 
					         read_only Texture2DSampled %416 = OpSampledImage %414 %415 
					                              f32_3 %417 = OpLoad %374 
					                              f32_2 %418 = OpVectorShuffle %417 %417 0 1 
					                              f32_4 %419 = OpImageSampleImplicitLod %416 %418 
					                              f32_3 %420 = OpVectorShuffle %419 %419 0 1 2 
					                                             OpStore %413 %420 
					                              f32_3 %422 = OpLoad %413 
					                              f32_3 %423 = OpFMul %422 %30 
					                              f32_3 %424 = OpFAdd %423 %33 
					                                             OpStore %421 %424 
					                              f32_3 %425 = OpLoad %27 
					                              f32_3 %426 = OpLoad %421 
					                                f32 %427 = OpDot %425 %426 
					                       Private f32* %428 = OpAccessChain %156 %146 
					                                             OpStore %428 %427 
					                       Private f32* %429 = OpAccessChain %156 %146 
					                                f32 %430 = OpLoad %429 
					                                f32 %431 = OpExtInst %1 43 %430 %97 %98 
					                       Private f32* %432 = OpAccessChain %156 %146 
					                                             OpStore %432 %431 
					                                f32 %433 = OpLoad %218 
					                       Private f32* %434 = OpAccessChain %156 %146 
					                                f32 %435 = OpLoad %434 
					                                f32 %436 = OpFMul %433 %435 
					                       Private f32* %437 = OpAccessChain %374 %146 
					                                             OpStore %437 %436 
					                                f32 %438 = OpLoad %218 
					                       Private f32* %439 = OpAccessChain %156 %146 
					                                f32 %440 = OpLoad %439 
					                                f32 %441 = OpFMul %438 %440 
					                                f32 %442 = OpLoad %73 
					                                f32 %443 = OpFAdd %441 %442 
					                                             OpStore %73 %443 
					                              f32_4 %445 = OpLoad %403 
					                              f32_3 %446 = OpVectorShuffle %445 %445 0 1 2 
					                              f32_3 %447 = OpFAdd %446 %107 
					                              f32_4 %448 = OpLoad %444 
					                              f32_4 %449 = OpVectorShuffle %448 %447 4 5 6 3 
					                                             OpStore %444 %449 
					                              f32_4 %450 = OpLoad %403 
					                              f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
					                              f32_4 %452 = OpLoad %444 
					                              f32_3 %453 = OpVectorShuffle %452 %452 0 1 2 
					                              f32_3 %454 = OpFDiv %451 %453 
					                              f32_4 %455 = OpLoad %444 
					                              f32_4 %456 = OpVectorShuffle %455 %454 4 5 6 3 
					                                             OpStore %444 %456 
					                       Uniform i32* %457 = OpAccessChain %40 %118 
					                                i32 %458 = OpLoad %457 
					                               bool %459 = OpINotEqual %458 %41 
					                                             OpSelectionMerge %462 None 
					                                             OpBranchConditional %459 %461 %465 
					                                    %461 = OpLabel 
					                              f32_4 %463 = OpLoad %444 
					                              f32_3 %464 = OpVectorShuffle %463 %463 0 1 2 
					                                             OpStore %460 %464 
					                                             OpBranch %462 
					                                    %465 = OpLabel 
					                              f32_4 %466 = OpLoad %403 
					                              f32_3 %467 = OpVectorShuffle %466 %466 0 1 2 
					                                             OpStore %460 %467 
					                                             OpBranch %462 
					                                    %462 = OpLabel 
					                              f32_3 %468 = OpLoad %460 
					                              f32_4 %469 = OpLoad %403 
					                              f32_4 %470 = OpVectorShuffle %469 %468 4 5 6 3 
					                                             OpStore %403 %470 
					                              f32_4 %471 = OpLoad %36 
					                              f32_4 %472 = OpVectorShuffle %471 %471 0 1 0 1 
					                              f32_4 %476 = OpFMul %472 %475 
					                              f32_2 %477 = OpLoad vs_TEXCOORD1 
					                              f32_4 %478 = OpVectorShuffle %477 %477 0 1 0 1 
					                              f32_4 %479 = OpFAdd %476 %478 
					                                             OpStore %444 %479 
					                read_only Texture2D %481 = OpLoad %64 
					                            sampler %482 = OpLoad %66 
					         read_only Texture2DSampled %483 = OpSampledImage %481 %482 
					                              f32_4 %484 = OpLoad %444 
					                              f32_2 %485 = OpVectorShuffle %484 %484 0 1 
					                              f32_4 %486 = OpImageSampleImplicitLod %483 %485 
					                                             OpStore %480 %486 
					                       Private f32* %487 = OpAccessChain %480 %75 
					                                f32 %488 = OpLoad %487 
					                                f32 %489 = OpFMul %488 %221 
					                                             OpStore %218 %489 
					                read_only Texture2D %491 = OpLoad %12 
					                            sampler %492 = OpLoad %16 
					         read_only Texture2DSampled %493 = OpSampledImage %491 %492 
					                              f32_4 %494 = OpLoad %444 
					                              f32_2 %495 = OpVectorShuffle %494 %494 0 1 
					                              f32_4 %496 = OpImageSampleImplicitLod %493 %495 
					                              f32_3 %497 = OpVectorShuffle %496 %496 0 1 2 
					                                             OpStore %490 %497 
					                              f32_3 %499 = OpLoad %490 
					                              f32_3 %500 = OpFMul %499 %30 
					                              f32_3 %501 = OpFAdd %500 %33 
					                                             OpStore %498 %501 
					                              f32_3 %502 = OpLoad %27 
					                              f32_3 %503 = OpLoad %498 
					                                f32 %504 = OpDot %502 %503 
					                       Private f32* %505 = OpAccessChain %156 %146 
					                                             OpStore %505 %504 
					                       Private f32* %506 = OpAccessChain %156 %146 
					                                f32 %507 = OpLoad %506 
					                                f32 %508 = OpExtInst %1 43 %507 %97 %98 
					                       Private f32* %509 = OpAccessChain %156 %146 
					                                             OpStore %509 %508 
					                                f32 %511 = OpLoad %218 
					                       Private f32* %512 = OpAccessChain %156 %146 
					                                f32 %513 = OpLoad %512 
					                                f32 %514 = OpFMul %511 %513 
					                                             OpStore %510 %514 
					                                f32 %515 = OpLoad %218 
					                       Private f32* %516 = OpAccessChain %156 %146 
					                                f32 %517 = OpLoad %516 
					                                f32 %518 = OpFMul %515 %517 
					                                f32 %519 = OpLoad %73 
					                                f32 %520 = OpFAdd %518 %519 
					                                             OpStore %73 %520 
					                              f32_4 %522 = OpLoad %480 
					                              f32_3 %523 = OpVectorShuffle %522 %522 0 1 2 
					                              f32_3 %524 = OpFAdd %523 %107 
					                              f32_4 %525 = OpLoad %521 
					                              f32_4 %526 = OpVectorShuffle %525 %524 4 5 6 3 
					                                             OpStore %521 %526 
					                              f32_4 %527 = OpLoad %480 
					                              f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
					                              f32_4 %529 = OpLoad %521 
					                              f32_3 %530 = OpVectorShuffle %529 %529 0 1 2 
					                              f32_3 %531 = OpFDiv %528 %530 
					                              f32_4 %532 = OpLoad %521 
					                              f32_4 %533 = OpVectorShuffle %532 %531 4 5 6 3 
					                                             OpStore %521 %533 
					                       Uniform i32* %534 = OpAccessChain %40 %118 
					                                i32 %535 = OpLoad %534 
					                               bool %536 = OpINotEqual %535 %41 
					                                             OpSelectionMerge %539 None 
					                                             OpBranchConditional %536 %538 %542 
					                                    %538 = OpLabel 
					                              f32_4 %540 = OpLoad %521 
					                              f32_3 %541 = OpVectorShuffle %540 %540 0 1 2 
					                                             OpStore %537 %541 
					                                             OpBranch %539 
					                                    %542 = OpLabel 
					                              f32_4 %543 = OpLoad %480 
					                              f32_3 %544 = OpVectorShuffle %543 %543 0 1 2 
					                                             OpStore %537 %544 
					                                             OpBranch %539 
					                                    %539 = OpLabel 
					                              f32_3 %545 = OpLoad %537 
					                              f32_4 %546 = OpLoad %480 
					                              f32_4 %547 = OpVectorShuffle %546 %545 4 5 6 3 
					                                             OpStore %480 %547 
					                read_only Texture2D %548 = OpLoad %64 
					                            sampler %549 = OpLoad %66 
					         read_only Texture2DSampled %550 = OpSampledImage %548 %549 
					                              f32_4 %551 = OpLoad %444 
					                              f32_2 %552 = OpVectorShuffle %551 %551 2 3 
					                              f32_4 %553 = OpImageSampleImplicitLod %550 %552 
					                                             OpStore %521 %553 
					                       Private f32* %554 = OpAccessChain %521 %75 
					                                f32 %555 = OpLoad %554 
					                                f32 %556 = OpFMul %555 %144 
					                                             OpStore %218 %556 
					                read_only Texture2D %558 = OpLoad %12 
					                            sampler %559 = OpLoad %16 
					         read_only Texture2DSampled %560 = OpSampledImage %558 %559 
					                              f32_4 %561 = OpLoad %444 
					                              f32_2 %562 = OpVectorShuffle %561 %561 2 3 
					                              f32_4 %563 = OpImageSampleImplicitLod %560 %562 
					                              f32_3 %564 = OpVectorShuffle %563 %563 0 1 2 
					                                             OpStore %557 %564 
					                              f32_3 %566 = OpLoad %557 
					                              f32_3 %567 = OpFMul %566 %30 
					                              f32_3 %568 = OpFAdd %567 %33 
					                                             OpStore %565 %568 
					                              f32_3 %569 = OpLoad %27 
					                              f32_3 %570 = OpLoad %565 
					                                f32 %571 = OpDot %569 %570 
					                       Private f32* %572 = OpAccessChain %156 %146 
					                                             OpStore %572 %571 
					                       Private f32* %573 = OpAccessChain %156 %146 
					                                f32 %574 = OpLoad %573 
					                                f32 %575 = OpExtInst %1 43 %574 %97 %98 
					                       Private f32* %576 = OpAccessChain %156 %146 
					                                             OpStore %576 %575 
					                                f32 %578 = OpLoad %218 
					                       Private f32* %579 = OpAccessChain %156 %146 
					                                f32 %580 = OpLoad %579 
					                                f32 %581 = OpFMul %578 %580 
					                                             OpStore %577 %581 
					                                f32 %582 = OpLoad %218 
					                       Private f32* %583 = OpAccessChain %156 %146 
					                                f32 %584 = OpLoad %583 
					                                f32 %585 = OpFMul %582 %584 
					                                f32 %586 = OpLoad %73 
					                                f32 %587 = OpFAdd %585 %586 
					                                             OpStore %73 %587 
					                              f32_4 %588 = OpLoad %521 
					                              f32_3 %589 = OpVectorShuffle %588 %588 0 1 2 
					                              f32_3 %590 = OpFAdd %589 %107 
					                              f32_4 %591 = OpLoad %444 
					                              f32_4 %592 = OpVectorShuffle %591 %590 4 5 6 3 
					                                             OpStore %444 %592 
					                              f32_4 %593 = OpLoad %521 
					                              f32_3 %594 = OpVectorShuffle %593 %593 0 1 2 
					                              f32_4 %595 = OpLoad %444 
					                              f32_3 %596 = OpVectorShuffle %595 %595 0 1 2 
					                              f32_3 %597 = OpFDiv %594 %596 
					                              f32_4 %598 = OpLoad %444 
					                              f32_4 %599 = OpVectorShuffle %598 %597 4 5 6 3 
					                                             OpStore %444 %599 
					                       Uniform i32* %600 = OpAccessChain %40 %118 
					                                i32 %601 = OpLoad %600 
					                               bool %602 = OpINotEqual %601 %41 
					                                             OpSelectionMerge %605 None 
					                                             OpBranchConditional %602 %604 %608 
					                                    %604 = OpLabel 
					                              f32_4 %606 = OpLoad %444 
					                              f32_3 %607 = OpVectorShuffle %606 %606 0 1 2 
					                                             OpStore %603 %607 
					                                             OpBranch %605 
					                                    %608 = OpLabel 
					                              f32_4 %609 = OpLoad %521 
					                              f32_3 %610 = OpVectorShuffle %609 %609 0 1 2 
					                                             OpStore %603 %610 
					                                             OpBranch %605 
					                                    %605 = OpLabel 
					                              f32_3 %611 = OpLoad %603 
					                              f32_4 %612 = OpLoad %521 
					                              f32_4 %613 = OpVectorShuffle %612 %611 4 5 6 3 
					                                             OpStore %521 %613 
					                              f32_4 %614 = OpLoad %36 
					                              f32_2 %615 = OpVectorShuffle %614 %614 0 1 
					                              f32_2 %618 = OpFMul %615 %617 
					                              f32_2 %619 = OpLoad vs_TEXCOORD1 
					                              f32_2 %620 = OpFAdd %618 %619 
					                              f32_4 %621 = OpLoad %36 
					                              f32_4 %622 = OpVectorShuffle %621 %620 4 5 2 3 
					                                             OpStore %36 %622 
					                read_only Texture2D %623 = OpLoad %64 
					                            sampler %624 = OpLoad %66 
					         read_only Texture2DSampled %625 = OpSampledImage %623 %624 
					                              f32_4 %626 = OpLoad %36 
					                              f32_2 %627 = OpVectorShuffle %626 %626 0 1 
					                              f32_4 %628 = OpImageSampleImplicitLod %625 %627 
					                                             OpStore %444 %628 
					                       Private f32* %629 = OpAccessChain %444 %75 
					                                f32 %630 = OpLoad %629 
					                                f32 %631 = OpFMul %630 %78 
					                                             OpStore %218 %631 
					                read_only Texture2D %633 = OpLoad %12 
					                            sampler %634 = OpLoad %16 
					         read_only Texture2DSampled %635 = OpSampledImage %633 %634 
					                              f32_4 %636 = OpLoad %36 
					                              f32_2 %637 = OpVectorShuffle %636 %636 0 1 
					                              f32_4 %638 = OpImageSampleImplicitLod %635 %637 
					                              f32_3 %639 = OpVectorShuffle %638 %638 0 1 2 
					                                             OpStore %632 %639 
					                              f32_3 %641 = OpLoad %632 
					                              f32_3 %642 = OpFMul %641 %30 
					                              f32_3 %643 = OpFAdd %642 %33 
					                                             OpStore %640 %643 
					                              f32_3 %644 = OpLoad %27 
					                              f32_3 %645 = OpLoad %640 
					                                f32 %646 = OpDot %644 %645 
					                       Private f32* %647 = OpAccessChain %27 %146 
					                                             OpStore %647 %646 
					                       Private f32* %648 = OpAccessChain %27 %146 
					                                f32 %649 = OpLoad %648 
					                                f32 %650 = OpExtInst %1 43 %649 %97 %98 
					                       Private f32* %651 = OpAccessChain %27 %146 
					                                             OpStore %651 %650 
					                       Private f32* %653 = OpAccessChain %27 %146 
					                                f32 %654 = OpLoad %653 
					                                f32 %655 = OpLoad %218 
					                                f32 %656 = OpFMul %654 %655 
					                       Private f32* %657 = OpAccessChain %652 %146 
					                                             OpStore %657 %656 
					                                f32 %659 = OpLoad %218 
					                       Private f32* %660 = OpAccessChain %27 %146 
					                                f32 %661 = OpLoad %660 
					                                f32 %662 = OpFMul %659 %661 
					                                f32 %663 = OpLoad %73 
					                                f32 %664 = OpFAdd %662 %663 
					                       Private f32* %665 = OpAccessChain %658 %146 
					                                             OpStore %665 %664 
					                              f32_4 %666 = OpLoad %444 
					                              f32_3 %667 = OpVectorShuffle %666 %666 0 1 2 
					                              f32_3 %668 = OpFAdd %667 %107 
					                              f32_4 %669 = OpLoad %36 
					                              f32_4 %670 = OpVectorShuffle %669 %668 4 5 6 3 
					                                             OpStore %36 %670 
					                              f32_4 %671 = OpLoad %444 
					                              f32_3 %672 = OpVectorShuffle %671 %671 0 1 2 
					                              f32_4 %673 = OpLoad %36 
					                              f32_3 %674 = OpVectorShuffle %673 %673 0 1 2 
					                              f32_3 %675 = OpFDiv %672 %674 
					                              f32_4 %676 = OpLoad %36 
					                              f32_4 %677 = OpVectorShuffle %676 %675 4 5 6 3 
					                                             OpStore %36 %677 
					                       Uniform i32* %678 = OpAccessChain %40 %118 
					                                i32 %679 = OpLoad %678 
					                               bool %680 = OpINotEqual %679 %41 
					                                             OpSelectionMerge %683 None 
					                                             OpBranchConditional %680 %682 %686 
					                                    %682 = OpLabel 
					                              f32_4 %684 = OpLoad %36 
					                              f32_3 %685 = OpVectorShuffle %684 %684 0 1 2 
					                                             OpStore %681 %685 
					                                             OpBranch %683 
					                                    %686 = OpLabel 
					                              f32_4 %687 = OpLoad %444 
					                              f32_3 %688 = OpVectorShuffle %687 %687 0 1 2 
					                                             OpStore %681 %688 
					                                             OpBranch %683 
					                                    %683 = OpLabel 
					                              f32_3 %689 = OpLoad %681 
					                              f32_4 %690 = OpLoad %444 
					                              f32_4 %691 = OpVectorShuffle %690 %689 4 5 6 3 
					                                             OpStore %444 %691 
					                       Private f32* %695 = OpAccessChain %658 %146 
					                                f32 %696 = OpLoad %695 
					                               bool %697 = OpFOrdLessThan %694 %696 
					                                             OpStore %693 %697 
					                               bool %698 = OpLoad %693 
					                                             OpSelectionMerge %700 None 
					                                             OpBranchConditional %698 %699 %813 
					                                    %699 = OpLabel 
					                              f32_4 %702 = OpLoad %53 
					                              f32_4 %703 = OpVectorShuffle %702 %702 0 0 0 0 
					                              f32_4 %704 = OpLoad %104 
					                              f32_4 %705 = OpFMul %703 %704 
					                                             OpStore %701 %705 
					                              f32_4 %706 = OpLoad %63 
					                                f32 %707 = OpLoad %100 
					                              f32_4 %708 = OpCompositeConstruct %707 %707 %707 %707 
					                              f32_4 %709 = OpFMul %706 %708 
					                              f32_4 %710 = OpLoad %701 
					                              f32_4 %711 = OpFAdd %709 %710 
					                                             OpStore %36 %711 
					                              f32_4 %712 = OpLoad %211 
					                                f32 %713 = OpLoad %241 
					                              f32_4 %714 = OpCompositeConstruct %713 %713 %713 %713 
					                              f32_4 %715 = OpFMul %712 %714 
					                              f32_4 %716 = OpLoad %36 
					                              f32_4 %717 = OpFAdd %715 %716 
					                                             OpStore %36 %717 
					                              f32_4 %718 = OpLoad %252 
					                                f32 %719 = OpLoad %309 
					                              f32_4 %720 = OpCompositeConstruct %719 %719 %719 %719 
					                              f32_4 %721 = OpFMul %718 %720 
					                              f32_4 %722 = OpLoad %36 
					                              f32_4 %723 = OpFAdd %721 %722 
					                                             OpStore %36 %723 
					                              f32_4 %724 = OpLoad %201 
					                                f32 %725 = OpLoad %363 
					                              f32_4 %726 = OpCompositeConstruct %725 %725 %725 %725 
					                              f32_4 %727 = OpFMul %724 %726 
					                              f32_4 %728 = OpLoad %36 
					                              f32_4 %729 = OpFAdd %727 %728 
					                                             OpStore %36 %729 
					                              f32_4 %730 = OpLoad %403 
					                              f32_3 %731 = OpLoad %374 
					                              f32_4 %732 = OpVectorShuffle %731 %731 0 0 0 0 
					                              f32_4 %733 = OpFMul %730 %732 
					                              f32_4 %734 = OpLoad %36 
					                              f32_4 %735 = OpFAdd %733 %734 
					                                             OpStore %36 %735 
					                              f32_4 %736 = OpLoad %480 
					                                f32 %737 = OpLoad %510 
					                              f32_4 %738 = OpCompositeConstruct %737 %737 %737 %737 
					                              f32_4 %739 = OpFMul %736 %738 
					                              f32_4 %740 = OpLoad %36 
					                              f32_4 %741 = OpFAdd %739 %740 
					                                             OpStore %36 %741 
					                              f32_4 %742 = OpLoad %521 
					                                f32 %743 = OpLoad %577 
					                              f32_4 %744 = OpCompositeConstruct %743 %743 %743 %743 
					                              f32_4 %745 = OpFMul %742 %744 
					                              f32_4 %746 = OpLoad %36 
					                              f32_4 %747 = OpFAdd %745 %746 
					                                             OpStore %36 %747 
					                              f32_4 %748 = OpLoad %444 
					                              f32_3 %749 = OpLoad %652 
					                              f32_4 %750 = OpVectorShuffle %749 %749 0 0 0 0 
					                              f32_4 %751 = OpFMul %748 %750 
					                              f32_4 %752 = OpLoad %36 
					                              f32_4 %753 = OpFAdd %751 %752 
					                                             OpStore %36 %753 
					                       Private f32* %754 = OpAccessChain %658 %146 
					                                f32 %755 = OpLoad %754 
					                                f32 %756 = OpFDiv %98 %755 
					                       Private f32* %757 = OpAccessChain %658 %146 
					                                             OpStore %757 %756 
					                       Private f32* %758 = OpAccessChain %658 %146 
					                                f32 %759 = OpLoad %758 
					                                f32 %760 = OpExtInst %1 40 %759 %29 
					                       Private f32* %761 = OpAccessChain %652 %146 
					                                             OpStore %761 %760 
					                       Private f32* %762 = OpAccessChain %652 %146 
					                                f32 %763 = OpLoad %762 
					                                f32 %764 = OpExtInst %1 31 %763 
					                       Private f32* %765 = OpAccessChain %652 %146 
					                                             OpStore %765 %764 
					                       Private f32* %766 = OpAccessChain %652 %146 
					                                f32 %767 = OpLoad %766 
					                       Private f32* %768 = OpAccessChain %36 %75 
					                                f32 %769 = OpLoad %768 
					                                f32 %770 = OpFMul %767 %769 
					                       Private f32* %771 = OpAccessChain %652 %146 
					                                             OpStore %771 %770 
					                       Private f32* %774 = OpAccessChain %652 %146 
					                                f32 %775 = OpLoad %774 
					                                f32 %776 = OpExtInst %1 37 %775 %98 
					                        Output f32* %778 = OpAccessChain %773 %75 
					                                             OpStore %778 %776 
					                              f32_3 %779 = OpLoad %658 
					                              f32_3 %780 = OpVectorShuffle %779 %779 0 0 0 
					                              f32_4 %781 = OpLoad %36 
					                              f32_3 %782 = OpVectorShuffle %781 %781 0 1 2 
					                              f32_3 %783 = OpFMul %780 %782 
					                                             OpStore %652 %783 
					                              f32_4 %784 = OpLoad %36 
					                              f32_3 %785 = OpVectorShuffle %784 %784 0 1 2 
					                              f32_3 %786 = OpFNegate %785 
					                              f32_3 %787 = OpLoad %658 
					                              f32_3 %788 = OpVectorShuffle %787 %787 0 0 0 
					                              f32_3 %789 = OpFMul %786 %788 
					                              f32_3 %790 = OpFAdd %789 %107 
					                              f32_4 %791 = OpLoad %36 
					                              f32_4 %792 = OpVectorShuffle %791 %790 4 5 6 3 
					                                             OpStore %36 %792 
					                              f32_3 %793 = OpLoad %652 
					                              f32_4 %794 = OpLoad %36 
					                              f32_3 %795 = OpVectorShuffle %794 %794 0 1 2 
					                              f32_3 %796 = OpFDiv %793 %795 
					                              f32_4 %797 = OpLoad %36 
					                              f32_4 %798 = OpVectorShuffle %797 %796 4 5 6 3 
					                                             OpStore %36 %798 
					                       Uniform i32* %799 = OpAccessChain %40 %118 
					                                i32 %800 = OpLoad %799 
					                               bool %801 = OpINotEqual %800 %41 
					                                             OpSelectionMerge %804 None 
					                                             OpBranchConditional %801 %803 %807 
					                                    %803 = OpLabel 
					                              f32_4 %805 = OpLoad %36 
					                              f32_3 %806 = OpVectorShuffle %805 %805 0 1 2 
					                                             OpStore %802 %806 
					                                             OpBranch %804 
					                                    %807 = OpLabel 
					                              f32_3 %808 = OpLoad %652 
					                                             OpStore %802 %808 
					                                             OpBranch %804 
					                                    %804 = OpLabel 
					                              f32_3 %809 = OpLoad %802 
					                              f32_4 %810 = OpLoad %773 
					                              f32_4 %811 = OpVectorShuffle %810 %809 4 5 6 3 
					                                             OpStore %773 %811 
					                                             OpReturn
					                                    %813 = OpLabel 
					                              f32_4 %814 = OpLoad %63 
					                              f32_3 %815 = OpVectorShuffle %814 %814 0 1 2 
					                              f32_4 %816 = OpLoad %104 
					                              f32_3 %817 = OpVectorShuffle %816 %816 0 1 2 
					                              f32_3 %818 = OpFAdd %815 %817 
					                                             OpStore %658 %818 
					                              f32_4 %819 = OpLoad %211 
					                              f32_3 %820 = OpVectorShuffle %819 %819 0 1 2 
					                              f32_3 %821 = OpLoad %658 
					                              f32_3 %822 = OpFAdd %820 %821 
					                                             OpStore %658 %822 
					                              f32_4 %823 = OpLoad %252 
					                              f32_3 %824 = OpVectorShuffle %823 %823 0 1 2 
					                              f32_3 %825 = OpLoad %658 
					                              f32_3 %826 = OpFAdd %824 %825 
					                                             OpStore %658 %826 
					                              f32_4 %827 = OpLoad %201 
					                              f32_3 %828 = OpVectorShuffle %827 %827 0 1 2 
					                              f32_3 %829 = OpLoad %658 
					                              f32_3 %830 = OpFAdd %828 %829 
					                                             OpStore %658 %830 
					                              f32_4 %831 = OpLoad %403 
					                              f32_3 %832 = OpVectorShuffle %831 %831 0 1 2 
					                              f32_3 %833 = OpLoad %658 
					                              f32_3 %834 = OpFAdd %832 %833 
					                                             OpStore %658 %834 
					                              f32_4 %835 = OpLoad %480 
					                              f32_3 %836 = OpVectorShuffle %835 %835 0 1 2 
					                              f32_3 %837 = OpLoad %658 
					                              f32_3 %838 = OpFAdd %836 %837 
					                                             OpStore %658 %838 
					                              f32_4 %839 = OpLoad %521 
					                              f32_3 %840 = OpVectorShuffle %839 %839 0 1 2 
					                              f32_3 %841 = OpLoad %658 
					                              f32_3 %842 = OpFAdd %840 %841 
					                                             OpStore %658 %842 
					                              f32_4 %843 = OpLoad %444 
					                              f32_3 %844 = OpVectorShuffle %843 %843 0 1 2 
					                              f32_3 %845 = OpLoad %658 
					                              f32_3 %846 = OpFAdd %844 %845 
					                                             OpStore %658 %846 
					                              f32_3 %847 = OpLoad %658 
					                              f32_3 %850 = OpFMul %847 %849 
					                              f32_4 %851 = OpLoad %36 
					                              f32_4 %852 = OpVectorShuffle %851 %850 4 5 6 3 
					                                             OpStore %36 %852 
					                              f32_3 %853 = OpLoad %658 
					                              f32_3 %854 = OpFNegate %853 
					                              f32_3 %855 = OpFMul %854 %849 
					                              f32_3 %856 = OpFAdd %855 %107 
					                                             OpStore %658 %856 
					                              f32_4 %857 = OpLoad %36 
					                              f32_3 %858 = OpVectorShuffle %857 %857 0 1 2 
					                              f32_3 %859 = OpLoad %658 
					                              f32_3 %860 = OpFDiv %858 %859 
					                                             OpStore %658 %860 
					                       Uniform i32* %861 = OpAccessChain %40 %118 
					                                i32 %862 = OpLoad %861 
					                               bool %863 = OpINotEqual %862 %41 
					                                             OpSelectionMerge %866 None 
					                                             OpBranchConditional %863 %865 %868 
					                                    %865 = OpLabel 
					                              f32_3 %867 = OpLoad %658 
					                                             OpStore %864 %867 
					                                             OpBranch %866 
					                                    %868 = OpLabel 
					                              f32_4 %869 = OpLoad %36 
					                              f32_3 %870 = OpVectorShuffle %869 %869 0 1 2 
					                                             OpStore %864 %870 
					                                             OpBranch %866 
					                                    %866 = OpLabel 
					                              f32_3 %871 = OpLoad %864 
					                              f32_4 %872 = OpLoad %773 
					                              f32_4 %873 = OpVectorShuffle %872 %871 4 5 6 3 
					                                             OpStore %773 %873 
					                        Output f32* %874 = OpAccessChain %773 %75 
					                                             OpStore %874 %97 
					                                             OpReturn
					                                    %700 = OpLabel 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[22];
						int _HighlightSuppression;
						vec4 unused_0_4[5];
						vec4 _Axis;
						vec4 unused_0_6;
					};
					uniform  sampler2D _NormalAndRoughnessTexture;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec3 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat10_7;
					float u_xlat8;
					vec4 u_xlat9;
					vec4 u_xlat10;
					vec3 u_xlat16_10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec4 u_xlat12;
					vec3 u_xlat16_12;
					vec4 u_xlat10_12;
					vec4 u_xlat13;
					vec3 u_xlat16_13;
					vec4 u_xlat10_13;
					vec3 u_xlat14;
					vec3 u_xlat16;
					vec3 u_xlat16_16;
					vec3 u_xlat22;
					vec3 u_xlat16_22;
					bool u_xlatb28;
					float u_xlat29;
					float u_xlat16_29;
					float u_xlat30;
					float u_xlat36;
					float u_xlat42;
					float u_xlat43;
					float u_xlat44;
					float u_xlat50;
					void main()
					{
					    u_xlat10_0 = texture(_NormalAndRoughnessTexture, vs_TEXCOORD1.xy);
					    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xy = _MainTex_TexelSize.xy * _Axis.xy;
					    u_xlat2 = u_xlat1.xyxy * vec4(-8.0, -8.0, -6.0, -6.0) + vs_TEXCOORD1.xyxy;
					    u_xlat3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat42 = u_xlat3.w * 0.0524999984;
					    u_xlat10_4 = texture(_NormalAndRoughnessTexture, u_xlat2.xy);
					    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_29 = dot(u_xlat16_0.xyz, u_xlat16_4.xyz);
					    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
					    u_xlat43 = u_xlat42 * u_xlat16_29;
					    u_xlat4.xyz = u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat4.xyz = u_xlat3.xyz / u_xlat4.xyz;
					    u_xlat3.xyz = (_HighlightSuppression != 0) ? u_xlat4.xyz : u_xlat3.xyz;
					    u_xlat4 = texture(_MainTex, u_xlat2.zw);
					    u_xlat2.x = u_xlat4.w * 0.075000003;
					    u_xlat10_5 = texture(_NormalAndRoughnessTexture, u_xlat2.zw);
					    u_xlat16_16.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_16.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat2.x = u_xlat16_16.x * u_xlat2.x;
					    u_xlat42 = u_xlat42 * u_xlat16_29 + u_xlat2.x;
					    u_xlat16.xyz = u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat16.xyz = u_xlat4.xyz / u_xlat16.xyz;
					    u_xlat4.xyz = (_HighlightSuppression != 0) ? u_xlat16.xyz : u_xlat4.xyz;
					    u_xlat5 = u_xlat1.xyxy * vec4(-4.0, -4.0, -2.0, -2.0) + vs_TEXCOORD1.xyxy;
					    u_xlat6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat29 = u_xlat6.w * 0.109999999;
					    u_xlat10_7 = texture(_NormalAndRoughnessTexture, u_xlat5.xy);
					    u_xlat16_16.xyz = u_xlat10_7.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_16.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat30 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat7.xyz = u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat7.xyz = u_xlat6.xyz / u_xlat7.xyz;
					    u_xlat6.xyz = (_HighlightSuppression != 0) ? u_xlat7.xyz : u_xlat6.xyz;
					    u_xlat7 = texture(_MainTex, u_xlat5.zw);
					    u_xlat29 = u_xlat7.w * 0.150000006;
					    u_xlat10_5 = texture(_NormalAndRoughnessTexture, u_xlat5.zw);
					    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_5.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat44 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat5.xyz = u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat5.xyz = u_xlat7.xyz / u_xlat5.xyz;
					    u_xlat7.xyz = (_HighlightSuppression != 0) ? u_xlat5.xyz : u_xlat7.xyz;
					    u_xlat5 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat29 = u_xlat5.w * 0.224999994;
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
					    u_xlat16_16.x = min(u_xlat16_16.x, 1.0);
					    u_xlat8 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat22.xyz = u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat22.xyz = u_xlat5.xyz / u_xlat22.xyz;
					    u_xlat5.xyz = (_HighlightSuppression != 0) ? u_xlat22.xyz : u_xlat5.xyz;
					    u_xlat22.xy = u_xlat1.xy * vec2(2.0, 2.0) + vs_TEXCOORD1.xy;
					    u_xlat9 = texture(_MainTex, u_xlat22.xy);
					    u_xlat29 = u_xlat9.w * 0.150000006;
					    u_xlat10_10 = texture(_NormalAndRoughnessTexture, u_xlat22.xy);
					    u_xlat16_22.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_22.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat22.x = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat10.xyz = u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = u_xlat9.xyz / u_xlat10.xyz;
					    u_xlat9.xyz = (_HighlightSuppression != 0) ? u_xlat10.xyz : u_xlat9.xyz;
					    u_xlat10 = u_xlat1.xyxy * vec4(4.0, 4.0, 6.0, 6.0) + vs_TEXCOORD1.xyxy;
					    u_xlat11 = texture(_MainTex, u_xlat10.xy);
					    u_xlat29 = u_xlat11.w * 0.109999999;
					    u_xlat10_12 = texture(_NormalAndRoughnessTexture, u_xlat10.xy);
					    u_xlat16_12.xyz = u_xlat10_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_12.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat36 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat12.xyz = u_xlat11.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat12.xyz = u_xlat11.xyz / u_xlat12.xyz;
					    u_xlat11.xyz = (_HighlightSuppression != 0) ? u_xlat12.xyz : u_xlat11.xyz;
					    u_xlat12 = texture(_MainTex, u_xlat10.zw);
					    u_xlat29 = u_xlat12.w * 0.075000003;
					    u_xlat10_10 = texture(_NormalAndRoughnessTexture, u_xlat10.zw);
					    u_xlat16_10.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_16.x = dot(u_xlat16_0.xyz, u_xlat16_10.xyz);
					    u_xlat16_16.x = clamp(u_xlat16_16.x, 0.0, 1.0);
					    u_xlat50 = u_xlat29 * u_xlat16_16.x;
					    u_xlat42 = u_xlat29 * u_xlat16_16.x + u_xlat42;
					    u_xlat10.xyz = u_xlat12.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat10.xyz = u_xlat12.xyz / u_xlat10.xyz;
					    u_xlat12.xyz = (_HighlightSuppression != 0) ? u_xlat10.xyz : u_xlat12.xyz;
					    u_xlat1.xy = u_xlat1.xy * vec2(8.0, 8.0) + vs_TEXCOORD1.xy;
					    u_xlat10 = texture(_MainTex, u_xlat1.xy);
					    u_xlat29 = u_xlat10.w * 0.0524999984;
					    u_xlat10_13 = texture(_NormalAndRoughnessTexture, u_xlat1.xy);
					    u_xlat16_13.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat16_13.xyz);
					    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
					    u_xlat14.x = u_xlat16_0.x * u_xlat29;
					    u_xlat0.x = u_xlat29 * u_xlat16_0.x + u_xlat42;
					    u_xlat1.xyz = u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat10.xyz / u_xlat1.xyz;
					    u_xlat10.xyz = (_HighlightSuppression != 0) ? u_xlat1.xyz : u_xlat10.xyz;
					    u_xlatb28 = 0.00999999978<u_xlat0.x;
					    if(u_xlatb28){
					        u_xlat13 = u_xlat2.xxxx * u_xlat4;
					        u_xlat1 = u_xlat3 * vec4(u_xlat43) + u_xlat13;
					        u_xlat1 = u_xlat6 * vec4(u_xlat30) + u_xlat1;
					        u_xlat1 = u_xlat7 * vec4(u_xlat44) + u_xlat1;
					        u_xlat1 = u_xlat5 * vec4(u_xlat8) + u_xlat1;
					        u_xlat1 = u_xlat9 * u_xlat22.xxxx + u_xlat1;
					        u_xlat1 = u_xlat11 * vec4(u_xlat36) + u_xlat1;
					        u_xlat1 = u_xlat12 * vec4(u_xlat50) + u_xlat1;
					        u_xlat1 = u_xlat10 * u_xlat14.xxxx + u_xlat1;
					        u_xlat0.x = float(1.0) / u_xlat0.x;
					        u_xlat14.x = max(u_xlat0.x, 2.0);
					        u_xlat14.x = sqrt(u_xlat14.x);
					        u_xlat14.x = u_xlat14.x * u_xlat1.w;
					        SV_Target0.w = min(u_xlat14.x, 1.0);
					        u_xlat14.xyz = u_xlat0.xxx * u_xlat1.xyz;
					        u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat0.xxx + vec3(1.0, 1.0, 1.0);
					        u_xlat1.xyz = u_xlat14.xyz / u_xlat1.xyz;
					        SV_Target0.xyz = (_HighlightSuppression != 0) ? u_xlat1.xyz : u_xlat14.xyz;
					        return;
					    } else {
					        u_xlat0.xyz = u_xlat3.xyz + u_xlat4.xyz;
					        u_xlat0.xyz = u_xlat6.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat7.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat9.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat11.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat12.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat10.xyz + u_xlat0.xyz;
					        u_xlat1.xyz = u_xlat0.xyz * vec3(0.111111112, 0.111111112, 0.111111112);
					        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.111111112, 0.111111112, 0.111111112) + vec3(1.0, 1.0, 1.0);
					        u_xlat0.xyz = u_xlat1.xyz / u_xlat0.xyz;
					        SV_Target0.xyz = (_HighlightSuppression != 0) ? u_xlat0.xyz : u_xlat1.xyz;
					        SV_Target0.w = 0.0;
					        return;
					    //ENDIF
					    }
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 253458
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	vec4 _ProjInfo;
					uniform 	vec4 hlslcc_mtx4x4_WorldToCameraMatrix[4];
					uniform 	vec2 _ReflectionBufferSize;
					uniform 	int _HalfResolution;
					uniform 	float _ScreenEdgeFading;
					uniform 	int _BilateralUpsampling;
					uniform 	float _PixelsPerMeterAtOneMeter;
					UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture1;
					UNITY_LOCATION(1) uniform  sampler2D _HitPointTexture;
					UNITY_LOCATION(2) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(3) uniform  sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(4) uniform  sampler2D _ReflectionTexture0;
					UNITY_LOCATION(5) uniform  sampler2D _ReflectionTexture1;
					UNITY_LOCATION(6) uniform  sampler2D _ReflectionTexture2;
					UNITY_LOCATION(7) uniform  sampler2D _ReflectionTexture3;
					UNITY_LOCATION(8) uniform  sampler2D _ReflectionTexture4;
					UNITY_LOCATION(9) uniform  sampler2D _NormalAndRoughnessTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat16_8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec3 u_xlat16_9;
					vec4 u_xlat10_9;
					vec3 u_xlat16_10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec3 u_xlat16_11;
					vec4 u_xlat10_11;
					vec4 u_xlat10_12;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					vec3 u_xlat14;
					float u_xlat16_14;
					bool u_xlatb14;
					float u_xlat15;
					vec3 u_xlat16_15;
					vec2 u_xlat16;
					float u_xlat16_16;
					vec2 u_xlat26;
					float u_xlat16_26;
					int u_xlati26;
					bool u_xlatb26;
					vec2 u_xlat27;
					vec2 u_xlat28;
					float u_xlat16_28;
					vec2 u_xlat29;
					float u_xlat16_29;
					float u_xlat39;
					int u_xlati39;
					float u_xlat40;
					float u_xlat16_41;
					void main()
					{
					    u_xlat10_0 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    u_xlat16_0 = (-u_xlat10_0.w) + 1.0;
					    u_xlat10_1 = texture(_HitPointTexture, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat13.x = _ZBufferParams.z * u_xlat10_2.x + _ZBufferParams.w;
					    u_xlat13.x = float(1.0) / u_xlat13.x;
					    u_xlat2.z = (-u_xlat13.x);
					    u_xlat13.xy = vs_TEXCOORD1.xy * _MainTex_TexelSize.zw;
					    u_xlat13.xy = u_xlat13.xy * _ProjInfo.xy + _ProjInfo.zw;
					    u_xlat2.xy = u_xlat2.zz * u_xlat13.xy;
					    u_xlat10_3 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					    u_xlat16_13.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyw = u_xlat16_13.yyy * hlslcc_mtx4x4_WorldToCameraMatrix[1].xyz;
					    u_xlat1.xyw = hlslcc_mtx4x4_WorldToCameraMatrix[0].xyz * u_xlat16_13.xxx + u_xlat1.xyw;
					    u_xlat13.xyz = hlslcc_mtx4x4_WorldToCameraMatrix[2].xyz * u_xlat16_13.zzz + u_xlat1.xyw;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat13.xyz, (-u_xlat1.xyw));
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx + u_xlat1.xyw;
					    u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat13.x = inversesqrt(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * u_xlat13.z;
					    u_xlat13.x = u_xlat13.x * u_xlat10_1.z + u_xlat2.z;
					    u_xlat16_26 = log2(u_xlat16_0);
					    u_xlat16_26 = u_xlat16_26 * 1.33333337;
					    u_xlat16_26 = exp2(u_xlat16_26);
					    u_xlat16_26 = u_xlat10_1.z * u_xlat16_26;
					    u_xlat26.x = u_xlat16_26 * _PixelsPerMeterAtOneMeter;
					    u_xlat13.x = u_xlat26.x / u_xlat13.x;
					    u_xlatb26 = _HalfResolution==1;
					    u_xlat39 = u_xlat13.x * 0.5;
					    u_xlat13.x = (u_xlatb26) ? u_xlat39 : u_xlat13.x;
					    u_xlat13.x = u_xlat13.x + 15.0;
					    u_xlat13.x = u_xlat13.x * 0.0625;
					    u_xlat13.x = log2(u_xlat13.x);
					    u_xlat13.x = min(u_xlat13.x, 4.0);
					    u_xlat13.x = max(u_xlat13.x, 0.0);
					    u_xlati26 = int(u_xlat13.x);
					    u_xlati39 = u_xlati26 + 1;
					    u_xlati39 = min(u_xlati39, 4);
					    u_xlat1.x = trunc(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x + (-u_xlat1.x);
					    u_xlatb1 = _BilateralUpsampling==1;
					    if(u_xlatb1){
					        u_xlat1.x = float((-u_xlati26));
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1 = u_xlat1.xxxx * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y);
					        u_xlat1 = floor(u_xlat1);
					        u_xlat2 = vs_TEXCOORD1.xyxy * u_xlat1.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat2 = floor(u_xlat2);
					        u_xlat2 = u_xlat2 + vec4(1.5, 0.5, 0.5, 1.5);
					        u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					        u_xlat3 = u_xlat2 * u_xlat3;
					        if(u_xlati26 == 0) {
					            u_xlat4 = textureLod(_ReflectionTexture0, u_xlat3.zy, 0.0);
					            u_xlat5 = textureLod(_ReflectionTexture0, u_xlat3.xy, 0.0);
					            u_xlat6 = textureLod(_ReflectionTexture0, u_xlat3.zw, 0.0);
					            u_xlat7 = textureLod(_ReflectionTexture0, u_xlat3.xw, 0.0);
					        } else {
					            u_xlatb1 = u_xlati26==1;
					            if(u_xlatb1){
					                u_xlat4 = textureLod(_ReflectionTexture1, u_xlat3.zy, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat4 = textureLod(_ReflectionTexture2, u_xlat3.zy, 0.0);
					                } else {
					                    u_xlatb14 = u_xlati26==3;
					                    if(u_xlatb14){
					                        u_xlat4 = textureLod(_ReflectionTexture3, u_xlat3.zy, 0.0);
					                    } else {
					                        u_xlat4 = textureLod(_ReflectionTexture4, u_xlat3.zy, 0.0);
					                    }
					                }
					            }
					            if(u_xlatb1){
					                u_xlat5 = textureLod(_ReflectionTexture1, u_xlat3.xy, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat5 = textureLod(_ReflectionTexture2, u_xlat3.xy, 0.0);
					                } else {
					                    u_xlatb14 = u_xlati26==3;
					                    if(u_xlatb14){
					                        u_xlat5 = textureLod(_ReflectionTexture3, u_xlat3.xy, 0.0);
					                    } else {
					                        u_xlat5 = textureLod(_ReflectionTexture4, u_xlat3.xy, 0.0);
					                    }
					                }
					            }
					            if(u_xlatb1){
					                u_xlat6 = textureLod(_ReflectionTexture1, u_xlat3.zw, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat6 = textureLod(_ReflectionTexture2, u_xlat3.zw, 0.0);
					                } else {
					                    u_xlatb14 = u_xlati26==3;
					                    if(u_xlatb14){
					                        u_xlat6 = textureLod(_ReflectionTexture3, u_xlat3.zw, 0.0);
					                    } else {
					                        u_xlat6 = textureLod(_ReflectionTexture4, u_xlat3.zw, 0.0);
					                    }
					                }
					            }
					            if(u_xlatb1){
					                u_xlat7 = textureLod(_ReflectionTexture1, u_xlat3.xw, 0.0);
					            } else {
					                u_xlatb1 = u_xlati26==2;
					                if(u_xlatb1){
					                    u_xlat7 = textureLod(_ReflectionTexture2, u_xlat3.xw, 0.0);
					                } else {
					                    u_xlatb1 = u_xlati26==3;
					                    if(u_xlatb1){
					                        u_xlat7 = textureLod(_ReflectionTexture3, u_xlat3.xw, 0.0);
					                    } else {
					                        u_xlat7 = textureLod(_ReflectionTexture4, u_xlat3.xw, 0.0);
					                    }
					                }
					            }
					        }
					        u_xlat1.xy = vs_TEXCOORD1.xy * u_xlat1.zw + (-u_xlat2.zy);
					        u_xlat27.xy = (-u_xlat1.yx) + vec2(1.0, 1.0);
					        u_xlat2.x = u_xlat27.x * u_xlat27.y;
					        u_xlat27.xy = u_xlat27.xy * u_xlat1.xy;
					        u_xlat1.x = u_xlat1.y * u_xlat1.x;
					        u_xlat8 = vec4(1.0, 1.0, 1.0, 1.0) / vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y);
					        u_xlat9 = u_xlat3.zyxw * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat9 = floor(u_xlat9);
					        u_xlat9 = u_xlat9 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat9 = u_xlat8 * u_xlat9;
					        u_xlat3 = u_xlat3 * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat3 = floor(u_xlat3);
					        u_xlat3 = u_xlat3 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat3 = u_xlat8 * u_xlat3;
					        u_xlat10_10 = textureLod(_NormalAndRoughnessTexture, vs_TEXCOORD1.xy, 0.0);
					        u_xlat16_15.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat10_11 = textureLod(_NormalAndRoughnessTexture, u_xlat9.xy, 0.0);
					        u_xlat10_12 = textureLod(_NormalAndRoughnessTexture, u_xlat3.xy, 0.0);
					        u_xlat10_3 = textureLod(_NormalAndRoughnessTexture, u_xlat3.zw, 0.0);
					        u_xlat10_9 = textureLod(_NormalAndRoughnessTexture, u_xlat9.zw, 0.0);
					        u_xlat16_10.xyz = u_xlat10_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_11.xyz = u_xlat10_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_9.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_14 = dot(u_xlat16_15.xyz, u_xlat16_10.xyz);
					        u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
					        u_xlat14.x = u_xlat16_14 * u_xlat2.x;
					        u_xlat16_2 = dot(u_xlat16_15.xyz, u_xlat16_11.xyz);
					        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					        u_xlat27.x = u_xlat27.x * u_xlat16_2;
					        u_xlat16_2 = dot(u_xlat16_15.xyz, u_xlat16_3.xyz);
					        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					        u_xlat40 = u_xlat27.y * u_xlat16_2;
					        u_xlat16_2 = dot(u_xlat16_15.xyz, u_xlat16_9.xyz);
					        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					        u_xlat1.x = u_xlat1.x * u_xlat16_2;
					        u_xlat16_2 = u_xlat10_10.w + (-u_xlat10_11.w);
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.y = u_xlat14.x * u_xlat16_2;
					        u_xlat16_2 = u_xlat10_10.w + (-u_xlat10_12.w);
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.z = u_xlat27.x * u_xlat16_2;
					        u_xlat16_2 = (-u_xlat10_3.w) + u_xlat10_10.w;
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.w = u_xlat40 * u_xlat16_2;
					        u_xlat16_2 = (-u_xlat10_9.w) + u_xlat10_10.w;
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.x = u_xlat1.x * u_xlat16_2;
					        u_xlat1 = max(u_xlat1, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
					        u_xlat2.x = u_xlat1.z + u_xlat1.y;
					        u_xlat2.x = u_xlat1.w + u_xlat2.x;
					        u_xlat2.x = u_xlat1.x + u_xlat2.x;
					        u_xlat2.x = float(1.0) / u_xlat2.x;
					        u_xlat3 = u_xlat1.zzzz * u_xlat5;
					        u_xlat3 = u_xlat4 * u_xlat1.yyyy + u_xlat3;
					        u_xlat3 = u_xlat6 * u_xlat1.wwww + u_xlat3;
					        u_xlat1 = u_xlat7 * u_xlat1.xxxx + u_xlat3;
					        u_xlat1 = u_xlat2.xxxx * u_xlat1;
					        u_xlat2.x = float((-u_xlati39));
					        u_xlat2.x = exp2(u_xlat2.x);
					        u_xlat3 = u_xlat2.xxxx * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y);
					        u_xlat3 = floor(u_xlat3);
					        u_xlat4 = vs_TEXCOORD1.xyxy * u_xlat3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat4 = floor(u_xlat4);
					        u_xlat4 = u_xlat4 + vec4(1.5, 0.5, 0.5, 1.5);
					        u_xlat5 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					        u_xlat5 = u_xlat4 * u_xlat5;
					        u_xlatb2 = u_xlati39==1;
					        if(u_xlatb2){
					            u_xlat6 = textureLod(_ReflectionTexture1, u_xlat5.zy, 0.0);
					            u_xlat7 = textureLod(_ReflectionTexture1, u_xlat5.xy, 0.0);
					            u_xlat9 = textureLod(_ReflectionTexture1, u_xlat5.zw, 0.0);
					            u_xlat11 = textureLod(_ReflectionTexture1, u_xlat5.xw, 0.0);
					        } else {
					            u_xlatb2 = u_xlati39==2;
					            if(u_xlatb2){
					                u_xlat6 = textureLod(_ReflectionTexture2, u_xlat5.zy, 0.0);
					            } else {
					                u_xlatb3 = u_xlati39==3;
					                if(u_xlatb3){
					                    u_xlat6 = textureLod(_ReflectionTexture3, u_xlat5.zy, 0.0);
					                } else {
					                    u_xlat6 = textureLod(_ReflectionTexture4, u_xlat5.zy, 0.0);
					                }
					            }
					            if(u_xlatb2){
					                u_xlat7 = textureLod(_ReflectionTexture2, u_xlat5.xy, 0.0);
					            } else {
					                u_xlatb3 = u_xlati39==3;
					                if(u_xlatb3){
					                    u_xlat7 = textureLod(_ReflectionTexture3, u_xlat5.xy, 0.0);
					                } else {
					                    u_xlat7 = textureLod(_ReflectionTexture4, u_xlat5.xy, 0.0);
					                }
					            }
					            if(u_xlatb2){
					                u_xlat9 = textureLod(_ReflectionTexture2, u_xlat5.zw, 0.0);
					            } else {
					                u_xlatb3 = u_xlati39==3;
					                if(u_xlatb3){
					                    u_xlat9 = textureLod(_ReflectionTexture3, u_xlat5.zw, 0.0);
					                } else {
					                    u_xlat9 = textureLod(_ReflectionTexture4, u_xlat5.zw, 0.0);
					                }
					            }
					            if(u_xlatb2){
					                u_xlat11 = textureLod(_ReflectionTexture2, u_xlat5.xw, 0.0);
					            } else {
					                u_xlatb2 = u_xlati39==3;
					                if(u_xlatb2){
					                    u_xlat11 = textureLod(_ReflectionTexture3, u_xlat5.xw, 0.0);
					                } else {
					                    u_xlat11 = textureLod(_ReflectionTexture4, u_xlat5.xw, 0.0);
					                }
					            }
					        }
					        u_xlat3.xy = vs_TEXCOORD1.xy * u_xlat3.zw + (-u_xlat4.zy);
					        u_xlat29.xy = (-u_xlat3.yx) + vec2(1.0, 1.0);
					        u_xlat2.x = u_xlat29.x * u_xlat29.y;
					        u_xlat29.xy = u_xlat29.xy * u_xlat3.xy;
					        u_xlat3.x = u_xlat3.y * u_xlat3.x;
					        u_xlat4 = u_xlat5.zyxw * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat4 = floor(u_xlat4);
					        u_xlat4 = u_xlat4 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat4 = u_xlat8 * u_xlat4;
					        u_xlat5 = u_xlat5 * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat5 = floor(u_xlat5);
					        u_xlat5 = u_xlat5 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat5 = u_xlat8 * u_xlat5;
					        u_xlat10_8 = textureLod(_NormalAndRoughnessTexture, u_xlat4.xy, 0.0);
					        u_xlat10_12 = textureLod(_NormalAndRoughnessTexture, u_xlat5.xy, 0.0);
					        u_xlat10_5 = textureLod(_NormalAndRoughnessTexture, u_xlat5.zw, 0.0);
					        u_xlat10_4 = textureLod(_NormalAndRoughnessTexture, u_xlat4.zw, 0.0);
					        u_xlat16_8.xyz = u_xlat10_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_10.xyz = u_xlat10_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_16 = dot(u_xlat16_15.xyz, u_xlat16_8.xyz);
					        u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
					        u_xlat2.x = u_xlat2.x * u_xlat16_16;
					        u_xlat16_16 = dot(u_xlat16_15.xyz, u_xlat16_10.xyz);
					        u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
					        u_xlat16.x = u_xlat16_16 * u_xlat29.x;
					        u_xlat16_29 = dot(u_xlat16_15.xyz, u_xlat16_5.xyz);
					        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
					        u_xlat16.y = u_xlat16_29 * u_xlat29.y;
					        u_xlat16_15.x = dot(u_xlat16_15.xyz, u_xlat16_4.xyz);
					        u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
					        u_xlat15 = u_xlat16_15.x * u_xlat3.x;
					        u_xlat16_28 = (-u_xlat10_8.w) + u_xlat10_10.w;
					        u_xlat16_28 = sqrt(abs(u_xlat16_28));
					        u_xlat16_28 = sqrt(u_xlat16_28);
					        u_xlat16_28 = (-u_xlat16_28) + 1.0;
					        u_xlat2.x = u_xlat16_28 * u_xlat2.x;
					        u_xlat16_28 = u_xlat10_10.w + (-u_xlat10_12.w);
					        u_xlat16_28 = sqrt(abs(u_xlat16_28));
					        u_xlat16_28 = sqrt(u_xlat16_28);
					        u_xlat28.x = (-u_xlat16_28) + 1.0;
					        u_xlat16_41 = (-u_xlat10_5.w) + u_xlat10_10.w;
					        u_xlat16_41 = sqrt(abs(u_xlat16_41));
					        u_xlat16_41 = sqrt(u_xlat16_41);
					        u_xlat28.y = (-u_xlat16_41) + 1.0;
					        u_xlat2.zw = u_xlat28.xy * u_xlat16.xy;
					        u_xlat16_3.x = (-u_xlat10_4.w) + u_xlat10_10.w;
					        u_xlat16_3.x = sqrt(abs(u_xlat16_3.x));
					        u_xlat16_3.x = sqrt(u_xlat16_3.x);
					        u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
					        u_xlat2.y = u_xlat15 * u_xlat16_3.x;
					        u_xlat2 = max(u_xlat2, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
					        u_xlat3.x = u_xlat2.z + u_xlat2.x;
					        u_xlat3.x = u_xlat2.w + u_xlat3.x;
					        u_xlat3.x = u_xlat2.y + u_xlat3.x;
					        u_xlat3.x = float(1.0) / u_xlat3.x;
					        u_xlat4 = u_xlat2.zzzz * u_xlat7;
					        u_xlat4 = u_xlat6 * u_xlat2.xxxx + u_xlat4;
					        u_xlat4 = u_xlat9 * u_xlat2.wwww + u_xlat4;
					        u_xlat2 = u_xlat11 * u_xlat2.yyyy + u_xlat4;
					        u_xlat2 = u_xlat2 * u_xlat3.xxxx + (-u_xlat1);
					        u_xlat1 = u_xlat13.xxxx * u_xlat2.wxyz + u_xlat1.wxyz;
					        SV_Target0.xyz = u_xlat1.yzw;
					    } else {
					        if(u_xlati26 == 0) {
					            u_xlat2 = textureLod(_ReflectionTexture0, vs_TEXCOORD1.xy, 0.0);
					        } else {
					            u_xlatb14 = u_xlati26==1;
					            if(u_xlatb14){
					                u_xlat2 = textureLod(_ReflectionTexture1, vs_TEXCOORD1.xy, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat2 = textureLod(_ReflectionTexture2, vs_TEXCOORD1.xy, 0.0);
					                } else {
					                    u_xlatb26 = u_xlati26==3;
					                    if(u_xlatb26){
					                        u_xlat2 = textureLod(_ReflectionTexture3, vs_TEXCOORD1.xy, 0.0);
					                    } else {
					                        u_xlat2 = textureLod(_ReflectionTexture4, vs_TEXCOORD1.xy, 0.0);
					                    }
					                }
					            }
					        }
					        u_xlatb26 = u_xlati39==1;
					        if(u_xlatb26){
					            u_xlat3 = textureLod(_ReflectionTexture1, vs_TEXCOORD1.xy, 0.0);
					        } else {
					            u_xlatb26 = u_xlati39==2;
					            if(u_xlatb26){
					                u_xlat3 = textureLod(_ReflectionTexture2, vs_TEXCOORD1.xy, 0.0);
					            } else {
					                u_xlatb26 = u_xlati39==3;
					                if(u_xlatb26){
					                    u_xlat3 = textureLod(_ReflectionTexture3, vs_TEXCOORD1.xy, 0.0);
					                } else {
					                    u_xlat3 = textureLod(_ReflectionTexture4, vs_TEXCOORD1.xy, 0.0);
					                }
					            }
					        }
					        u_xlat14.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
					        SV_Target0.xyz = u_xlat13.xxx * u_xlat14.xyz + u_xlat2.xyz;
					        u_xlat1.x = min(u_xlat2.w, u_xlat3.w);
					    }
					    u_xlat13.x = min(u_xlat1.x, 1.0);
					    u_xlat26.xy = (-vs_TEXCOORD1.xy) + vec2(1.0, 1.0);
					    u_xlat26.x = min(u_xlat26.y, u_xlat26.x);
					    u_xlat26.x = min(u_xlat26.x, vs_TEXCOORD1.x);
					    u_xlat39 = _ScreenEdgeFading * 0.100000001 + 0.00100000005;
					    u_xlat26.x = u_xlat26.x / u_xlat39;
					    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
					    u_xlat26.x = log2(u_xlat26.x);
					    u_xlat26.x = u_xlat26.x * 0.200000003;
					    u_xlat26.x = exp2(u_xlat26.x);
					    u_xlat13.x = u_xlat26.x * u_xlat13.x;
					    u_xlat16_0 = u_xlat16_0 * 0.300000012;
					    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    SV_Target0.w = u_xlat16_0 * u_xlat13.x;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 1576
					; Schema: 0
					                                                      OpCapability Shader 
					                                               %1 = OpExtInstImport "GLSL.std.450" 
					                                                      OpMemoryModel Logical GLSL450 
					                                                      OpEntryPoint Fragment %4 "main" %21 %1398 
					                                                      OpExecutionMode %4 OriginUpperLeft 
					                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                      OpDecorate %8 RelaxedPrecision 
					                                                      OpDecorate %11 RelaxedPrecision 
					                                                      OpDecorate %11 DescriptorSet 11 
					                                                      OpDecorate %11 Binding 11 
					                                                      OpDecorate %12 RelaxedPrecision 
					                                                      OpDecorate %15 RelaxedPrecision 
					                                                      OpDecorate %15 DescriptorSet 15 
					                                                      OpDecorate %15 Binding 15 
					                                                      OpDecorate %16 RelaxedPrecision 
					                                                      OpDecorate vs_TEXCOORD1 Location 21 
					                                                      OpDecorate %27 RelaxedPrecision 
					                                                      OpDecorate %28 RelaxedPrecision 
					                                                      OpDecorate %29 RelaxedPrecision 
					                                                      OpDecorate %30 RelaxedPrecision 
					                                                      OpDecorate %32 RelaxedPrecision 
					                                                      OpDecorate %33 RelaxedPrecision 
					                                                      OpDecorate %34 RelaxedPrecision 
					                                                      OpDecorate %34 DescriptorSet 34 
					                                                      OpDecorate %34 Binding 34 
					                                                      OpDecorate %35 RelaxedPrecision 
					                                                      OpDecorate %36 RelaxedPrecision 
					                                                      OpDecorate %36 DescriptorSet 36 
					                                                      OpDecorate %36 Binding 36 
					                                                      OpDecorate %37 RelaxedPrecision 
					                                                      OpDecorate %42 RelaxedPrecision 
					                                                      OpDecorate %45 DescriptorSet 45 
					                                                      OpDecorate %45 Binding 45 
					                                                      OpDecorate %47 DescriptorSet 47 
					                                                      OpDecorate %47 Binding 47 
					                                                      OpDecorate %56 ArrayStride 56 
					                                                      OpMemberDecorate %58 0 Offset 58 
					                                                      OpMemberDecorate %58 1 Offset 58 
					                                                      OpMemberDecorate %58 2 Offset 58 
					                                                      OpMemberDecorate %58 3 Offset 58 
					                                                      OpMemberDecorate %58 4 Offset 58 
					                                                      OpMemberDecorate %58 5 Offset 58 
					                                                      OpMemberDecorate %58 6 Offset 58 
					                                                      OpMemberDecorate %58 7 Offset 58 
					                                                      OpMemberDecorate %58 8 Offset 58 
					                                                      OpDecorate %58 Block 
					                                                      OpDecorate %60 DescriptorSet 60 
					                                                      OpDecorate %60 Binding 60 
					                                                      OpDecorate %107 RelaxedPrecision 
					                                                      OpDecorate %108 RelaxedPrecision 
					                                                      OpDecorate %108 DescriptorSet 108 
					                                                      OpDecorate %108 Binding 108 
					                                                      OpDecorate %109 RelaxedPrecision 
					                                                      OpDecorate %110 RelaxedPrecision 
					                                                      OpDecorate %110 DescriptorSet 110 
					                                                      OpDecorate %110 Binding 110 
					                                                      OpDecorate %111 RelaxedPrecision 
					                                                      OpDecorate %115 RelaxedPrecision 
					                                                      OpDecorate %116 RelaxedPrecision 
					                                                      OpDecorate %117 RelaxedPrecision 
					                                                      OpDecorate %120 RelaxedPrecision 
					                                                      OpDecorate %123 RelaxedPrecision 
					                                                      OpDecorate %125 RelaxedPrecision 
					                                                      OpDecorate %126 RelaxedPrecision 
					                                                      OpDecorate %138 RelaxedPrecision 
					                                                      OpDecorate %139 RelaxedPrecision 
					                                                      OpDecorate %149 RelaxedPrecision 
					                                                      OpDecorate %150 RelaxedPrecision 
					                                                      OpDecorate %215 RelaxedPrecision 
					                                                      OpDecorate %221 RelaxedPrecision 
					                                                      OpDecorate %222 RelaxedPrecision 
					                                                      OpDecorate %223 RelaxedPrecision 
					                                                      OpDecorate %224 RelaxedPrecision 
					                                                      OpDecorate %226 RelaxedPrecision 
					                                                      OpDecorate %227 RelaxedPrecision 
					                                                      OpDecorate %228 RelaxedPrecision 
					                                                      OpDecorate %229 RelaxedPrecision 
					                                                      OpDecorate %230 RelaxedPrecision 
					                                                      OpDecorate %231 RelaxedPrecision 
					                                                      OpDecorate %232 RelaxedPrecision 
					                                                      OpDecorate %234 RelaxedPrecision 
					                                                      OpDecorate %347 RelaxedPrecision 
					                                                      OpDecorate %347 DescriptorSet 347 
					                                                      OpDecorate %347 Binding 347 
					                                                      OpDecorate %348 RelaxedPrecision 
					                                                      OpDecorate %349 RelaxedPrecision 
					                                                      OpDecorate %349 DescriptorSet 349 
					                                                      OpDecorate %349 Binding 349 
					                                                      OpDecorate %350 RelaxedPrecision 
					                                                      OpDecorate %356 RelaxedPrecision 
					                                                      OpDecorate %357 RelaxedPrecision 
					                                                      OpDecorate %363 RelaxedPrecision 
					                                                      OpDecorate %364 RelaxedPrecision 
					                                                      OpDecorate %370 RelaxedPrecision 
					                                                      OpDecorate %371 RelaxedPrecision 
					                                                      OpDecorate %382 RelaxedPrecision 
					                                                      OpDecorate %382 DescriptorSet 382 
					                                                      OpDecorate %382 Binding 382 
					                                                      OpDecorate %383 RelaxedPrecision 
					                                                      OpDecorate %384 RelaxedPrecision 
					                                                      OpDecorate %384 DescriptorSet 384 
					                                                      OpDecorate %384 Binding 384 
					                                                      OpDecorate %385 RelaxedPrecision 
					                                                      OpDecorate %397 RelaxedPrecision 
					                                                      OpDecorate %397 DescriptorSet 397 
					                                                      OpDecorate %397 Binding 397 
					                                                      OpDecorate %398 RelaxedPrecision 
					                                                      OpDecorate %399 RelaxedPrecision 
					                                                      OpDecorate %399 DescriptorSet 399 
					                                                      OpDecorate %399 Binding 399 
					                                                      OpDecorate %400 RelaxedPrecision 
					                                                      OpDecorate %411 RelaxedPrecision 
					                                                      OpDecorate %411 DescriptorSet 411 
					                                                      OpDecorate %411 Binding 411 
					                                                      OpDecorate %412 RelaxedPrecision 
					                                                      OpDecorate %413 RelaxedPrecision 
					                                                      OpDecorate %413 DescriptorSet 413 
					                                                      OpDecorate %413 Binding 413 
					                                                      OpDecorate %414 RelaxedPrecision 
					                                                      OpDecorate %420 RelaxedPrecision 
					                                                      OpDecorate %420 DescriptorSet 420 
					                                                      OpDecorate %420 Binding 420 
					                                                      OpDecorate %421 RelaxedPrecision 
					                                                      OpDecorate %422 RelaxedPrecision 
					                                                      OpDecorate %422 DescriptorSet 422 
					                                                      OpDecorate %422 Binding 422 
					                                                      OpDecorate %423 RelaxedPrecision 
					                                                      OpDecorate %431 RelaxedPrecision 
					                                                      OpDecorate %432 RelaxedPrecision 
					                                                      OpDecorate %443 RelaxedPrecision 
					                                                      OpDecorate %444 RelaxedPrecision 
					                                                      OpDecorate %455 RelaxedPrecision 
					                                                      OpDecorate %456 RelaxedPrecision 
					                                                      OpDecorate %462 RelaxedPrecision 
					                                                      OpDecorate %463 RelaxedPrecision 
					                                                      OpDecorate %471 RelaxedPrecision 
					                                                      OpDecorate %472 RelaxedPrecision 
					                                                      OpDecorate %483 RelaxedPrecision 
					                                                      OpDecorate %484 RelaxedPrecision 
					                                                      OpDecorate %495 RelaxedPrecision 
					                                                      OpDecorate %496 RelaxedPrecision 
					                                                      OpDecorate %502 RelaxedPrecision 
					                                                      OpDecorate %503 RelaxedPrecision 
					                                                      OpDecorate %511 RelaxedPrecision 
					                                                      OpDecorate %512 RelaxedPrecision 
					                                                      OpDecorate %523 RelaxedPrecision 
					                                                      OpDecorate %524 RelaxedPrecision 
					                                                      OpDecorate %535 RelaxedPrecision 
					                                                      OpDecorate %536 RelaxedPrecision 
					                                                      OpDecorate %542 RelaxedPrecision 
					                                                      OpDecorate %543 RelaxedPrecision 
					                                                      OpDecorate %632 RelaxedPrecision 
					                                                      OpDecorate %633 RelaxedPrecision 
					                                                      OpDecorate %633 DescriptorSet 633 
					                                                      OpDecorate %633 Binding 633 
					                                                      OpDecorate %634 RelaxedPrecision 
					                                                      OpDecorate %635 RelaxedPrecision 
					                                                      OpDecorate %635 DescriptorSet 635 
					                                                      OpDecorate %635 Binding 635 
					                                                      OpDecorate %636 RelaxedPrecision 
					                                                      OpDecorate %640 RelaxedPrecision 
					                                                      OpDecorate %641 RelaxedPrecision 
					                                                      OpDecorate %642 RelaxedPrecision 
					                                                      OpDecorate %643 RelaxedPrecision 
					                                                      OpDecorate %644 RelaxedPrecision 
					                                                      OpDecorate %645 RelaxedPrecision 
					                                                      OpDecorate %646 RelaxedPrecision 
					                                                      OpDecorate %647 RelaxedPrecision 
					                                                      OpDecorate %652 RelaxedPrecision 
					                                                      OpDecorate %653 RelaxedPrecision 
					                                                      OpDecorate %654 RelaxedPrecision 
					                                                      OpDecorate %659 RelaxedPrecision 
					                                                      OpDecorate %660 RelaxedPrecision 
					                                                      OpDecorate %661 RelaxedPrecision 
					                                                      OpDecorate %666 RelaxedPrecision 
					                                                      OpDecorate %667 RelaxedPrecision 
					                                                      OpDecorate %668 RelaxedPrecision 
					                                                      OpDecorate %673 RelaxedPrecision 
					                                                      OpDecorate %674 RelaxedPrecision 
					                                                      OpDecorate %675 RelaxedPrecision 
					                                                      OpDecorate %676 RelaxedPrecision 
					                                                      OpDecorate %677 RelaxedPrecision 
					                                                      OpDecorate %678 RelaxedPrecision 
					                                                      OpDecorate %679 RelaxedPrecision 
					                                                      OpDecorate %680 RelaxedPrecision 
					                                                      OpDecorate %681 RelaxedPrecision 
					                                                      OpDecorate %682 RelaxedPrecision 
					                                                      OpDecorate %683 RelaxedPrecision 
					                                                      OpDecorate %684 RelaxedPrecision 
					                                                      OpDecorate %685 RelaxedPrecision 
					                                                      OpDecorate %686 RelaxedPrecision 
					                                                      OpDecorate %687 RelaxedPrecision 
					                                                      OpDecorate %688 RelaxedPrecision 
					                                                      OpDecorate %689 RelaxedPrecision 
					                                                      OpDecorate %690 RelaxedPrecision 
					                                                      OpDecorate %691 RelaxedPrecision 
					                                                      OpDecorate %692 RelaxedPrecision 
					                                                      OpDecorate %693 RelaxedPrecision 
					                                                      OpDecorate %694 RelaxedPrecision 
					                                                      OpDecorate %695 RelaxedPrecision 
					                                                      OpDecorate %696 RelaxedPrecision 
					                                                      OpDecorate %697 RelaxedPrecision 
					                                                      OpDecorate %698 RelaxedPrecision 
					                                                      OpDecorate %700 RelaxedPrecision 
					                                                      OpDecorate %705 RelaxedPrecision 
					                                                      OpDecorate %706 RelaxedPrecision 
					                                                      OpDecorate %707 RelaxedPrecision 
					                                                      OpDecorate %710 RelaxedPrecision 
					                                                      OpDecorate %711 RelaxedPrecision 
					                                                      OpDecorate %716 RelaxedPrecision 
					                                                      OpDecorate %719 RelaxedPrecision 
					                                                      OpDecorate %720 RelaxedPrecision 
					                                                      OpDecorate %721 RelaxedPrecision 
					                                                      OpDecorate %724 RelaxedPrecision 
					                                                      OpDecorate %725 RelaxedPrecision 
					                                                      OpDecorate %731 RelaxedPrecision 
					                                                      OpDecorate %733 RelaxedPrecision 
					                                                      OpDecorate %734 RelaxedPrecision 
					                                                      OpDecorate %735 RelaxedPrecision 
					                                                      OpDecorate %738 RelaxedPrecision 
					                                                      OpDecorate %739 RelaxedPrecision 
					                                                      OpDecorate %744 RelaxedPrecision 
					                                                      OpDecorate %748 RelaxedPrecision 
					                                                      OpDecorate %750 RelaxedPrecision 
					                                                      OpDecorate %751 RelaxedPrecision 
					                                                      OpDecorate %752 RelaxedPrecision 
					                                                      OpDecorate %755 RelaxedPrecision 
					                                                      OpDecorate %756 RelaxedPrecision 
					                                                      OpDecorate %757 RelaxedPrecision 
					                                                      OpDecorate %760 RelaxedPrecision 
					                                                      OpDecorate %761 RelaxedPrecision 
					                                                      OpDecorate %764 RelaxedPrecision 
					                                                      OpDecorate %765 RelaxedPrecision 
					                                                      OpDecorate %766 RelaxedPrecision 
					                                                      OpDecorate %771 RelaxedPrecision 
					                                                      OpDecorate %775 RelaxedPrecision 
					                                                      OpDecorate %777 RelaxedPrecision 
					                                                      OpDecorate %778 RelaxedPrecision 
					                                                      OpDecorate %779 RelaxedPrecision 
					                                                      OpDecorate %782 RelaxedPrecision 
					                                                      OpDecorate %783 RelaxedPrecision 
					                                                      OpDecorate %784 RelaxedPrecision 
					                                                      OpDecorate %787 RelaxedPrecision 
					                                                      OpDecorate %788 RelaxedPrecision 
					                                                      OpDecorate %791 RelaxedPrecision 
					                                                      OpDecorate %792 RelaxedPrecision 
					                                                      OpDecorate %793 RelaxedPrecision 
					                                                      OpDecorate %798 RelaxedPrecision 
					                                                      OpDecorate %802 RelaxedPrecision 
					                                                      OpDecorate %803 RelaxedPrecision 
					                                                      OpDecorate %805 RelaxedPrecision 
					                                                      OpDecorate %806 RelaxedPrecision 
					                                                      OpDecorate %809 RelaxedPrecision 
					                                                      OpDecorate %810 RelaxedPrecision 
					                                                      OpDecorate %811 RelaxedPrecision 
					                                                      OpDecorate %814 RelaxedPrecision 
					                                                      OpDecorate %815 RelaxedPrecision 
					                                                      OpDecorate %818 RelaxedPrecision 
					                                                      OpDecorate %819 RelaxedPrecision 
					                                                      OpDecorate %820 RelaxedPrecision 
					                                                      OpDecorate %824 RelaxedPrecision 
					                                                      OpDecorate %828 RelaxedPrecision 
					                                                      OpDecorate %829 RelaxedPrecision 
					                                                      OpDecorate %831 RelaxedPrecision 
					                                                      OpDecorate %832 RelaxedPrecision 
					                                                      OpDecorate %835 RelaxedPrecision 
					                                                      OpDecorate %836 RelaxedPrecision 
					                                                      OpDecorate %837 RelaxedPrecision 
					                                                      OpDecorate %840 RelaxedPrecision 
					                                                      OpDecorate %841 RelaxedPrecision 
					                                                      OpDecorate %844 RelaxedPrecision 
					                                                      OpDecorate %845 RelaxedPrecision 
					                                                      OpDecorate %846 RelaxedPrecision 
					                                                      OpDecorate %851 RelaxedPrecision 
					                                                      OpDecorate %949 RelaxedPrecision 
					                                                      OpDecorate %950 RelaxedPrecision 
					                                                      OpDecorate %955 RelaxedPrecision 
					                                                      OpDecorate %956 RelaxedPrecision 
					                                                      OpDecorate %961 RelaxedPrecision 
					                                                      OpDecorate %962 RelaxedPrecision 
					                                                      OpDecorate %968 RelaxedPrecision 
					                                                      OpDecorate %969 RelaxedPrecision 
					                                                      OpDecorate %980 RelaxedPrecision 
					                                                      OpDecorate %981 RelaxedPrecision 
					                                                      OpDecorate %993 RelaxedPrecision 
					                                                      OpDecorate %994 RelaxedPrecision 
					                                                      OpDecorate %1000 RelaxedPrecision 
					                                                      OpDecorate %1001 RelaxedPrecision 
					                                                      OpDecorate %1009 RelaxedPrecision 
					                                                      OpDecorate %1010 RelaxedPrecision 
					                                                      OpDecorate %1021 RelaxedPrecision 
					                                                      OpDecorate %1022 RelaxedPrecision 
					                                                      OpDecorate %1028 RelaxedPrecision 
					                                                      OpDecorate %1029 RelaxedPrecision 
					                                                      OpDecorate %1037 RelaxedPrecision 
					                                                      OpDecorate %1038 RelaxedPrecision 
					                                                      OpDecorate %1049 RelaxedPrecision 
					                                                      OpDecorate %1050 RelaxedPrecision 
					                                                      OpDecorate %1056 RelaxedPrecision 
					                                                      OpDecorate %1057 RelaxedPrecision 
					                                                      OpDecorate %1065 RelaxedPrecision 
					                                                      OpDecorate %1066 RelaxedPrecision 
					                                                      OpDecorate %1077 RelaxedPrecision 
					                                                      OpDecorate %1078 RelaxedPrecision 
					                                                      OpDecorate %1084 RelaxedPrecision 
					                                                      OpDecorate %1085 RelaxedPrecision 
					                                                      OpDecorate %1160 RelaxedPrecision 
					                                                      OpDecorate %1161 RelaxedPrecision 
					                                                      OpDecorate %1162 RelaxedPrecision 
					                                                      OpDecorate %1167 RelaxedPrecision 
					                                                      OpDecorate %1168 RelaxedPrecision 
					                                                      OpDecorate %1173 RelaxedPrecision 
					                                                      OpDecorate %1174 RelaxedPrecision 
					                                                      OpDecorate %1175 RelaxedPrecision 
					                                                      OpDecorate %1180 RelaxedPrecision 
					                                                      OpDecorate %1181 RelaxedPrecision 
					                                                      OpDecorate %1182 RelaxedPrecision 
					                                                      OpDecorate %1187 RelaxedPrecision 
					                                                      OpDecorate %1188 RelaxedPrecision 
					                                                      OpDecorate %1189 RelaxedPrecision 
					                                                      OpDecorate %1190 RelaxedPrecision 
					                                                      OpDecorate %1191 RelaxedPrecision 
					                                                      OpDecorate %1192 RelaxedPrecision 
					                                                      OpDecorate %1193 RelaxedPrecision 
					                                                      OpDecorate %1194 RelaxedPrecision 
					                                                      OpDecorate %1195 RelaxedPrecision 
					                                                      OpDecorate %1196 RelaxedPrecision 
					                                                      OpDecorate %1197 RelaxedPrecision 
					                                                      OpDecorate %1198 RelaxedPrecision 
					                                                      OpDecorate %1199 RelaxedPrecision 
					                                                      OpDecorate %1200 RelaxedPrecision 
					                                                      OpDecorate %1201 RelaxedPrecision 
					                                                      OpDecorate %1202 RelaxedPrecision 
					                                                      OpDecorate %1203 RelaxedPrecision 
					                                                      OpDecorate %1204 RelaxedPrecision 
					                                                      OpDecorate %1205 RelaxedPrecision 
					                                                      OpDecorate %1206 RelaxedPrecision 
					                                                      OpDecorate %1207 RelaxedPrecision 
					                                                      OpDecorate %1208 RelaxedPrecision 
					                                                      OpDecorate %1209 RelaxedPrecision 
					                                                      OpDecorate %1210 RelaxedPrecision 
					                                                      OpDecorate %1211 RelaxedPrecision 
					                                                      OpDecorate %1214 RelaxedPrecision 
					                                                      OpDecorate %1217 RelaxedPrecision 
					                                                      OpDecorate %1218 RelaxedPrecision 
					                                                      OpDecorate %1219 RelaxedPrecision 
					                                                      OpDecorate %1220 RelaxedPrecision 
					                                                      OpDecorate %1221 RelaxedPrecision 
					                                                      OpDecorate %1223 RelaxedPrecision 
					                                                      OpDecorate %1228 RelaxedPrecision 
					                                                      OpDecorate %1229 RelaxedPrecision 
					                                                      OpDecorate %1230 RelaxedPrecision 
					                                                      OpDecorate %1231 RelaxedPrecision 
					                                                      OpDecorate %1232 RelaxedPrecision 
					                                                      OpDecorate %1233 RelaxedPrecision 
					                                                      OpDecorate %1234 RelaxedPrecision 
					                                                      OpDecorate %1239 RelaxedPrecision 
					                                                      OpDecorate %1240 RelaxedPrecision 
					                                                      OpDecorate %1241 RelaxedPrecision 
					                                                      OpDecorate %1244 RelaxedPrecision 
					                                                      OpDecorate %1245 RelaxedPrecision 
					                                                      OpDecorate %1249 RelaxedPrecision 
					                                                      OpDecorate %1253 RelaxedPrecision 
					                                                      OpDecorate %1255 RelaxedPrecision 
					                                                      OpDecorate %1256 RelaxedPrecision 
					                                                      OpDecorate %1258 RelaxedPrecision 
					                                                      OpDecorate %1259 RelaxedPrecision 
					                                                      OpDecorate %1260 RelaxedPrecision 
					                                                      OpDecorate %1261 RelaxedPrecision 
					                                                      OpDecorate %1262 RelaxedPrecision 
					                                                      OpDecorate %1263 RelaxedPrecision 
					                                                      OpDecorate %1264 RelaxedPrecision 
					                                                      OpDecorate %1265 RelaxedPrecision 
					                                                      OpDecorate %1266 RelaxedPrecision 
					                                                      OpDecorate %1267 RelaxedPrecision 
					                                                      OpDecorate %1268 RelaxedPrecision 
					                                                      OpDecorate %1274 RelaxedPrecision 
					                                                      OpDecorate %1276 RelaxedPrecision 
					                                                      OpDecorate %1277 RelaxedPrecision 
					                                                      OpDecorate %1278 RelaxedPrecision 
					                                                      OpDecorate %1279 RelaxedPrecision 
					                                                      OpDecorate %1280 RelaxedPrecision 
					                                                      OpDecorate %1281 RelaxedPrecision 
					                                                      OpDecorate %1282 RelaxedPrecision 
					                                                      OpDecorate %1283 RelaxedPrecision 
					                                                      OpDecorate %1285 RelaxedPrecision 
					                                                      OpDecorate %1286 RelaxedPrecision 
					                                                      OpDecorate %1287 RelaxedPrecision 
					                                                      OpDecorate %1289 RelaxedPrecision 
					                                                      OpDecorate %1291 RelaxedPrecision 
					                                                      OpDecorate %1292 RelaxedPrecision 
					                                                      OpDecorate %1294 RelaxedPrecision 
					                                                      OpDecorate %1295 RelaxedPrecision 
					                                                      OpDecorate %1296 RelaxedPrecision 
					                                                      OpDecorate %1297 RelaxedPrecision 
					                                                      OpDecorate %1298 RelaxedPrecision 
					                                                      OpDecorate %1299 RelaxedPrecision 
					                                                      OpDecorate %1300 RelaxedPrecision 
					                                                      OpDecorate %1301 RelaxedPrecision 
					                                                      OpDecorate %1302 RelaxedPrecision 
					                                                      OpDecorate %1303 RelaxedPrecision 
					                                                      OpDecorate %1311 RelaxedPrecision 
					                                                      OpDecorate %1312 RelaxedPrecision 
					                                                      OpDecorate %1314 RelaxedPrecision 
					                                                      OpDecorate %1315 RelaxedPrecision 
					                                                      OpDecorate %1318 RelaxedPrecision 
					                                                      OpDecorate %1319 RelaxedPrecision 
					                                                      OpDecorate %1320 RelaxedPrecision 
					                                                      OpDecorate %1323 RelaxedPrecision 
					                                                      OpDecorate %1324 RelaxedPrecision 
					                                                      OpDecorate %1327 RelaxedPrecision 
					                                                      OpDecorate %1328 RelaxedPrecision 
					                                                      OpDecorate %1329 RelaxedPrecision 
					                                                      OpDecorate %1333 RelaxedPrecision 
					                                                      OpDecorate %1398 Location 1398 
					                                                      OpDecorate %1408 RelaxedPrecision 
					                                                      OpDecorate %1409 RelaxedPrecision 
					                                                      OpDecorate %1419 RelaxedPrecision 
					                                                      OpDecorate %1420 RelaxedPrecision 
					                                                      OpDecorate %1430 RelaxedPrecision 
					                                                      OpDecorate %1431 RelaxedPrecision 
					                                                      OpDecorate %1441 RelaxedPrecision 
					                                                      OpDecorate %1442 RelaxedPrecision 
					                                                      OpDecorate %1447 RelaxedPrecision 
					                                                      OpDecorate %1448 RelaxedPrecision 
					                                                      OpDecorate %1457 RelaxedPrecision 
					                                                      OpDecorate %1458 RelaxedPrecision 
					                                                      OpDecorate %1468 RelaxedPrecision 
					                                                      OpDecorate %1469 RelaxedPrecision 
					                                                      OpDecorate %1479 RelaxedPrecision 
					                                                      OpDecorate %1480 RelaxedPrecision 
					                                                      OpDecorate %1485 RelaxedPrecision 
					                                                      OpDecorate %1486 RelaxedPrecision 
					                                                      OpDecorate %1562 RelaxedPrecision 
					                                                      OpDecorate %1564 RelaxedPrecision 
					                                                      OpDecorate %1565 RelaxedPrecision 
					                                                      OpDecorate %1566 RelaxedPrecision 
					                                                      OpDecorate %1567 RelaxedPrecision 
					                                                      OpDecorate %1568 RelaxedPrecision 
					                                                      OpDecorate %1569 RelaxedPrecision 
					                                                      OpDecorate %1570 RelaxedPrecision 
					                                               %2 = OpTypeVoid 
					                                               %3 = OpTypeFunction %2 
					                                               %6 = OpTypeFloat 32 
					                                               %7 = OpTypePointer Private %6 
					                                  Private f32* %8 = OpVariable Private 
					                                               %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                              %10 = OpTypePointer UniformConstant %9 
					         UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
					                                              %13 = OpTypeSampler 
					                                              %14 = OpTypePointer UniformConstant %13 
					                     UniformConstant sampler* %15 = OpVariable UniformConstant 
					                                              %17 = OpTypeSampledImage %9 
					                                              %19 = OpTypeVector %6 2 
					                                              %20 = OpTypePointer Input %19 
					                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                              %23 = OpTypeVector %6 4 
					                                              %25 = OpTypeInt 32 0 
					                                          u32 %26 = OpConstant 3 
					                                 Private f32* %28 = OpVariable Private 
					                                          f32 %31 = OpConstant 3,674022E-40 
					                                 Private f32* %33 = OpVariable Private 
					         UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
					                     UniformConstant sampler* %36 = OpVariable UniformConstant 
					                                          u32 %41 = OpConstant 2 
					                                              %43 = OpTypePointer Private %19 
					                               Private f32_2* %44 = OpVariable Private 
					         UniformConstant read_only Texture2D* %45 = OpVariable UniformConstant 
					                     UniformConstant sampler* %47 = OpVariable UniformConstant 
					                                          u32 %52 = OpConstant 0 
					                                          u32 %55 = OpConstant 4 
					                                              %56 = OpTypeArray %23 %55 
					                                              %57 = OpTypeInt 32 1 
					                                              %58 = OpTypeStruct %23 %23 %23 %56 %19 %57 %6 %57 %6 
					                                              %59 = OpTypePointer Uniform %58 
					Uniform struct {f32_4; f32_4; f32_4; f32_4[4]; f32_2; i32; f32; i32; f32;}* %60 = OpVariable Uniform 
					                                          i32 %61 = OpConstant 0 
					                                              %62 = OpTypePointer Uniform %6 
					                                              %76 = OpTypePointer Private %23 
					                               Private f32_4* %77 = OpVariable Private 
					                                          i32 %83 = OpConstant 1 
					                                              %84 = OpTypePointer Uniform %23 
					                                          i32 %90 = OpConstant 2 
					                                             %105 = OpTypeVector %6 3 
					                                             %106 = OpTypePointer Private %105 
					                              Private f32_3* %107 = OpVariable Private 
					        UniformConstant read_only Texture2D* %108 = OpVariable UniformConstant 
					                    UniformConstant sampler* %110 = OpVariable UniformConstant 
					                              Private f32_3* %116 = OpVariable Private 
					                                         f32 %118 = OpConstant 3,674022E-40 
					                                       f32_3 %119 = OpConstantComposite %118 %118 %118 
					                                         f32 %121 = OpConstant 3,674022E-40 
					                                       f32_3 %122 = OpConstantComposite %121 %121 %121 
					                              Private f32_4* %124 = OpVariable Private 
					                                         i32 %127 = OpConstant 3 
					                              Private f32_4* %134 = OpVariable Private 
					                                Private f32* %221 = OpVariable Private 
					                                         f32 %225 = OpConstant 3,674022E-40 
					                                Private f32* %229 = OpVariable Private 
					                                Private f32* %233 = OpVariable Private 
					                                         i32 %235 = OpConstant 8 
					                                             %243 = OpTypeBool 
					                                             %244 = OpTypePointer Private %243 
					                               Private bool* %245 = OpVariable Private 
					                                         i32 %246 = OpConstant 5 
					                                             %247 = OpTypePointer Uniform %57 
					                                Private f32* %251 = OpVariable Private 
					                                         f32 %253 = OpConstant 3,674022E-40 
					                                         f32 %260 = OpConstant 3,674022E-40 
					                                         f32 %263 = OpConstant 3,674022E-40 
					                                         f32 %268 = OpConstant 3,674022E-40 
					                                         f32 %271 = OpConstant 3,674022E-40 
					                                             %273 = OpTypePointer Private %57 
					                                Private i32* %274 = OpVariable Private 
					                                Private i32* %277 = OpVariable Private 
					                                         i32 %281 = OpConstant 4 
					                               Private bool* %291 = OpVariable Private 
					                                         i32 %292 = OpConstant 7 
					                                         u32 %311 = OpConstant 1 
					                                         f32 %327 = OpConstant 3,674022E-40 
					                                       f32_4 %328 = OpConstantComposite %327 %327 %327 %327 
					                                         f32 %333 = OpConstant 3,674022E-40 
					                                       f32_4 %334 = OpConstantComposite %333 %253 %253 %333 
					                                       f32_4 %336 = OpConstantComposite %31 %31 %31 %31 
					                              Private f32_4* %346 = OpVariable Private 
					        UniformConstant read_only Texture2D* %347 = OpVariable UniformConstant 
					                    UniformConstant sampler* %349 = OpVariable UniformConstant 
					                              Private f32_4* %355 = OpVariable Private 
					                              Private f32_4* %362 = OpVariable Private 
					                              Private f32_4* %369 = OpVariable Private 
					        UniformConstant read_only Texture2D* %382 = OpVariable UniformConstant 
					                    UniformConstant sampler* %384 = OpVariable UniformConstant 
					                               Private bool* %391 = OpVariable Private 
					        UniformConstant read_only Texture2D* %397 = OpVariable UniformConstant 
					                    UniformConstant sampler* %399 = OpVariable UniformConstant 
					        UniformConstant read_only Texture2D* %411 = OpVariable UniformConstant 
					                    UniformConstant sampler* %413 = OpVariable UniformConstant 
					        UniformConstant read_only Texture2D* %420 = OpVariable UniformConstant 
					                    UniformConstant sampler* %422 = OpVariable UniformConstant 
					                              Private f32_2* %558 = OpVariable Private 
					                                       f32_2 %562 = OpConstantComposite %31 %31 
					                              Private f32_4* %580 = OpVariable Private 
					                              Private f32_4* %591 = OpVariable Private 
					                                       f32_4 %608 = OpConstantComposite %253 %253 %253 %253 
					                              Private f32_4* %632 = OpVariable Private 
					        UniformConstant read_only Texture2D* %633 = OpVariable UniformConstant 
					                    UniformConstant sampler* %635 = OpVariable UniformConstant 
					                              Private f32_3* %640 = OpVariable Private 
					                              Private f32_4* %645 = OpVariable Private 
					                              Private f32_4* %652 = OpVariable Private 
					                              Private f32_4* %659 = OpVariable Private 
					                              Private f32_4* %666 = OpVariable Private 
					                              Private f32_3* %673 = OpVariable Private 
					                              Private f32_3* %678 = OpVariable Private 
					                              Private f32_3* %683 = OpVariable Private 
					                              Private f32_3* %688 = OpVariable Private 
					                                Private f32* %693 = OpVariable Private 
					                              Private f32_3* %699 = OpVariable Private 
					                                Private f32* %727 = OpVariable Private 
					                                         f32 %855 = OpConstant 3,674022E-40 
					                                       f32_4 %856 = OpConstantComposite %855 %855 %855 %855 
					                               Private bool* %943 = OpVariable Private 
					                              Private f32_4* %967 = OpVariable Private 
					                               Private bool* %987 = OpVariable Private 
					                             Private f32_2* %1100 = OpVariable Private 
					                             Private f32_4* %1160 = OpVariable Private 
					                             Private f32_4* %1173 = OpVariable Private 
					                             Private f32_4* %1180 = OpVariable Private 
					                             Private f32_3* %1187 = OpVariable Private 
					                             Private f32_3* %1196 = OpVariable Private 
					                             Private f32_3* %1201 = OpVariable Private 
					                               Private f32* %1206 = OpVariable Private 
					                             Private f32_2* %1222 = OpVariable Private 
					                               Private f32* %1228 = OpVariable Private 
					                               Private f32* %1247 = OpVariable Private 
					                               Private f32* %1253 = OpVariable Private 
					                             Private f32_2* %1284 = OpVariable Private 
					                               Private f32* %1289 = OpVariable Private 
					                                            %1397 = OpTypePointer Output %23 
					                              Output f32_4* %1398 = OpVariable Output 
					                                            %1525 = OpTypePointer Input %6 
					                                        i32 %1530 = OpConstant 6 
					                                        f32 %1533 = OpConstant 3,674022E-40 
					                                        f32 %1551 = OpConstant 3,674022E-40 
					                                        f32 %1563 = OpConstant 3,674022E-40 
					                                            %1573 = OpTypePointer Output %6 
					                                          void %4 = OpFunction None %3 
					                                               %5 = OpLabel 
					                          read_only Texture2D %12 = OpLoad %11 
					                                      sampler %16 = OpLoad %15 
					                   read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                                        f32_2 %22 = OpLoad vs_TEXCOORD1 
					                                        f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                          f32 %27 = OpCompositeExtract %24 3 
					                                                      OpStore %8 %27 
					                                          f32 %29 = OpLoad %8 
					                                          f32 %30 = OpFNegate %29 
					                                          f32 %32 = OpFAdd %30 %31 
					                                                      OpStore %28 %32 
					                          read_only Texture2D %35 = OpLoad %34 
					                                      sampler %37 = OpLoad %36 
					                   read_only Texture2DSampled %38 = OpSampledImage %35 %37 
					                                        f32_2 %39 = OpLoad vs_TEXCOORD1 
					                                        f32_4 %40 = OpImageSampleImplicitLod %38 %39 
					                                          f32 %42 = OpCompositeExtract %40 2 
					                                                      OpStore %33 %42 
					                          read_only Texture2D %46 = OpLoad %45 
					                                      sampler %48 = OpLoad %47 
					                   read_only Texture2DSampled %49 = OpSampledImage %46 %48 
					                                        f32_2 %50 = OpLoad vs_TEXCOORD1 
					                                        f32_4 %51 = OpImageSampleImplicitLod %49 %50 
					                                          f32 %53 = OpCompositeExtract %51 0 
					                                 Private f32* %54 = OpAccessChain %44 %52 
					                                                      OpStore %54 %53 
					                                 Uniform f32* %63 = OpAccessChain %60 %61 %41 
					                                          f32 %64 = OpLoad %63 
					                                 Private f32* %65 = OpAccessChain %44 %52 
					                                          f32 %66 = OpLoad %65 
					                                          f32 %67 = OpFMul %64 %66 
					                                 Uniform f32* %68 = OpAccessChain %60 %61 %26 
					                                          f32 %69 = OpLoad %68 
					                                          f32 %70 = OpFAdd %67 %69 
					                                 Private f32* %71 = OpAccessChain %44 %52 
					                                                      OpStore %71 %70 
					                                 Private f32* %72 = OpAccessChain %44 %52 
					                                          f32 %73 = OpLoad %72 
					                                          f32 %74 = OpFDiv %31 %73 
					                                 Private f32* %75 = OpAccessChain %44 %52 
					                                                      OpStore %75 %74 
					                                 Private f32* %78 = OpAccessChain %44 %52 
					                                          f32 %79 = OpLoad %78 
					                                          f32 %80 = OpFNegate %79 
					                                 Private f32* %81 = OpAccessChain %77 %41 
					                                                      OpStore %81 %80 
					                                        f32_2 %82 = OpLoad vs_TEXCOORD1 
					                               Uniform f32_4* %85 = OpAccessChain %60 %83 
					                                        f32_4 %86 = OpLoad %85 
					                                        f32_2 %87 = OpVectorShuffle %86 %86 2 3 
					                                        f32_2 %88 = OpFMul %82 %87 
					                                                      OpStore %44 %88 
					                                        f32_2 %89 = OpLoad %44 
					                               Uniform f32_4* %91 = OpAccessChain %60 %90 
					                                        f32_4 %92 = OpLoad %91 
					                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
					                                        f32_2 %94 = OpFMul %89 %93 
					                               Uniform f32_4* %95 = OpAccessChain %60 %90 
					                                        f32_4 %96 = OpLoad %95 
					                                        f32_2 %97 = OpVectorShuffle %96 %96 2 3 
					                                        f32_2 %98 = OpFAdd %94 %97 
					                                                      OpStore %44 %98 
					                                        f32_4 %99 = OpLoad %77 
					                                       f32_2 %100 = OpVectorShuffle %99 %99 2 2 
					                                       f32_2 %101 = OpLoad %44 
					                                       f32_2 %102 = OpFMul %100 %101 
					                                       f32_4 %103 = OpLoad %77 
					                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 2 3 
					                                                      OpStore %77 %104 
					                         read_only Texture2D %109 = OpLoad %108 
					                                     sampler %111 = OpLoad %110 
					                  read_only Texture2DSampled %112 = OpSampledImage %109 %111 
					                                       f32_2 %113 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %114 = OpImageSampleImplicitLod %112 %113 
					                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
					                                                      OpStore %107 %115 
					                                       f32_3 %117 = OpLoad %107 
					                                       f32_3 %120 = OpFMul %117 %119 
					                                       f32_3 %123 = OpFAdd %120 %122 
					                                                      OpStore %116 %123 
					                                       f32_3 %125 = OpLoad %116 
					                                       f32_3 %126 = OpVectorShuffle %125 %125 1 1 1 
					                              Uniform f32_4* %128 = OpAccessChain %60 %127 %83 
					                                       f32_4 %129 = OpLoad %128 
					                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
					                                       f32_3 %131 = OpFMul %126 %130 
					                                       f32_4 %132 = OpLoad %124 
					                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
					                                                      OpStore %124 %133 
					                              Uniform f32_4* %135 = OpAccessChain %60 %127 %61 
					                                       f32_4 %136 = OpLoad %135 
					                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
					                                       f32_3 %138 = OpLoad %116 
					                                       f32_3 %139 = OpVectorShuffle %138 %138 0 0 0 
					                                       f32_3 %140 = OpFMul %137 %139 
					                                       f32_4 %141 = OpLoad %124 
					                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
					                                       f32_3 %143 = OpFAdd %140 %142 
					                                       f32_4 %144 = OpLoad %134 
					                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 6 
					                                                      OpStore %134 %145 
					                              Uniform f32_4* %146 = OpAccessChain %60 %127 %90 
					                                       f32_4 %147 = OpLoad %146 
					                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
					                                       f32_3 %149 = OpLoad %116 
					                                       f32_3 %150 = OpVectorShuffle %149 %149 2 2 2 
					                                       f32_3 %151 = OpFMul %148 %150 
					                                       f32_4 %152 = OpLoad %134 
					                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 3 
					                                       f32_3 %154 = OpFAdd %151 %153 
					                                       f32_4 %155 = OpLoad %134 
					                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
					                                                      OpStore %134 %156 
					                                       f32_4 %157 = OpLoad %77 
					                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
					                                       f32_4 %159 = OpLoad %77 
					                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
					                                         f32 %161 = OpDot %158 %160 
					                                Private f32* %162 = OpAccessChain %44 %52 
					                                                      OpStore %162 %161 
					                                Private f32* %163 = OpAccessChain %44 %52 
					                                         f32 %164 = OpLoad %163 
					                                         f32 %165 = OpExtInst %1 32 %164 
					                                Private f32* %166 = OpAccessChain %44 %52 
					                                                      OpStore %166 %165 
					                                       f32_2 %167 = OpLoad %44 
					                                       f32_3 %168 = OpVectorShuffle %167 %167 0 0 0 
					                                       f32_4 %169 = OpLoad %77 
					                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
					                                       f32_3 %171 = OpFMul %168 %170 
					                                       f32_4 %172 = OpLoad %77 
					                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 6 
					                                                      OpStore %77 %173 
					                                       f32_4 %174 = OpLoad %134 
					                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
					                                       f32_4 %176 = OpLoad %77 
					                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 3 
					                                       f32_3 %178 = OpFNegate %177 
					                                         f32 %179 = OpDot %175 %178 
					                                Private f32* %180 = OpAccessChain %44 %52 
					                                                      OpStore %180 %179 
					                                Private f32* %181 = OpAccessChain %44 %52 
					                                         f32 %182 = OpLoad %181 
					                                Private f32* %183 = OpAccessChain %44 %52 
					                                         f32 %184 = OpLoad %183 
					                                         f32 %185 = OpFAdd %182 %184 
					                                Private f32* %186 = OpAccessChain %44 %52 
					                                                      OpStore %186 %185 
					                                       f32_4 %187 = OpLoad %134 
					                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
					                                       f32_2 %189 = OpLoad %44 
					                                       f32_3 %190 = OpVectorShuffle %189 %189 0 0 0 
					                                       f32_3 %191 = OpFMul %188 %190 
					                                       f32_4 %192 = OpLoad %77 
					                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 3 
					                                       f32_3 %194 = OpFAdd %191 %193 
					                                       f32_4 %195 = OpLoad %77 
					                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 2 6 
					                                                      OpStore %77 %196 
					                                       f32_4 %197 = OpLoad %77 
					                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 3 
					                                       f32_4 %199 = OpLoad %77 
					                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 3 
					                                         f32 %201 = OpDot %198 %200 
					                                Private f32* %202 = OpAccessChain %44 %52 
					                                                      OpStore %202 %201 
					                                Private f32* %203 = OpAccessChain %44 %52 
					                                         f32 %204 = OpLoad %203 
					                                         f32 %205 = OpExtInst %1 32 %204 
					                                Private f32* %206 = OpAccessChain %44 %52 
					                                                      OpStore %206 %205 
					                                Private f32* %207 = OpAccessChain %44 %52 
					                                         f32 %208 = OpLoad %207 
					                                Private f32* %209 = OpAccessChain %77 %26 
					                                         f32 %210 = OpLoad %209 
					                                         f32 %211 = OpFMul %208 %210 
					                                Private f32* %212 = OpAccessChain %44 %52 
					                                                      OpStore %212 %211 
					                                Private f32* %213 = OpAccessChain %44 %52 
					                                         f32 %214 = OpLoad %213 
					                                         f32 %215 = OpLoad %33 
					                                         f32 %216 = OpFMul %214 %215 
					                                Private f32* %217 = OpAccessChain %77 %41 
					                                         f32 %218 = OpLoad %217 
					                                         f32 %219 = OpFAdd %216 %218 
					                                Private f32* %220 = OpAccessChain %44 %52 
					                                                      OpStore %220 %219 
					                                         f32 %222 = OpLoad %28 
					                                         f32 %223 = OpExtInst %1 30 %222 
					                                                      OpStore %221 %223 
					                                         f32 %224 = OpLoad %221 
					                                         f32 %226 = OpFMul %224 %225 
					                                                      OpStore %221 %226 
					                                         f32 %227 = OpLoad %221 
					                                         f32 %228 = OpExtInst %1 29 %227 
					                                                      OpStore %221 %228 
					                                         f32 %230 = OpLoad %33 
					                                         f32 %231 = OpLoad %221 
					                                         f32 %232 = OpFMul %230 %231 
					                                                      OpStore %229 %232 
					                                         f32 %234 = OpLoad %229 
					                                Uniform f32* %236 = OpAccessChain %60 %235 
					                                         f32 %237 = OpLoad %236 
					                                         f32 %238 = OpFMul %234 %237 
					                                                      OpStore %233 %238 
					                                         f32 %239 = OpLoad %233 
					                                Private f32* %240 = OpAccessChain %44 %52 
					                                         f32 %241 = OpLoad %240 
					                                         f32 %242 = OpFDiv %239 %241 
					                                                      OpStore %233 %242 
					                                Uniform i32* %248 = OpAccessChain %60 %246 
					                                         i32 %249 = OpLoad %248 
					                                        bool %250 = OpIEqual %249 %83 
					                                                      OpStore %245 %250 
					                                         f32 %252 = OpLoad %233 
					                                         f32 %254 = OpFMul %252 %253 
					                                                      OpStore %251 %254 
					                                        bool %255 = OpLoad %245 
					                                         f32 %256 = OpLoad %251 
					                                         f32 %257 = OpLoad %233 
					                                         f32 %258 = OpSelect %255 %256 %257 
					                                                      OpStore %233 %258 
					                                         f32 %259 = OpLoad %233 
					                                         f32 %261 = OpFAdd %259 %260 
					                                                      OpStore %233 %261 
					                                         f32 %262 = OpLoad %233 
					                                         f32 %264 = OpFMul %262 %263 
					                                                      OpStore %233 %264 
					                                         f32 %265 = OpLoad %233 
					                                         f32 %266 = OpExtInst %1 30 %265 
					                                                      OpStore %233 %266 
					                                         f32 %267 = OpLoad %233 
					                                         f32 %269 = OpExtInst %1 37 %267 %268 
					                                                      OpStore %233 %269 
					                                         f32 %270 = OpLoad %233 
					                                         f32 %272 = OpExtInst %1 40 %270 %271 
					                                                      OpStore %233 %272 
					                                         f32 %275 = OpLoad %233 
					                                         i32 %276 = OpConvertFToS %275 
					                                                      OpStore %274 %276 
					                                         i32 %278 = OpLoad %274 
					                                         i32 %279 = OpIAdd %278 %83 
					                                                      OpStore %277 %279 
					                                         i32 %280 = OpLoad %277 
					                                         i32 %282 = OpExtInst %1 39 %280 %281 
					                                                      OpStore %277 %282 
					                                         f32 %283 = OpLoad %233 
					                                         f32 %284 = OpExtInst %1 3 %283 
					                                Private f32* %285 = OpAccessChain %77 %52 
					                                                      OpStore %285 %284 
					                                         f32 %286 = OpLoad %233 
					                                Private f32* %287 = OpAccessChain %77 %52 
					                                         f32 %288 = OpLoad %287 
					                                         f32 %289 = OpFNegate %288 
					                                         f32 %290 = OpFAdd %286 %289 
					                                                      OpStore %233 %290 
					                                Uniform i32* %293 = OpAccessChain %60 %292 
					                                         i32 %294 = OpLoad %293 
					                                        bool %295 = OpIEqual %294 %83 
					                                                      OpStore %291 %295 
					                                        bool %296 = OpLoad %291 
					                                                      OpSelectionMerge %298 None 
					                                                      OpBranchConditional %296 %297 %1403 
					                                             %297 = OpLabel 
					                                         i32 %299 = OpLoad %274 
					                                         i32 %300 = OpSNegate %299 
					                                         f32 %301 = OpConvertSToF %300 
					                                Private f32* %302 = OpAccessChain %77 %52 
					                                                      OpStore %302 %301 
					                                Private f32* %303 = OpAccessChain %77 %52 
					                                         f32 %304 = OpLoad %303 
					                                         f32 %305 = OpExtInst %1 29 %304 
					                                Private f32* %306 = OpAccessChain %77 %52 
					                                                      OpStore %306 %305 
					                                       f32_4 %307 = OpLoad %77 
					                                       f32_4 %308 = OpVectorShuffle %307 %307 0 0 0 0 
					                                Uniform f32* %309 = OpAccessChain %60 %281 %52 
					                                         f32 %310 = OpLoad %309 
					                                Uniform f32* %312 = OpAccessChain %60 %281 %311 
					                                         f32 %313 = OpLoad %312 
					                                Uniform f32* %314 = OpAccessChain %60 %281 %52 
					                                         f32 %315 = OpLoad %314 
					                                Uniform f32* %316 = OpAccessChain %60 %281 %311 
					                                         f32 %317 = OpLoad %316 
					                                       f32_4 %318 = OpCompositeConstruct %310 %313 %315 %317 
					                                       f32_4 %319 = OpFMul %308 %318 
					                                                      OpStore %77 %319 
					                                       f32_4 %320 = OpLoad %77 
					                                       f32_4 %321 = OpExtInst %1 8 %320 
					                                                      OpStore %77 %321 
					                                       f32_2 %322 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %323 = OpVectorShuffle %322 %322 0 1 0 1 
					                                       f32_4 %324 = OpLoad %77 
					                                       f32_4 %325 = OpVectorShuffle %324 %324 2 3 2 3 
					                                       f32_4 %326 = OpFMul %323 %325 
					                                       f32_4 %329 = OpFAdd %326 %328 
					                                                      OpStore %134 %329 
					                                       f32_4 %330 = OpLoad %134 
					                                       f32_4 %331 = OpExtInst %1 8 %330 
					                                                      OpStore %134 %331 
					                                       f32_4 %332 = OpLoad %134 
					                                       f32_4 %335 = OpFAdd %332 %334 
					                                                      OpStore %134 %335 
					                                       f32_4 %337 = OpLoad %77 
					                                       f32_4 %338 = OpFDiv %336 %337 
					                                                      OpStore %124 %338 
					                                       f32_4 %339 = OpLoad %134 
					                                       f32_4 %340 = OpLoad %124 
					                                       f32_4 %341 = OpFMul %339 %340 
					                                                      OpStore %124 %341 
					                                         i32 %342 = OpLoad %274 
					                                        bool %343 = OpIEqual %342 %61 
					                                                      OpSelectionMerge %345 None 
					                                                      OpBranchConditional %343 %344 %376 
					                                             %344 = OpLabel 
					                         read_only Texture2D %348 = OpLoad %347 
					                                     sampler %350 = OpLoad %349 
					                  read_only Texture2DSampled %351 = OpSampledImage %348 %350 
					                                       f32_4 %352 = OpLoad %124 
					                                       f32_2 %353 = OpVectorShuffle %352 %352 2 1 
					                                       f32_4 %354 = OpImageSampleExplicitLod %351 %353 Lod %23 
					                                                      OpStore %346 %354 
					                         read_only Texture2D %356 = OpLoad %347 
					                                     sampler %357 = OpLoad %349 
					                  read_only Texture2DSampled %358 = OpSampledImage %356 %357 
					                                       f32_4 %359 = OpLoad %124 
					                                       f32_2 %360 = OpVectorShuffle %359 %359 0 1 
					                                       f32_4 %361 = OpImageSampleExplicitLod %358 %360 Lod %23 
					                                                      OpStore %355 %361 
					                         read_only Texture2D %363 = OpLoad %347 
					                                     sampler %364 = OpLoad %349 
					                  read_only Texture2DSampled %365 = OpSampledImage %363 %364 
					                                       f32_4 %366 = OpLoad %124 
					                                       f32_2 %367 = OpVectorShuffle %366 %366 2 3 
					                                       f32_4 %368 = OpImageSampleExplicitLod %365 %367 Lod %23 
					                                                      OpStore %362 %368 
					                         read_only Texture2D %370 = OpLoad %347 
					                                     sampler %371 = OpLoad %349 
					                  read_only Texture2DSampled %372 = OpSampledImage %370 %371 
					                                       f32_4 %373 = OpLoad %124 
					                                       f32_2 %374 = OpVectorShuffle %373 %373 0 3 
					                                       f32_4 %375 = OpImageSampleExplicitLod %372 %374 Lod %23 
					                                                      OpStore %369 %375 
					                                                      OpBranch %345 
					                                             %376 = OpLabel 
					                                         i32 %377 = OpLoad %274 
					                                        bool %378 = OpIEqual %377 %83 
					                                                      OpStore %291 %378 
					                                        bool %379 = OpLoad %291 
					                                                      OpSelectionMerge %381 None 
					                                                      OpBranchConditional %379 %380 %390 
					                                             %380 = OpLabel 
					                         read_only Texture2D %383 = OpLoad %382 
					                                     sampler %385 = OpLoad %384 
					                  read_only Texture2DSampled %386 = OpSampledImage %383 %385 
					                                       f32_4 %387 = OpLoad %124 
					                                       f32_2 %388 = OpVectorShuffle %387 %387 2 1 
					                                       f32_4 %389 = OpImageSampleExplicitLod %386 %388 Lod %23 
					                                                      OpStore %346 %389 
					                                                      OpBranch %381 
					                                             %390 = OpLabel 
					                                         i32 %392 = OpLoad %274 
					                                        bool %393 = OpIEqual %392 %90 
					                                                      OpStore %391 %393 
					                                        bool %394 = OpLoad %391 
					                                                      OpSelectionMerge %396 None 
					                                                      OpBranchConditional %394 %395 %405 
					                                             %395 = OpLabel 
					                         read_only Texture2D %398 = OpLoad %397 
					                                     sampler %400 = OpLoad %399 
					                  read_only Texture2DSampled %401 = OpSampledImage %398 %400 
					                                       f32_4 %402 = OpLoad %124 
					                                       f32_2 %403 = OpVectorShuffle %402 %402 2 1 
					                                       f32_4 %404 = OpImageSampleExplicitLod %401 %403 Lod %23 
					                                                      OpStore %346 %404 
					                                                      OpBranch %396 
					                                             %405 = OpLabel 
					                                         i32 %406 = OpLoad %274 
					                                        bool %407 = OpIEqual %406 %127 
					                                                      OpStore %391 %407 
					                                        bool %408 = OpLoad %391 
					                                                      OpSelectionMerge %410 None 
					                                                      OpBranchConditional %408 %409 %419 
					                                             %409 = OpLabel 
					                         read_only Texture2D %412 = OpLoad %411 
					                                     sampler %414 = OpLoad %413 
					                  read_only Texture2DSampled %415 = OpSampledImage %412 %414 
					                                       f32_4 %416 = OpLoad %124 
					                                       f32_2 %417 = OpVectorShuffle %416 %416 2 1 
					                                       f32_4 %418 = OpImageSampleExplicitLod %415 %417 Lod %23 
					                                                      OpStore %346 %418 
					                                                      OpBranch %410 
					                                             %419 = OpLabel 
					                         read_only Texture2D %421 = OpLoad %420 
					                                     sampler %423 = OpLoad %422 
					                  read_only Texture2DSampled %424 = OpSampledImage %421 %423 
					                                       f32_4 %425 = OpLoad %124 
					                                       f32_2 %426 = OpVectorShuffle %425 %425 2 1 
					                                       f32_4 %427 = OpImageSampleExplicitLod %424 %426 Lod %23 
					                                                      OpStore %346 %427 
					                                                      OpBranch %410 
					                                             %410 = OpLabel 
					                                                      OpBranch %396 
					                                             %396 = OpLabel 
					                                                      OpBranch %381 
					                                             %381 = OpLabel 
					                                        bool %428 = OpLoad %291 
					                                                      OpSelectionMerge %430 None 
					                                                      OpBranchConditional %428 %429 %437 
					                                             %429 = OpLabel 
					                         read_only Texture2D %431 = OpLoad %382 
					                                     sampler %432 = OpLoad %384 
					                  read_only Texture2DSampled %433 = OpSampledImage %431 %432 
					                                       f32_4 %434 = OpLoad %124 
					                                       f32_2 %435 = OpVectorShuffle %434 %434 0 1 
					                                       f32_4 %436 = OpImageSampleExplicitLod %433 %435 Lod %23 
					                                                      OpStore %355 %436 
					                                                      OpBranch %430 
					                                             %437 = OpLabel 
					                                         i32 %438 = OpLoad %274 
					                                        bool %439 = OpIEqual %438 %90 
					                                                      OpStore %391 %439 
					                                        bool %440 = OpLoad %391 
					                                                      OpSelectionMerge %442 None 
					                                                      OpBranchConditional %440 %441 %449 
					                                             %441 = OpLabel 
					                         read_only Texture2D %443 = OpLoad %397 
					                                     sampler %444 = OpLoad %399 
					                  read_only Texture2DSampled %445 = OpSampledImage %443 %444 
					                                       f32_4 %446 = OpLoad %124 
					                                       f32_2 %447 = OpVectorShuffle %446 %446 0 1 
					                                       f32_4 %448 = OpImageSampleExplicitLod %445 %447 Lod %23 
					                                                      OpStore %355 %448 
					                                                      OpBranch %442 
					                                             %449 = OpLabel 
					                                         i32 %450 = OpLoad %274 
					                                        bool %451 = OpIEqual %450 %127 
					                                                      OpStore %391 %451 
					                                        bool %452 = OpLoad %391 
					                                                      OpSelectionMerge %454 None 
					                                                      OpBranchConditional %452 %453 %461 
					                                             %453 = OpLabel 
					                         read_only Texture2D %455 = OpLoad %411 
					                                     sampler %456 = OpLoad %413 
					                  read_only Texture2DSampled %457 = OpSampledImage %455 %456 
					                                       f32_4 %458 = OpLoad %124 
					                                       f32_2 %459 = OpVectorShuffle %458 %458 0 1 
					                                       f32_4 %460 = OpImageSampleExplicitLod %457 %459 Lod %23 
					                                                      OpStore %355 %460 
					                                                      OpBranch %454 
					                                             %461 = OpLabel 
					                         read_only Texture2D %462 = OpLoad %420 
					                                     sampler %463 = OpLoad %422 
					                  read_only Texture2DSampled %464 = OpSampledImage %462 %463 
					                                       f32_4 %465 = OpLoad %124 
					                                       f32_2 %466 = OpVectorShuffle %465 %465 0 1 
					                                       f32_4 %467 = OpImageSampleExplicitLod %464 %466 Lod %23 
					                                                      OpStore %355 %467 
					                                                      OpBranch %454 
					                                             %454 = OpLabel 
					                                                      OpBranch %442 
					                                             %442 = OpLabel 
					                                                      OpBranch %430 
					                                             %430 = OpLabel 
					                                        bool %468 = OpLoad %291 
					                                                      OpSelectionMerge %470 None 
					                                                      OpBranchConditional %468 %469 %477 
					                                             %469 = OpLabel 
					                         read_only Texture2D %471 = OpLoad %382 
					                                     sampler %472 = OpLoad %384 
					                  read_only Texture2DSampled %473 = OpSampledImage %471 %472 
					                                       f32_4 %474 = OpLoad %124 
					                                       f32_2 %475 = OpVectorShuffle %474 %474 2 3 
					                                       f32_4 %476 = OpImageSampleExplicitLod %473 %475 Lod %23 
					                                                      OpStore %362 %476 
					                                                      OpBranch %470 
					                                             %477 = OpLabel 
					                                         i32 %478 = OpLoad %274 
					                                        bool %479 = OpIEqual %478 %90 
					                                                      OpStore %391 %479 
					                                        bool %480 = OpLoad %391 
					                                                      OpSelectionMerge %482 None 
					                                                      OpBranchConditional %480 %481 %489 
					                                             %481 = OpLabel 
					                         read_only Texture2D %483 = OpLoad %397 
					                                     sampler %484 = OpLoad %399 
					                  read_only Texture2DSampled %485 = OpSampledImage %483 %484 
					                                       f32_4 %486 = OpLoad %124 
					                                       f32_2 %487 = OpVectorShuffle %486 %486 2 3 
					                                       f32_4 %488 = OpImageSampleExplicitLod %485 %487 Lod %23 
					                                                      OpStore %362 %488 
					                                                      OpBranch %482 
					                                             %489 = OpLabel 
					                                         i32 %490 = OpLoad %274 
					                                        bool %491 = OpIEqual %490 %127 
					                                                      OpStore %391 %491 
					                                        bool %492 = OpLoad %391 
					                                                      OpSelectionMerge %494 None 
					                                                      OpBranchConditional %492 %493 %501 
					                                             %493 = OpLabel 
					                         read_only Texture2D %495 = OpLoad %411 
					                                     sampler %496 = OpLoad %413 
					                  read_only Texture2DSampled %497 = OpSampledImage %495 %496 
					                                       f32_4 %498 = OpLoad %124 
					                                       f32_2 %499 = OpVectorShuffle %498 %498 2 3 
					                                       f32_4 %500 = OpImageSampleExplicitLod %497 %499 Lod %23 
					                                                      OpStore %362 %500 
					                                                      OpBranch %494 
					                                             %501 = OpLabel 
					                         read_only Texture2D %502 = OpLoad %420 
					                                     sampler %503 = OpLoad %422 
					                  read_only Texture2DSampled %504 = OpSampledImage %502 %503 
					                                       f32_4 %505 = OpLoad %124 
					                                       f32_2 %506 = OpVectorShuffle %505 %505 2 3 
					                                       f32_4 %507 = OpImageSampleExplicitLod %504 %506 Lod %23 
					                                                      OpStore %362 %507 
					                                                      OpBranch %494 
					                                             %494 = OpLabel 
					                                                      OpBranch %482 
					                                             %482 = OpLabel 
					                                                      OpBranch %470 
					                                             %470 = OpLabel 
					                                        bool %508 = OpLoad %291 
					                                                      OpSelectionMerge %510 None 
					                                                      OpBranchConditional %508 %509 %517 
					                                             %509 = OpLabel 
					                         read_only Texture2D %511 = OpLoad %382 
					                                     sampler %512 = OpLoad %384 
					                  read_only Texture2DSampled %513 = OpSampledImage %511 %512 
					                                       f32_4 %514 = OpLoad %124 
					                                       f32_2 %515 = OpVectorShuffle %514 %514 0 3 
					                                       f32_4 %516 = OpImageSampleExplicitLod %513 %515 Lod %23 
					                                                      OpStore %369 %516 
					                                                      OpBranch %510 
					                                             %517 = OpLabel 
					                                         i32 %518 = OpLoad %274 
					                                        bool %519 = OpIEqual %518 %90 
					                                                      OpStore %291 %519 
					                                        bool %520 = OpLoad %291 
					                                                      OpSelectionMerge %522 None 
					                                                      OpBranchConditional %520 %521 %529 
					                                             %521 = OpLabel 
					                         read_only Texture2D %523 = OpLoad %397 
					                                     sampler %524 = OpLoad %399 
					                  read_only Texture2DSampled %525 = OpSampledImage %523 %524 
					                                       f32_4 %526 = OpLoad %124 
					                                       f32_2 %527 = OpVectorShuffle %526 %526 0 3 
					                                       f32_4 %528 = OpImageSampleExplicitLod %525 %527 Lod %23 
					                                                      OpStore %369 %528 
					                                                      OpBranch %522 
					                                             %529 = OpLabel 
					                                         i32 %530 = OpLoad %274 
					                                        bool %531 = OpIEqual %530 %127 
					                                                      OpStore %291 %531 
					                                        bool %532 = OpLoad %291 
					                                                      OpSelectionMerge %534 None 
					                                                      OpBranchConditional %532 %533 %541 
					                                             %533 = OpLabel 
					                         read_only Texture2D %535 = OpLoad %411 
					                                     sampler %536 = OpLoad %413 
					                  read_only Texture2DSampled %537 = OpSampledImage %535 %536 
					                                       f32_4 %538 = OpLoad %124 
					                                       f32_2 %539 = OpVectorShuffle %538 %538 0 3 
					                                       f32_4 %540 = OpImageSampleExplicitLod %537 %539 Lod %23 
					                                                      OpStore %369 %540 
					                                                      OpBranch %534 
					                                             %541 = OpLabel 
					                         read_only Texture2D %542 = OpLoad %420 
					                                     sampler %543 = OpLoad %422 
					                  read_only Texture2DSampled %544 = OpSampledImage %542 %543 
					                                       f32_4 %545 = OpLoad %124 
					                                       f32_2 %546 = OpVectorShuffle %545 %545 0 3 
					                                       f32_4 %547 = OpImageSampleExplicitLod %544 %546 Lod %23 
					                                                      OpStore %369 %547 
					                                                      OpBranch %534 
					                                             %534 = OpLabel 
					                                                      OpBranch %522 
					                                             %522 = OpLabel 
					                                                      OpBranch %510 
					                                             %510 = OpLabel 
					                                                      OpBranch %345 
					                                             %345 = OpLabel 
					                                       f32_2 %548 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %549 = OpLoad %77 
					                                       f32_2 %550 = OpVectorShuffle %549 %549 2 3 
					                                       f32_2 %551 = OpFMul %548 %550 
					                                       f32_4 %552 = OpLoad %134 
					                                       f32_2 %553 = OpVectorShuffle %552 %552 2 1 
					                                       f32_2 %554 = OpFNegate %553 
					                                       f32_2 %555 = OpFAdd %551 %554 
					                                       f32_4 %556 = OpLoad %77 
					                                       f32_4 %557 = OpVectorShuffle %556 %555 4 5 2 3 
					                                                      OpStore %77 %557 
					                                       f32_4 %559 = OpLoad %77 
					                                       f32_2 %560 = OpVectorShuffle %559 %559 1 0 
					                                       f32_2 %561 = OpFNegate %560 
					                                       f32_2 %563 = OpFAdd %561 %562 
					                                                      OpStore %558 %563 
					                                Private f32* %564 = OpAccessChain %558 %52 
					                                         f32 %565 = OpLoad %564 
					                                Private f32* %566 = OpAccessChain %558 %311 
					                                         f32 %567 = OpLoad %566 
					                                         f32 %568 = OpFMul %565 %567 
					                                Private f32* %569 = OpAccessChain %134 %52 
					                                                      OpStore %569 %568 
					                                       f32_2 %570 = OpLoad %558 
					                                       f32_4 %571 = OpLoad %77 
					                                       f32_2 %572 = OpVectorShuffle %571 %571 0 1 
					                                       f32_2 %573 = OpFMul %570 %572 
					                                                      OpStore %558 %573 
					                                Private f32* %574 = OpAccessChain %77 %311 
					                                         f32 %575 = OpLoad %574 
					                                Private f32* %576 = OpAccessChain %77 %52 
					                                         f32 %577 = OpLoad %576 
					                                         f32 %578 = OpFMul %575 %577 
					                                Private f32* %579 = OpAccessChain %77 %52 
					                                                      OpStore %579 %578 
					                                Uniform f32* %581 = OpAccessChain %60 %281 %52 
					                                         f32 %582 = OpLoad %581 
					                                Uniform f32* %583 = OpAccessChain %60 %281 %311 
					                                         f32 %584 = OpLoad %583 
					                                Uniform f32* %585 = OpAccessChain %60 %281 %52 
					                                         f32 %586 = OpLoad %585 
					                                Uniform f32* %587 = OpAccessChain %60 %281 %311 
					                                         f32 %588 = OpLoad %587 
					                                       f32_4 %589 = OpCompositeConstruct %582 %584 %586 %588 
					                                       f32_4 %590 = OpFDiv %336 %589 
					                                                      OpStore %580 %590 
					                                       f32_4 %592 = OpLoad %124 
					                                       f32_4 %593 = OpVectorShuffle %592 %592 2 1 0 3 
					                                Uniform f32* %594 = OpAccessChain %60 %281 %52 
					                                         f32 %595 = OpLoad %594 
					                                Uniform f32* %596 = OpAccessChain %60 %281 %311 
					                                         f32 %597 = OpLoad %596 
					                                Uniform f32* %598 = OpAccessChain %60 %281 %52 
					                                         f32 %599 = OpLoad %598 
					                                Uniform f32* %600 = OpAccessChain %60 %281 %311 
					                                         f32 %601 = OpLoad %600 
					                                       f32_4 %602 = OpCompositeConstruct %595 %597 %599 %601 
					                                       f32_4 %603 = OpFMul %593 %602 
					                                       f32_4 %604 = OpFAdd %603 %328 
					                                                      OpStore %591 %604 
					                                       f32_4 %605 = OpLoad %591 
					                                       f32_4 %606 = OpExtInst %1 8 %605 
					                                                      OpStore %591 %606 
					                                       f32_4 %607 = OpLoad %591 
					                                       f32_4 %609 = OpFAdd %607 %608 
					                                                      OpStore %591 %609 
					                                       f32_4 %610 = OpLoad %580 
					                                       f32_4 %611 = OpLoad %591 
					                                       f32_4 %612 = OpFMul %610 %611 
					                                                      OpStore %591 %612 
					                                       f32_4 %613 = OpLoad %124 
					                                Uniform f32* %614 = OpAccessChain %60 %281 %52 
					                                         f32 %615 = OpLoad %614 
					                                Uniform f32* %616 = OpAccessChain %60 %281 %311 
					                                         f32 %617 = OpLoad %616 
					                                Uniform f32* %618 = OpAccessChain %60 %281 %52 
					                                         f32 %619 = OpLoad %618 
					                                Uniform f32* %620 = OpAccessChain %60 %281 %311 
					                                         f32 %621 = OpLoad %620 
					                                       f32_4 %622 = OpCompositeConstruct %615 %617 %619 %621 
					                                       f32_4 %623 = OpFMul %613 %622 
					                                       f32_4 %624 = OpFAdd %623 %328 
					                                                      OpStore %124 %624 
					                                       f32_4 %625 = OpLoad %124 
					                                       f32_4 %626 = OpExtInst %1 8 %625 
					                                                      OpStore %124 %626 
					                                       f32_4 %627 = OpLoad %124 
					                                       f32_4 %628 = OpFAdd %627 %608 
					                                                      OpStore %124 %628 
					                                       f32_4 %629 = OpLoad %580 
					                                       f32_4 %630 = OpLoad %124 
					                                       f32_4 %631 = OpFMul %629 %630 
					                                                      OpStore %124 %631 
					                         read_only Texture2D %634 = OpLoad %633 
					                                     sampler %636 = OpLoad %635 
					                  read_only Texture2DSampled %637 = OpSampledImage %634 %636 
					                                       f32_2 %638 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %639 = OpImageSampleExplicitLod %637 %638 Lod %23 
					                                                      OpStore %632 %639 
					                                       f32_4 %641 = OpLoad %632 
					                                       f32_3 %642 = OpVectorShuffle %641 %641 0 1 2 
					                                       f32_3 %643 = OpFMul %642 %119 
					                                       f32_3 %644 = OpFAdd %643 %122 
					                                                      OpStore %640 %644 
					                         read_only Texture2D %646 = OpLoad %633 
					                                     sampler %647 = OpLoad %635 
					                  read_only Texture2DSampled %648 = OpSampledImage %646 %647 
					                                       f32_4 %649 = OpLoad %591 
					                                       f32_2 %650 = OpVectorShuffle %649 %649 0 1 
					                                       f32_4 %651 = OpImageSampleExplicitLod %648 %650 Lod %23 
					                                                      OpStore %645 %651 
					                         read_only Texture2D %653 = OpLoad %633 
					                                     sampler %654 = OpLoad %635 
					                  read_only Texture2DSampled %655 = OpSampledImage %653 %654 
					                                       f32_4 %656 = OpLoad %124 
					                                       f32_2 %657 = OpVectorShuffle %656 %656 0 1 
					                                       f32_4 %658 = OpImageSampleExplicitLod %655 %657 Lod %23 
					                                                      OpStore %652 %658 
					                         read_only Texture2D %660 = OpLoad %633 
					                                     sampler %661 = OpLoad %635 
					                  read_only Texture2DSampled %662 = OpSampledImage %660 %661 
					                                       f32_4 %663 = OpLoad %124 
					                                       f32_2 %664 = OpVectorShuffle %663 %663 2 3 
					                                       f32_4 %665 = OpImageSampleExplicitLod %662 %664 Lod %23 
					                                                      OpStore %659 %665 
					                         read_only Texture2D %667 = OpLoad %633 
					                                     sampler %668 = OpLoad %635 
					                  read_only Texture2DSampled %669 = OpSampledImage %667 %668 
					                                       f32_4 %670 = OpLoad %591 
					                                       f32_2 %671 = OpVectorShuffle %670 %670 2 3 
					                                       f32_4 %672 = OpImageSampleExplicitLod %669 %671 Lod %23 
					                                                      OpStore %666 %672 
					                                       f32_4 %674 = OpLoad %645 
					                                       f32_3 %675 = OpVectorShuffle %674 %674 0 1 2 
					                                       f32_3 %676 = OpFMul %675 %119 
					                                       f32_3 %677 = OpFAdd %676 %122 
					                                                      OpStore %673 %677 
					                                       f32_4 %679 = OpLoad %652 
					                                       f32_3 %680 = OpVectorShuffle %679 %679 0 1 2 
					                                       f32_3 %681 = OpFMul %680 %119 
					                                       f32_3 %682 = OpFAdd %681 %122 
					                                                      OpStore %678 %682 
					                                       f32_4 %684 = OpLoad %659 
					                                       f32_3 %685 = OpVectorShuffle %684 %684 0 1 2 
					                                       f32_3 %686 = OpFMul %685 %119 
					                                       f32_3 %687 = OpFAdd %686 %122 
					                                                      OpStore %683 %687 
					                                       f32_4 %689 = OpLoad %666 
					                                       f32_3 %690 = OpVectorShuffle %689 %689 0 1 2 
					                                       f32_3 %691 = OpFMul %690 %119 
					                                       f32_3 %692 = OpFAdd %691 %122 
					                                                      OpStore %688 %692 
					                                       f32_3 %694 = OpLoad %640 
					                                       f32_3 %695 = OpLoad %673 
					                                         f32 %696 = OpDot %694 %695 
					                                                      OpStore %693 %696 
					                                         f32 %697 = OpLoad %693 
					                                         f32 %698 = OpExtInst %1 43 %697 %271 %31 
					                                                      OpStore %693 %698 
					                                         f32 %700 = OpLoad %693 
					                                Private f32* %701 = OpAccessChain %134 %52 
					                                         f32 %702 = OpLoad %701 
					                                         f32 %703 = OpFMul %700 %702 
					                                Private f32* %704 = OpAccessChain %699 %52 
					                                                      OpStore %704 %703 
					                                       f32_3 %705 = OpLoad %640 
					                                       f32_3 %706 = OpLoad %678 
					                                         f32 %707 = OpDot %705 %706 
					                                Private f32* %708 = OpAccessChain %116 %52 
					                                                      OpStore %708 %707 
					                                Private f32* %709 = OpAccessChain %116 %52 
					                                         f32 %710 = OpLoad %709 
					                                         f32 %711 = OpExtInst %1 43 %710 %271 %31 
					                                Private f32* %712 = OpAccessChain %116 %52 
					                                                      OpStore %712 %711 
					                                Private f32* %713 = OpAccessChain %558 %52 
					                                         f32 %714 = OpLoad %713 
					                                Private f32* %715 = OpAccessChain %116 %52 
					                                         f32 %716 = OpLoad %715 
					                                         f32 %717 = OpFMul %714 %716 
					                                Private f32* %718 = OpAccessChain %558 %52 
					                                                      OpStore %718 %717 
					                                       f32_3 %719 = OpLoad %640 
					                                       f32_3 %720 = OpLoad %683 
					                                         f32 %721 = OpDot %719 %720 
					                                Private f32* %722 = OpAccessChain %116 %52 
					                                                      OpStore %722 %721 
					                                Private f32* %723 = OpAccessChain %116 %52 
					                                         f32 %724 = OpLoad %723 
					                                         f32 %725 = OpExtInst %1 43 %724 %271 %31 
					                                Private f32* %726 = OpAccessChain %116 %52 
					                                                      OpStore %726 %725 
					                                Private f32* %728 = OpAccessChain %558 %311 
					                                         f32 %729 = OpLoad %728 
					                                Private f32* %730 = OpAccessChain %116 %52 
					                                         f32 %731 = OpLoad %730 
					                                         f32 %732 = OpFMul %729 %731 
					                                                      OpStore %727 %732 
					                                       f32_3 %733 = OpLoad %640 
					                                       f32_3 %734 = OpLoad %688 
					                                         f32 %735 = OpDot %733 %734 
					                                Private f32* %736 = OpAccessChain %116 %52 
					                                                      OpStore %736 %735 
					                                Private f32* %737 = OpAccessChain %116 %52 
					                                         f32 %738 = OpLoad %737 
					                                         f32 %739 = OpExtInst %1 43 %738 %271 %31 
					                                Private f32* %740 = OpAccessChain %116 %52 
					                                                      OpStore %740 %739 
					                                Private f32* %741 = OpAccessChain %77 %52 
					                                         f32 %742 = OpLoad %741 
					                                Private f32* %743 = OpAccessChain %116 %52 
					                                         f32 %744 = OpLoad %743 
					                                         f32 %745 = OpFMul %742 %744 
					                                Private f32* %746 = OpAccessChain %77 %52 
					                                                      OpStore %746 %745 
					                                Private f32* %747 = OpAccessChain %632 %26 
					                                         f32 %748 = OpLoad %747 
					                                Private f32* %749 = OpAccessChain %645 %26 
					                                         f32 %750 = OpLoad %749 
					                                         f32 %751 = OpFNegate %750 
					                                         f32 %752 = OpFAdd %748 %751 
					                                Private f32* %753 = OpAccessChain %116 %52 
					                                                      OpStore %753 %752 
					                                Private f32* %754 = OpAccessChain %116 %52 
					                                         f32 %755 = OpLoad %754 
					                                         f32 %756 = OpExtInst %1 4 %755 
					                                         f32 %757 = OpExtInst %1 31 %756 
					                                Private f32* %758 = OpAccessChain %116 %52 
					                                                      OpStore %758 %757 
					                                Private f32* %759 = OpAccessChain %116 %52 
					                                         f32 %760 = OpLoad %759 
					                                         f32 %761 = OpExtInst %1 31 %760 
					                                Private f32* %762 = OpAccessChain %116 %52 
					                                                      OpStore %762 %761 
					                                Private f32* %763 = OpAccessChain %116 %52 
					                                         f32 %764 = OpLoad %763 
					                                         f32 %765 = OpFNegate %764 
					                                         f32 %766 = OpFAdd %765 %31 
					                                Private f32* %767 = OpAccessChain %116 %52 
					                                                      OpStore %767 %766 
					                                Private f32* %768 = OpAccessChain %699 %52 
					                                         f32 %769 = OpLoad %768 
					                                Private f32* %770 = OpAccessChain %116 %52 
					                                         f32 %771 = OpLoad %770 
					                                         f32 %772 = OpFMul %769 %771 
					                                Private f32* %773 = OpAccessChain %77 %311 
					                                                      OpStore %773 %772 
					                                Private f32* %774 = OpAccessChain %632 %26 
					                                         f32 %775 = OpLoad %774 
					                                Private f32* %776 = OpAccessChain %652 %26 
					                                         f32 %777 = OpLoad %776 
					                                         f32 %778 = OpFNegate %777 
					                                         f32 %779 = OpFAdd %775 %778 
					                                Private f32* %780 = OpAccessChain %116 %52 
					                                                      OpStore %780 %779 
					                                Private f32* %781 = OpAccessChain %116 %52 
					                                         f32 %782 = OpLoad %781 
					                                         f32 %783 = OpExtInst %1 4 %782 
					                                         f32 %784 = OpExtInst %1 31 %783 
					                                Private f32* %785 = OpAccessChain %116 %52 
					                                                      OpStore %785 %784 
					                                Private f32* %786 = OpAccessChain %116 %52 
					                                         f32 %787 = OpLoad %786 
					                                         f32 %788 = OpExtInst %1 31 %787 
					                                Private f32* %789 = OpAccessChain %116 %52 
					                                                      OpStore %789 %788 
					                                Private f32* %790 = OpAccessChain %116 %52 
					                                         f32 %791 = OpLoad %790 
					                                         f32 %792 = OpFNegate %791 
					                                         f32 %793 = OpFAdd %792 %31 
					                                Private f32* %794 = OpAccessChain %116 %52 
					                                                      OpStore %794 %793 
					                                Private f32* %795 = OpAccessChain %558 %52 
					                                         f32 %796 = OpLoad %795 
					                                Private f32* %797 = OpAccessChain %116 %52 
					                                         f32 %798 = OpLoad %797 
					                                         f32 %799 = OpFMul %796 %798 
					                                Private f32* %800 = OpAccessChain %77 %41 
					                                                      OpStore %800 %799 
					                                Private f32* %801 = OpAccessChain %659 %26 
					                                         f32 %802 = OpLoad %801 
					                                         f32 %803 = OpFNegate %802 
					                                Private f32* %804 = OpAccessChain %632 %26 
					                                         f32 %805 = OpLoad %804 
					                                         f32 %806 = OpFAdd %803 %805 
					                                Private f32* %807 = OpAccessChain %116 %52 
					                                                      OpStore %807 %806 
					                                Private f32* %808 = OpAccessChain %116 %52 
					                                         f32 %809 = OpLoad %808 
					                                         f32 %810 = OpExtInst %1 4 %809 
					                                         f32 %811 = OpExtInst %1 31 %810 
					                                Private f32* %812 = OpAccessChain %116 %52 
					                                                      OpStore %812 %811 
					                                Private f32* %813 = OpAccessChain %116 %52 
					                                         f32 %814 = OpLoad %813 
					                                         f32 %815 = OpExtInst %1 31 %814 
					                                Private f32* %816 = OpAccessChain %116 %52 
					                                                      OpStore %816 %815 
					                                Private f32* %817 = OpAccessChain %116 %52 
					                                         f32 %818 = OpLoad %817 
					                                         f32 %819 = OpFNegate %818 
					                                         f32 %820 = OpFAdd %819 %31 
					                                Private f32* %821 = OpAccessChain %116 %52 
					                                                      OpStore %821 %820 
					                                         f32 %822 = OpLoad %727 
					                                Private f32* %823 = OpAccessChain %116 %52 
					                                         f32 %824 = OpLoad %823 
					                                         f32 %825 = OpFMul %822 %824 
					                                Private f32* %826 = OpAccessChain %77 %26 
					                                                      OpStore %826 %825 
					                                Private f32* %827 = OpAccessChain %666 %26 
					                                         f32 %828 = OpLoad %827 
					                                         f32 %829 = OpFNegate %828 
					                                Private f32* %830 = OpAccessChain %632 %26 
					                                         f32 %831 = OpLoad %830 
					                                         f32 %832 = OpFAdd %829 %831 
					                                Private f32* %833 = OpAccessChain %116 %52 
					                                                      OpStore %833 %832 
					                                Private f32* %834 = OpAccessChain %116 %52 
					                                         f32 %835 = OpLoad %834 
					                                         f32 %836 = OpExtInst %1 4 %835 
					                                         f32 %837 = OpExtInst %1 31 %836 
					                                Private f32* %838 = OpAccessChain %116 %52 
					                                                      OpStore %838 %837 
					                                Private f32* %839 = OpAccessChain %116 %52 
					                                         f32 %840 = OpLoad %839 
					                                         f32 %841 = OpExtInst %1 31 %840 
					                                Private f32* %842 = OpAccessChain %116 %52 
					                                                      OpStore %842 %841 
					                                Private f32* %843 = OpAccessChain %116 %52 
					                                         f32 %844 = OpLoad %843 
					                                         f32 %845 = OpFNegate %844 
					                                         f32 %846 = OpFAdd %845 %31 
					                                Private f32* %847 = OpAccessChain %116 %52 
					                                                      OpStore %847 %846 
					                                Private f32* %848 = OpAccessChain %77 %52 
					                                         f32 %849 = OpLoad %848 
					                                Private f32* %850 = OpAccessChain %116 %52 
					                                         f32 %851 = OpLoad %850 
					                                         f32 %852 = OpFMul %849 %851 
					                                Private f32* %853 = OpAccessChain %77 %52 
					                                                      OpStore %853 %852 
					                                       f32_4 %854 = OpLoad %77 
					                                       f32_4 %857 = OpExtInst %1 40 %854 %856 
					                                                      OpStore %77 %857 
					                                Private f32* %858 = OpAccessChain %77 %41 
					                                         f32 %859 = OpLoad %858 
					                                Private f32* %860 = OpAccessChain %77 %311 
					                                         f32 %861 = OpLoad %860 
					                                         f32 %862 = OpFAdd %859 %861 
					                                Private f32* %863 = OpAccessChain %134 %52 
					                                                      OpStore %863 %862 
					                                Private f32* %864 = OpAccessChain %77 %26 
					                                         f32 %865 = OpLoad %864 
					                                Private f32* %866 = OpAccessChain %134 %52 
					                                         f32 %867 = OpLoad %866 
					                                         f32 %868 = OpFAdd %865 %867 
					                                Private f32* %869 = OpAccessChain %134 %52 
					                                                      OpStore %869 %868 
					                                Private f32* %870 = OpAccessChain %77 %52 
					                                         f32 %871 = OpLoad %870 
					                                Private f32* %872 = OpAccessChain %134 %52 
					                                         f32 %873 = OpLoad %872 
					                                         f32 %874 = OpFAdd %871 %873 
					                                Private f32* %875 = OpAccessChain %134 %52 
					                                                      OpStore %875 %874 
					                                Private f32* %876 = OpAccessChain %134 %52 
					                                         f32 %877 = OpLoad %876 
					                                         f32 %878 = OpFDiv %31 %877 
					                                Private f32* %879 = OpAccessChain %134 %52 
					                                                      OpStore %879 %878 
					                                       f32_4 %880 = OpLoad %77 
					                                       f32_4 %881 = OpVectorShuffle %880 %880 2 2 2 2 
					                                       f32_4 %882 = OpLoad %355 
					                                       f32_4 %883 = OpFMul %881 %882 
					                                                      OpStore %124 %883 
					                                       f32_4 %884 = OpLoad %346 
					                                       f32_4 %885 = OpLoad %77 
					                                       f32_4 %886 = OpVectorShuffle %885 %885 1 1 1 1 
					                                       f32_4 %887 = OpFMul %884 %886 
					                                       f32_4 %888 = OpLoad %124 
					                                       f32_4 %889 = OpFAdd %887 %888 
					                                                      OpStore %124 %889 
					                                       f32_4 %890 = OpLoad %362 
					                                       f32_4 %891 = OpLoad %77 
					                                       f32_4 %892 = OpVectorShuffle %891 %891 3 3 3 3 
					                                       f32_4 %893 = OpFMul %890 %892 
					                                       f32_4 %894 = OpLoad %124 
					                                       f32_4 %895 = OpFAdd %893 %894 
					                                                      OpStore %124 %895 
					                                       f32_4 %896 = OpLoad %369 
					                                       f32_4 %897 = OpLoad %77 
					                                       f32_4 %898 = OpVectorShuffle %897 %897 0 0 0 0 
					                                       f32_4 %899 = OpFMul %896 %898 
					                                       f32_4 %900 = OpLoad %124 
					                                       f32_4 %901 = OpFAdd %899 %900 
					                                                      OpStore %77 %901 
					                                       f32_4 %902 = OpLoad %134 
					                                       f32_4 %903 = OpVectorShuffle %902 %902 0 0 0 0 
					                                       f32_4 %904 = OpLoad %77 
					                                       f32_4 %905 = OpFMul %903 %904 
					                                                      OpStore %77 %905 
					                                         i32 %906 = OpLoad %277 
					                                         i32 %907 = OpSNegate %906 
					                                         f32 %908 = OpConvertSToF %907 
					                                Private f32* %909 = OpAccessChain %134 %52 
					                                                      OpStore %909 %908 
					                                Private f32* %910 = OpAccessChain %134 %52 
					                                         f32 %911 = OpLoad %910 
					                                         f32 %912 = OpExtInst %1 29 %911 
					                                Private f32* %913 = OpAccessChain %134 %52 
					                                                      OpStore %913 %912 
					                                       f32_4 %914 = OpLoad %134 
					                                       f32_4 %915 = OpVectorShuffle %914 %914 0 0 0 0 
					                                Uniform f32* %916 = OpAccessChain %60 %281 %52 
					                                         f32 %917 = OpLoad %916 
					                                Uniform f32* %918 = OpAccessChain %60 %281 %311 
					                                         f32 %919 = OpLoad %918 
					                                Uniform f32* %920 = OpAccessChain %60 %281 %52 
					                                         f32 %921 = OpLoad %920 
					                                Uniform f32* %922 = OpAccessChain %60 %281 %311 
					                                         f32 %923 = OpLoad %922 
					                                       f32_4 %924 = OpCompositeConstruct %917 %919 %921 %923 
					                                       f32_4 %925 = OpFMul %915 %924 
					                                                      OpStore %124 %925 
					                                       f32_4 %926 = OpLoad %124 
					                                       f32_4 %927 = OpExtInst %1 8 %926 
					                                                      OpStore %124 %927 
					                                       f32_2 %928 = OpLoad vs_TEXCOORD1 
					                                       f32_4 %929 = OpVectorShuffle %928 %928 0 1 0 1 
					                                       f32_4 %930 = OpLoad %124 
					                                       f32_4 %931 = OpVectorShuffle %930 %930 2 3 2 3 
					                                       f32_4 %932 = OpFMul %929 %931 
					                                       f32_4 %933 = OpFAdd %932 %328 
					                                                      OpStore %346 %933 
					                                       f32_4 %934 = OpLoad %346 
					                                       f32_4 %935 = OpExtInst %1 8 %934 
					                                                      OpStore %346 %935 
					                                       f32_4 %936 = OpLoad %346 
					                                       f32_4 %937 = OpFAdd %936 %334 
					                                                      OpStore %346 %937 
					                                       f32_4 %938 = OpLoad %124 
					                                       f32_4 %939 = OpFDiv %336 %938 
					                                                      OpStore %355 %939 
					                                       f32_4 %940 = OpLoad %346 
					                                       f32_4 %941 = OpLoad %355 
					                                       f32_4 %942 = OpFMul %940 %941 
					                                                      OpStore %355 %942 
					                                         i32 %944 = OpLoad %277 
					                                        bool %945 = OpIEqual %944 %83 
					                                                      OpStore %943 %945 
					                                        bool %946 = OpLoad %943 
					                                                      OpSelectionMerge %948 None 
					                                                      OpBranchConditional %946 %947 %974 
					                                             %947 = OpLabel 
					                         read_only Texture2D %949 = OpLoad %382 
					                                     sampler %950 = OpLoad %384 
					                  read_only Texture2DSampled %951 = OpSampledImage %949 %950 
					                                       f32_4 %952 = OpLoad %355 
					                                       f32_2 %953 = OpVectorShuffle %952 %952 2 1 
					                                       f32_4 %954 = OpImageSampleExplicitLod %951 %953 Lod %23 
					                                                      OpStore %362 %954 
					                         read_only Texture2D %955 = OpLoad %382 
					                                     sampler %956 = OpLoad %384 
					                  read_only Texture2DSampled %957 = OpSampledImage %955 %956 
					                                       f32_4 %958 = OpLoad %355 
					                                       f32_2 %959 = OpVectorShuffle %958 %958 0 1 
					                                       f32_4 %960 = OpImageSampleExplicitLod %957 %959 Lod %23 
					                                                      OpStore %369 %960 
					                         read_only Texture2D %961 = OpLoad %382 
					                                     sampler %962 = OpLoad %384 
					                  read_only Texture2DSampled %963 = OpSampledImage %961 %962 
					                                       f32_4 %964 = OpLoad %355 
					                                       f32_2 %965 = OpVectorShuffle %964 %964 2 3 
					                                       f32_4 %966 = OpImageSampleExplicitLod %963 %965 Lod %23 
					                                                      OpStore %591 %966 
					                         read_only Texture2D %968 = OpLoad %382 
					                                     sampler %969 = OpLoad %384 
					                  read_only Texture2DSampled %970 = OpSampledImage %968 %969 
					                                       f32_4 %971 = OpLoad %355 
					                                       f32_2 %972 = OpVectorShuffle %971 %971 0 3 
					                                       f32_4 %973 = OpImageSampleExplicitLod %970 %972 Lod %23 
					                                                      OpStore %967 %973 
					                                                      OpBranch %948 
					                                             %974 = OpLabel 
					                                         i32 %975 = OpLoad %277 
					                                        bool %976 = OpIEqual %975 %90 
					                                                      OpStore %943 %976 
					                                        bool %977 = OpLoad %943 
					                                                      OpSelectionMerge %979 None 
					                                                      OpBranchConditional %977 %978 %986 
					                                             %978 = OpLabel 
					                         read_only Texture2D %980 = OpLoad %397 
					                                     sampler %981 = OpLoad %399 
					                  read_only Texture2DSampled %982 = OpSampledImage %980 %981 
					                                       f32_4 %983 = OpLoad %355 
					                                       f32_2 %984 = OpVectorShuffle %983 %983 2 1 
					                                       f32_4 %985 = OpImageSampleExplicitLod %982 %984 Lod %23 
					                                                      OpStore %362 %985 
					                                                      OpBranch %979 
					                                             %986 = OpLabel 
					                                         i32 %988 = OpLoad %277 
					                                        bool %989 = OpIEqual %988 %127 
					                                                      OpStore %987 %989 
					                                        bool %990 = OpLoad %987 
					                                                      OpSelectionMerge %992 None 
					                                                      OpBranchConditional %990 %991 %999 
					                                             %991 = OpLabel 
					                         read_only Texture2D %993 = OpLoad %411 
					                                     sampler %994 = OpLoad %413 
					                  read_only Texture2DSampled %995 = OpSampledImage %993 %994 
					                                       f32_4 %996 = OpLoad %355 
					                                       f32_2 %997 = OpVectorShuffle %996 %996 2 1 
					                                       f32_4 %998 = OpImageSampleExplicitLod %995 %997 Lod %23 
					                                                      OpStore %362 %998 
					                                                      OpBranch %992 
					                                             %999 = OpLabel 
					                        read_only Texture2D %1000 = OpLoad %420 
					                                    sampler %1001 = OpLoad %422 
					                 read_only Texture2DSampled %1002 = OpSampledImage %1000 %1001 
					                                      f32_4 %1003 = OpLoad %355 
					                                      f32_2 %1004 = OpVectorShuffle %1003 %1003 2 1 
					                                      f32_4 %1005 = OpImageSampleExplicitLod %1002 %1004 Lod %23 
					                                                      OpStore %362 %1005 
					                                                      OpBranch %992 
					                                             %992 = OpLabel 
					                                                      OpBranch %979 
					                                             %979 = OpLabel 
					                                       bool %1006 = OpLoad %943 
					                                                      OpSelectionMerge %1008 None 
					                                                      OpBranchConditional %1006 %1007 %1015 
					                                            %1007 = OpLabel 
					                        read_only Texture2D %1009 = OpLoad %397 
					                                    sampler %1010 = OpLoad %399 
					                 read_only Texture2DSampled %1011 = OpSampledImage %1009 %1010 
					                                      f32_4 %1012 = OpLoad %355 
					                                      f32_2 %1013 = OpVectorShuffle %1012 %1012 0 1 
					                                      f32_4 %1014 = OpImageSampleExplicitLod %1011 %1013 Lod %23 
					                                                      OpStore %369 %1014 
					                                                      OpBranch %1008 
					                                            %1015 = OpLabel 
					                                        i32 %1016 = OpLoad %277 
					                                       bool %1017 = OpIEqual %1016 %127 
					                                                      OpStore %987 %1017 
					                                       bool %1018 = OpLoad %987 
					                                                      OpSelectionMerge %1020 None 
					                                                      OpBranchConditional %1018 %1019 %1027 
					                                            %1019 = OpLabel 
					                        read_only Texture2D %1021 = OpLoad %411 
					                                    sampler %1022 = OpLoad %413 
					                 read_only Texture2DSampled %1023 = OpSampledImage %1021 %1022 
					                                      f32_4 %1024 = OpLoad %355 
					                                      f32_2 %1025 = OpVectorShuffle %1024 %1024 0 1 
					                                      f32_4 %1026 = OpImageSampleExplicitLod %1023 %1025 Lod %23 
					                                                      OpStore %369 %1026 
					                                                      OpBranch %1020 
					                                            %1027 = OpLabel 
					                        read_only Texture2D %1028 = OpLoad %420 
					                                    sampler %1029 = OpLoad %422 
					                 read_only Texture2DSampled %1030 = OpSampledImage %1028 %1029 
					                                      f32_4 %1031 = OpLoad %355 
					                                      f32_2 %1032 = OpVectorShuffle %1031 %1031 0 1 
					                                      f32_4 %1033 = OpImageSampleExplicitLod %1030 %1032 Lod %23 
					                                                      OpStore %369 %1033 
					                                                      OpBranch %1020 
					                                            %1020 = OpLabel 
					                                                      OpBranch %1008 
					                                            %1008 = OpLabel 
					                                       bool %1034 = OpLoad %943 
					                                                      OpSelectionMerge %1036 None 
					                                                      OpBranchConditional %1034 %1035 %1043 
					                                            %1035 = OpLabel 
					                        read_only Texture2D %1037 = OpLoad %397 
					                                    sampler %1038 = OpLoad %399 
					                 read_only Texture2DSampled %1039 = OpSampledImage %1037 %1038 
					                                      f32_4 %1040 = OpLoad %355 
					                                      f32_2 %1041 = OpVectorShuffle %1040 %1040 2 3 
					                                      f32_4 %1042 = OpImageSampleExplicitLod %1039 %1041 Lod %23 
					                                                      OpStore %591 %1042 
					                                                      OpBranch %1036 
					                                            %1043 = OpLabel 
					                                        i32 %1044 = OpLoad %277 
					                                       bool %1045 = OpIEqual %1044 %127 
					                                                      OpStore %987 %1045 
					                                       bool %1046 = OpLoad %987 
					                                                      OpSelectionMerge %1048 None 
					                                                      OpBranchConditional %1046 %1047 %1055 
					                                            %1047 = OpLabel 
					                        read_only Texture2D %1049 = OpLoad %411 
					                                    sampler %1050 = OpLoad %413 
					                 read_only Texture2DSampled %1051 = OpSampledImage %1049 %1050 
					                                      f32_4 %1052 = OpLoad %355 
					                                      f32_2 %1053 = OpVectorShuffle %1052 %1052 2 3 
					                                      f32_4 %1054 = OpImageSampleExplicitLod %1051 %1053 Lod %23 
					                                                      OpStore %591 %1054 
					                                                      OpBranch %1048 
					                                            %1055 = OpLabel 
					                        read_only Texture2D %1056 = OpLoad %420 
					                                    sampler %1057 = OpLoad %422 
					                 read_only Texture2DSampled %1058 = OpSampledImage %1056 %1057 
					                                      f32_4 %1059 = OpLoad %355 
					                                      f32_2 %1060 = OpVectorShuffle %1059 %1059 2 3 
					                                      f32_4 %1061 = OpImageSampleExplicitLod %1058 %1060 Lod %23 
					                                                      OpStore %591 %1061 
					                                                      OpBranch %1048 
					                                            %1048 = OpLabel 
					                                                      OpBranch %1036 
					                                            %1036 = OpLabel 
					                                       bool %1062 = OpLoad %943 
					                                                      OpSelectionMerge %1064 None 
					                                                      OpBranchConditional %1062 %1063 %1071 
					                                            %1063 = OpLabel 
					                        read_only Texture2D %1065 = OpLoad %397 
					                                    sampler %1066 = OpLoad %399 
					                 read_only Texture2DSampled %1067 = OpSampledImage %1065 %1066 
					                                      f32_4 %1068 = OpLoad %355 
					                                      f32_2 %1069 = OpVectorShuffle %1068 %1068 0 3 
					                                      f32_4 %1070 = OpImageSampleExplicitLod %1067 %1069 Lod %23 
					                                                      OpStore %967 %1070 
					                                                      OpBranch %1064 
					                                            %1071 = OpLabel 
					                                        i32 %1072 = OpLoad %277 
					                                       bool %1073 = OpIEqual %1072 %127 
					                                                      OpStore %943 %1073 
					                                       bool %1074 = OpLoad %943 
					                                                      OpSelectionMerge %1076 None 
					                                                      OpBranchConditional %1074 %1075 %1083 
					                                            %1075 = OpLabel 
					                        read_only Texture2D %1077 = OpLoad %411 
					                                    sampler %1078 = OpLoad %413 
					                 read_only Texture2DSampled %1079 = OpSampledImage %1077 %1078 
					                                      f32_4 %1080 = OpLoad %355 
					                                      f32_2 %1081 = OpVectorShuffle %1080 %1080 0 3 
					                                      f32_4 %1082 = OpImageSampleExplicitLod %1079 %1081 Lod %23 
					                                                      OpStore %967 %1082 
					                                                      OpBranch %1076 
					                                            %1083 = OpLabel 
					                        read_only Texture2D %1084 = OpLoad %420 
					                                    sampler %1085 = OpLoad %422 
					                 read_only Texture2DSampled %1086 = OpSampledImage %1084 %1085 
					                                      f32_4 %1087 = OpLoad %355 
					                                      f32_2 %1088 = OpVectorShuffle %1087 %1087 0 3 
					                                      f32_4 %1089 = OpImageSampleExplicitLod %1086 %1088 Lod %23 
					                                                      OpStore %967 %1089 
					                                                      OpBranch %1076 
					                                            %1076 = OpLabel 
					                                                      OpBranch %1064 
					                                            %1064 = OpLabel 
					                                                      OpBranch %948 
					                                             %948 = OpLabel 
					                                      f32_2 %1090 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1091 = OpLoad %124 
					                                      f32_2 %1092 = OpVectorShuffle %1091 %1091 2 3 
					                                      f32_2 %1093 = OpFMul %1090 %1092 
					                                      f32_4 %1094 = OpLoad %346 
					                                      f32_2 %1095 = OpVectorShuffle %1094 %1094 2 1 
					                                      f32_2 %1096 = OpFNegate %1095 
					                                      f32_2 %1097 = OpFAdd %1093 %1096 
					                                      f32_4 %1098 = OpLoad %124 
					                                      f32_4 %1099 = OpVectorShuffle %1098 %1097 4 5 2 3 
					                                                      OpStore %124 %1099 
					                                      f32_4 %1101 = OpLoad %124 
					                                      f32_2 %1102 = OpVectorShuffle %1101 %1101 1 0 
					                                      f32_2 %1103 = OpFNegate %1102 
					                                      f32_2 %1104 = OpFAdd %1103 %562 
					                                                      OpStore %1100 %1104 
					                               Private f32* %1105 = OpAccessChain %1100 %52 
					                                        f32 %1106 = OpLoad %1105 
					                               Private f32* %1107 = OpAccessChain %1100 %311 
					                                        f32 %1108 = OpLoad %1107 
					                                        f32 %1109 = OpFMul %1106 %1108 
					                               Private f32* %1110 = OpAccessChain %134 %52 
					                                                      OpStore %1110 %1109 
					                                      f32_2 %1111 = OpLoad %1100 
					                                      f32_4 %1112 = OpLoad %124 
					                                      f32_2 %1113 = OpVectorShuffle %1112 %1112 0 1 
					                                      f32_2 %1114 = OpFMul %1111 %1113 
					                                                      OpStore %1100 %1114 
					                               Private f32* %1115 = OpAccessChain %124 %311 
					                                        f32 %1116 = OpLoad %1115 
					                               Private f32* %1117 = OpAccessChain %124 %52 
					                                        f32 %1118 = OpLoad %1117 
					                                        f32 %1119 = OpFMul %1116 %1118 
					                               Private f32* %1120 = OpAccessChain %124 %52 
					                                                      OpStore %1120 %1119 
					                                      f32_4 %1121 = OpLoad %355 
					                                      f32_4 %1122 = OpVectorShuffle %1121 %1121 2 1 0 3 
					                               Uniform f32* %1123 = OpAccessChain %60 %281 %52 
					                                        f32 %1124 = OpLoad %1123 
					                               Uniform f32* %1125 = OpAccessChain %60 %281 %311 
					                                        f32 %1126 = OpLoad %1125 
					                               Uniform f32* %1127 = OpAccessChain %60 %281 %52 
					                                        f32 %1128 = OpLoad %1127 
					                               Uniform f32* %1129 = OpAccessChain %60 %281 %311 
					                                        f32 %1130 = OpLoad %1129 
					                                      f32_4 %1131 = OpCompositeConstruct %1124 %1126 %1128 %1130 
					                                      f32_4 %1132 = OpFMul %1122 %1131 
					                                      f32_4 %1133 = OpFAdd %1132 %328 
					                                                      OpStore %346 %1133 
					                                      f32_4 %1134 = OpLoad %346 
					                                      f32_4 %1135 = OpExtInst %1 8 %1134 
					                                                      OpStore %346 %1135 
					                                      f32_4 %1136 = OpLoad %346 
					                                      f32_4 %1137 = OpFAdd %1136 %608 
					                                                      OpStore %346 %1137 
					                                      f32_4 %1138 = OpLoad %580 
					                                      f32_4 %1139 = OpLoad %346 
					                                      f32_4 %1140 = OpFMul %1138 %1139 
					                                                      OpStore %346 %1140 
					                                      f32_4 %1141 = OpLoad %355 
					                               Uniform f32* %1142 = OpAccessChain %60 %281 %52 
					                                        f32 %1143 = OpLoad %1142 
					                               Uniform f32* %1144 = OpAccessChain %60 %281 %311 
					                                        f32 %1145 = OpLoad %1144 
					                               Uniform f32* %1146 = OpAccessChain %60 %281 %52 
					                                        f32 %1147 = OpLoad %1146 
					                               Uniform f32* %1148 = OpAccessChain %60 %281 %311 
					                                        f32 %1149 = OpLoad %1148 
					                                      f32_4 %1150 = OpCompositeConstruct %1143 %1145 %1147 %1149 
					                                      f32_4 %1151 = OpFMul %1141 %1150 
					                                      f32_4 %1152 = OpFAdd %1151 %328 
					                                                      OpStore %355 %1152 
					                                      f32_4 %1153 = OpLoad %355 
					                                      f32_4 %1154 = OpExtInst %1 8 %1153 
					                                                      OpStore %355 %1154 
					                                      f32_4 %1155 = OpLoad %355 
					                                      f32_4 %1156 = OpFAdd %1155 %608 
					                                                      OpStore %355 %1156 
					                                      f32_4 %1157 = OpLoad %580 
					                                      f32_4 %1158 = OpLoad %355 
					                                      f32_4 %1159 = OpFMul %1157 %1158 
					                                                      OpStore %355 %1159 
					                        read_only Texture2D %1161 = OpLoad %633 
					                                    sampler %1162 = OpLoad %635 
					                 read_only Texture2DSampled %1163 = OpSampledImage %1161 %1162 
					                                      f32_4 %1164 = OpLoad %346 
					                                      f32_2 %1165 = OpVectorShuffle %1164 %1164 0 1 
					                                      f32_4 %1166 = OpImageSampleExplicitLod %1163 %1165 Lod %23 
					                                                      OpStore %1160 %1166 
					                        read_only Texture2D %1167 = OpLoad %633 
					                                    sampler %1168 = OpLoad %635 
					                 read_only Texture2DSampled %1169 = OpSampledImage %1167 %1168 
					                                      f32_4 %1170 = OpLoad %355 
					                                      f32_2 %1171 = OpVectorShuffle %1170 %1170 0 1 
					                                      f32_4 %1172 = OpImageSampleExplicitLod %1169 %1171 Lod %23 
					                                                      OpStore %652 %1172 
					                        read_only Texture2D %1174 = OpLoad %633 
					                                    sampler %1175 = OpLoad %635 
					                 read_only Texture2DSampled %1176 = OpSampledImage %1174 %1175 
					                                      f32_4 %1177 = OpLoad %355 
					                                      f32_2 %1178 = OpVectorShuffle %1177 %1177 2 3 
					                                      f32_4 %1179 = OpImageSampleExplicitLod %1176 %1178 Lod %23 
					                                                      OpStore %1173 %1179 
					                        read_only Texture2D %1181 = OpLoad %633 
					                                    sampler %1182 = OpLoad %635 
					                 read_only Texture2DSampled %1183 = OpSampledImage %1181 %1182 
					                                      f32_4 %1184 = OpLoad %346 
					                                      f32_2 %1185 = OpVectorShuffle %1184 %1184 2 3 
					                                      f32_4 %1186 = OpImageSampleExplicitLod %1183 %1185 Lod %23 
					                                                      OpStore %1180 %1186 
					                                      f32_4 %1188 = OpLoad %1160 
					                                      f32_3 %1189 = OpVectorShuffle %1188 %1188 0 1 2 
					                                      f32_3 %1190 = OpFMul %1189 %119 
					                                      f32_3 %1191 = OpFAdd %1190 %122 
					                                                      OpStore %1187 %1191 
					                                      f32_4 %1192 = OpLoad %652 
					                                      f32_3 %1193 = OpVectorShuffle %1192 %1192 0 1 2 
					                                      f32_3 %1194 = OpFMul %1193 %119 
					                                      f32_3 %1195 = OpFAdd %1194 %122 
					                                                      OpStore %673 %1195 
					                                      f32_4 %1197 = OpLoad %1173 
					                                      f32_3 %1198 = OpVectorShuffle %1197 %1197 0 1 2 
					                                      f32_3 %1199 = OpFMul %1198 %119 
					                                      f32_3 %1200 = OpFAdd %1199 %122 
					                                                      OpStore %1196 %1200 
					                                      f32_4 %1202 = OpLoad %1180 
					                                      f32_3 %1203 = OpVectorShuffle %1202 %1202 0 1 2 
					                                      f32_3 %1204 = OpFMul %1203 %119 
					                                      f32_3 %1205 = OpFAdd %1204 %122 
					                                                      OpStore %1201 %1205 
					                                      f32_3 %1207 = OpLoad %640 
					                                      f32_3 %1208 = OpLoad %1187 
					                                        f32 %1209 = OpDot %1207 %1208 
					                                                      OpStore %1206 %1209 
					                                        f32 %1210 = OpLoad %1206 
					                                        f32 %1211 = OpExtInst %1 43 %1210 %271 %31 
					                                                      OpStore %1206 %1211 
					                               Private f32* %1212 = OpAccessChain %134 %52 
					                                        f32 %1213 = OpLoad %1212 
					                                        f32 %1214 = OpLoad %1206 
					                                        f32 %1215 = OpFMul %1213 %1214 
					                               Private f32* %1216 = OpAccessChain %134 %52 
					                                                      OpStore %1216 %1215 
					                                      f32_3 %1217 = OpLoad %640 
					                                      f32_3 %1218 = OpLoad %673 
					                                        f32 %1219 = OpDot %1217 %1218 
					                                                      OpStore %1206 %1219 
					                                        f32 %1220 = OpLoad %1206 
					                                        f32 %1221 = OpExtInst %1 43 %1220 %271 %31 
					                                                      OpStore %1206 %1221 
					                                        f32 %1223 = OpLoad %1206 
					                               Private f32* %1224 = OpAccessChain %1100 %52 
					                                        f32 %1225 = OpLoad %1224 
					                                        f32 %1226 = OpFMul %1223 %1225 
					                               Private f32* %1227 = OpAccessChain %1222 %52 
					                                                      OpStore %1227 %1226 
					                                      f32_3 %1229 = OpLoad %640 
					                                      f32_3 %1230 = OpLoad %1196 
					                                        f32 %1231 = OpDot %1229 %1230 
					                                                      OpStore %1228 %1231 
					                                        f32 %1232 = OpLoad %1228 
					                                        f32 %1233 = OpExtInst %1 43 %1232 %271 %31 
					                                                      OpStore %1228 %1233 
					                                        f32 %1234 = OpLoad %1228 
					                               Private f32* %1235 = OpAccessChain %1100 %311 
					                                        f32 %1236 = OpLoad %1235 
					                                        f32 %1237 = OpFMul %1234 %1236 
					                               Private f32* %1238 = OpAccessChain %1222 %311 
					                                                      OpStore %1238 %1237 
					                                      f32_3 %1239 = OpLoad %640 
					                                      f32_3 %1240 = OpLoad %1201 
					                                        f32 %1241 = OpDot %1239 %1240 
					                               Private f32* %1242 = OpAccessChain %640 %52 
					                                                      OpStore %1242 %1241 
					                               Private f32* %1243 = OpAccessChain %640 %52 
					                                        f32 %1244 = OpLoad %1243 
					                                        f32 %1245 = OpExtInst %1 43 %1244 %271 %31 
					                               Private f32* %1246 = OpAccessChain %640 %52 
					                                                      OpStore %1246 %1245 
					                               Private f32* %1248 = OpAccessChain %640 %52 
					                                        f32 %1249 = OpLoad %1248 
					                               Private f32* %1250 = OpAccessChain %124 %52 
					                                        f32 %1251 = OpLoad %1250 
					                                        f32 %1252 = OpFMul %1249 %1251 
					                                                      OpStore %1247 %1252 
					                               Private f32* %1254 = OpAccessChain %1160 %26 
					                                        f32 %1255 = OpLoad %1254 
					                                        f32 %1256 = OpFNegate %1255 
					                               Private f32* %1257 = OpAccessChain %632 %26 
					                                        f32 %1258 = OpLoad %1257 
					                                        f32 %1259 = OpFAdd %1256 %1258 
					                                                      OpStore %1253 %1259 
					                                        f32 %1260 = OpLoad %1253 
					                                        f32 %1261 = OpExtInst %1 4 %1260 
					                                        f32 %1262 = OpExtInst %1 31 %1261 
					                                                      OpStore %1253 %1262 
					                                        f32 %1263 = OpLoad %1253 
					                                        f32 %1264 = OpExtInst %1 31 %1263 
					                                                      OpStore %1253 %1264 
					                                        f32 %1265 = OpLoad %1253 
					                                        f32 %1266 = OpFNegate %1265 
					                                        f32 %1267 = OpFAdd %1266 %31 
					                                                      OpStore %1253 %1267 
					                                        f32 %1268 = OpLoad %1253 
					                               Private f32* %1269 = OpAccessChain %134 %52 
					                                        f32 %1270 = OpLoad %1269 
					                                        f32 %1271 = OpFMul %1268 %1270 
					                               Private f32* %1272 = OpAccessChain %134 %52 
					                                                      OpStore %1272 %1271 
					                               Private f32* %1273 = OpAccessChain %632 %26 
					                                        f32 %1274 = OpLoad %1273 
					                               Private f32* %1275 = OpAccessChain %652 %26 
					                                        f32 %1276 = OpLoad %1275 
					                                        f32 %1277 = OpFNegate %1276 
					                                        f32 %1278 = OpFAdd %1274 %1277 
					                                                      OpStore %1253 %1278 
					                                        f32 %1279 = OpLoad %1253 
					                                        f32 %1280 = OpExtInst %1 4 %1279 
					                                        f32 %1281 = OpExtInst %1 31 %1280 
					                                                      OpStore %1253 %1281 
					                                        f32 %1282 = OpLoad %1253 
					                                        f32 %1283 = OpExtInst %1 31 %1282 
					                                                      OpStore %1253 %1283 
					                                        f32 %1285 = OpLoad %1253 
					                                        f32 %1286 = OpFNegate %1285 
					                                        f32 %1287 = OpFAdd %1286 %31 
					                               Private f32* %1288 = OpAccessChain %1284 %52 
					                                                      OpStore %1288 %1287 
					                               Private f32* %1290 = OpAccessChain %1173 %26 
					                                        f32 %1291 = OpLoad %1290 
					                                        f32 %1292 = OpFNegate %1291 
					                               Private f32* %1293 = OpAccessChain %632 %26 
					                                        f32 %1294 = OpLoad %1293 
					                                        f32 %1295 = OpFAdd %1292 %1294 
					                                                      OpStore %1289 %1295 
					                                        f32 %1296 = OpLoad %1289 
					                                        f32 %1297 = OpExtInst %1 4 %1296 
					                                        f32 %1298 = OpExtInst %1 31 %1297 
					                                                      OpStore %1289 %1298 
					                                        f32 %1299 = OpLoad %1289 
					                                        f32 %1300 = OpExtInst %1 31 %1299 
					                                                      OpStore %1289 %1300 
					                                        f32 %1301 = OpLoad %1289 
					                                        f32 %1302 = OpFNegate %1301 
					                                        f32 %1303 = OpFAdd %1302 %31 
					                               Private f32* %1304 = OpAccessChain %1284 %311 
					                                                      OpStore %1304 %1303 
					                                      f32_2 %1305 = OpLoad %1284 
					                                      f32_2 %1306 = OpLoad %1222 
					                                      f32_2 %1307 = OpFMul %1305 %1306 
					                                      f32_4 %1308 = OpLoad %134 
					                                      f32_4 %1309 = OpVectorShuffle %1308 %1307 0 1 4 5 
					                                                      OpStore %134 %1309 
					                               Private f32* %1310 = OpAccessChain %1180 %26 
					                                        f32 %1311 = OpLoad %1310 
					                                        f32 %1312 = OpFNegate %1311 
					                               Private f32* %1313 = OpAccessChain %632 %26 
					                                        f32 %1314 = OpLoad %1313 
					                                        f32 %1315 = OpFAdd %1312 %1314 
					                               Private f32* %1316 = OpAccessChain %683 %52 
					                                                      OpStore %1316 %1315 
					                               Private f32* %1317 = OpAccessChain %683 %52 
					                                        f32 %1318 = OpLoad %1317 
					                                        f32 %1319 = OpExtInst %1 4 %1318 
					                                        f32 %1320 = OpExtInst %1 31 %1319 
					                               Private f32* %1321 = OpAccessChain %683 %52 
					                                                      OpStore %1321 %1320 
					                               Private f32* %1322 = OpAccessChain %683 %52 
					                                        f32 %1323 = OpLoad %1322 
					                                        f32 %1324 = OpExtInst %1 31 %1323 
					                               Private f32* %1325 = OpAccessChain %683 %52 
					                                                      OpStore %1325 %1324 
					                               Private f32* %1326 = OpAccessChain %683 %52 
					                                        f32 %1327 = OpLoad %1326 
					                                        f32 %1328 = OpFNegate %1327 
					                                        f32 %1329 = OpFAdd %1328 %31 
					                               Private f32* %1330 = OpAccessChain %683 %52 
					                                                      OpStore %1330 %1329 
					                                        f32 %1331 = OpLoad %1247 
					                               Private f32* %1332 = OpAccessChain %683 %52 
					                                        f32 %1333 = OpLoad %1332 
					                                        f32 %1334 = OpFMul %1331 %1333 
					                               Private f32* %1335 = OpAccessChain %134 %311 
					                                                      OpStore %1335 %1334 
					                                      f32_4 %1336 = OpLoad %134 
					                                      f32_4 %1337 = OpExtInst %1 40 %1336 %856 
					                                                      OpStore %134 %1337 
					                               Private f32* %1338 = OpAccessChain %134 %41 
					                                        f32 %1339 = OpLoad %1338 
					                               Private f32* %1340 = OpAccessChain %134 %52 
					                                        f32 %1341 = OpLoad %1340 
					                                        f32 %1342 = OpFAdd %1339 %1341 
					                               Private f32* %1343 = OpAccessChain %124 %52 
					                                                      OpStore %1343 %1342 
					                               Private f32* %1344 = OpAccessChain %134 %26 
					                                        f32 %1345 = OpLoad %1344 
					                               Private f32* %1346 = OpAccessChain %124 %52 
					                                        f32 %1347 = OpLoad %1346 
					                                        f32 %1348 = OpFAdd %1345 %1347 
					                               Private f32* %1349 = OpAccessChain %124 %52 
					                                                      OpStore %1349 %1348 
					                               Private f32* %1350 = OpAccessChain %134 %311 
					                                        f32 %1351 = OpLoad %1350 
					                               Private f32* %1352 = OpAccessChain %124 %52 
					                                        f32 %1353 = OpLoad %1352 
					                                        f32 %1354 = OpFAdd %1351 %1353 
					                               Private f32* %1355 = OpAccessChain %124 %52 
					                                                      OpStore %1355 %1354 
					                               Private f32* %1356 = OpAccessChain %124 %52 
					                                        f32 %1357 = OpLoad %1356 
					                                        f32 %1358 = OpFDiv %31 %1357 
					                               Private f32* %1359 = OpAccessChain %124 %52 
					                                                      OpStore %1359 %1358 
					                                      f32_4 %1360 = OpLoad %134 
					                                      f32_4 %1361 = OpVectorShuffle %1360 %1360 2 2 2 2 
					                                      f32_4 %1362 = OpLoad %369 
					                                      f32_4 %1363 = OpFMul %1361 %1362 
					                                                      OpStore %346 %1363 
					                                      f32_4 %1364 = OpLoad %362 
					                                      f32_4 %1365 = OpLoad %134 
					                                      f32_4 %1366 = OpVectorShuffle %1365 %1365 0 0 0 0 
					                                      f32_4 %1367 = OpFMul %1364 %1366 
					                                      f32_4 %1368 = OpLoad %346 
					                                      f32_4 %1369 = OpFAdd %1367 %1368 
					                                                      OpStore %346 %1369 
					                                      f32_4 %1370 = OpLoad %591 
					                                      f32_4 %1371 = OpLoad %134 
					                                      f32_4 %1372 = OpVectorShuffle %1371 %1371 3 3 3 3 
					                                      f32_4 %1373 = OpFMul %1370 %1372 
					                                      f32_4 %1374 = OpLoad %346 
					                                      f32_4 %1375 = OpFAdd %1373 %1374 
					                                                      OpStore %346 %1375 
					                                      f32_4 %1376 = OpLoad %967 
					                                      f32_4 %1377 = OpLoad %134 
					                                      f32_4 %1378 = OpVectorShuffle %1377 %1377 1 1 1 1 
					                                      f32_4 %1379 = OpFMul %1376 %1378 
					                                      f32_4 %1380 = OpLoad %346 
					                                      f32_4 %1381 = OpFAdd %1379 %1380 
					                                                      OpStore %134 %1381 
					                                      f32_4 %1382 = OpLoad %134 
					                                      f32_4 %1383 = OpLoad %124 
					                                      f32_4 %1384 = OpVectorShuffle %1383 %1383 0 0 0 0 
					                                      f32_4 %1385 = OpFMul %1382 %1384 
					                                      f32_4 %1386 = OpLoad %77 
					                                      f32_4 %1387 = OpFNegate %1386 
					                                      f32_4 %1388 = OpFAdd %1385 %1387 
					                                                      OpStore %134 %1388 
					                                        f32 %1389 = OpLoad %233 
					                                      f32_4 %1390 = OpCompositeConstruct %1389 %1389 %1389 %1389 
					                                      f32_4 %1391 = OpLoad %134 
					                                      f32_4 %1392 = OpVectorShuffle %1391 %1391 3 0 1 2 
					                                      f32_4 %1393 = OpFMul %1390 %1392 
					                                      f32_4 %1394 = OpLoad %77 
					                                      f32_4 %1395 = OpVectorShuffle %1394 %1394 3 0 1 2 
					                                      f32_4 %1396 = OpFAdd %1393 %1395 
					                                                      OpStore %77 %1396 
					                                      f32_4 %1399 = OpLoad %77 
					                                      f32_3 %1400 = OpVectorShuffle %1399 %1399 1 2 3 
					                                      f32_4 %1401 = OpLoad %1398 
					                                      f32_4 %1402 = OpVectorShuffle %1401 %1400 4 5 6 3 
					                                                      OpStore %1398 %1402 
					                                                      OpBranch %298 
					                                            %1403 = OpLabel 
					                                        i32 %1404 = OpLoad %274 
					                                       bool %1405 = OpIEqual %1404 %61 
					                                                      OpSelectionMerge %1407 None 
					                                                      OpBranchConditional %1405 %1406 %1413 
					                                            %1406 = OpLabel 
					                        read_only Texture2D %1408 = OpLoad %347 
					                                    sampler %1409 = OpLoad %349 
					                 read_only Texture2DSampled %1410 = OpSampledImage %1408 %1409 
					                                      f32_2 %1411 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1412 = OpImageSampleExplicitLod %1410 %1411 Lod %23 
					                                                      OpStore %134 %1412 
					                                                      OpBranch %1407 
					                                            %1413 = OpLabel 
					                                        i32 %1414 = OpLoad %274 
					                                       bool %1415 = OpIEqual %1414 %83 
					                                                      OpStore %391 %1415 
					                                       bool %1416 = OpLoad %391 
					                                                      OpSelectionMerge %1418 None 
					                                                      OpBranchConditional %1416 %1417 %1424 
					                                            %1417 = OpLabel 
					                        read_only Texture2D %1419 = OpLoad %382 
					                                    sampler %1420 = OpLoad %384 
					                 read_only Texture2DSampled %1421 = OpSampledImage %1419 %1420 
					                                      f32_2 %1422 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1423 = OpImageSampleExplicitLod %1421 %1422 Lod %23 
					                                                      OpStore %134 %1423 
					                                                      OpBranch %1418 
					                                            %1424 = OpLabel 
					                                        i32 %1425 = OpLoad %274 
					                                       bool %1426 = OpIEqual %1425 %90 
					                                                      OpStore %391 %1426 
					                                       bool %1427 = OpLoad %391 
					                                                      OpSelectionMerge %1429 None 
					                                                      OpBranchConditional %1427 %1428 %1435 
					                                            %1428 = OpLabel 
					                        read_only Texture2D %1430 = OpLoad %397 
					                                    sampler %1431 = OpLoad %399 
					                 read_only Texture2DSampled %1432 = OpSampledImage %1430 %1431 
					                                      f32_2 %1433 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1434 = OpImageSampleExplicitLod %1432 %1433 Lod %23 
					                                                      OpStore %134 %1434 
					                                                      OpBranch %1429 
					                                            %1435 = OpLabel 
					                                        i32 %1436 = OpLoad %274 
					                                       bool %1437 = OpIEqual %1436 %127 
					                                                      OpStore %245 %1437 
					                                       bool %1438 = OpLoad %245 
					                                                      OpSelectionMerge %1440 None 
					                                                      OpBranchConditional %1438 %1439 %1446 
					                                            %1439 = OpLabel 
					                        read_only Texture2D %1441 = OpLoad %411 
					                                    sampler %1442 = OpLoad %413 
					                 read_only Texture2DSampled %1443 = OpSampledImage %1441 %1442 
					                                      f32_2 %1444 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1445 = OpImageSampleExplicitLod %1443 %1444 Lod %23 
					                                                      OpStore %134 %1445 
					                                                      OpBranch %1440 
					                                            %1446 = OpLabel 
					                        read_only Texture2D %1447 = OpLoad %420 
					                                    sampler %1448 = OpLoad %422 
					                 read_only Texture2DSampled %1449 = OpSampledImage %1447 %1448 
					                                      f32_2 %1450 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1451 = OpImageSampleExplicitLod %1449 %1450 Lod %23 
					                                                      OpStore %134 %1451 
					                                                      OpBranch %1440 
					                                            %1440 = OpLabel 
					                                                      OpBranch %1429 
					                                            %1429 = OpLabel 
					                                                      OpBranch %1418 
					                                            %1418 = OpLabel 
					                                                      OpBranch %1407 
					                                            %1407 = OpLabel 
					                                        i32 %1452 = OpLoad %277 
					                                       bool %1453 = OpIEqual %1452 %83 
					                                                      OpStore %245 %1453 
					                                       bool %1454 = OpLoad %245 
					                                                      OpSelectionMerge %1456 None 
					                                                      OpBranchConditional %1454 %1455 %1462 
					                                            %1455 = OpLabel 
					                        read_only Texture2D %1457 = OpLoad %382 
					                                    sampler %1458 = OpLoad %384 
					                 read_only Texture2DSampled %1459 = OpSampledImage %1457 %1458 
					                                      f32_2 %1460 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1461 = OpImageSampleExplicitLod %1459 %1460 Lod %23 
					                                                      OpStore %124 %1461 
					                                                      OpBranch %1456 
					                                            %1462 = OpLabel 
					                                        i32 %1463 = OpLoad %277 
					                                       bool %1464 = OpIEqual %1463 %90 
					                                                      OpStore %245 %1464 
					                                       bool %1465 = OpLoad %245 
					                                                      OpSelectionMerge %1467 None 
					                                                      OpBranchConditional %1465 %1466 %1473 
					                                            %1466 = OpLabel 
					                        read_only Texture2D %1468 = OpLoad %397 
					                                    sampler %1469 = OpLoad %399 
					                 read_only Texture2DSampled %1470 = OpSampledImage %1468 %1469 
					                                      f32_2 %1471 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1472 = OpImageSampleExplicitLod %1470 %1471 Lod %23 
					                                                      OpStore %124 %1472 
					                                                      OpBranch %1467 
					                                            %1473 = OpLabel 
					                                        i32 %1474 = OpLoad %277 
					                                       bool %1475 = OpIEqual %1474 %127 
					                                                      OpStore %245 %1475 
					                                       bool %1476 = OpLoad %245 
					                                                      OpSelectionMerge %1478 None 
					                                                      OpBranchConditional %1476 %1477 %1484 
					                                            %1477 = OpLabel 
					                        read_only Texture2D %1479 = OpLoad %411 
					                                    sampler %1480 = OpLoad %413 
					                 read_only Texture2DSampled %1481 = OpSampledImage %1479 %1480 
					                                      f32_2 %1482 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1483 = OpImageSampleExplicitLod %1481 %1482 Lod %23 
					                                                      OpStore %124 %1483 
					                                                      OpBranch %1478 
					                                            %1484 = OpLabel 
					                        read_only Texture2D %1485 = OpLoad %420 
					                                    sampler %1486 = OpLoad %422 
					                 read_only Texture2DSampled %1487 = OpSampledImage %1485 %1486 
					                                      f32_2 %1488 = OpLoad vs_TEXCOORD1 
					                                      f32_4 %1489 = OpImageSampleExplicitLod %1487 %1488 Lod %23 
					                                                      OpStore %124 %1489 
					                                                      OpBranch %1478 
					                                            %1478 = OpLabel 
					                                                      OpBranch %1467 
					                                            %1467 = OpLabel 
					                                                      OpBranch %1456 
					                                            %1456 = OpLabel 
					                                      f32_4 %1490 = OpLoad %134 
					                                      f32_3 %1491 = OpVectorShuffle %1490 %1490 0 1 2 
					                                      f32_3 %1492 = OpFNegate %1491 
					                                      f32_4 %1493 = OpLoad %124 
					                                      f32_3 %1494 = OpVectorShuffle %1493 %1493 0 1 2 
					                                      f32_3 %1495 = OpFAdd %1492 %1494 
					                                                      OpStore %699 %1495 
					                                        f32 %1496 = OpLoad %233 
					                                      f32_3 %1497 = OpCompositeConstruct %1496 %1496 %1496 
					                                      f32_3 %1498 = OpLoad %699 
					                                      f32_3 %1499 = OpFMul %1497 %1498 
					                                      f32_4 %1500 = OpLoad %134 
					                                      f32_3 %1501 = OpVectorShuffle %1500 %1500 0 1 2 
					                                      f32_3 %1502 = OpFAdd %1499 %1501 
					                                      f32_4 %1503 = OpLoad %1398 
					                                      f32_4 %1504 = OpVectorShuffle %1503 %1502 4 5 6 3 
					                                                      OpStore %1398 %1504 
					                               Private f32* %1505 = OpAccessChain %134 %26 
					                                        f32 %1506 = OpLoad %1505 
					                               Private f32* %1507 = OpAccessChain %124 %26 
					                                        f32 %1508 = OpLoad %1507 
					                                        f32 %1509 = OpExtInst %1 37 %1506 %1508 
					                               Private f32* %1510 = OpAccessChain %77 %52 
					                                                      OpStore %1510 %1509 
					                                                      OpBranch %298 
					                                             %298 = OpLabel 
					                               Private f32* %1511 = OpAccessChain %77 %52 
					                                        f32 %1512 = OpLoad %1511 
					                                        f32 %1513 = OpExtInst %1 37 %1512 %31 
					                                                      OpStore %233 %1513 
					                                      f32_2 %1514 = OpLoad vs_TEXCOORD1 
					                                      f32_2 %1515 = OpFNegate %1514 
					                                      f32_2 %1516 = OpFAdd %1515 %562 
					                                                      OpStore %44 %1516 
					                               Private f32* %1517 = OpAccessChain %44 %311 
					                                        f32 %1518 = OpLoad %1517 
					                               Private f32* %1519 = OpAccessChain %44 %52 
					                                        f32 %1520 = OpLoad %1519 
					                                        f32 %1521 = OpExtInst %1 37 %1518 %1520 
					                               Private f32* %1522 = OpAccessChain %44 %52 
					                                                      OpStore %1522 %1521 
					                               Private f32* %1523 = OpAccessChain %44 %52 
					                                        f32 %1524 = OpLoad %1523 
					                                 Input f32* %1526 = OpAccessChain vs_TEXCOORD1 %52 
					                                        f32 %1527 = OpLoad %1526 
					                                        f32 %1528 = OpExtInst %1 37 %1524 %1527 
					                               Private f32* %1529 = OpAccessChain %44 %52 
					                                                      OpStore %1529 %1528 
					                               Uniform f32* %1531 = OpAccessChain %60 %1530 
					                                        f32 %1532 = OpLoad %1531 
					                                        f32 %1534 = OpFMul %1532 %1533 
					                                        f32 %1535 = OpFAdd %1534 %855 
					                                                      OpStore %251 %1535 
					                               Private f32* %1536 = OpAccessChain %44 %52 
					                                        f32 %1537 = OpLoad %1536 
					                                        f32 %1538 = OpLoad %251 
					                                        f32 %1539 = OpFDiv %1537 %1538 
					                               Private f32* %1540 = OpAccessChain %44 %52 
					                                                      OpStore %1540 %1539 
					                               Private f32* %1541 = OpAccessChain %44 %52 
					                                        f32 %1542 = OpLoad %1541 
					                                        f32 %1543 = OpExtInst %1 43 %1542 %271 %31 
					                               Private f32* %1544 = OpAccessChain %44 %52 
					                                                      OpStore %1544 %1543 
					                               Private f32* %1545 = OpAccessChain %44 %52 
					                                        f32 %1546 = OpLoad %1545 
					                                        f32 %1547 = OpExtInst %1 30 %1546 
					                               Private f32* %1548 = OpAccessChain %44 %52 
					                                                      OpStore %1548 %1547 
					                               Private f32* %1549 = OpAccessChain %44 %52 
					                                        f32 %1550 = OpLoad %1549 
					                                        f32 %1552 = OpFMul %1550 %1551 
					                               Private f32* %1553 = OpAccessChain %44 %52 
					                                                      OpStore %1553 %1552 
					                               Private f32* %1554 = OpAccessChain %44 %52 
					                                        f32 %1555 = OpLoad %1554 
					                                        f32 %1556 = OpExtInst %1 29 %1555 
					                               Private f32* %1557 = OpAccessChain %44 %52 
					                                                      OpStore %1557 %1556 
					                               Private f32* %1558 = OpAccessChain %44 %52 
					                                        f32 %1559 = OpLoad %1558 
					                                        f32 %1560 = OpLoad %233 
					                                        f32 %1561 = OpFMul %1559 %1560 
					                                                      OpStore %233 %1561 
					                                        f32 %1562 = OpLoad %28 
					                                        f32 %1564 = OpFMul %1562 %1563 
					                                                      OpStore %28 %1564 
					                                        f32 %1565 = OpLoad %28 
					                                        f32 %1566 = OpExtInst %1 43 %1565 %271 %31 
					                                                      OpStore %28 %1566 
					                                        f32 %1567 = OpLoad %28 
					                                        f32 %1568 = OpFNegate %1567 
					                                        f32 %1569 = OpFAdd %1568 %31 
					                                                      OpStore %28 %1569 
					                                        f32 %1570 = OpLoad %28 
					                                        f32 %1571 = OpLoad %233 
					                                        f32 %1572 = OpFMul %1570 %1571 
					                                Output f32* %1574 = OpAccessChain %1398 %26 
					                                                      OpStore %1574 %1572 
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
						vec4 _ProjInfo;
						mat4x4 _WorldToCameraMatrix;
						vec4 unused_0_5[8];
						vec2 _ReflectionBufferSize;
						vec4 unused_0_7[3];
						int _HalfResolution;
						vec4 unused_0_9;
						float _ScreenEdgeFading;
						int _BilateralUpsampling;
						vec4 unused_0_12;
						float _PixelsPerMeterAtOneMeter;
						vec4 unused_0_14[7];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraGBufferTexture1;
					uniform  sampler2D _HitPointTexture;
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _CameraGBufferTexture2;
					uniform  sampler2D _ReflectionTexture0;
					uniform  sampler2D _ReflectionTexture1;
					uniform  sampler2D _ReflectionTexture2;
					uniform  sampler2D _ReflectionTexture3;
					uniform  sampler2D _ReflectionTexture4;
					uniform  sampler2D _NormalAndRoughnessTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat10_1;
					bool u_xlatb1;
					vec4 u_xlat2;
					float u_xlat16_2;
					vec4 u_xlat10_2;
					bool u_xlatb2;
					vec4 u_xlat3;
					vec3 u_xlat16_3;
					vec4 u_xlat10_3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat16_4;
					vec4 u_xlat10_4;
					vec4 u_xlat5;
					vec3 u_xlat16_5;
					vec4 u_xlat10_5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat16_8;
					vec4 u_xlat10_8;
					vec4 u_xlat9;
					vec3 u_xlat16_9;
					vec4 u_xlat10_9;
					vec3 u_xlat16_10;
					vec4 u_xlat10_10;
					vec4 u_xlat11;
					vec3 u_xlat16_11;
					vec4 u_xlat10_11;
					vec4 u_xlat10_12;
					vec3 u_xlat13;
					vec3 u_xlat16_13;
					vec3 u_xlat14;
					float u_xlat16_14;
					bool u_xlatb14;
					float u_xlat15;
					vec3 u_xlat16_15;
					vec2 u_xlat16;
					float u_xlat16_16;
					vec2 u_xlat26;
					float u_xlat16_26;
					int u_xlati26;
					bool u_xlatb26;
					vec2 u_xlat27;
					vec2 u_xlat28;
					float u_xlat16_28;
					vec2 u_xlat29;
					float u_xlat16_29;
					float u_xlat39;
					int u_xlati39;
					float u_xlat40;
					float u_xlat16_41;
					void main()
					{
					    u_xlat10_0 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    u_xlat16_0 = (-u_xlat10_0.w) + 1.0;
					    u_xlat10_1 = texture(_HitPointTexture, vs_TEXCOORD1.xy);
					    u_xlat10_2 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat13.x = _ZBufferParams.z * u_xlat10_2.x + _ZBufferParams.w;
					    u_xlat13.x = float(1.0) / u_xlat13.x;
					    u_xlat2.z = (-u_xlat13.x);
					    u_xlat13.xy = vs_TEXCOORD1.xy * _MainTex_TexelSize.zw;
					    u_xlat13.xy = u_xlat13.xy * _ProjInfo.xy + _ProjInfo.zw;
					    u_xlat2.xy = u_xlat2.zz * u_xlat13.xy;
					    u_xlat10_3 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					    u_xlat16_13.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat1.xyw = u_xlat16_13.yyy * _WorldToCameraMatrix[1].xyz;
					    u_xlat1.xyw = _WorldToCameraMatrix[0].xyz * u_xlat16_13.xxx + u_xlat1.xyw;
					    u_xlat13.xyz = _WorldToCameraMatrix[2].xyz * u_xlat16_13.zzz + u_xlat1.xyw;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.x = dot(u_xlat13.xyz, (-u_xlat1.xyw));
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx + u_xlat1.xyw;
					    u_xlat13.x = dot(u_xlat13.xyz, u_xlat13.xyz);
					    u_xlat13.x = inversesqrt(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x * u_xlat13.z;
					    u_xlat13.x = u_xlat13.x * u_xlat10_1.z + u_xlat2.z;
					    u_xlat16_26 = log2(u_xlat16_0);
					    u_xlat16_26 = u_xlat16_26 * 1.33333337;
					    u_xlat16_26 = exp2(u_xlat16_26);
					    u_xlat16_26 = u_xlat10_1.z * u_xlat16_26;
					    u_xlat26.x = u_xlat16_26 * _PixelsPerMeterAtOneMeter;
					    u_xlat13.x = u_xlat26.x / u_xlat13.x;
					    u_xlatb26 = _HalfResolution==1;
					    u_xlat39 = u_xlat13.x * 0.5;
					    u_xlat13.x = (u_xlatb26) ? u_xlat39 : u_xlat13.x;
					    u_xlat13.x = u_xlat13.x + 15.0;
					    u_xlat13.x = u_xlat13.x * 0.0625;
					    u_xlat13.x = log2(u_xlat13.x);
					    u_xlat13.x = min(u_xlat13.x, 4.0);
					    u_xlat13.x = max(u_xlat13.x, 0.0);
					    u_xlati26 = int(u_xlat13.x);
					    u_xlati39 = u_xlati26 + 1;
					    u_xlati39 = min(u_xlati39, 4);
					    u_xlat1.x = trunc(u_xlat13.x);
					    u_xlat13.x = u_xlat13.x + (-u_xlat1.x);
					    u_xlatb1 = _BilateralUpsampling==1;
					    if(u_xlatb1){
					        u_xlat1.x = float((-u_xlati26));
					        u_xlat1.x = exp2(u_xlat1.x);
					        u_xlat1 = u_xlat1.xxxx * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y);
					        u_xlat1 = floor(u_xlat1);
					        u_xlat2 = vs_TEXCOORD1.xyxy * u_xlat1.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat2 = floor(u_xlat2);
					        u_xlat2 = u_xlat2 + vec4(1.5, 0.5, 0.5, 1.5);
					        u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					        u_xlat3 = u_xlat2 * u_xlat3;
					        if(u_xlati26 == 0) {
					            u_xlat4 = textureLod(_ReflectionTexture0, u_xlat3.zy, 0.0);
					            u_xlat5 = textureLod(_ReflectionTexture0, u_xlat3.xy, 0.0);
					            u_xlat6 = textureLod(_ReflectionTexture0, u_xlat3.zw, 0.0);
					            u_xlat7 = textureLod(_ReflectionTexture0, u_xlat3.xw, 0.0);
					        } else {
					            u_xlatb1 = u_xlati26==1;
					            if(u_xlatb1){
					                u_xlat4 = textureLod(_ReflectionTexture1, u_xlat3.zy, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat4 = textureLod(_ReflectionTexture2, u_xlat3.zy, 0.0);
					                } else {
					                    u_xlatb14 = u_xlati26==3;
					                    if(u_xlatb14){
					                        u_xlat4 = textureLod(_ReflectionTexture3, u_xlat3.zy, 0.0);
					                    } else {
					                        u_xlat4 = textureLod(_ReflectionTexture4, u_xlat3.zy, 0.0);
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            if(u_xlatb1){
					                u_xlat5 = textureLod(_ReflectionTexture1, u_xlat3.xy, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat5 = textureLod(_ReflectionTexture2, u_xlat3.xy, 0.0);
					                } else {
					                    u_xlatb14 = u_xlati26==3;
					                    if(u_xlatb14){
					                        u_xlat5 = textureLod(_ReflectionTexture3, u_xlat3.xy, 0.0);
					                    } else {
					                        u_xlat5 = textureLod(_ReflectionTexture4, u_xlat3.xy, 0.0);
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            if(u_xlatb1){
					                u_xlat6 = textureLod(_ReflectionTexture1, u_xlat3.zw, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat6 = textureLod(_ReflectionTexture2, u_xlat3.zw, 0.0);
					                } else {
					                    u_xlatb14 = u_xlati26==3;
					                    if(u_xlatb14){
					                        u_xlat6 = textureLod(_ReflectionTexture3, u_xlat3.zw, 0.0);
					                    } else {
					                        u_xlat6 = textureLod(_ReflectionTexture4, u_xlat3.zw, 0.0);
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					            if(u_xlatb1){
					                u_xlat7 = textureLod(_ReflectionTexture1, u_xlat3.xw, 0.0);
					            } else {
					                u_xlatb1 = u_xlati26==2;
					                if(u_xlatb1){
					                    u_xlat7 = textureLod(_ReflectionTexture2, u_xlat3.xw, 0.0);
					                } else {
					                    u_xlatb1 = u_xlati26==3;
					                    if(u_xlatb1){
					                        u_xlat7 = textureLod(_ReflectionTexture3, u_xlat3.xw, 0.0);
					                    } else {
					                        u_xlat7 = textureLod(_ReflectionTexture4, u_xlat3.xw, 0.0);
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlat1.xy = vs_TEXCOORD1.xy * u_xlat1.zw + (-u_xlat2.zy);
					        u_xlat27.xy = (-u_xlat1.yx) + vec2(1.0, 1.0);
					        u_xlat2.x = u_xlat27.x * u_xlat27.y;
					        u_xlat27.xy = u_xlat27.xy * u_xlat1.xy;
					        u_xlat1.x = u_xlat1.y * u_xlat1.x;
					        u_xlat8 = vec4(1.0, 1.0, 1.0, 1.0) / vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y);
					        u_xlat9 = u_xlat3.zyxw * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat9 = floor(u_xlat9);
					        u_xlat9 = u_xlat9 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat9 = u_xlat8 * u_xlat9;
					        u_xlat3 = u_xlat3 * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat3 = floor(u_xlat3);
					        u_xlat3 = u_xlat3 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat3 = u_xlat8 * u_xlat3;
					        u_xlat10_10 = textureLod(_NormalAndRoughnessTexture, vs_TEXCOORD1.xy, 0.0);
					        u_xlat16_15.xyz = u_xlat10_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat10_11 = textureLod(_NormalAndRoughnessTexture, u_xlat9.xy, 0.0);
					        u_xlat10_12 = textureLod(_NormalAndRoughnessTexture, u_xlat3.xy, 0.0);
					        u_xlat10_3 = textureLod(_NormalAndRoughnessTexture, u_xlat3.zw, 0.0);
					        u_xlat10_9 = textureLod(_NormalAndRoughnessTexture, u_xlat9.zw, 0.0);
					        u_xlat16_10.xyz = u_xlat10_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_11.xyz = u_xlat10_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_9.xyz = u_xlat10_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_14 = dot(u_xlat16_15.xyz, u_xlat16_10.xyz);
					        u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
					        u_xlat14.x = u_xlat16_14 * u_xlat2.x;
					        u_xlat16_2 = dot(u_xlat16_15.xyz, u_xlat16_11.xyz);
					        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					        u_xlat27.x = u_xlat27.x * u_xlat16_2;
					        u_xlat16_2 = dot(u_xlat16_15.xyz, u_xlat16_3.xyz);
					        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					        u_xlat40 = u_xlat27.y * u_xlat16_2;
					        u_xlat16_2 = dot(u_xlat16_15.xyz, u_xlat16_9.xyz);
					        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
					        u_xlat1.x = u_xlat1.x * u_xlat16_2;
					        u_xlat16_2 = u_xlat10_10.w + (-u_xlat10_11.w);
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.y = u_xlat14.x * u_xlat16_2;
					        u_xlat16_2 = u_xlat10_10.w + (-u_xlat10_12.w);
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.z = u_xlat27.x * u_xlat16_2;
					        u_xlat16_2 = (-u_xlat10_3.w) + u_xlat10_10.w;
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.w = u_xlat40 * u_xlat16_2;
					        u_xlat16_2 = (-u_xlat10_9.w) + u_xlat10_10.w;
					        u_xlat16_2 = sqrt(abs(u_xlat16_2));
					        u_xlat16_2 = sqrt(u_xlat16_2);
					        u_xlat16_2 = (-u_xlat16_2) + 1.0;
					        u_xlat1.x = u_xlat1.x * u_xlat16_2;
					        u_xlat1 = max(u_xlat1, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
					        u_xlat2.x = u_xlat1.z + u_xlat1.y;
					        u_xlat2.x = u_xlat1.w + u_xlat2.x;
					        u_xlat2.x = u_xlat1.x + u_xlat2.x;
					        u_xlat2.x = float(1.0) / u_xlat2.x;
					        u_xlat3 = u_xlat1.zzzz * u_xlat5;
					        u_xlat3 = u_xlat4 * u_xlat1.yyyy + u_xlat3;
					        u_xlat3 = u_xlat6 * u_xlat1.wwww + u_xlat3;
					        u_xlat1 = u_xlat7 * u_xlat1.xxxx + u_xlat3;
					        u_xlat1 = u_xlat2.xxxx * u_xlat1;
					        u_xlat2.x = float((-u_xlati39));
					        u_xlat2.x = exp2(u_xlat2.x);
					        u_xlat3 = u_xlat2.xxxx * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y);
					        u_xlat3 = floor(u_xlat3);
					        u_xlat4 = vs_TEXCOORD1.xyxy * u_xlat3.zwzw + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat4 = floor(u_xlat4);
					        u_xlat4 = u_xlat4 + vec4(1.5, 0.5, 0.5, 1.5);
					        u_xlat5 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					        u_xlat5 = u_xlat4 * u_xlat5;
					        u_xlatb2 = u_xlati39==1;
					        if(u_xlatb2){
					            u_xlat6 = textureLod(_ReflectionTexture1, u_xlat5.zy, 0.0);
					            u_xlat7 = textureLod(_ReflectionTexture1, u_xlat5.xy, 0.0);
					            u_xlat9 = textureLod(_ReflectionTexture1, u_xlat5.zw, 0.0);
					            u_xlat11 = textureLod(_ReflectionTexture1, u_xlat5.xw, 0.0);
					        } else {
					            u_xlatb2 = u_xlati39==2;
					            if(u_xlatb2){
					                u_xlat6 = textureLod(_ReflectionTexture2, u_xlat5.zy, 0.0);
					            } else {
					                u_xlatb3 = u_xlati39==3;
					                if(u_xlatb3){
					                    u_xlat6 = textureLod(_ReflectionTexture3, u_xlat5.zy, 0.0);
					                } else {
					                    u_xlat6 = textureLod(_ReflectionTexture4, u_xlat5.zy, 0.0);
					                //ENDIF
					                }
					            //ENDIF
					            }
					            if(u_xlatb2){
					                u_xlat7 = textureLod(_ReflectionTexture2, u_xlat5.xy, 0.0);
					            } else {
					                u_xlatb3 = u_xlati39==3;
					                if(u_xlatb3){
					                    u_xlat7 = textureLod(_ReflectionTexture3, u_xlat5.xy, 0.0);
					                } else {
					                    u_xlat7 = textureLod(_ReflectionTexture4, u_xlat5.xy, 0.0);
					                //ENDIF
					                }
					            //ENDIF
					            }
					            if(u_xlatb2){
					                u_xlat9 = textureLod(_ReflectionTexture2, u_xlat5.zw, 0.0);
					            } else {
					                u_xlatb3 = u_xlati39==3;
					                if(u_xlatb3){
					                    u_xlat9 = textureLod(_ReflectionTexture3, u_xlat5.zw, 0.0);
					                } else {
					                    u_xlat9 = textureLod(_ReflectionTexture4, u_xlat5.zw, 0.0);
					                //ENDIF
					                }
					            //ENDIF
					            }
					            if(u_xlatb2){
					                u_xlat11 = textureLod(_ReflectionTexture2, u_xlat5.xw, 0.0);
					            } else {
					                u_xlatb2 = u_xlati39==3;
					                if(u_xlatb2){
					                    u_xlat11 = textureLod(_ReflectionTexture3, u_xlat5.xw, 0.0);
					                } else {
					                    u_xlat11 = textureLod(_ReflectionTexture4, u_xlat5.xw, 0.0);
					                //ENDIF
					                }
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlat3.xy = vs_TEXCOORD1.xy * u_xlat3.zw + (-u_xlat4.zy);
					        u_xlat29.xy = (-u_xlat3.yx) + vec2(1.0, 1.0);
					        u_xlat2.x = u_xlat29.x * u_xlat29.y;
					        u_xlat29.xy = u_xlat29.xy * u_xlat3.xy;
					        u_xlat3.x = u_xlat3.y * u_xlat3.x;
					        u_xlat4 = u_xlat5.zyxw * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat4 = floor(u_xlat4);
					        u_xlat4 = u_xlat4 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat4 = u_xlat8 * u_xlat4;
					        u_xlat5 = u_xlat5 * vec4(_ReflectionBufferSize.x, _ReflectionBufferSize.y, _ReflectionBufferSize.x, _ReflectionBufferSize.y) + vec4(-0.5, -0.5, -0.5, -0.5);
					        u_xlat5 = floor(u_xlat5);
					        u_xlat5 = u_xlat5 + vec4(0.5, 0.5, 0.5, 0.5);
					        u_xlat5 = u_xlat8 * u_xlat5;
					        u_xlat10_8 = textureLod(_NormalAndRoughnessTexture, u_xlat4.xy, 0.0);
					        u_xlat10_12 = textureLod(_NormalAndRoughnessTexture, u_xlat5.xy, 0.0);
					        u_xlat10_5 = textureLod(_NormalAndRoughnessTexture, u_xlat5.zw, 0.0);
					        u_xlat10_4 = textureLod(_NormalAndRoughnessTexture, u_xlat4.zw, 0.0);
					        u_xlat16_8.xyz = u_xlat10_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_10.xyz = u_xlat10_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					        u_xlat16_16 = dot(u_xlat16_15.xyz, u_xlat16_8.xyz);
					        u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
					        u_xlat2.x = u_xlat2.x * u_xlat16_16;
					        u_xlat16_16 = dot(u_xlat16_15.xyz, u_xlat16_10.xyz);
					        u_xlat16_16 = clamp(u_xlat16_16, 0.0, 1.0);
					        u_xlat16.x = u_xlat16_16 * u_xlat29.x;
					        u_xlat16_29 = dot(u_xlat16_15.xyz, u_xlat16_5.xyz);
					        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
					        u_xlat16.y = u_xlat16_29 * u_xlat29.y;
					        u_xlat16_15.x = dot(u_xlat16_15.xyz, u_xlat16_4.xyz);
					        u_xlat16_15.x = clamp(u_xlat16_15.x, 0.0, 1.0);
					        u_xlat15 = u_xlat16_15.x * u_xlat3.x;
					        u_xlat16_28 = (-u_xlat10_8.w) + u_xlat10_10.w;
					        u_xlat16_28 = sqrt(abs(u_xlat16_28));
					        u_xlat16_28 = sqrt(u_xlat16_28);
					        u_xlat16_28 = (-u_xlat16_28) + 1.0;
					        u_xlat2.x = u_xlat16_28 * u_xlat2.x;
					        u_xlat16_28 = u_xlat10_10.w + (-u_xlat10_12.w);
					        u_xlat16_28 = sqrt(abs(u_xlat16_28));
					        u_xlat16_28 = sqrt(u_xlat16_28);
					        u_xlat28.x = (-u_xlat16_28) + 1.0;
					        u_xlat16_41 = (-u_xlat10_5.w) + u_xlat10_10.w;
					        u_xlat16_41 = sqrt(abs(u_xlat16_41));
					        u_xlat16_41 = sqrt(u_xlat16_41);
					        u_xlat28.y = (-u_xlat16_41) + 1.0;
					        u_xlat2.zw = u_xlat28.xy * u_xlat16.xy;
					        u_xlat16_3.x = (-u_xlat10_4.w) + u_xlat10_10.w;
					        u_xlat16_3.x = sqrt(abs(u_xlat16_3.x));
					        u_xlat16_3.x = sqrt(u_xlat16_3.x);
					        u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
					        u_xlat2.y = u_xlat15 * u_xlat16_3.x;
					        u_xlat2 = max(u_xlat2, vec4(0.00100000005, 0.00100000005, 0.00100000005, 0.00100000005));
					        u_xlat3.x = u_xlat2.z + u_xlat2.x;
					        u_xlat3.x = u_xlat2.w + u_xlat3.x;
					        u_xlat3.x = u_xlat2.y + u_xlat3.x;
					        u_xlat3.x = float(1.0) / u_xlat3.x;
					        u_xlat4 = u_xlat2.zzzz * u_xlat7;
					        u_xlat4 = u_xlat6 * u_xlat2.xxxx + u_xlat4;
					        u_xlat4 = u_xlat9 * u_xlat2.wwww + u_xlat4;
					        u_xlat2 = u_xlat11 * u_xlat2.yyyy + u_xlat4;
					        u_xlat2 = u_xlat2 * u_xlat3.xxxx + (-u_xlat1);
					        u_xlat1 = u_xlat13.xxxx * u_xlat2.wxyz + u_xlat1.wxyz;
					        SV_Target0.xyz = u_xlat1.yzw;
					    } else {
					        if(u_xlati26 == 0) {
					            u_xlat2 = textureLod(_ReflectionTexture0, vs_TEXCOORD1.xy, 0.0);
					        } else {
					            u_xlatb14 = u_xlati26==1;
					            if(u_xlatb14){
					                u_xlat2 = textureLod(_ReflectionTexture1, vs_TEXCOORD1.xy, 0.0);
					            } else {
					                u_xlatb14 = u_xlati26==2;
					                if(u_xlatb14){
					                    u_xlat2 = textureLod(_ReflectionTexture2, vs_TEXCOORD1.xy, 0.0);
					                } else {
					                    u_xlatb26 = u_xlati26==3;
					                    if(u_xlatb26){
					                        u_xlat2 = textureLod(_ReflectionTexture3, vs_TEXCOORD1.xy, 0.0);
					                    } else {
					                        u_xlat2 = textureLod(_ReflectionTexture4, vs_TEXCOORD1.xy, 0.0);
					                    //ENDIF
					                    }
					                //ENDIF
					                }
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlatb26 = u_xlati39==1;
					        if(u_xlatb26){
					            u_xlat3 = textureLod(_ReflectionTexture1, vs_TEXCOORD1.xy, 0.0);
					        } else {
					            u_xlatb26 = u_xlati39==2;
					            if(u_xlatb26){
					                u_xlat3 = textureLod(_ReflectionTexture2, vs_TEXCOORD1.xy, 0.0);
					            } else {
					                u_xlatb26 = u_xlati39==3;
					                if(u_xlatb26){
					                    u_xlat3 = textureLod(_ReflectionTexture3, vs_TEXCOORD1.xy, 0.0);
					                } else {
					                    u_xlat3 = textureLod(_ReflectionTexture4, vs_TEXCOORD1.xy, 0.0);
					                //ENDIF
					                }
					            //ENDIF
					            }
					        //ENDIF
					        }
					        u_xlat14.xyz = (-u_xlat2.xyz) + u_xlat3.xyz;
					        SV_Target0.xyz = u_xlat13.xxx * u_xlat14.xyz + u_xlat2.xyz;
					        u_xlat1.x = min(u_xlat2.w, u_xlat3.w);
					    //ENDIF
					    }
					    u_xlat13.x = min(u_xlat1.x, 1.0);
					    u_xlat26.xy = (-vs_TEXCOORD1.xy) + vec2(1.0, 1.0);
					    u_xlat26.x = min(u_xlat26.y, u_xlat26.x);
					    u_xlat26.x = min(u_xlat26.x, vs_TEXCOORD1.x);
					    u_xlat39 = unused_0_9.w * 0.100000001 + 0.00100000005;
					    u_xlat26.x = u_xlat26.x / u_xlat39;
					    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
					    u_xlat26.x = log2(u_xlat26.x);
					    u_xlat26.x = u_xlat26.x * 0.200000003;
					    u_xlat26.x = exp2(u_xlat26.x);
					    u_xlat13.x = u_xlat26.x * u_xlat13.x;
					    u_xlat16_0 = u_xlat16_0 * 0.300000012;
					    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
					    u_xlat16_0 = (-u_xlat16_0) + 1.0;
					    SV_Target0.w = u_xlat16_0 * u_xlat13.x;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 326708
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform 	vec2 _ReflectionBufferSize;
					uniform 	int _LastMip;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.x = float((-_LastMip));
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xx * vec2(_ReflectionBufferSize.x, _ReflectionBufferSize.y);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat8.xy = vs_TEXCOORD1.xy * u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = vec2(1.0, 1.0) / u_xlat0.xy;
					    u_xlat8.xy = floor(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat0.xy * u_xlat8.xy;
					    u_xlat1.zw = u_xlat8.xy * u_xlat0.xy + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zy);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1 = min(u_xlat10_1, u_xlat10_3);
					    u_xlat16_0 = min(u_xlat10_0, u_xlat10_2);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 124
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %43 %119 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpMemberDecorate %11 0 Offset 11 
					                                             OpMemberDecorate %11 1 Offset 11 
					                                             OpDecorate %11 Block 
					                                             OpDecorate %13 DescriptorSet 13 
					                                             OpDecorate %13 Binding 13 
					                                             OpDecorate vs_TEXCOORD1 Location 43 
					                                             OpDecorate %75 RelaxedPrecision 
					                                             OpDecorate %78 RelaxedPrecision 
					                                             OpDecorate %78 DescriptorSet 78 
					                                             OpDecorate %78 Binding 78 
					                                             OpDecorate %79 RelaxedPrecision 
					                                             OpDecorate %82 RelaxedPrecision 
					                                             OpDecorate %82 DescriptorSet 82 
					                                             OpDecorate %82 Binding 82 
					                                             OpDecorate %83 RelaxedPrecision 
					                                             OpDecorate %89 RelaxedPrecision 
					                                             OpDecorate %90 RelaxedPrecision 
					                                             OpDecorate %91 RelaxedPrecision 
					                                             OpDecorate %96 RelaxedPrecision 
					                                             OpDecorate %97 RelaxedPrecision 
					                                             OpDecorate %98 RelaxedPrecision 
					                                             OpDecorate %103 RelaxedPrecision 
					                                             OpDecorate %104 RelaxedPrecision 
					                                             OpDecorate %105 RelaxedPrecision 
					                                             OpDecorate %110 RelaxedPrecision 
					                                             OpDecorate %111 RelaxedPrecision 
					                                             OpDecorate %112 RelaxedPrecision 
					                                             OpDecorate %113 RelaxedPrecision 
					                                             OpDecorate %114 RelaxedPrecision 
					                                             OpDecorate %115 RelaxedPrecision 
					                                             OpDecorate %116 RelaxedPrecision 
					                                             OpDecorate %117 RelaxedPrecision 
					                                             OpDecorate %119 Location 119 
					                                             OpDecorate %120 RelaxedPrecision 
					                                             OpDecorate %121 RelaxedPrecision 
					                                             OpDecorate %122 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 2 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_2* %9 = OpVariable Private 
					                                     %10 = OpTypeInt 32 1 
					                                     %11 = OpTypeStruct %7 %10 
					                                     %12 = OpTypePointer Uniform %11 
					       Uniform struct {f32_2; i32;}* %13 = OpVariable Uniform 
					                                 i32 %14 = OpConstant 1 
					                                     %15 = OpTypePointer Uniform %10 
					                                     %20 = OpTypeInt 32 0 
					                                 u32 %21 = OpConstant 0 
					                                     %22 = OpTypePointer Private %6 
					                                 i32 %30 = OpConstant 0 
					                                     %31 = OpTypePointer Uniform %6 
					                                 u32 %34 = OpConstant 1 
					                      Private f32_2* %41 = OpVariable Private 
					                                     %42 = OpTypePointer Input %7 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                 f32 %47 = OpConstant 3,674022E-40 
					                               f32_2 %48 = OpConstantComposite %47 %47 
					                                 f32 %50 = OpConstant 3,674022E-40 
					                               f32_2 %51 = OpConstantComposite %50 %50 
					                                 f32 %57 = OpConstant 3,674022E-40 
					                               f32_2 %58 = OpConstantComposite %57 %57 
					                                     %60 = OpTypeVector %6 4 
					                                     %61 = OpTypePointer Private %60 
					                      Private f32_4* %62 = OpVariable Private 
					                      Private f32_4* %75 = OpVariable Private 
					                                     %76 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %77 = OpTypePointer UniformConstant %76 
					UniformConstant read_only Texture2D* %78 = OpVariable UniformConstant 
					                                     %80 = OpTypeSampler 
					                                     %81 = OpTypePointer UniformConstant %80 
					            UniformConstant sampler* %82 = OpVariable UniformConstant 
					                                     %84 = OpTypeSampledImage %76 
					                      Private f32_4* %89 = OpVariable Private 
					                      Private f32_4* %96 = OpVariable Private 
					                     Private f32_4* %103 = OpVariable Private 
					                     Private f32_4* %110 = OpVariable Private 
					                     Private f32_4* %114 = OpVariable Private 
					                                    %118 = OpTypePointer Output %60 
					                      Output f32_4* %119 = OpVariable Output 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                        Uniform i32* %16 = OpAccessChain %13 %14 
					                                 i32 %17 = OpLoad %16 
					                                 i32 %18 = OpSNegate %17 
					                                 f32 %19 = OpConvertSToF %18 
					                        Private f32* %23 = OpAccessChain %9 %21 
					                                             OpStore %23 %19 
					                        Private f32* %24 = OpAccessChain %9 %21 
					                                 f32 %25 = OpLoad %24 
					                                 f32 %26 = OpExtInst %1 29 %25 
					                        Private f32* %27 = OpAccessChain %9 %21 
					                                             OpStore %27 %26 
					                               f32_2 %28 = OpLoad %9 
					                               f32_2 %29 = OpVectorShuffle %28 %28 0 0 
					                        Uniform f32* %32 = OpAccessChain %13 %30 %21 
					                                 f32 %33 = OpLoad %32 
					                        Uniform f32* %35 = OpAccessChain %13 %30 %34 
					                                 f32 %36 = OpLoad %35 
					                               f32_2 %37 = OpCompositeConstruct %33 %36 
					                               f32_2 %38 = OpFMul %29 %37 
					                                             OpStore %9 %38 
					                               f32_2 %39 = OpLoad %9 
					                               f32_2 %40 = OpExtInst %1 8 %39 
					                                             OpStore %9 %40 
					                               f32_2 %44 = OpLoad vs_TEXCOORD1 
					                               f32_2 %45 = OpLoad %9 
					                               f32_2 %46 = OpFMul %44 %45 
					                               f32_2 %49 = OpFAdd %46 %48 
					                                             OpStore %41 %49 
					                               f32_2 %52 = OpLoad %9 
					                               f32_2 %53 = OpFDiv %51 %52 
					                                             OpStore %9 %53 
					                               f32_2 %54 = OpLoad %41 
					                               f32_2 %55 = OpExtInst %1 8 %54 
					                                             OpStore %41 %55 
					                               f32_2 %56 = OpLoad %41 
					                               f32_2 %59 = OpFAdd %56 %58 
					                                             OpStore %41 %59 
					                               f32_2 %63 = OpLoad %9 
					                               f32_2 %64 = OpLoad %41 
					                               f32_2 %65 = OpFMul %63 %64 
					                               f32_4 %66 = OpLoad %62 
					                               f32_4 %67 = OpVectorShuffle %66 %65 4 5 2 3 
					                                             OpStore %62 %67 
					                               f32_2 %68 = OpLoad %41 
					                               f32_2 %69 = OpLoad %9 
					                               f32_2 %70 = OpFMul %68 %69 
					                               f32_2 %71 = OpLoad %9 
					                               f32_2 %72 = OpFAdd %70 %71 
					                               f32_4 %73 = OpLoad %62 
					                               f32_4 %74 = OpVectorShuffle %73 %72 0 1 4 5 
					                                             OpStore %62 %74 
					                 read_only Texture2D %79 = OpLoad %78 
					                             sampler %83 = OpLoad %82 
					          read_only Texture2DSampled %85 = OpSampledImage %79 %83 
					                               f32_4 %86 = OpLoad %62 
					                               f32_2 %87 = OpVectorShuffle %86 %86 0 3 
					                               f32_4 %88 = OpImageSampleImplicitLod %85 %87 
					                                             OpStore %75 %88 
					                 read_only Texture2D %90 = OpLoad %78 
					                             sampler %91 = OpLoad %82 
					          read_only Texture2DSampled %92 = OpSampledImage %90 %91 
					                               f32_4 %93 = OpLoad %62 
					                               f32_2 %94 = OpVectorShuffle %93 %93 2 1 
					                               f32_4 %95 = OpImageSampleImplicitLod %92 %94 
					                                             OpStore %89 %95 
					                 read_only Texture2D %97 = OpLoad %78 
					                             sampler %98 = OpLoad %82 
					          read_only Texture2DSampled %99 = OpSampledImage %97 %98 
					                              f32_4 %100 = OpLoad %62 
					                              f32_2 %101 = OpVectorShuffle %100 %100 0 1 
					                              f32_4 %102 = OpImageSampleImplicitLod %99 %101 
					                                             OpStore %96 %102 
					                read_only Texture2D %104 = OpLoad %78 
					                            sampler %105 = OpLoad %82 
					         read_only Texture2DSampled %106 = OpSampledImage %104 %105 
					                              f32_4 %107 = OpLoad %62 
					                              f32_2 %108 = OpVectorShuffle %107 %107 2 3 
					                              f32_4 %109 = OpImageSampleImplicitLod %106 %108 
					                                             OpStore %103 %109 
					                              f32_4 %111 = OpLoad %103 
					                              f32_4 %112 = OpLoad %96 
					                              f32_4 %113 = OpExtInst %1 37 %111 %112 
					                                             OpStore %110 %113 
					                              f32_4 %115 = OpLoad %75 
					                              f32_4 %116 = OpLoad %89 
					                              f32_4 %117 = OpExtInst %1 37 %115 %116 
					                                             OpStore %114 %117 
					                              f32_4 %120 = OpLoad %114 
					                              f32_4 %121 = OpLoad %110 
					                              f32_4 %122 = OpExtInst %1 37 %120 %121 
					                                             OpStore %119 %122 
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
						vec4 unused_0_0[19];
						vec2 _ReflectionBufferSize;
						vec4 unused_0_2[14];
						int _LastMip;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat16_0;
					vec4 u_xlat10_0;
					vec4 u_xlat1;
					vec4 u_xlat16_1;
					vec4 u_xlat10_1;
					vec4 u_xlat10_2;
					vec4 u_xlat10_3;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.x = float((-_LastMip));
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xy = u_xlat0.xx * vec2(_ReflectionBufferSize.x, _ReflectionBufferSize.y);
					    u_xlat0.xy = floor(u_xlat0.xy);
					    u_xlat8.xy = vs_TEXCOORD1.xy * u_xlat0.xy + vec2(-0.5, -0.5);
					    u_xlat0.xy = vec2(1.0, 1.0) / u_xlat0.xy;
					    u_xlat8.xy = floor(u_xlat8.xy);
					    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
					    u_xlat1.xy = u_xlat0.xy * u_xlat8.xy;
					    u_xlat1.zw = u_xlat8.xy * u_xlat0.xy + u_xlat0.xy;
					    u_xlat10_0 = texture(_MainTex, u_xlat1.xw);
					    u_xlat10_2 = texture(_MainTex, u_xlat1.zy);
					    u_xlat10_3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat10_1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat16_1 = min(u_xlat10_1, u_xlat10_3);
					    u_xlat16_0 = min(u_xlat10_0, u_xlat10_2);
					    SV_Target0 = min(u_xlat16_0, u_xlat16_1);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 358014
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _HitPointTexture;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					UNITY_LOCATION(2) uniform  sampler2D _CameraReflectionsTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					ivec3 u_xlati1;
					bvec3 u_xlatb1;
					vec4 u_xlat10_2;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0 = texture(_CameraReflectionsTexture, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_HitPointTexture, vs_TEXCOORD1.xy);
					    u_xlatb9 = 0.0<u_xlat10_1.w;
					    u_xlat10_2 = texture(_MainTex, u_xlat10_1.xy);
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat10_2.xyz : u_xlat10_0.xyz;
					    u_xlati1.xyz = ivec3(floatBitsToUint(u_xlat0.xyz) & uvec3(2139095040u, 2139095040u, 2139095040u));
					    u_xlatb1.xyz = notEqual(u_xlati1.xyzx, ivec4(int(0x7F800000u), int(0x7F800000u), int(0x7F800000u), 0)).xyz;
					    u_xlatb9 = u_xlatb1.y && u_xlatb1.x;
					    u_xlatb9 = u_xlatb1.z && u_xlatb9;
					    SV_Target0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat0.xyz, vec3(bvec3(u_xlatb9)));
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 122
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %61 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 22 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate %29 DescriptorSet 29 
					                                             OpDecorate %29 Binding 29 
					                                             OpDecorate %30 RelaxedPrecision 
					                                             OpDecorate %31 RelaxedPrecision 
					                                             OpDecorate %31 DescriptorSet 31 
					                                             OpDecorate %31 Binding 31 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %49 RelaxedPrecision 
					                                             OpDecorate %49 DescriptorSet 49 
					                                             OpDecorate %49 Binding 49 
					                                             OpDecorate %50 RelaxedPrecision 
					                                             OpDecorate %51 RelaxedPrecision 
					                                             OpDecorate %51 DescriptorSet 51 
					                                             OpDecorate %51 Binding 51 
					                                             OpDecorate %52 RelaxedPrecision 
					                                             OpDecorate %61 Location 61 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                                     %27 = OpTypePointer Private %24 
					                      Private f32_4* %28 = OpVariable Private 
					UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
					            UniformConstant sampler* %31 = OpVariable UniformConstant 
					                                     %39 = OpTypeBool 
					                                     %40 = OpTypePointer Private %39 
					                       Private bool* %41 = OpVariable Private 
					                                 f32 %42 = OpConstant 3,674022E-40 
					                                     %43 = OpTypeInt 32 0 
					                                 u32 %44 = OpConstant 2 
					                                     %45 = OpTypePointer Private %6 
					UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
					            UniformConstant sampler* %51 = OpVariable UniformConstant 
					                                     %60 = OpTypePointer Output %24 
					                       Output f32_4* %61 = OpVariable Output 
					                                 u32 %64 = OpConstant 3 
					                                     %65 = OpTypePointer Output %6 
					                                     %68 = OpTypePointer Function %7 
					                                     %77 = OpTypeInt 32 1 
					                                     %78 = OpTypeVector %77 3 
					                                     %79 = OpTypePointer Private %78 
					                      Private i32_3* %80 = OpVariable Private 
					                                     %82 = OpTypeVector %43 3 
					                                 u32 %84 = OpConstant 2139095040 
					                               u32_3 %85 = OpConstantComposite %84 %84 %84 
					                                     %88 = OpTypeVector %39 3 
					                                     %89 = OpTypePointer Private %88 
					                     Private bool_3* %90 = OpVariable Private 
					                                     %91 = OpTypeVector %77 4 
					                                 i32 %94 = OpConstant 2139095040 
					                                 i32 %95 = OpConstant 0 
					                               i32_4 %96 = OpConstantComposite %94 %94 %94 %95 
					                                     %97 = OpTypeVector %39 4 
					                                u32 %100 = OpConstant 1 
					                                u32 %103 = OpConstant 0 
					                              f32_3 %111 = OpConstantComposite %42 %42 %42 
					                                f32 %115 = OpConstant 3,674022E-40 
					                              f32_3 %116 = OpConstantComposite %115 %115 %115 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                     Function f32_3* %69 = OpVariable Function 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD1 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                 read_only Texture2D %30 = OpLoad %29 
					                             sampler %32 = OpLoad %31 
					          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
					                               f32_2 %34 = OpLoad vs_TEXCOORD1 
					                               f32_4 %35 = OpImageSampleImplicitLod %33 %34 
					                               f32_3 %36 = OpVectorShuffle %35 %35 0 1 3 
					                               f32_4 %37 = OpLoad %28 
					                               f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
					                                             OpStore %28 %38 
					                        Private f32* %46 = OpAccessChain %28 %44 
					                                 f32 %47 = OpLoad %46 
					                                bool %48 = OpFOrdLessThan %42 %47 
					                                             OpStore %41 %48 
					                 read_only Texture2D %50 = OpLoad %49 
					                             sampler %52 = OpLoad %51 
					          read_only Texture2DSampled %53 = OpSampledImage %50 %52 
					                               f32_4 %54 = OpLoad %28 
					                               f32_2 %55 = OpVectorShuffle %54 %54 0 1 
					                               f32_4 %56 = OpImageSampleImplicitLod %53 %55 
					                               f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
					                               f32_4 %58 = OpLoad %28 
					                               f32_4 %59 = OpVectorShuffle %58 %57 4 5 2 6 
					                                             OpStore %28 %59 
					                        Private f32* %62 = OpAccessChain %28 %44 
					                                 f32 %63 = OpLoad %62 
					                         Output f32* %66 = OpAccessChain %61 %64 
					                                             OpStore %66 %63 
					                                bool %67 = OpLoad %41 
					                                             OpSelectionMerge %71 None 
					                                             OpBranchConditional %67 %70 %74 
					                                     %70 = OpLabel 
					                               f32_4 %72 = OpLoad %28 
					                               f32_3 %73 = OpVectorShuffle %72 %72 0 1 3 
					                                             OpStore %69 %73 
					                                             OpBranch %71 
					                                     %74 = OpLabel 
					                               f32_3 %75 = OpLoad %9 
					                                             OpStore %69 %75 
					                                             OpBranch %71 
					                                     %71 = OpLabel 
					                               f32_3 %76 = OpLoad %69 
					                                             OpStore %9 %76 
					                               f32_3 %81 = OpLoad %9 
					                               u32_3 %83 = OpBitcast %81 
					                               u32_3 %86 = OpBitwiseAnd %83 %85 
					                               i32_3 %87 = OpBitcast %86 
					                                             OpStore %80 %87 
					                               i32_3 %92 = OpLoad %80 
					                               i32_4 %93 = OpVectorShuffle %92 %92 0 1 2 0 
					                              bool_4 %98 = OpINotEqual %93 %96 
					                              bool_3 %99 = OpVectorShuffle %98 %98 0 1 2 
					                                             OpStore %90 %99 
					                      Private bool* %101 = OpAccessChain %90 %100 
					                               bool %102 = OpLoad %101 
					                      Private bool* %104 = OpAccessChain %90 %103 
					                               bool %105 = OpLoad %104 
					                               bool %106 = OpLogicalAnd %102 %105 
					                                             OpStore %41 %106 
					                      Private bool* %107 = OpAccessChain %90 %44 
					                               bool %108 = OpLoad %107 
					                               bool %109 = OpLoad %41 
					                               bool %110 = OpLogicalAnd %108 %109 
					                                             OpStore %41 %110 
					                              f32_3 %112 = OpLoad %9 
					                               bool %113 = OpLoad %41 
					                             bool_3 %114 = OpCompositeConstruct %113 %113 %113 
					                              f32_3 %117 = OpSelect %114 %116 %111 
					                              f32_3 %118 = OpExtInst %1 46 %111 %112 %117 
					                              f32_4 %119 = OpLoad %61 
					                              f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
					                                             OpStore %61 %120 
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
					
					uniform  sampler2D _HitPointTexture;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraReflectionsTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat10_0;
					vec4 u_xlat10_1;
					ivec3 u_xlati1;
					bvec3 u_xlatb1;
					vec4 u_xlat10_2;
					bool u_xlatb9;
					void main()
					{
					    u_xlat10_0 = texture(_CameraReflectionsTexture, vs_TEXCOORD1.xy);
					    u_xlat10_1 = texture(_HitPointTexture, vs_TEXCOORD1.xy);
					    u_xlatb9 = 0.0<u_xlat10_1.w;
					    u_xlat10_2 = texture(_MainTex, u_xlat10_1.xy);
					    SV_Target0.w = u_xlat10_1.w;
					    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat10_2.xyz : u_xlat10_0.xyz;
					    u_xlati1.xyz = ivec3(floatBitsToUint(u_xlat0).xyz & uvec3(2139095040u, 2139095040u, 2139095040u));
					    u_xlatb1.xyz = notEqual(u_xlati1.xyzx, ivec4(int(0x7F800000u), int(0x7F800000u), int(0x7F800000u), 0)).xyz;
					    u_xlatb9 = u_xlatb1.y && u_xlatb1.x;
					    u_xlatb9 = u_xlatb1.z && u_xlatb9;
					    SV_Target0.xyz = mix(vec3(0.0, 0.0, 0.0), u_xlat0.xyz, vec3(bvec3(u_xlatb9)));
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 407151
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
					    return;
					}
					
					#endif
					#ifdef FRAGMENT
					#version 150
					#extension GL_ARB_explicit_attrib_location : require
					#ifdef GL_ARB_shader_bit_encoding
					#extension GL_ARB_shader_bit_encoding : enable
					#endif
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					UNITY_LOCATION(0) uniform  sampler2D _CameraGBufferTexture2;
					UNITY_LOCATION(1) uniform  sampler2D _CameraGBufferTexture1;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    u_xlat10_0 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    SV_Target0.w = u_xlat10_0.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 50
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %22 %28 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpDecorate %9 RelaxedPrecision 
					                                             OpDecorate %12 RelaxedPrecision 
					                                             OpDecorate %12 DescriptorSet 12 
					                                             OpDecorate %12 Binding 12 
					                                             OpDecorate %13 RelaxedPrecision 
					                                             OpDecorate %16 RelaxedPrecision 
					                                             OpDecorate %16 DescriptorSet 16 
					                                             OpDecorate %16 Binding 16 
					                                             OpDecorate %17 RelaxedPrecision 
					                                             OpDecorate vs_TEXCOORD1 Location 22 
					                                             OpDecorate %26 RelaxedPrecision 
					                                             OpDecorate %28 Location 28 
					                                             OpDecorate %29 RelaxedPrecision 
					                                             OpDecorate %32 RelaxedPrecision 
					                                             OpDecorate %32 DescriptorSet 32 
					                                             OpDecorate %32 Binding 32 
					                                             OpDecorate %33 RelaxedPrecision 
					                                             OpDecorate %34 RelaxedPrecision 
					                                             OpDecorate %34 DescriptorSet 34 
					                                             OpDecorate %34 Binding 34 
					                                             OpDecorate %35 RelaxedPrecision 
					                                             OpDecorate %41 RelaxedPrecision 
					                                             OpDecorate %46 RelaxedPrecision 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypeVector %6 3 
					                                      %8 = OpTypePointer Private %7 
					                       Private f32_3* %9 = OpVariable Private 
					                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %11 = OpTypePointer UniformConstant %10 
					UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
					                                     %14 = OpTypeSampler 
					                                     %15 = OpTypePointer UniformConstant %14 
					            UniformConstant sampler* %16 = OpVariable UniformConstant 
					                                     %18 = OpTypeSampledImage %10 
					                                     %20 = OpTypeVector %6 2 
					                                     %21 = OpTypePointer Input %20 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %24 = OpTypeVector %6 4 
					                                     %27 = OpTypePointer Output %24 
					                       Output f32_4* %28 = OpVariable Output 
					UniformConstant read_only Texture2D* %32 = OpVariable UniformConstant 
					            UniformConstant sampler* %34 = OpVariable UniformConstant 
					                                     %39 = OpTypeInt 32 0 
					                                 u32 %40 = OpConstant 3 
					                                 u32 %42 = OpConstant 0 
					                                     %43 = OpTypePointer Private %6 
					                                     %47 = OpTypePointer Output %6 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %13 = OpLoad %12 
					                             sampler %17 = OpLoad %16 
					          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
					                               f32_2 %23 = OpLoad vs_TEXCOORD1 
					                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
					                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
					                                             OpStore %9 %26 
					                               f32_3 %29 = OpLoad %9 
					                               f32_4 %30 = OpLoad %28 
					                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
					                                             OpStore %28 %31 
					                 read_only Texture2D %33 = OpLoad %32 
					                             sampler %35 = OpLoad %34 
					          read_only Texture2DSampled %36 = OpSampledImage %33 %35 
					                               f32_2 %37 = OpLoad vs_TEXCOORD1 
					                               f32_4 %38 = OpImageSampleImplicitLod %36 %37 
					                                 f32 %41 = OpCompositeExtract %38 3 
					                        Private f32* %44 = OpAccessChain %9 %42 
					                                             OpStore %44 %41 
					                        Private f32* %45 = OpAccessChain %9 %42 
					                                 f32 %46 = OpLoad %45 
					                         Output f32* %48 = OpAccessChain %28 %40 
					                                             OpStore %48 %46 
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
					
					uniform  sampler2D _CameraGBufferTexture2;
					uniform  sampler2D _CameraGBufferTexture1;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_CameraGBufferTexture2, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat10_0.xyz;
					    u_xlat10_0 = texture(_CameraGBufferTexture1, vs_TEXCOORD1.xy);
					    SV_Target0.w = u_xlat10_0.w;
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 479679
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					UNITY_LOCATION(0) uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0 = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0 = float(1.0) / u_xlat0;
					    SV_Target0.x = (-u_xlat0);
					    SV_Target0.yzw = vec3(0.0, 0.0, 0.0);
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 58
					; Schema: 0
					                                             OpCapability Shader 
					                                      %1 = OpExtInstImport "GLSL.std.450" 
					                                             OpMemoryModel Logical GLSL450 
					                                             OpEntryPoint Fragment %4 "main" %21 %47 
					                                             OpExecutionMode %4 OriginUpperLeft 
					                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                             OpDecorate %11 DescriptorSet 11 
					                                             OpDecorate %11 Binding 11 
					                                             OpDecorate %15 DescriptorSet 15 
					                                             OpDecorate %15 Binding 15 
					                                             OpDecorate vs_TEXCOORD1 Location 21 
					                                             OpMemberDecorate %28 0 Offset 28 
					                                             OpDecorate %28 Block 
					                                             OpDecorate %30 DescriptorSet 30 
					                                             OpDecorate %30 Binding 30 
					                                             OpDecorate %47 Location 47 
					                                      %2 = OpTypeVoid 
					                                      %3 = OpTypeFunction %2 
					                                      %6 = OpTypeFloat 32 
					                                      %7 = OpTypePointer Private %6 
					                         Private f32* %8 = OpVariable Private 
					                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %10 = OpTypePointer UniformConstant %9 
					UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
					                                     %13 = OpTypeSampler 
					                                     %14 = OpTypePointer UniformConstant %13 
					            UniformConstant sampler* %15 = OpVariable UniformConstant 
					                                     %17 = OpTypeSampledImage %9 
					                                     %19 = OpTypeVector %6 2 
					                                     %20 = OpTypePointer Input %19 
					               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                                     %23 = OpTypeVector %6 4 
					                                     %25 = OpTypeInt 32 0 
					                                 u32 %26 = OpConstant 0 
					                                     %28 = OpTypeStruct %23 
					                                     %29 = OpTypePointer Uniform %28 
					            Uniform struct {f32_4;}* %30 = OpVariable Uniform 
					                                     %31 = OpTypeInt 32 1 
					                                 i32 %32 = OpConstant 0 
					                                 u32 %33 = OpConstant 2 
					                                     %34 = OpTypePointer Uniform %6 
					                                 u32 %39 = OpConstant 3 
					                                 f32 %43 = OpConstant 3,674022E-40 
					                                     %46 = OpTypePointer Output %23 
					                       Output f32_4* %47 = OpVariable Output 
					                                     %50 = OpTypePointer Output %6 
					                                     %52 = OpTypeVector %6 3 
					                                 f32 %53 = OpConstant 3,674022E-40 
					                               f32_3 %54 = OpConstantComposite %53 %53 %53 
					                                 void %4 = OpFunction None %3 
					                                      %5 = OpLabel 
					                 read_only Texture2D %12 = OpLoad %11 
					                             sampler %16 = OpLoad %15 
					          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
					                               f32_2 %22 = OpLoad vs_TEXCOORD1 
					                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
					                                 f32 %27 = OpCompositeExtract %24 0 
					                                             OpStore %8 %27 
					                        Uniform f32* %35 = OpAccessChain %30 %32 %33 
					                                 f32 %36 = OpLoad %35 
					                                 f32 %37 = OpLoad %8 
					                                 f32 %38 = OpFMul %36 %37 
					                        Uniform f32* %40 = OpAccessChain %30 %32 %39 
					                                 f32 %41 = OpLoad %40 
					                                 f32 %42 = OpFAdd %38 %41 
					                                             OpStore %8 %42 
					                                 f32 %44 = OpLoad %8 
					                                 f32 %45 = OpFDiv %43 %44 
					                                             OpStore %8 %45 
					                                 f32 %48 = OpLoad %8 
					                                 f32 %49 = OpFNegate %48 
					                         Output f32* %51 = OpAccessChain %47 %26 
					                                             OpStore %51 %49 
					                               f32_4 %55 = OpLoad %47 
					                               f32_4 %56 = OpVectorShuffle %55 %54 0 4 5 6 
					                                             OpStore %47 %56 
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
					
					layout(std140) uniform UnityPerCamera {
						vec4 unused_0_0[7];
						vec4 _ZBufferParams;
						vec4 unused_0_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat10_0;
					void main()
					{
					    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0 = _ZBufferParams.z * u_xlat10_0.x + _ZBufferParams.w;
					    u_xlat0 = float(1.0) / u_xlat0;
					    SV_Target0.x = (-u_xlat0);
					    SV_Target0.yzw = vec3(0.0, 0.0, 0.0);
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
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 545449
			Program "vp" {
				SubProgram "d3d11 " {
					"!!vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[30];
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat2 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
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
					    phase0_Output0_1 = in_TEXCOORD0.xyxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec2 ImmCB_0_0_0[12];
					uniform 	vec4 _MainTex_TexelSize;
					uniform 	float _ReflectionBlur;
					uniform 	int _HighlightSuppression;
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					int u_xlati4;
					vec2 u_xlat8;
					bool u_xlatb8;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(-0.326211989, -0.405809999);
						ImmCB_0_0_0[1] = vec2(-0.840143979, -0.0735799968);
						ImmCB_0_0_0[2] = vec2(-0.69591397, 0.457136989);
						ImmCB_0_0_0[3] = vec2(-0.203345001, 0.620715976);
						ImmCB_0_0_0[4] = vec2(0.962339997, -0.194983006);
						ImmCB_0_0_0[5] = vec2(0.473434001, -0.480026007);
						ImmCB_0_0_0[6] = vec2(0.519456029, 0.767022014);
						ImmCB_0_0_0[7] = vec2(0.185461, -0.893123984);
						ImmCB_0_0_0[8] = vec2(0.507430971, 0.0644249991);
						ImmCB_0_0_0[9] = vec2(0.896420002, 0.412458003);
						ImmCB_0_0_0[10] = vec2(-0.321940005, -0.932614982);
						ImmCB_0_0_0[11] = vec2(-0.791558981, -0.597710013);
					    u_xlat0.x = _MainTex_TexelSize.x * _ReflectionBlur;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat8.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * u_xlat0.xx + vs_TEXCOORD1.xy;
					        u_xlat2 = texture(_MainTex, u_xlat8.xy);
					        u_xlat3.xyz = u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					        u_xlat3.xyz = u_xlat2.xyz / u_xlat3.xyz;
					        u_xlat2.xyz = (_HighlightSuppression != 0) ? u_xlat3.xyz : u_xlat2.xyz;
					        u_xlat1 = u_xlat1 + u_xlat2;
					    }
					    u_xlat0 = u_xlat1 * vec4(0.0833333358, 0.0833333358, 0.0833333358, 0.0833333358);
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(0.0833333358, 0.0833333358, 0.0833333358) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.xyz;
					    SV_Target0.xyz = (_HighlightSuppression != 0) ? u_xlat1.xyz : u_xlat0.xyz;
					    SV_Target0.w = u_xlat0.w;
					    return;
					}
					
					#endif"
				}
				SubProgram "vulkan " {
					"!!vulkan
					
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 132
					; Schema: 0
					                                                     OpCapability Shader 
					                                              %1 = OpExtInstImport "GLSL.std.450" 
					                                                     OpMemoryModel Logical GLSL450 
					                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %120 %123 
					                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
					                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                                     OpDecorate %11 Location 11 
					                                                     OpDecorate %16 ArrayStride 16 
					                                                     OpDecorate %17 ArrayStride 17 
					                                                     OpMemberDecorate %18 0 Offset 18 
					                                                     OpMemberDecorate %18 1 Offset 18 
					                                                     OpMemberDecorate %18 2 Offset 18 
					                                                     OpDecorate %18 Block 
					                                                     OpDecorate %20 DescriptorSet 20 
					                                                     OpDecorate %20 Binding 20 
					                                                     OpMemberDecorate %70 0 BuiltIn 70 
					                                                     OpMemberDecorate %70 1 BuiltIn 70 
					                                                     OpMemberDecorate %70 2 BuiltIn 70 
					                                                     OpDecorate %70 Block 
					                                                     OpDecorate %94 RelaxedPrecision 
					                                                     OpDecorate %94 Location 94 
					                                                     OpDecorate %97 RelaxedPrecision 
					                                                     OpDecorate %98 RelaxedPrecision 
					                                                     OpDecorate %100 RelaxedPrecision 
					                                                     OpDecorate %110 RelaxedPrecision 
					                                                     OpDecorate %115 RelaxedPrecision 
					                                                     OpDecorate %116 RelaxedPrecision 
					                                                     OpDecorate vs_TEXCOORD0 Location 120 
					                                                     OpDecorate vs_TEXCOORD1 Location 123 
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
					                                             %18 = OpTypeStruct %16 %17 %7 
					                                             %19 = OpTypePointer Uniform %18 
					Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
					                                             %82 = OpTypeBool 
					                                             %83 = OpTypePointer Private %82 
					                               Private bool* %84 = OpVariable Private 
					                                             %85 = OpTypePointer Uniform %6 
					                                         f32 %88 = OpConstant 3,674022E-40 
					                                             %90 = OpTypePointer Private %6 
					                                Private f32* %91 = OpVariable Private 
					                                             %92 = OpTypeVector %6 2 
					                                             %93 = OpTypePointer Input %92 
					                                Input f32_2* %94 = OpVariable Input 
					                                             %95 = OpTypePointer Input %6 
					                                         f32 %99 = OpConstant 3,674022E-40 
					                             Private f32_4* %101 = OpVariable Private 
					                                            %103 = OpTypePointer Function %6 
					                                        u32 %112 = OpConstant 3 
					                                            %114 = OpTypeVector %6 3 
					                                            %119 = OpTypePointer Output %92 
					                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
					                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
					                                            %126 = OpTypePointer Output %6 
					                                         void %4 = OpFunction None %3 
					                                              %5 = OpLabel 
					                              Function f32* %104 = OpVariable Function 
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
					                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
					                                         f32 %87 = OpLoad %86 
					                                        bool %89 = OpFOrdLessThan %87 %88 
					                                                     OpStore %84 %89 
					                                  Input f32* %96 = OpAccessChain %94 %68 
					                                         f32 %97 = OpLoad %96 
					                                         f32 %98 = OpFNegate %97 
					                                        f32 %100 = OpFAdd %98 %99 
					                                                     OpStore %91 %100 
					                                       bool %102 = OpLoad %84 
					                                                     OpSelectionMerge %106 None 
					                                                     OpBranchConditional %102 %105 %108 
					                                            %105 = OpLabel 
					                                        f32 %107 = OpLoad %91 
					                                                     OpStore %104 %107 
					                                                     OpBranch %106 
					                                            %108 = OpLabel 
					                                 Input f32* %109 = OpAccessChain %94 %68 
					                                        f32 %110 = OpLoad %109 
					                                                     OpStore %104 %110 
					                                                     OpBranch %106 
					                                            %106 = OpLabel 
					                                        f32 %111 = OpLoad %104 
					                               Private f32* %113 = OpAccessChain %101 %112 
					                                                     OpStore %113 %111 
					                                      f32_2 %115 = OpLoad %94 
					                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 0 
					                                      f32_4 %117 = OpLoad %101 
					                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
					                                                     OpStore %101 %118 
					                                      f32_4 %121 = OpLoad %101 
					                                      f32_2 %122 = OpVectorShuffle %121 %121 0 1 
					                                                     OpStore vs_TEXCOORD0 %122 
					                                      f32_4 %124 = OpLoad %101 
					                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
					                                                     OpStore vs_TEXCOORD1 %125 
					                                Output f32* %127 = OpAccessChain %72 %22 %68 
					                                        f32 %128 = OpLoad %127 
					                                        f32 %129 = OpFNegate %128 
					                                Output f32* %130 = OpAccessChain %72 %22 %68 
					                                                     OpStore %130 %129 
					                                                     OpReturn
					                                                     OpFunctionEnd
					; SPIR-V
					; Version: 1.0
					; Generator: Khronos Glslang Reference Front End; 6
					; Bound: 195
					; Schema: 0
					                                              OpCapability Shader 
					                                       %1 = OpExtInstImport "GLSL.std.450" 
					                                              OpMemoryModel Logical GLSL450 
					                                              OpEntryPoint Fragment %4 "main" %102 %171 
					                                              OpExecutionMode %4 OriginUpperLeft 
					                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
					                                              OpMemberDecorate %11 0 Offset 11 
					                                              OpMemberDecorate %11 1 Offset 11 
					                                              OpMemberDecorate %11 2 Offset 11 
					                                              OpDecorate %11 Block 
					                                              OpDecorate %13 DescriptorSet 13 
					                                              OpDecorate %13 Binding 13 
					                                              OpDecorate vs_TEXCOORD1 Location 102 
					                                              OpDecorate %108 RelaxedPrecision 
					                                              OpDecorate %108 DescriptorSet 108 
					                                              OpDecorate %108 Binding 108 
					                                              OpDecorate %109 RelaxedPrecision 
					                                              OpDecorate %112 RelaxedPrecision 
					                                              OpDecorate %112 DescriptorSet 112 
					                                              OpDecorate %112 Binding 112 
					                                              OpDecorate %113 RelaxedPrecision 
					                                              OpDecorate %171 Location 171 
					                                       %2 = OpTypeVoid 
					                                       %3 = OpTypeFunction %2 
					                                       %6 = OpTypeFloat 32 
					                                       %7 = OpTypeVector %6 4 
					                                       %8 = OpTypePointer Private %7 
					                        Private f32_4* %9 = OpVariable Private 
					                                      %10 = OpTypeInt 32 1 
					                                      %11 = OpTypeStruct %7 %6 %10 
					                                      %12 = OpTypePointer Uniform %11 
					   Uniform struct {f32_4; f32; i32;}* %13 = OpVariable Uniform 
					                                  i32 %14 = OpConstant 0 
					                                      %15 = OpTypeInt 32 0 
					                                  u32 %16 = OpConstant 0 
					                                      %17 = OpTypePointer Uniform %6 
					                                  i32 %20 = OpConstant 1 
					                                      %24 = OpTypePointer Private %6 
					                       Private f32_4* %26 = OpVariable Private 
					                                  f32 %27 = OpConstant 3,674022E-40 
					                                  u32 %29 = OpConstant 1 
					                                  u32 %31 = OpConstant 2 
					                                  u32 %33 = OpConstant 3 
					                                      %35 = OpTypePointer Function %10 
					                                  i32 %43 = OpConstant 12 
					                                      %44 = OpTypeBool 
					                                      %46 = OpTypeVector %6 2 
					                                      %47 = OpTypePointer Private %46 
					                       Private f32_2* %48 = OpVariable Private 
					                                      %49 = OpTypeVector %15 4 
					                                  u32 %50 = OpConstant 12 
					                                      %51 = OpTypeArray %49 %50 
					                                  u32 %52 = OpConstant 3198616898 
					                                  u32 %53 = OpConstant 3201287764 
					                                u32_4 %54 = OpConstantComposite %52 %53 %16 %16 
					                                  u32 %55 = OpConstant 3210154925 
					                                  u32 %56 = OpConstant 3180769564 
					                                u32_4 %57 = OpConstantComposite %55 %56 %16 %16 
					                                  u32 %58 = OpConstant 3207735147 
					                                  u32 %59 = OpConstant 1055526364 
					                                u32_4 %60 = OpConstantComposite %58 %59 %16 %16 
					                                  u32 %61 = OpConstant 3192928684 
					                                  u32 %62 = OpConstant 1058989886 
					                                u32_4 %63 = OpConstantComposite %61 %62 %16 %16 
					                                  u32 %64 = OpConstant 1064721386 
					                                  u32 %65 = OpConstant 3192367520 
					                                u32_4 %66 = OpConstantComposite %64 %65 %16 %16 
					                                  u32 %67 = OpConstant 1056073201 
					                                  u32 %68 = OpConstant 3203778040 
					                                u32_4 %69 = OpConstantComposite %67 %68 %16 %16 
					                                  u32 %70 = OpConstant 1057291026 
					                                  u32 %71 = OpConstant 1061444494 
					                                u32_4 %72 = OpConstantComposite %70 %71 %16 %16 
					                                  u32 %73 = OpConstant 1044244861 
					                                  u32 %74 = OpConstant 3211043782 
					                                u32_4 %75 = OpConstantComposite %73 %74 %16 %16 
					                                  u32 %76 = OpConstant 1057089279 
					                                  u32 %77 = OpConstant 1032057153 
					                                u32_4 %78 = OpConstantComposite %76 %77 %16 %16 
					                                  u32 %79 = OpConstant 1063615432 
					                                  u32 %80 = OpConstant 1054027186 
					                                u32_4 %81 = OpConstantComposite %79 %80 %16 %16 
					                                  u32 %82 = OpConstant 3198473554 
					                                  u32 %83 = OpConstant 3211706331 
					                                u32_4 %84 = OpConstantComposite %82 %83 %16 %16 
					                                  u32 %85 = OpConstant 3209339804 
					                                  u32 %86 = OpConstant 3206087558 
					                                u32_4 %87 = OpConstantComposite %85 %86 %16 %16 
					                            u32_4[12] %88 = OpConstantComposite %54 %57 %60 %63 %66 %69 %72 %75 %78 %81 %84 %87 
					                                      %90 = OpTypeVector %15 2 
					                                      %91 = OpTypePointer Function %51 
					                                      %93 = OpTypePointer Function %49 
					                                     %101 = OpTypePointer Input %46 
					                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
					                      Private f32_4* %105 = OpVariable Private 
					                                     %106 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
					                                     %107 = OpTypePointer UniformConstant %106 
					UniformConstant read_only Texture2D* %108 = OpVariable UniformConstant 
					                                     %110 = OpTypeSampler 
					                                     %111 = OpTypePointer UniformConstant %110 
					            UniformConstant sampler* %112 = OpVariable UniformConstant 
					                                     %114 = OpTypeSampledImage %106 
					                                     %118 = OpTypeVector %6 3 
					                                     %119 = OpTypePointer Private %118 
					                      Private f32_3* %120 = OpVariable Private 
					                                 f32 %123 = OpConstant 3,674022E-40 
					                               f32_3 %124 = OpConstantComposite %123 %123 %123 
					                                 i32 %130 = OpConstant 2 
					                                     %131 = OpTypePointer Uniform %10 
					                                     %135 = OpTypePointer Function %118 
					                                 f32 %152 = OpConstant 3,674022E-40 
					                               f32_4 %153 = OpConstantComposite %152 %152 %152 %152 
					                               f32_3 %158 = OpConstantComposite %152 %152 %152 
					                                     %170 = OpTypePointer Output %7 
					                       Output f32_4* %171 = OpVariable Output 
					                                     %188 = OpTypePointer Output %6 
					                                     %191 = OpTypePointer Private %10 
					                        Private i32* %192 = OpVariable Private 
					                                     %193 = OpTypePointer Private %44 
					                       Private bool* %194 = OpVariable Private 
					                                  void %4 = OpFunction None %3 
					                                       %5 = OpLabel 
					                        Function i32* %36 = OpVariable Function 
					                  Function u32_4[12]* %92 = OpVariable Function 
					                     Function f32_3* %136 = OpVariable Function 
					                     Function f32_3* %175 = OpVariable Function 
					                         Uniform f32* %18 = OpAccessChain %13 %14 %16 
					                                  f32 %19 = OpLoad %18 
					                         Uniform f32* %21 = OpAccessChain %13 %20 
					                                  f32 %22 = OpLoad %21 
					                                  f32 %23 = OpFMul %19 %22 
					                         Private f32* %25 = OpAccessChain %9 %16 
					                                              OpStore %25 %23 
					                         Private f32* %28 = OpAccessChain %26 %16 
					                                              OpStore %28 %27 
					                         Private f32* %30 = OpAccessChain %26 %29 
					                                              OpStore %30 %27 
					                         Private f32* %32 = OpAccessChain %26 %31 
					                                              OpStore %32 %27 
					                         Private f32* %34 = OpAccessChain %26 %33 
					                                              OpStore %34 %27 
					                                              OpStore %36 %14 
					                                              OpBranch %37 
					                                      %37 = OpLabel 
					                                              OpLoopMerge %39 %40 None 
					                                              OpBranch %41 
					                                      %41 = OpLabel 
					                                  i32 %42 = OpLoad %36 
					                                 bool %45 = OpSLessThan %42 %43 
					                                              OpBranchConditional %45 %38 %39 
					                                      %38 = OpLabel 
					                                  i32 %89 = OpLoad %36 
					                                              OpStore %92 %88 
					                      Function u32_4* %94 = OpAccessChain %92 %89 
					                                u32_4 %95 = OpLoad %94 
					                                u32_2 %96 = OpVectorShuffle %95 %95 0 1 
					                                f32_2 %97 = OpBitcast %96 
					                                f32_4 %98 = OpLoad %9 
					                                f32_2 %99 = OpVectorShuffle %98 %98 0 0 
					                               f32_2 %100 = OpFMul %97 %99 
					                               f32_2 %103 = OpLoad vs_TEXCOORD1 
					                               f32_2 %104 = OpFAdd %100 %103 
					                                              OpStore %48 %104 
					                 read_only Texture2D %109 = OpLoad %108 
					                             sampler %113 = OpLoad %112 
					          read_only Texture2DSampled %115 = OpSampledImage %109 %113 
					                               f32_2 %116 = OpLoad %48 
					                               f32_4 %117 = OpImageSampleImplicitLod %115 %116 
					                                              OpStore %105 %117 
					                               f32_4 %121 = OpLoad %105 
					                               f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
					                               f32_3 %125 = OpFAdd %122 %124 
					                                              OpStore %120 %125 
					                               f32_4 %126 = OpLoad %105 
					                               f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
					                               f32_3 %128 = OpLoad %120 
					                               f32_3 %129 = OpFDiv %127 %128 
					                                              OpStore %120 %129 
					                        Uniform i32* %132 = OpAccessChain %13 %130 
					                                 i32 %133 = OpLoad %132 
					                                bool %134 = OpINotEqual %133 %14 
					                                              OpSelectionMerge %138 None 
					                                              OpBranchConditional %134 %137 %140 
					                                     %137 = OpLabel 
					                               f32_3 %139 = OpLoad %120 
					                                              OpStore %136 %139 
					                                              OpBranch %138 
					                                     %140 = OpLabel 
					                               f32_4 %141 = OpLoad %105 
					                               f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
					                                              OpStore %136 %142 
					                                              OpBranch %138 
					                                     %138 = OpLabel 
					                               f32_3 %143 = OpLoad %136 
					                               f32_4 %144 = OpLoad %105 
					                               f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
					                                              OpStore %105 %145 
					                               f32_4 %146 = OpLoad %26 
					                               f32_4 %147 = OpLoad %105 
					                               f32_4 %148 = OpFAdd %146 %147 
					                                              OpStore %26 %148 
					                                              OpBranch %40 
					                                      %40 = OpLabel 
					                                 i32 %149 = OpLoad %36 
					                                 i32 %150 = OpIAdd %149 %20 
					                                              OpStore %36 %150 
					                                              OpBranch %37 
					                                      %39 = OpLabel 
					                               f32_4 %151 = OpLoad %26 
					                               f32_4 %154 = OpFMul %151 %153 
					                                              OpStore %9 %154 
					                               f32_4 %155 = OpLoad %26 
					                               f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
					                               f32_3 %157 = OpFNegate %156 
					                               f32_3 %159 = OpFMul %157 %158 
					                               f32_3 %160 = OpFAdd %159 %124 
					                               f32_4 %161 = OpLoad %26 
					                               f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
					                                              OpStore %26 %162 
					                               f32_4 %163 = OpLoad %9 
					                               f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
					                               f32_4 %165 = OpLoad %26 
					                               f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
					                               f32_3 %167 = OpFDiv %164 %166 
					                               f32_4 %168 = OpLoad %26 
					                               f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
					                                              OpStore %26 %169 
					                        Uniform i32* %172 = OpAccessChain %13 %130 
					                                 i32 %173 = OpLoad %172 
					                                bool %174 = OpINotEqual %173 %14 
					                                              OpSelectionMerge %177 None 
					                                              OpBranchConditional %174 %176 %180 
					                                     %176 = OpLabel 
					                               f32_4 %178 = OpLoad %26 
					                               f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
					                                              OpStore %175 %179 
					                                              OpBranch %177 
					                                     %180 = OpLabel 
					                               f32_4 %181 = OpLoad %9 
					                               f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
					                                              OpStore %175 %182 
					                                              OpBranch %177 
					                                     %177 = OpLabel 
					                               f32_3 %183 = OpLoad %175 
					                               f32_4 %184 = OpLoad %171 
					                               f32_4 %185 = OpVectorShuffle %184 %183 4 5 6 3 
					                                              OpStore %171 %185 
					                        Private f32* %186 = OpAccessChain %9 %33 
					                                 f32 %187 = OpLoad %186 
					                         Output f32* %189 = OpAccessChain %171 %33 
					                                              OpStore %189 %187 
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
					
					vec2 ImmCB_0_0_0[12];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[4];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[18];
						float _ReflectionBlur;
						vec4 unused_0_4[3];
						int _HighlightSuppression;
						vec4 unused_0_6[7];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					int u_xlati4;
					vec2 u_xlat8;
					bool u_xlatb8;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(-0.326211989, -0.405809999);
						ImmCB_0_0_0[1] = vec2(-0.840143979, -0.0735799968);
						ImmCB_0_0_0[2] = vec2(-0.69591397, 0.457136989);
						ImmCB_0_0_0[3] = vec2(-0.203345001, 0.620715976);
						ImmCB_0_0_0[4] = vec2(0.962339997, -0.194983006);
						ImmCB_0_0_0[5] = vec2(0.473434001, -0.480026007);
						ImmCB_0_0_0[6] = vec2(0.519456029, 0.767022014);
						ImmCB_0_0_0[7] = vec2(0.185461, -0.893123984);
						ImmCB_0_0_0[8] = vec2(0.507430971, 0.0644249991);
						ImmCB_0_0_0[9] = vec2(0.896420002, 0.412458003);
						ImmCB_0_0_0[10] = vec2(-0.321940005, -0.932614982);
						ImmCB_0_0_0[11] = vec2(-0.791558981, -0.597710013);
					    u_xlat0.x = _MainTex_TexelSize.x * _ReflectionBlur;
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat8.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * u_xlat0.xx + vs_TEXCOORD1.xy;
					        u_xlat2 = texture(_MainTex, u_xlat8.xy);
					        u_xlat3.xyz = u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
					        u_xlat3.xyz = u_xlat2.xyz / u_xlat3.xyz;
					        u_xlat2.xyz = (_HighlightSuppression != 0) ? u_xlat3.xyz : u_xlat2.xyz;
					        u_xlat1 = u_xlat1 + u_xlat2;
					    }
					    u_xlat0 = u_xlat1 * vec4(0.0833333358, 0.0833333358, 0.0833333358, 0.0833333358);
					    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(0.0833333358, 0.0833333358, 0.0833333358) + vec3(1.0, 1.0, 1.0);
					    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.xyz;
					    SV_Target0.xyz = (_HighlightSuppression != 0) ? u_xlat1.xyz : u_xlat0.xyz;
					    SV_Target0.w = u_xlat0.w;
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
	Fallback "Diffuse"
}