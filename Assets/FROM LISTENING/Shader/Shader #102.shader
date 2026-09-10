//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1,1,1,1)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0,1)) = 0.5
 _Glossiness ("Smoothness", Range(0,1)) = 0.5
[Gamma]  _Metallic ("Metallic", Range(0,1)) = 0
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
 _BumpScale ("Scale", Float) = 1
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005,0.08)) = 0.02
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0,1)) = 1
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0,0,0,1)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1
 _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0
[HideInInspector]  _Mode ("__mode", Float) = 0
[HideInInspector]  _SrcBlend ("__src", Float) = 1
[HideInInspector]  _DstBlend ("__dst", Float) = 0
[HideInInspector]  _ZWrite ("__zw", Float) = 1
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 39223
Program "vp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD8.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat17;
float u_xlat28;
float u_xlat29;
vec2 u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
float u_xlat39;
float u_xlat40;
bool u_xlatb41;
float u_xlat42;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat39 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat42 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.x = (-_OcclusionStrength) + 1.0;
    u_xlat4.x = u_xlat10_4.y * _OcclusionStrength + u_xlat4.x;
    u_xlat17 = (-_Glossiness) + 1.0;
    u_xlat30.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat30.x = u_xlat30.x + u_xlat30.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat30.xxx) + u_xlat3.xyz;
    u_xlat2.w = 1.0;
    u_xlat6.x = dot(unity_SHAr, u_xlat2);
    u_xlat6.y = dot(unity_SHAg, u_xlat2);
    u_xlat6.z = dot(unity_SHAb, u_xlat2);
    u_xlat6.xyz = u_xlat6.xyz + vs_TEXCOORD5.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb41 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat7.xyz = log2(u_xlat6.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = (bool(u_xlatb41)) ? u_xlat7.xyz : u_xlat6.xyz;
    u_xlatb30 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb30){
        u_xlat30.x = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat30.x = inversesqrt(u_xlat30.x);
        u_xlat7.xyz = u_xlat30.xxx * u_xlat5.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat30.x = min(u_xlat8.y, u_xlat8.x);
        u_xlat30.x = min(u_xlat8.z, u_xlat30.x);
        u_xlat8.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * u_xlat30.xxx + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat30.x = (-u_xlat17) * 0.699999988 + 1.70000005;
    u_xlat30.x = u_xlat30.x * u_xlat17;
    u_xlat30.x = u_xlat30.x * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat30.x);
    u_xlat16_43 = log2(u_xlat10_7.w);
    u_xlat43 = u_xlat16_43 * unity_SpecCube0_HDR.y;
    u_xlat43 = exp2(u_xlat43);
    u_xlat43 = u_xlat43 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat43);
    u_xlatb44 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb44){
        u_xlatb44 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb44){
            u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat44 = inversesqrt(u_xlat44);
            u_xlat9.xyz = vec3(u_xlat44) * u_xlat5.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat44 = min(u_xlat10.y, u_xlat10.x);
            u_xlat44 = min(u_xlat10.z, u_xlat44);
            u_xlat10.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat44) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat30.x);
        u_xlat16_30 = log2(u_xlat10_5.w);
        u_xlat30.x = u_xlat16_30 * unity_SpecCube1_HDR.y;
        u_xlat30.x = exp2(u_xlat30.x);
        u_xlat30.x = u_xlat30.x * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat30.xxx;
        u_xlat7.xyz = vec3(u_xlat43) * u_xlat10_7.xyz + (-u_xlat5.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat7.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat28 = u_xlat17 * u_xlat17;
    u_xlat3.x = (-u_xlat17) * u_xlat17 + 1.0;
    u_xlat16 = u_xlat2.x * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat42 * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat42 * u_xlat16 + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat16 = u_xlat28 * u_xlat28;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat30.xy = vec2(u_xlat28) * vec2(u_xlat28) + vec2(-1.0, 1.0);
    u_xlat40 = u_xlat40 * u_xlat30.x + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274 + 1.00000001e-07;
    u_xlat40 = u_xlat16 / u_xlat40;
    u_xlat16 = (-u_xlat42) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat29 = u_xlat2.x * u_xlat2.x;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat2.x = u_xlat2.x * u_xlat29;
    u_xlat29 = u_xlat2.y * u_xlat2.y;
    u_xlat29 = dot(vec2(u_xlat29), vec2(u_xlat17));
    u_xlat29 = u_xlat29 + -0.5;
    u_xlat16 = u_xlat29 * u_xlat16 + 1.0;
    u_xlat29 = u_xlat29 * u_xlat2.x + 1.0;
    u_xlat16 = u_xlat29 * u_xlat16;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat40 * 0.785398185;
    u_xlat3.x = max(u_xlat40, 9.99999975e-05);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat40 = (u_xlatb41) ? u_xlat3.x : u_xlat40;
    u_xlat40 = u_xlat42 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = u_xlat42 * u_xlat16;
    u_xlat28 = u_xlat28 * u_xlat17;
    u_xlat28 = (-u_xlat28) * 0.280000001 + 1.0;
    u_xlat16 = float(1.0) / u_xlat30.y;
    u_xlat28 = (u_xlatb41) ? u_xlat28 : u_xlat16;
    u_xlat39 = (-u_xlat39) + _Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xxx * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat6.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat40) * _LightColor0.xyz;
    u_xlat40 = (-u_xlat2.y) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat15.xyz = u_xlat5.xyz * vec3(u_xlat28);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat15.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD8.xyz = u_xlat1.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(unity_SHBr, u_xlat2);
    u_xlat1.y = dot(unity_SHBg, u_xlat2);
    u_xlat1.z = dot(unity_SHBb, u_xlat2);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
bvec3 u_xlatb11;
vec3 u_xlat12;
bvec3 u_xlatb13;
vec3 u_xlat16;
float u_xlat17;
float u_xlat18;
float u_xlat30;
float u_xlat31;
float u_xlat32;
float u_xlat42;
float u_xlat43;
bool u_xlatb44;
float u_xlat45;
float u_xlat46;
mediump float u_xlat16_46;
float u_xlat47;
bool u_xlatb47;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat42 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat42) * u_xlat1.xyz;
    u_xlat43 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat2.xyz = vec3(u_xlat43) * vs_TEXCOORD4.xyz;
    u_xlat43 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat3.xyz = vec3(u_xlat43) * vs_TEXCOORD1.xyz;
    u_xlat45 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat18 = (-_OcclusionStrength) + 1.0;
    u_xlat18 = u_xlat10_5.y * _OcclusionStrength + u_xlat18;
    u_xlat32 = (-_Glossiness) + 1.0;
    u_xlat46 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat46 = u_xlat46 + u_xlat46;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat46)) + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat10_4.xxx * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat7.x = dot(unity_SHAr, u_xlat2);
    u_xlat7.y = dot(unity_SHAg, u_xlat2);
    u_xlat7.z = dot(unity_SHAb, u_xlat2);
    u_xlat7.xyz = u_xlat7.xyz + vs_TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb44 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat8.xyz = log2(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = (bool(u_xlatb44)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb4 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb4){
        u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat4.x = inversesqrt(u_xlat4.x);
        u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
        u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        u_xlat9.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
        u_xlat9.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
        u_xlat9.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
        u_xlat4.x = min(u_xlat9.y, u_xlat9.x);
        u_xlat4.x = min(u_xlat9.z, u_xlat4.x);
        u_xlat9.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat4.x = (-u_xlat32) * 0.699999988 + 1.70000005;
    u_xlat4.x = u_xlat4.x * u_xlat32;
    u_xlat4.x = u_xlat4.x * 6.0;
    u_xlat10_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat4.x);
    u_xlat16_46 = log2(u_xlat10_8.w);
    u_xlat46 = u_xlat16_46 * unity_SpecCube0_HDR.y;
    u_xlat46 = exp2(u_xlat46);
    u_xlat46 = u_xlat46 * unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(u_xlat46);
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb47){
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat10.xyz = vec3(u_xlat47) * u_xlat5.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat10.xyz;
            u_xlat12.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlatb13.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            u_xlat11.x = (u_xlatb13.x) ? u_xlat11.x : u_xlat12.x;
            u_xlat11.y = (u_xlatb13.y) ? u_xlat11.y : u_xlat12.y;
            u_xlat11.z = (u_xlatb13.z) ? u_xlat11.z : u_xlat12.z;
            u_xlat47 = min(u_xlat11.y, u_xlat11.x);
            u_xlat47 = min(u_xlat11.z, u_xlat47);
            u_xlat11.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat10.xyz * vec3(u_xlat47) + u_xlat11.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat4.x);
        u_xlat16_4 = log2(u_xlat10_5.w);
        u_xlat4.x = u_xlat16_4 * unity_SpecCube1_HDR.y;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = u_xlat4.x * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat4.xxx;
        u_xlat8.xyz = vec3(u_xlat46) * u_xlat10_8.xyz + (-u_xlat5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat8.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat43) + _WorldSpaceLightPos0.xyz;
    u_xlat43 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat43 = max(u_xlat43, 0.00100000005);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat8.xyz = vec3(u_xlat43) * u_xlat8.xyz;
    u_xlat43 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat30 = u_xlat32 * u_xlat32;
    u_xlat3.x = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat17 = u_xlat2.x * u_xlat3.x + u_xlat30;
    u_xlat3.x = u_xlat45 * u_xlat3.x + u_xlat30;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat45 * u_xlat17 + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat17 = u_xlat30 * u_xlat30;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat4.xw = vec2(u_xlat30) * vec2(u_xlat30) + vec2(-1.0, 1.0);
    u_xlat43 = u_xlat43 * u_xlat4.x + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * 3.14159274 + 1.00000001e-07;
    u_xlat43 = u_xlat17 / u_xlat43;
    u_xlat17 = (-u_xlat45) + 1.0;
    u_xlat31 = u_xlat17 * u_xlat17;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat17 = u_xlat17 * u_xlat31;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat31 = u_xlat2.x * u_xlat2.x;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat2.x = u_xlat2.x * u_xlat31;
    u_xlat31 = u_xlat2.y * u_xlat2.y;
    u_xlat31 = dot(vec2(u_xlat31), vec2(u_xlat32));
    u_xlat31 = u_xlat31 + -0.5;
    u_xlat17 = u_xlat31 * u_xlat17 + 1.0;
    u_xlat31 = u_xlat31 * u_xlat2.x + 1.0;
    u_xlat17 = u_xlat31 * u_xlat17;
    u_xlat43 = u_xlat43 * u_xlat3.x;
    u_xlat43 = u_xlat43 * 0.785398185;
    u_xlat3.x = max(u_xlat43, 9.99999975e-05);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat43 = (u_xlatb44) ? u_xlat3.x : u_xlat43;
    u_xlat43 = u_xlat45 * u_xlat43;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat3.x = u_xlat45 * u_xlat17;
    u_xlat30 = u_xlat30 * u_xlat32;
    u_xlat30 = (-u_xlat30) * 0.280000001 + 1.0;
    u_xlat17 = float(1.0) / u_xlat4.w;
    u_xlat30 = (u_xlatb44) ? u_xlat30 : u_xlat17;
    u_xlat42 = (-u_xlat42) + _Glossiness;
    u_xlat42 = u_xlat42 + 1.0;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat43);
    u_xlat43 = (-u_xlat2.y) + 1.0;
    u_xlat16.x = u_xlat43 * u_xlat43;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat43 = u_xlat43 * u_xlat16.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat43) + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat16.xyz = u_xlat5.xyz * vec3(u_xlat30);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat42);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat4 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    vs_TEXCOORD8.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat4 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat3 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat2 * u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlatb15 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat0.xyz = (bool(u_xlatb15)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = u_xlat1.x * u_xlat1.x + (-u_xlat15);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat2.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat15;
float u_xlat16;
float u_xlat17;
float u_xlat28;
float u_xlat29;
vec2 u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
float u_xlat39;
float u_xlat40;
bool u_xlatb41;
float u_xlat42;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat39 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat2.xyz = vec3(u_xlat40) * vs_TEXCOORD4.xyz;
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat3.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat42 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat10_4 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat4.x = (-_OcclusionStrength) + 1.0;
    u_xlat4.x = u_xlat10_4.y * _OcclusionStrength + u_xlat4.x;
    u_xlat17 = (-_Glossiness) + 1.0;
    u_xlat30.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat30.x = u_xlat30.x + u_xlat30.x;
    u_xlat5.xyz = u_xlat2.xyz * (-u_xlat30.xxx) + u_xlat3.xyz;
    u_xlat2.w = 1.0;
    u_xlat6.x = dot(unity_SHAr, u_xlat2);
    u_xlat6.y = dot(unity_SHAg, u_xlat2);
    u_xlat6.z = dot(unity_SHAb, u_xlat2);
    u_xlat6.xyz = u_xlat6.xyz + vs_TEXCOORD5.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb41 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat7.xyz = log2(u_xlat6.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = (bool(u_xlatb41)) ? u_xlat7.xyz : u_xlat6.xyz;
    u_xlatb30 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb30){
        u_xlat30.x = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat30.x = inversesqrt(u_xlat30.x);
        u_xlat7.xyz = u_xlat30.xxx * u_xlat5.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat30.x = min(u_xlat8.y, u_xlat8.x);
        u_xlat30.x = min(u_xlat8.z, u_xlat30.x);
        u_xlat8.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * u_xlat30.xxx + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat30.x = (-u_xlat17) * 0.699999988 + 1.70000005;
    u_xlat30.x = u_xlat30.x * u_xlat17;
    u_xlat30.x = u_xlat30.x * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat30.x);
    u_xlat16_43 = log2(u_xlat10_7.w);
    u_xlat43 = u_xlat16_43 * unity_SpecCube0_HDR.y;
    u_xlat43 = exp2(u_xlat43);
    u_xlat43 = u_xlat43 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat43);
    u_xlatb44 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb44){
        u_xlatb44 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb44){
            u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat44 = inversesqrt(u_xlat44);
            u_xlat9.xyz = vec3(u_xlat44) * u_xlat5.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat44 = min(u_xlat10.y, u_xlat10.x);
            u_xlat44 = min(u_xlat10.z, u_xlat44);
            u_xlat10.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat9.xyz * vec3(u_xlat44) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat30.x);
        u_xlat16_30 = log2(u_xlat10_5.w);
        u_xlat30.x = u_xlat16_30 * unity_SpecCube1_HDR.y;
        u_xlat30.x = exp2(u_xlat30.x);
        u_xlat30.x = u_xlat30.x * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat30.xxx;
        u_xlat7.xyz = vec3(u_xlat43) * u_xlat10_7.xyz + (-u_xlat5.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = u_xlat4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat40) + _WorldSpaceLightPos0.xyz;
    u_xlat40 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat40 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat7.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat28 = u_xlat17 * u_xlat17;
    u_xlat3.x = (-u_xlat17) * u_xlat17 + 1.0;
    u_xlat16 = u_xlat2.x * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat42 * u_xlat3.x + u_xlat28;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat42 * u_xlat16 + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat16 = u_xlat28 * u_xlat28;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat30.xy = vec2(u_xlat28) * vec2(u_xlat28) + vec2(-1.0, 1.0);
    u_xlat40 = u_xlat40 * u_xlat30.x + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274 + 1.00000001e-07;
    u_xlat40 = u_xlat16 / u_xlat40;
    u_xlat16 = (-u_xlat42) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat29 = u_xlat2.x * u_xlat2.x;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat2.x = u_xlat2.x * u_xlat29;
    u_xlat29 = u_xlat2.y * u_xlat2.y;
    u_xlat29 = dot(vec2(u_xlat29), vec2(u_xlat17));
    u_xlat29 = u_xlat29 + -0.5;
    u_xlat16 = u_xlat29 * u_xlat16 + 1.0;
    u_xlat29 = u_xlat29 * u_xlat2.x + 1.0;
    u_xlat16 = u_xlat29 * u_xlat16;
    u_xlat40 = u_xlat40 * u_xlat3.x;
    u_xlat40 = u_xlat40 * 0.785398185;
    u_xlat3.x = max(u_xlat40, 9.99999975e-05);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat40 = (u_xlatb41) ? u_xlat3.x : u_xlat40;
    u_xlat40 = u_xlat42 * u_xlat40;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat3.x = u_xlat42 * u_xlat16;
    u_xlat28 = u_xlat28 * u_xlat17;
    u_xlat28 = (-u_xlat28) * 0.280000001 + 1.0;
    u_xlat16 = float(1.0) / u_xlat30.y;
    u_xlat28 = (u_xlatb41) ? u_xlat28 : u_xlat16;
    u_xlat39 = (-u_xlat39) + _Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xxx * _LightColor0.xyz;
    u_xlat3.xyz = u_xlat6.xyz * u_xlat4.xxx + u_xlat3.xyz;
    u_xlat4.xyz = vec3(u_xlat40) * _LightColor0.xyz;
    u_xlat40 = (-u_xlat2.y) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat40) + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat15.xyz = u_xlat5.xyz * vec3(u_xlat28);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat39);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat15.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
out vec3 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat3 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat5 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    vs_TEXCOORD8.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat5 * u_xlat2.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat4 = inversesqrt(u_xlat3);
    u_xlat3 = u_xlat3 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat3 * u_xlat1;
    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlatb19 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = u_xlat2.x * u_xlat2.x + (-u_xlat19);
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat3.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
in  vec3 vs_TEXCOORD8;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
bool u_xlatb4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
bvec3 u_xlatb11;
vec3 u_xlat12;
bvec3 u_xlatb13;
vec3 u_xlat16;
float u_xlat17;
float u_xlat18;
float u_xlat30;
float u_xlat31;
float u_xlat32;
float u_xlat42;
float u_xlat43;
bool u_xlatb44;
float u_xlat45;
float u_xlat46;
mediump float u_xlat16_46;
float u_xlat47;
bool u_xlatb47;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = _Color.xyz * u_xlat10_0.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat0.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat42 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat42) * u_xlat1.xyz;
    u_xlat43 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat2.xyz = vec3(u_xlat43) * vs_TEXCOORD4.xyz;
    u_xlat43 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat3.xyz = vec3(u_xlat43) * vs_TEXCOORD1.xyz;
    u_xlat45 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat45 = max(u_xlat45, 0.0);
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat10_5 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat18 = (-_OcclusionStrength) + 1.0;
    u_xlat18 = u_xlat10_5.y * _OcclusionStrength + u_xlat18;
    u_xlat32 = (-_Glossiness) + 1.0;
    u_xlat46 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat46 = u_xlat46 + u_xlat46;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat46)) + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat10_4.xxx * _LightColor0.xyz;
    u_xlat2.w = 1.0;
    u_xlat7.x = dot(unity_SHAr, u_xlat2);
    u_xlat7.y = dot(unity_SHAg, u_xlat2);
    u_xlat7.z = dot(unity_SHAb, u_xlat2);
    u_xlat7.xyz = u_xlat7.xyz + vs_TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb44 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat8.xyz = log2(u_xlat7.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat7.xyz = (bool(u_xlatb44)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb4 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb4){
        u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat4.x = inversesqrt(u_xlat4.x);
        u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
        u_xlat10.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
        u_xlat9.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
        u_xlat9.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
        u_xlat9.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
        u_xlat4.x = min(u_xlat9.y, u_xlat9.x);
        u_xlat4.x = min(u_xlat9.z, u_xlat4.x);
        u_xlat9.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx + u_xlat9.xyz;
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    //ENDIF
    }
    u_xlat4.x = (-u_xlat32) * 0.699999988 + 1.70000005;
    u_xlat4.x = u_xlat4.x * u_xlat32;
    u_xlat4.x = u_xlat4.x * 6.0;
    u_xlat10_8 = textureLod(unity_SpecCube0, u_xlat8.xyz, u_xlat4.x);
    u_xlat16_46 = log2(u_xlat10_8.w);
    u_xlat46 = u_xlat16_46 * unity_SpecCube0_HDR.y;
    u_xlat46 = exp2(u_xlat46);
    u_xlat46 = u_xlat46 * unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(u_xlat46);
    u_xlatb47 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb47){
        u_xlatb47 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb47){
            u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat47 = inversesqrt(u_xlat47);
            u_xlat10.xyz = vec3(u_xlat47) * u_xlat5.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat10.xyz;
            u_xlat12.xyz = (-vs_TEXCOORD8.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlatb13.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat10.xyzx).xyz;
            u_xlat11.x = (u_xlatb13.x) ? u_xlat11.x : u_xlat12.x;
            u_xlat11.y = (u_xlatb13.y) ? u_xlat11.y : u_xlat12.y;
            u_xlat11.z = (u_xlatb13.z) ? u_xlat11.z : u_xlat12.z;
            u_xlat47 = min(u_xlat11.y, u_xlat11.x);
            u_xlat47 = min(u_xlat11.z, u_xlat47);
            u_xlat11.xyz = vs_TEXCOORD8.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat10.xyz * vec3(u_xlat47) + u_xlat11.xyz;
        //ENDIF
        }
        u_xlat10_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, u_xlat4.x);
        u_xlat16_4 = log2(u_xlat10_5.w);
        u_xlat4.x = u_xlat16_4 * unity_SpecCube1_HDR.y;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = u_xlat4.x * unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat4.xxx;
        u_xlat8.xyz = vec3(u_xlat46) * u_xlat10_8.xyz + (-u_xlat5.xyz);
        u_xlat9.xyz = unity_SpecCube0_BoxMin.www * u_xlat8.xyz + u_xlat5.xyz;
    //ENDIF
    }
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat43) + _WorldSpaceLightPos0.xyz;
    u_xlat43 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat43 = max(u_xlat43, 0.00100000005);
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat8.xyz = vec3(u_xlat43) * u_xlat8.xyz;
    u_xlat43 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat2.x = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat2.y = dot(_WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat30 = u_xlat32 * u_xlat32;
    u_xlat3.x = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat17 = u_xlat2.x * u_xlat3.x + u_xlat30;
    u_xlat3.x = u_xlat45 * u_xlat3.x + u_xlat30;
    u_xlat3.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.x = u_xlat45 * u_xlat17 + u_xlat3.x;
    u_xlat3.x = u_xlat3.x + 9.99999975e-06;
    u_xlat3.x = 2.0 / u_xlat3.x;
    u_xlat17 = u_xlat30 * u_xlat30;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat4.xw = vec2(u_xlat30) * vec2(u_xlat30) + vec2(-1.0, 1.0);
    u_xlat43 = u_xlat43 * u_xlat4.x + 1.0;
    u_xlat43 = u_xlat43 * u_xlat43;
    u_xlat43 = u_xlat43 * 3.14159274 + 1.00000001e-07;
    u_xlat43 = u_xlat17 / u_xlat43;
    u_xlat17 = (-u_xlat45) + 1.0;
    u_xlat31 = u_xlat17 * u_xlat17;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat17 = u_xlat17 * u_xlat31;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat31 = u_xlat2.x * u_xlat2.x;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat2.x = u_xlat2.x * u_xlat31;
    u_xlat31 = u_xlat2.y * u_xlat2.y;
    u_xlat31 = dot(vec2(u_xlat31), vec2(u_xlat32));
    u_xlat31 = u_xlat31 + -0.5;
    u_xlat17 = u_xlat31 * u_xlat17 + 1.0;
    u_xlat31 = u_xlat31 * u_xlat2.x + 1.0;
    u_xlat17 = u_xlat31 * u_xlat17;
    u_xlat43 = u_xlat43 * u_xlat3.x;
    u_xlat43 = u_xlat43 * 0.785398185;
    u_xlat3.x = max(u_xlat43, 9.99999975e-05);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat43 = (u_xlatb44) ? u_xlat3.x : u_xlat43;
    u_xlat43 = u_xlat45 * u_xlat43;
    u_xlat43 = max(u_xlat43, 0.0);
    u_xlat3.x = u_xlat45 * u_xlat17;
    u_xlat30 = u_xlat30 * u_xlat32;
    u_xlat30 = (-u_xlat30) * 0.280000001 + 1.0;
    u_xlat17 = float(1.0) / u_xlat4.w;
    u_xlat30 = (u_xlatb44) ? u_xlat30 : u_xlat17;
    u_xlat42 = (-u_xlat42) + _Glossiness;
    u_xlat42 = u_xlat42 + 1.0;
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat43);
    u_xlat43 = (-u_xlat2.y) + 1.0;
    u_xlat16.x = u_xlat43 * u_xlat43;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat43 = u_xlat43 * u_xlat16.x;
    u_xlat6.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat43) + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat16.xyz = u_xlat5.xyz * vec3(u_xlat30);
    u_xlat3.xyz = (-u_xlat0.xyz) + vec3(u_xlat42);
    u_xlat0.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
}
 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 129312
Program "vp" {
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat0.w = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, (-u_xlat0.xyz));
    u_xlat0.yz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat18 = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat18 = u_xlat13 / u_xlat18;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat7.x = max(u_xlat18, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb13) ? u_xlat7.x : u_xlat18;
    u_xlat18 = u_xlat0.y * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat7.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat7.xx);
    u_xlat7.xyz = u_xlat10_2.www * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat7.xyz;
    u_xlat0.xw = (-u_xlat0.xz) + vec2(1.0, 1.0);
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat12 = dot(vec2(u_xlat12), u_xlat1.xx);
    u_xlat12 = u_xlat12 + -0.5;
    u_xlat1.x = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat0.x * u_xlat0.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat0.x = u_xlat12 * u_xlat0.x + 1.0;
    u_xlat18 = (-u_xlat0.y) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat18 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat10;
float u_xlat11;
bool u_xlatb11;
float u_xlat15;
float u_xlat16;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat15 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat15) + u_xlat1.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * vs_TEXCOORD1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, (-u_xlat3.xyz));
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 0.00100000005);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    u_xlat16 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.xyw = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat10.x = max(u_xlat16, 0.0);
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat6.x = u_xlat1.x * u_xlat1.x;
    u_xlat11 = u_xlat6.x * u_xlat6.x + -1.0;
    u_xlat10.x = u_xlat10.x * u_xlat11 + 1.0;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat10.x * 3.14159274 + 1.00000001e-07;
    u_xlat11 = u_xlat6.x * u_xlat6.x;
    u_xlat10.x = u_xlat11 / u_xlat10.x;
    u_xlat11 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat16 = u_xlat0.w * u_xlat11 + u_xlat6.x;
    u_xlat6.x = u_xlat0.x * u_xlat11 + u_xlat6.x;
    u_xlat6.x = u_xlat0.w * u_xlat6.x;
    u_xlat6.x = u_xlat0.x * u_xlat16 + u_xlat6.x;
    u_xlat6.x = u_xlat6.x + 9.99999975e-06;
    u_xlat6.x = 2.0 / u_xlat6.x;
    u_xlat10.x = u_xlat10.x * u_xlat6.x;
    u_xlat10.x = u_xlat10.x * 0.785398185;
    u_xlat6.x = max(u_xlat10.x, 9.99999975e-05);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlatb11 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat10.x = (u_xlatb11) ? u_xlat6.x : u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = max(u_xlat10.x, 0.0);
    u_xlat6.xyz = u_xlat10.xxx * _LightColor0.xyz;
    u_xlat10.xy = (-u_xlat0.yw) + vec2(1.0, 1.0);
    u_xlat5 = dot(u_xlat0.yy, u_xlat0.yy);
    u_xlat5 = u_xlat5 * u_xlat1.x + -0.5;
    u_xlat1.x = u_xlat10.x * u_xlat10.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat10.x = u_xlat10.x * u_xlat1.x;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat3.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat3.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat4.xyz = (-u_xlat3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat10.xxx + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat3.xyz;
    u_xlat10.x = u_xlat10.y * u_xlat10.y;
    u_xlat10.x = u_xlat10.x * u_xlat10.x;
    u_xlat10.x = u_xlat10.y * u_xlat10.x;
    u_xlat10.x = u_xlat5 * u_xlat10.x + 1.0;
    u_xlat15 = (-u_xlat0.x) + 1.0;
    u_xlat16 = u_xlat15 * u_xlat15;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat5 = u_xlat5 * u_xlat15 + 1.0;
    u_xlat5 = u_xlat10.x * u_xlat5;
    u_xlat0.x = u_xlat0.x * u_xlat5;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat15 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat0.w = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, (-u_xlat0.xyz));
    u_xlat0.yz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat18 = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat18 = u_xlat13 / u_xlat18;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat7.x = max(u_xlat18, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb13) ? u_xlat7.x : u_xlat18;
    u_xlat18 = u_xlat0.y * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat7.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_2 = texture(_LightTexture0, u_xlat7.xy);
    u_xlatb7 = 0.0<vs_TEXCOORD5.z;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat10_2.w * u_xlat7.x;
    u_xlat13 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat13));
    u_xlat7.x = u_xlat7.x * u_xlat10_2.w;
    u_xlat7.xyz = u_xlat7.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat7.xyz;
    u_xlat0.xw = (-u_xlat0.xz) + vec2(1.0, 1.0);
    u_xlat12 = dot(u_xlat0.zz, u_xlat0.zz);
    u_xlat12 = u_xlat12 * u_xlat1.x + -0.5;
    u_xlat1.x = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat0.x * u_xlat0.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat0.x = u_xlat12 * u_xlat0.x + 1.0;
    u_xlat18 = (-u_xlat0.y) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat18 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat0.w = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, (-u_xlat0.xyz));
    u_xlat0.yz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat18 = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat18 = u_xlat13 / u_xlat18;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat7.x = max(u_xlat18, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb13) ? u_xlat7.x : u_xlat18;
    u_xlat18 = u_xlat0.y * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat7.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat7.xx);
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_7 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat7.xyz = vec3(u_xlat16_7) * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat7.xyz;
    u_xlat0.xw = (-u_xlat0.xz) + vec2(1.0, 1.0);
    u_xlat12 = u_xlat0.z * u_xlat0.z;
    u_xlat12 = dot(vec2(u_xlat12), u_xlat1.xx);
    u_xlat12 = u_xlat12 + -0.5;
    u_xlat1.x = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat0.x * u_xlat0.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat0.x = u_xlat12 * u_xlat0.x + 1.0;
    u_xlat18 = (-u_xlat0.y) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat18 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * _LightMatrix0[1].xy;
    u_xlat0.xy = _LightMatrix0[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = _LightMatrix0[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat0.ww + u_xlat0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, (-u_xlat3.xyz));
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = max(u_xlat19, 0.00100000005);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.xyw = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12.x = max(u_xlat19, 0.0);
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12.x = u_xlat12.x * u_xlat13 + 1.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12.x = u_xlat13 / u_xlat12.x;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.w * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.w * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12.x = u_xlat12.x * u_xlat7.x;
    u_xlat12.x = u_xlat12.x * 0.785398185;
    u_xlat7.x = max(u_xlat12.x, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12.x = (u_xlatb13) ? u_xlat7.x : u_xlat12.x;
    u_xlat12.x = u_xlat0.x * u_xlat12.x;
    u_xlat12.x = max(u_xlat12.x, 0.0);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat7.xyz = u_xlat10_2.www * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat12.xxx * u_xlat7.xyz;
    u_xlat12.xy = (-u_xlat0.yw) + vec2(1.0, 1.0);
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = dot(vec2(u_xlat6), u_xlat1.xx);
    u_xlat6 = u_xlat6 + -0.5;
    u_xlat1.x = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat12.x = u_xlat12.x * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat12.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12.x = u_xlat12.y * u_xlat12.y;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.y * u_xlat12.x;
    u_xlat12.x = u_xlat6 * u_xlat12.x + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12.x * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 unity_World2Shadow[4];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * unity_World2Shadow[0][1];
    u_xlat1 = unity_World2Shadow[0][0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = unity_World2Shadow[0][2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = unity_World2Shadow[0][3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
float u_xlat13;
float u_xlat14;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0 = texture(_LightTexture0, u_xlat0.xy);
    u_xlatb0 = 0.0<vs_TEXCOORD5.z;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat10_0.w * u_xlat0.x;
    u_xlat6.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat6.xx);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat6.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
    vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat12 = (-_LightShadowData.x) + 1.0;
    u_xlat6.x = u_xlat10_6 * u_xlat12 + _LightShadowData.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, (-u_xlat1.xyz));
    u_xlat7 = max(u_xlat2.x, 0.0);
    u_xlat1.xz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat19 * u_xlat19;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat7 * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.z) + 1.0;
    u_xlat13 = dot(u_xlat1.zz, u_xlat1.zz);
    u_xlat13 = u_xlat13 * u_xlat19 + -0.5;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = u_xlat13 * u_xlat18 + 1.0;
    u_xlat1.x = (-u_xlat7) + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat1.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat1.x = u_xlat1.x * u_xlat19;
    u_xlat1.x = u_xlat13 * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, (-u_xlat3.xyz));
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = max(u_xlat19, 0.00100000005);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.xyw = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12.x = max(u_xlat19, 0.0);
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12.x = u_xlat12.x * u_xlat13 + 1.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12.x = u_xlat13 / u_xlat12.x;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.w * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.w * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12.x = u_xlat12.x * u_xlat7.x;
    u_xlat12.x = u_xlat12.x * 0.785398185;
    u_xlat7.x = max(u_xlat12.x, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12.x = (u_xlatb13) ? u_xlat7.x : u_xlat12.x;
    u_xlat12.x = u_xlat0.x * u_xlat12.x;
    u_xlat12.x = max(u_xlat12.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat12.xxx * u_xlat7.xyz;
    u_xlat12.xy = (-u_xlat0.yw) + vec2(1.0, 1.0);
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = dot(vec2(u_xlat6), u_xlat1.xx);
    u_xlat6 = u_xlat6 + -0.5;
    u_xlat1.x = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat12.x = u_xlat12.x * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat12.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12.x = u_xlat12.y * u_xlat12.y;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.y * u_xlat12.x;
    u_xlat12.x = u_xlat6 * u_xlat12.x + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12.x * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat1 = _Object2World[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = _Object2World[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = _Object2World[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xy = u_xlat1.yy * _LightMatrix0[1].xy;
    u_xlat1.xy = _LightMatrix0[0].xy * u_xlat1.xx + u_xlat2.xy;
    u_xlat1.xy = _LightMatrix0[2].xy * u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat1.ww + u_xlat1.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) * vec3(u_xlat18) + u_xlat1.xyz;
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat0.w = dot(u_xlat0.xyz, (-u_xlat3.xyz));
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = max(u_xlat19, 0.00100000005);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat2.xyz = vec3(u_xlat19) * u_xlat2.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.xyw = max(u_xlat0.xyw, vec3(0.0, 0.0, 0.0));
    u_xlat12.x = max(u_xlat19, 0.0);
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat12.x = u_xlat12.x * u_xlat13 + 1.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat12.x = u_xlat13 / u_xlat12.x;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.w * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.w * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat12.x = u_xlat12.x * u_xlat7.x;
    u_xlat12.x = u_xlat12.x * 0.785398185;
    u_xlat7.x = max(u_xlat12.x, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat12.x = (u_xlatb13) ? u_xlat7.x : u_xlat12.x;
    u_xlat12.x = u_xlat0.x * u_xlat12.x;
    u_xlat12.x = max(u_xlat12.x, 0.0);
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat7.xy);
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat16_7 = u_xlat10_2.x * u_xlat10_3.w;
    u_xlat7.xyz = vec3(u_xlat16_7) * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat12.xxx * u_xlat7.xyz;
    u_xlat12.xy = (-u_xlat0.yw) + vec2(1.0, 1.0);
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = dot(vec2(u_xlat6), u_xlat1.xx);
    u_xlat6 = u_xlat6 + -0.5;
    u_xlat1.x = u_xlat12.x * u_xlat12.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat12.x = u_xlat12.x * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat12.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat12.x = u_xlat12.y * u_xlat12.y;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.y * u_xlat12.x;
    u_xlat12.x = u_xlat6 * u_xlat12.x + 1.0;
    u_xlat18 = (-u_xlat0.x) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat6 = u_xlat6 * u_xlat18 + 1.0;
    u_xlat6 = u_xlat12.x * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat6;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = vs_TEXCOORD2.w;
    u_xlat1.y = vs_TEXCOORD3.w;
    u_xlat1.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat0.w = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat1.w = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, (-u_xlat0.xyz));
    u_xlat0.yz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat0.xw = max(u_xlat0.xw, vec2(0.0, 0.0));
    u_xlat18 = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = (-_Glossiness) + 1.0;
    u_xlat7.x = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat7.x * u_xlat7.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat13 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat13 = u_xlat7.x * u_xlat7.x;
    u_xlat18 = u_xlat13 / u_xlat18;
    u_xlat13 = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat13 + u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.y * u_xlat19 + u_xlat7.x;
    u_xlat7.x = u_xlat7.x + 9.99999975e-06;
    u_xlat7.x = 2.0 / u_xlat7.x;
    u_xlat18 = u_xlat18 * u_xlat7.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat7.x = max(u_xlat18, 9.99999975e-05);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlatb13 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb13) ? u_xlat7.x : u_xlat18;
    u_xlat18 = u_xlat0.y * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat7.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * _LightPositionRange.w;
    u_xlat7.x = u_xlat7.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb7 = u_xlat10_2.x<u_xlat7.x;
    u_xlat7.x = (u_xlatb7) ? _LightShadowData.x : 1.0;
    u_xlat13 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTexture0, vec2(u_xlat13));
    u_xlat7.x = u_xlat7.x * u_xlat10_2.w;
    u_xlat7.xyz = u_xlat7.xxx * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat7.xyz;
    u_xlat0.xw = (-u_xlat0.xz) + vec2(1.0, 1.0);
    u_xlat12 = dot(u_xlat0.zz, u_xlat0.zz);
    u_xlat12 = u_xlat12 * u_xlat1.x + -0.5;
    u_xlat1.x = u_xlat0.w * u_xlat0.w;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat0.x * u_xlat0.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat0.x = u_xlat12 * u_xlat0.x + 1.0;
    u_xlat18 = (-u_xlat0.y) + 1.0;
    u_xlat1.x = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat18 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat13;
float u_xlat14;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * 0.970000029;
    u_xlat10_1 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb0 = u_xlat10_1.x<u_xlat0.x;
    u_xlat0.x = (u_xlatb0) ? _LightShadowData.x : 1.0;
    u_xlat6 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat6));
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_6 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_6;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, (-u_xlat1.xyz));
    u_xlat7 = max(u_xlat2.x, 0.0);
    u_xlat1.xz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat19 * u_xlat19;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat7 * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.z) + 1.0;
    u_xlat13 = dot(u_xlat1.zz, u_xlat1.zz);
    u_xlat13 = u_xlat13 * u_xlat19 + -0.5;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = u_xlat13 * u_xlat18 + 1.0;
    u_xlat1.x = (-u_xlat7) + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat1.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat1.x = u_xlat1.x * u_xlat19;
    u_xlat1.x = u_xlat13 * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 unity_World2Shadow[4];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * unity_World2Shadow[0][1];
    u_xlat1 = unity_World2Shadow[0][0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = unity_World2Shadow[0][2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = unity_World2Shadow[0][3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	vec4 _ShadowOffsets[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
float u_xlat13;
float u_xlat14;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = (-_LightShadowData.x) + 1.0;
    u_xlat6.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
    u_xlat1.xyz = u_xlat6.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xyz = u_xlat6.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xyz = u_xlat6.xyz + _ShadowOffsets[2].xyz;
    u_xlat6.xyz = u_xlat6.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0 = u_xlat1 * u_xlat0.xxxx + _LightShadowData.xxxx;
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat6.xy);
    u_xlatb6 = 0.0<vs_TEXCOORD5.z;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat6.x = u_xlat10_1.w * u_xlat6.x;
    u_xlat12 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, vec2(u_xlat12));
    u_xlat6.x = u_xlat6.x * u_xlat10_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, (-u_xlat1.xyz));
    u_xlat7 = max(u_xlat2.x, 0.0);
    u_xlat1.xz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat19 * u_xlat19;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat7 * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.z) + 1.0;
    u_xlat13 = u_xlat1.z * u_xlat1.z;
    u_xlat13 = dot(vec2(u_xlat13), vec2(u_xlat19));
    u_xlat13 = u_xlat13 + -0.5;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = u_xlat13 * u_xlat18 + 1.0;
    u_xlat1.x = (-u_xlat7) + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat1.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat1.x = u_xlat1.x * u_xlat19;
    u_xlat1.x = u_xlat13 * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat13;
float u_xlat14;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * 0.970000029;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat1 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.y = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.z = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.w = u_xlat10_2.x;
    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat6.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat6.xx);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, (-u_xlat1.xyz));
    u_xlat7 = max(u_xlat2.x, 0.0);
    u_xlat1.xz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat19 * u_xlat19;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat7 * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.z) + 1.0;
    u_xlat13 = u_xlat1.z * u_xlat1.z;
    u_xlat13 = dot(vec2(u_xlat13), vec2(u_xlat19));
    u_xlat13 = u_xlat13 + -0.5;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = u_xlat13 * u_xlat18 + 1.0;
    u_xlat1.x = (-u_xlat7) + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat1.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat1.x = u_xlat1.x * u_xlat19;
    u_xlat1.x = u_xlat13 * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    vs_TEXCOORD2.w = u_xlat2.x;
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat0.zxy;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat2.y;
    vs_TEXCOORD4.w = u_xlat2.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
float u_xlat8;
bool u_xlatb8;
float u_xlat13;
float u_xlat14;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * 0.970000029;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat1 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.y = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.z = u_xlat10_2.x;
    u_xlat6.xyz = vs_TEXCOORD6.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat1.w = u_xlat10_2.x;
    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat6.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat6.xx);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_6 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_6;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat18 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * vs_TEXCOORD1.xyz;
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat18) + (-u_xlat1.xyz);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * vs_TEXCOORD4.xyz;
    u_xlat18 = dot(u_xlat4.xyz, u_xlat3.xyz);
    u_xlat1.w = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, (-u_xlat1.xyz));
    u_xlat7 = max(u_xlat2.x, 0.0);
    u_xlat1.xz = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat2.x = u_xlat19 * u_xlat19;
    u_xlat8 = u_xlat2.x * u_xlat2.x + -1.0;
    u_xlat18 = u_xlat18 * u_xlat8 + 1.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * 3.14159274 + 1.00000001e-07;
    u_xlat8 = u_xlat2.x * u_xlat2.x;
    u_xlat18 = u_xlat8 / u_xlat18;
    u_xlat8 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat14 = u_xlat1.x * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat7 * u_xlat8 + u_xlat2.x;
    u_xlat2.x = u_xlat1.x * u_xlat2.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat2.x = u_xlat7 * u_xlat14 + u_xlat2.x;
    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
    u_xlat2.x = 2.0 / u_xlat2.x;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.785398185;
    u_xlat2.x = max(u_xlat18, 9.99999975e-05);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb8 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat18 = (u_xlatb8) ? u_xlat2.x : u_xlat18;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat18);
    u_xlat18 = (-u_xlat1.z) + 1.0;
    u_xlat13 = u_xlat1.z * u_xlat1.z;
    u_xlat13 = dot(vec2(u_xlat13), vec2(u_xlat19));
    u_xlat13 = u_xlat13 + -0.5;
    u_xlat19 = u_xlat18 * u_xlat18;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat18 = u_xlat18 * u_xlat19;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = _Color.xyz * u_xlat10_3.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat18 = u_xlat13 * u_xlat18 + 1.0;
    u_xlat1.x = (-u_xlat7) + 1.0;
    u_xlat19 = u_xlat1.x * u_xlat1.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat1.x = u_xlat1.x * u_xlat19;
    u_xlat1.x = u_xlat13 * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat7 * u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    SV_Target0.xyz = u_xlat1.xyz * u_xlat0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
""
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "SHADOWS_NATIVE" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 147192
Program "vp" {
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	mat4x4 unity_MatrixVP;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + _Object2World[3].xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + unity_MatrixVP[3];
    u_xlat1 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
    u_xlatb2 = unity_LightShadowBias.z!=0.0;
    u_xlat0 = (bool(u_xlatb2)) ? u_xlat0 : u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + unity_LightShadowBias.x;
    SV_Target0 = vec4(u_xlat0) * _LightPositionRange.wwww;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
""
}
}
 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 219902
Program "vp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(unity_SHBr, u_xlat1);
    u_xlat2.y = dot(unity_SHBg, u_xlat1);
    u_xlat2.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform 	float _OcclusionStrength;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat4;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat0.x = (-_OcclusionStrength) + 1.0;
    u_xlat0.w = u_xlat10_0.y * _OcclusionStrength + u_xlat0.x;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat2.xyz = _Color.xyz * u_xlat10_2.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz;
    SV_Target0 = u_xlat0;
    SV_Target1.w = _Glossiness;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    SV_Target2 = u_xlat1 * vec4(0.5, 0.5, 0.5, 1.0) + vec4(0.5, 0.5, 0.5, 0.0);
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat1.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb10 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.www * u_xlat1.xyz;
    SV_Target3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
""
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_COMBINED" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
""
}
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_SEPARATE" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
""
}
}
 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  GpuProgramID 358221
Program "vp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = u_xlat0.x * u_xlat0.x + (-u_xlat1.x);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat0);
    u_xlat2.y = dot(unity_SHAg, u_xlat0);
    u_xlat2.z = dot(unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat1.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb12 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat0.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat22 = (-u_xlat0.x) + _Glossiness;
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat6.xyz = vec3(u_xlat22) + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat0.zzz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat10_0 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_0 = u_xlat10_0.w * 16.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    vs_TEXCOORD1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    vs_TEXCOORD4.w = 0.0;
    u_xlat2.x = u_xlat1.y * u_xlat1.y;
    u_xlat2.x = u_xlat1.x * u_xlat1.x + (-u_xlat2.x);
    u_xlat3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat2.xyz = unity_SHC.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat1.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb16 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : u_xlat1.xyz;
    vs_TEXCOORD5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat8;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat1.xy * u_xlat1.xy;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat8 = (-u_xlat1.x) + _Glossiness;
    u_xlat8 = u_xlat8 + 1.0;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = vec3(u_xlat8) + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat0.zzz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_7 = u_xlat10_6.w * 16.0;
    u_xlat7.xyz = vec3(u_xlat16_7) * u_xlat4.xyz + u_xlat1.xzw;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat7.xyz * u_xlat2.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    vs_TEXCOORD1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.w = 0.0;
    u_xlat1.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat1.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat1.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat2.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat2.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat2.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat2.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat2.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb18 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat2.xyz + u_xlat0.xyz;
    vs_TEXCOORD5.w = 0.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat22 = (-u_xlat0.x) + _Glossiness;
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat5.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat6.xyz = vec3(u_xlat22) + (-u_xlat5.xyz);
    u_xlat6.xyz = u_xlat0.zzz * u_xlat6.xyz + u_xlat5.xyz;
    u_xlat10_0 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_0 = u_xlat10_0.w * 16.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat4.xyz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_ColorSpaceLuminance;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4.w = 0.0;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat22 = u_xlat2.y * u_xlat2.y;
    u_xlat22 = u_xlat2.x * u_xlat2.x + (-u_xlat22);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat22) + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat2);
    u_xlat4.y = dot(unity_SHAg, u_xlat2);
    u_xlat4.z = dot(unity_SHAb, u_xlat2);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb22 = unity_ColorSpaceLuminance.w==0.0;
    u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : u_xlat3.xyz;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat6 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat6 * u_xlat2.xxxx + u_xlat5;
    u_xlat2 = u_xlat1 * u_xlat2.zzzz + u_xlat5;
    u_xlat4 = u_xlat6 * u_xlat6 + u_xlat4;
    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat4;
    u_xlat4 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat2 = u_xlat2 * u_xlat4;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat3.xyz + u_xlat1.xyz;
    vs_TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D unity_NHxRoughness;
uniform  samplerCube unity_SpecCube0;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
lowp vec4 u_xlat10_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat8;
float u_xlat22;
void main()
{
    u_xlat0.xw = (-vec2(vec2(_Glossiness, _Glossiness))) + vec2(1.0, 1.0);
    u_xlat1.x = (-u_xlat0.x) * 0.699999988 + 1.70000005;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat0.x * 6.0;
    u_xlat1.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD4.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat22 = u_xlat22 + u_xlat22;
    u_xlat2.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + vs_TEXCOORD1.xyz;
    u_xlat10_2 = textureLod(unity_SpecCube0, u_xlat2.xyz, u_xlat0.x);
    u_xlat16_0 = log2(u_xlat10_2.w);
    u_xlat0.x = u_xlat16_0 * unity_SpecCube0_HDR.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_SpecCube0_HDR.x;
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat0.xxx;
    u_xlat10_3 = texture(_OcclusionMap, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.yyy;
    u_xlat3.xyz = u_xlat10_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat22 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.y = (-u_xlat0.x) + 1.0;
    u_xlat5.xyz = u_xlat1.xyz * (-vec3(u_xlat22)) + (-vs_TEXCOORD1.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.xy = u_xlat4.xy * u_xlat4.xy;
    u_xlat0.yz = u_xlat1.xy * u_xlat1.xy;
    u_xlat1.x = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat8 = (-u_xlat1.x) + _Glossiness;
    u_xlat8 = u_xlat8 + 1.0;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = _Color.xyz * u_xlat10_4.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat1.xzw = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat5.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat5.xyz = vec3(u_xlat8) + (-u_xlat4.xyz);
    u_xlat5.xyz = u_xlat0.zzz * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat10_6 = texture(unity_NHxRoughness, u_xlat0.yw);
    u_xlat16_7 = u_xlat10_6.w * 16.0;
    u_xlat7.xyz = vec3(u_xlat16_7) * u_xlat4.xyz + u_xlat1.xzw;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat1.xzw + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_2.xxx * _LightColor0.xyz;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat7.xyz * u_xlat2.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" }
""
}
}
 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="ForwardAdd" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  GpuProgramID 443686
Program "vp" {
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_9 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat2.xyz = vec3(u_xlat16_9) * u_xlat2.xyz;
    u_xlat9 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat9) + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlatb1 = 0.0<vs_TEXCOORD5.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat10_1.w * u_xlat1.x;
    u_xlat4 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat4));
    u_xlat1.x = u_xlat1.x * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_1 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_1 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat1.xyz = vec3(u_xlat16_1) * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xy = u_xlat0.yy * _LightMatrix0[1].xy;
    u_xlat0.xy = _LightMatrix0[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = _LightMatrix0[2].xy * u_xlat0.zz + u_xlat0.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat0.ww + u_xlat0.xy;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat10_1 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat1.xyz = u_xlat10_1.www * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 unity_World2Shadow[4];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * _LightMatrix0[1];
    u_xlat1 = _LightMatrix0[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = _LightMatrix0[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD5 = _LightMatrix0[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * unity_World2Shadow[0][1];
    u_xlat1 = unity_World2Shadow[0][0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = unity_World2Shadow[0][2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = unity_World2Shadow[0][3] * u_xlat0.wwww + u_xlat1;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler2D unity_NHxRoughness;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlatb1 = 0.0<vs_TEXCOORD5.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat10_1.w * u_xlat1.x;
    u_xlat4.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat4.xx);
    u_xlat1.x = u_xlat1.x * u_xlat10_2.w;
    u_xlat4.xyz = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat10_4 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat7 = (-_LightShadowData.x) + 1.0;
    u_xlat4.x = u_xlat10_4 * u_xlat7 + _LightShadowData.x;
    u_xlat1.x = u_xlat4.x * u_xlat1.x;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    vs_TEXCOORD1.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec4 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec2 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlatb1 = _UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat1.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    vs_TEXCOORD1.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat2.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat3.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat3.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat4.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat4.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat4.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat4.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat4.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat4.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat1.xxx * u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    u_xlat1 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat1 = _Object2World[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = _Object2World[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = _Object2World[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xy = u_xlat1.yy * _LightMatrix0[1].xy;
    u_xlat1.xy = _LightMatrix0[0].xy * u_xlat1.xx + u_xlat2.xy;
    u_xlat1.xy = _LightMatrix0[2].xy * u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD5.xy = _LightMatrix0[3].xy * u_xlat1.ww + u_xlat1.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec2 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat1.xy);
    u_xlat10_2 = texture(_LightTexture0, vs_TEXCOORD5.xy);
    u_xlat16_1 = u_xlat10_1.x * u_xlat10_2.w;
    u_xlat1.xyz = vec3(u_xlat16_1) * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
float u_xlat4;
float u_xlat9;
float u_xlat10;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat9 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat9)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat3.x * u_xlat3.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_3 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat3.xyz = vec3(u_xlat16_3) * u_xlat2.xyz;
    u_xlat10 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat3.xyz = u_xlat1.xyz * vec3(u_xlat10) + u_xlat3.xyz;
    u_xlat1.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LightPositionRange.w;
    u_xlat1.x = u_xlat1.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb1 = u_xlat10_2.x<u_xlat1.x;
    u_xlat1.x = (u_xlatb1) ? _LightShadowData.x : 1.0;
    u_xlat4 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTexture0, vec2(u_xlat4));
    u_xlat1.x = u_xlat1.x * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _DetailAlbedoMap_ST;
uniform 	float _UVSec;
uniform 	mat4x4 _LightMatrix0;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec4 in_TANGENT0;
out vec4 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec3 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    u_xlatb0 = _UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? in_TEXCOORD0.xy : in_TEXCOORD1.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _DetailAlbedoMap_ST.xy + _DetailAlbedoMap_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat0.x;
    u_xlat1.xyz = in_TANGENT0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat2.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat2.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat3.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat3.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat3.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat3.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat3.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat3.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD3.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD3.w = u_xlat0.y;
    vs_TEXCOORD4.w = u_xlat0.z;
    u_xlat0 = in_POSITION0.yyyy * _Object2World[1];
    u_xlat0 = _Object2World[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = _Object2World[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = _Object2World[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * _LightMatrix0[1].xyz;
    u_xlat1.xyz = _LightMatrix0[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = _LightMatrix0[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ColorSpaceDielectricSpec;
uniform 	vec4 _LightColor0;
uniform 	vec4 _Color;
uniform 	float _Metallic;
uniform 	float _Glossiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D unity_NHxRoughness;
in  vec4 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
in  vec3 vs_TEXCOORD5;
in  vec3 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat5;
mediump float u_xlat16_5;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
    u_xlat12 = dot((-vs_TEXCOORD1.xyz), u_xlat0.xyz);
    u_xlat12 = u_xlat12 + u_xlat12;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat12)) + (-vs_TEXCOORD1.xyz);
    u_xlat2.x = vs_TEXCOORD2.w;
    u_xlat2.y = vs_TEXCOORD3.w;
    u_xlat2.z = vs_TEXCOORD4.w;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat4.x * u_xlat4.x;
    u_xlat1.y = (-_Glossiness) + 1.0;
    u_xlat10_1 = texture(unity_NHxRoughness, u_xlat1.xy);
    u_xlat16_4 = u_xlat10_1.w * 16.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = _Color.xyz * u_xlat10_1.xyz + (-unity_ColorSpaceDielectricSpec.xyz);
    u_xlat1.xyz = u_xlat10_1.xyz * _Color.xyz;
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + unity_ColorSpaceDielectricSpec.xyz;
    u_xlat4.xyz = vec3(u_xlat16_4) * u_xlat2.xyz;
    u_xlat13 = (-_Metallic) * unity_ColorSpaceDielectricSpec.w + unity_ColorSpaceDielectricSpec.w;
    u_xlat4.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat4.xyz;
    u_xlat1.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _LightPositionRange.w;
    u_xlat1.x = u_xlat1.x * 0.970000029;
    u_xlat10_2 = texture(_ShadowMapTexture, vs_TEXCOORD6.xyz);
    u_xlatb1 = u_xlat10_2.x<u_xlat1.x;
    u_xlat1.x = (u_xlatb1) ? _LightShadowData.x : 1.0;
    u_xlat5 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat5));
    u_xlat10_3 = texture(_LightTexture0, vs_TEXCOORD5.xyz);
    u_xlat16_5 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat1.x = u_xlat1.x * u_xlat16_5;
    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_OFF" }
""
}
SubProgram "d3d9 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_NATIVE" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" "SHADOWS_CUBE" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
""
}
}
 }
 Pass {
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  GpuProgramID 488501
Program "vp" {
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	mat4x4 unity_MatrixVP;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.x = in_NORMAL0.x * _World2Object[0].x;
    u_xlat0.y = in_NORMAL0.x * _World2Object[1].x;
    u_xlat0.z = in_NORMAL0.x * _World2Object[2].x;
    u_xlat1.x = in_NORMAL0.y * _World2Object[0].y;
    u_xlat1.y = in_NORMAL0.y * _World2Object[1].y;
    u_xlat1.z = in_NORMAL0.y * _World2Object[2].y;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.x = in_NORMAL0.z * _World2Object[0].z;
    u_xlat1.y = in_NORMAL0.z * _World2Object[1].z;
    u_xlat1.z = in_NORMAL0.z * _World2Object[2].z;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + _Object2World[3].xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + unity_MatrixVP[3];
    u_xlat1 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
    u_xlatb2 = unity_LightShadowBias.z!=0.0;
    u_xlat0 = (bool(u_xlatb2)) ? u_xlat0 : u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
in  vec4 in_POSITION0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0 = sqrt(u_xlat0);
    u_xlat0 = u_xlat0 + unity_LightShadowBias.x;
    SV_Target0 = vec4(u_xlat0) * _LightPositionRange.wwww;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_DEPTH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "d3d9 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SHADOWS_CUBE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SHADOWS_CUBE" }
""
}
}
 }
}
Fallback "VertexLit"
}