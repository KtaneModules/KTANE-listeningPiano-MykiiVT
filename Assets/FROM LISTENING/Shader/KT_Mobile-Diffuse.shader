//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "KT/Mobile/Diffuse" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardBase" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  GpuProgramID 31058
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
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
    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat0) + u_xlat1.xyz;
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat2.xyz;
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
    vs_TEXCOORD3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_1.xxx * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat0) + u_xlat1.xyz;
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat19 = u_xlat0.y * u_xlat0.y;
    u_xlat19 = u_xlat0.x * u_xlat0.x + (-u_xlat19);
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat3.xyz;
    u_xlat0.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat0);
    u_xlat3.y = dot(unity_SHAg, u_xlat0);
    u_xlat3.z = dot(unity_SHAb, u_xlat0);
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
    u_xlat3 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat0.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat1 * u_xlat0.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat3;
    u_xlat3 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat1 * u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat0) + u_xlat1.xyz;
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat2.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat23 = u_xlat1.y * u_xlat1.y;
    u_xlat23 = u_xlat1.x * u_xlat1.x + (-u_xlat23);
    u_xlat3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat23) + u_xlat4.xyz;
    u_xlat1.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat1);
    u_xlat4.y = dot(unity_SHAg, u_xlat1);
    u_xlat4.z = dot(unity_SHAb, u_xlat1);
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
    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat1.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat6 = (-u_xlat2.xxxx) + unity_4LightPosX0;
    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat6 * u_xlat1.xxxx + u_xlat5;
    u_xlat1 = u_xlat2 * u_xlat1.zzzz + u_xlat5;
    u_xlat4 = u_xlat6 * u_xlat6 + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
    u_xlat4 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat4;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat2 * u_xlat1;
    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_1 = texture(_ShadowMapTexture, u_xlat2.xy);
    u_xlat2.xyz = u_xlat10_1.xxx * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vs_TEXCOORD3.xyz;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat0) + u_xlat1.xyz;
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
  Name "FORWARD"
  Tags { "LIGHTMODE"="ForwardAdd" "RenderType"="Opaque" }
  ZWrite Off
  Blend One One
  GpuProgramID 68801
Program "vp" {
SubProgram "d3d9 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	mat4x4 _LightMatrix0;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.yyy * _LightMatrix0[1].xyz;
    u_xlat0.xyz = _LightMatrix0[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + _LightMatrix0[3].xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_0 = texture(_LightTexture0, u_xlat0.xx);
    u_xlat0.xyz = u_xlat10_0.www * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _LightColor0.xyz;
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	mat4x4 _LightMatrix0;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0 = vs_TEXCOORD2.yyyy * _LightMatrix0[1];
    u_xlat0 = _LightMatrix0[0] * vs_TEXCOORD2.xxxx + u_xlat0;
    u_xlat0 = _LightMatrix0[2] * vs_TEXCOORD2.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + _LightMatrix0[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlatb9 = 0.0<u_xlat0.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat0.xx);
    u_xlat0.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat10_1.w * u_xlat0.x;
    u_xlat0.x = u_xlat10_2.w * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 0.0);
    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	mat4x4 _LightMatrix0;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.yyy * _LightMatrix0[1].xyz;
    u_xlat0.xyz = _LightMatrix0[0].xyz * vs_TEXCOORD2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _LightMatrix0[2].xyz * vs_TEXCOORD2.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + _LightMatrix0[3].xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat0.xyz);
    u_xlat10_0 = texture(_LightTextureB0, vec2(u_xlat6));
    u_xlat16_0 = u_xlat10_1.w * u_xlat10_0.w;
    u_xlat0.xyz = vec3(u_xlat16_0) * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightColor0;
uniform 	mat4x4 _LightMatrix0;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.yy * _LightMatrix0[1].xy;
    u_xlat0.xy = _LightMatrix0[0].xy * vs_TEXCOORD2.xx + u_xlat0.xy;
    u_xlat0.xy = _LightMatrix0[2].xy * vs_TEXCOORD2.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + _LightMatrix0[3].xy;
    u_xlat10_0 = texture(_LightTexture0, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_0.www * _LightColor0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat6 = dot(vs_TEXCOORD1.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat6 = max(u_xlat6, 0.0);
    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d9 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassBase" "RenderType"="Opaque" }
  GpuProgramID 152376
Program "vp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 _Object2World;
uniform 	mat4x4 _World2Object;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec3 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
    vs_TEXCOORD0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat0.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target0.w = 0.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
}
 }
 Pass {
  Name "PREPASS"
  Tags { "LIGHTMODE"="PrePassFinal" "RenderType"="Opaque" }
  ZWrite Off
  GpuProgramID 234979
Program "vp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
    vs_TEXCOORD4.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
uniform  sampler2D _LightBuffer;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0 = texture(_LightBuffer, u_xlat0.xy);
    u_xlat16_0.xyz = log2(u_xlat10_0.xyz);
    u_xlat0.xyz = (-u_xlat16_0.xyz) + vs_TEXCOORD4.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
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
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD1.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
    vs_TEXCOORD4.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
uniform  sampler2D _LightBuffer;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat10_0 = texture(_LightBuffer, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz + vs_TEXCOORD4.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
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
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
""
}
}
 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="Deferred" "RenderType"="Opaque" }
  GpuProgramID 323896
Program "vp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
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
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
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
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
vec4 u_xlat0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * _Object2World[1].xyz;
    u_xlat1.xyz = _Object2World[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = _Object2World[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = _Object2World[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
lowp vec4 u_xlat10_0;
void main()
{
    SV_Target0.w = 1.0;
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target3.xyz = u_xlat10_0.xyz * vs_TEXCOORD4.xyz;
    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}
#endif
"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "HDR_LIGHT_PREPASS_OFF" }
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
SubProgram "d3d11_9x " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "DYNAMICLIGHTMAP_OFF" "UNITY_HDR_ON" }
""
}
}
 }
}
Fallback "Mobile/VertexLit"
}