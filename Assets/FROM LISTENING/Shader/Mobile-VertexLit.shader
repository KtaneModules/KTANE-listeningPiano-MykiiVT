//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/VertexLit" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader { 
 LOD 80
 Tags { "RenderType"="Opaque" }
 Pass {
  Tags { "LIGHTMODE"="Vertex" "RenderType"="Opaque" }
  GpuProgramID 121265
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 glstate_matrix_invtrans_modelview0;
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
int u_xlati9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xyz = in_NORMAL0.yyy * glstate_matrix_invtrans_modelview0[1].xyz;
    u_xlat0.xyz = glstate_matrix_invtrans_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = glstate_matrix_invtrans_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat10 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat10 = max(u_xlat10, 0.0);
        u_xlat2.xyz = vec3(u_xlat10) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat2.xyz = min(u_xlat2.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    }
    vs_COLOR0.xyz = u_xlat1.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
    vs_COLOR0.w = 1.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}
#endif
"
}
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 glstate_matrix_modelview0;
uniform 	mat4x4 glstate_matrix_invtrans_modelview0;
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb4;
float u_xlat15;
int u_xlati15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * glstate_matrix_modelview0[1].xyz;
    u_xlat0.xyz = glstate_matrix_modelview0[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = glstate_matrix_modelview0[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + glstate_matrix_modelview0[3].xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * glstate_matrix_invtrans_modelview0[1].xyz;
    u_xlat1.xyz = glstate_matrix_invtrans_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = glstate_matrix_invtrans_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat17 = unity_LightAtten[u_xlati_loop_1].z * u_xlat16 + 1.0;
        u_xlat17 = float(1.0) / u_xlat17;
        u_xlatb18 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb4 = unity_LightAtten[u_xlati_loop_1].w<u_xlat16;
        u_xlatb18 = u_xlatb18 && u_xlatb4;
        u_xlat16 = inversesqrt(u_xlat16);
        u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
        u_xlat16 = u_xlat17 * 0.5;
        u_xlat16 = (u_xlatb18) ? 0.0 : u_xlat16;
        u_xlat17 = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat17 = max(u_xlat17, 0.0);
        u_xlat3.xyz = vec3(u_xlat17) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
        u_xlat3.xyz = min(u_xlat3.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    }
    vs_COLOR0.xyz = u_xlat2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
    vs_COLOR0.w = 1.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat0.xyz;
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
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	mat4x4 glstate_matrix_mvp;
uniform 	mat4x4 glstate_matrix_modelview0;
uniform 	mat4x4 glstate_matrix_invtrans_modelview0;
uniform 	vec4 glstate_lightmodel_ambient;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb4;
float u_xlat15;
int u_xlati15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * glstate_matrix_modelview0[1].xyz;
    u_xlat0.xyz = glstate_matrix_modelview0[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = glstate_matrix_modelview0[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + glstate_matrix_modelview0[3].xyz;
    u_xlat1.xyz = in_NORMAL0.yyy * glstate_matrix_invtrans_modelview0[1].xyz;
    u_xlat1.xyz = glstate_matrix_invtrans_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = glstate_matrix_invtrans_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat17 = unity_LightAtten[u_xlati_loop_1].z * u_xlat16 + 1.0;
        u_xlat17 = float(1.0) / u_xlat17;
        u_xlatb18 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb4 = unity_LightAtten[u_xlati_loop_1].w<u_xlat16;
        u_xlatb18 = u_xlatb18 && u_xlatb4;
        u_xlat17 = (u_xlatb18) ? 0.0 : u_xlat17;
        u_xlat16 = inversesqrt(u_xlat16);
        u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
        u_xlat16 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat16 = max(u_xlat16, 0.0);
        u_xlat16 = u_xlat16 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16 = u_xlat16 * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
        u_xlat16 = u_xlat16 * u_xlat17;
        u_xlat16 = u_xlat16 * 0.5;
        u_xlat17 = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat17 = max(u_xlat17, 0.0);
        u_xlat3.xyz = vec3(u_xlat17) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
        u_xlat3.xyz = min(u_xlat3.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    }
    vs_COLOR0.xyz = u_xlat2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
    vs_COLOR0.w = 1.0;
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
}
 }
 Pass {
  Tags { "LIGHTMODE"="VertexLM" "RenderType"="Opaque" }
  GpuProgramID 194227
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD1;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
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
  Tags { "LIGHTMODE"="VertexLMRGBM" "RenderType"="Opaque" }
  GpuProgramID 231454
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
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in  vec3 in_POSITION0;
in  vec3 in_TEXCOORD1;
in  vec3 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec4 u_xlat0;
void main()
{
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
    return;
}
#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable
uniform  sampler2D _MainTex;
uniform  sampler2D unity_Lightmap;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(unity_Lightmap, vs_TEXCOORD0.xy);
    u_xlat16_0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0);
    SV_Target0.w = 1.0;
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
  Name "SHADOWCASTER"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  Cull Off
  GpuProgramID 49029
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
}