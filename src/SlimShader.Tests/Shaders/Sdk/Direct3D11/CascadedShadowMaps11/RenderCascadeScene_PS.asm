//
// Generated by Microsoft (R) HLSL Shader Compiler 9.30.9200.20714
//
//
///
// Buffer Definitions: 
//
// cbuffer cbAllShadowData
// {
//
//   float4x4 m_mWorldViewProjection;   // Offset:    0 Size:    64 [unused]
//   float4x4 m_mWorld;                 // Offset:   64 Size:    64 [unused]
//   float4x4 m_mWorldView;             // Offset:  128 Size:    64 [unused]
//   float4x4 m_mShadow;                // Offset:  192 Size:    64 [unused]
//   float4 m_vCascadeOffset[8];        // Offset:  256 Size:   128
//   float4 m_vCascadeScale[8];         // Offset:  384 Size:   128
//   int m_nCascadeLevels;              // Offset:  512 Size:     4 [unused]
//   int m_iVisualizeCascades;          // Offset:  516 Size:     4
//   int m_iPCFBlurForLoopStart;        // Offset:  520 Size:     4
//   int m_iPCFBlurForLoopEnd;          // Offset:  524 Size:     4
//   float m_fMinBorderPadding;         // Offset:  528 Size:     4
//   float m_fMaxBorderPadding;         // Offset:  532 Size:     4
//   float m_fShadowBiasFromGUI;        // Offset:  536 Size:     4
//   float m_fShadowPartitionSize;      // Offset:  540 Size:     4
//   float m_fCascadeBlendArea;         // Offset:  544 Size:     4 [unused]
//   float m_fTexelSize;                // Offset:  548 Size:     4
//   float m_fNativeTexelSizeInX;       // Offset:  552 Size:     4
//   float m_fPaddingForCB3;            // Offset:  556 Size:     4 [unused]
//   float4 m_fCascadeFrustumsEyeSpaceDepthsFloat[2];// Offset:  560 Size:    32 [unused]
//   float4 m_fCascadeFrustumsEyeSpaceDepthsFloat4[8];// Offset:  592 Size:   128 [unused]
//   float3 m_vLightDir;                // Offset:  720 Size:    12
//   float m_fPaddingCB4;               // Offset:  732 Size:     4 [unused]
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// g_samLinear                       sampler      NA          NA    0        1
// g_samShadow                     sampler_c      NA          NA    5        1
// g_txDiffuse                       texture  float4          2d    0        1
// g_txShadow                        texture  float4          2d    5        1
// cbAllShadowData                   cbuffer      NA          NA    0        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// NORMAL                   0   xyz         0     NONE   float   xyz 
// TEXCOORD                 0   xy          1     NONE   float   xy  
// TEXCOORD                 3     z         1     NONE   float       
// TEXCOORD                 1   xyzw        2     NONE   float   xyz 
// SV_POSITION              0   xyzw        3      POS   float       
// TEXCOORD                 2   xyzw        4     NONE   float       
//
//
// Output signature:
//
// Name                 Index   Mask Register SysValue  Format   Used
// -------------------- ----- ------ -------- -------- ------- ------
// SV_TARGET                0   xyzw        0   TARGET   float   xyzw
//
ps_4_0
dcl_immediateConstantBuffer { { 1.500000, 0, 0, 1.000000},
                              { 0, 1.500000, 0, 1.000000},
                              { 0, 0, 5.500000, 1.000000},
                              { 1.500000, 0, 5.500000, 1.000000},
                              { 1.500000, 1.500000, 0, 1.000000},
                              { 1.000000, 1.000000, 1.000000, 1.000000},
                              { 0, 1.000000, 5.500000, 1.000000},
                              { 0.500000, 3.500000, 0.750000, 1.000000} }
dcl_constantbuffer cb0[46], dynamicIndexed
dcl_sampler s0, mode_default
dcl_sampler s5, mode_comparison
dcl_resource_texture2d (float,float,float,float) t0
dcl_resource_texture2d (float,float,float,float) t5
dcl_input_ps linear v0.xyz
dcl_input_ps linear v1.xy
dcl_input_ps linear v2.xyz
dcl_output o0.xyzw
dcl_temps 5
sample r0.xyzw, v1.xyxx, t0.xyzw, s0
iadd r1.x, -cb0[32].z, cb0[32].w
imul null, r1.x, r1.x, r1.x
itof r1.x, r1.x
mov r2.x, l(1)
mov r1.yzw, l(0,0,0,0)
mov r3.xy, l(0,0,0,0)
mov r2.y, l(0)
loop 
  ilt r2.z, r2.y, l(3)
  ieq r2.w, r3.x, l(0)
  and r2.z, r2.w, r2.z
  breakc_z r2.z
  mad r1.yzw, v2.xxyz, cb0[r2.y + 24].xxyz, cb0[r2.y + 16].xxyz
  min r2.z, r1.z, r1.y
  lt r2.z, cb0[33].x, r2.z
  max r2.w, r1.z, r1.y
  lt r2.w, r2.w, cb0[33].y
  and r2.z, r2.w, r2.z
  movc r3.xy, r2.zzzz, r2.xyxx, r3.xyxx
  iadd r2.y, r2.y, l(1)
endloop 
itof r2.x, r3.y
mul r2.x, r2.x, cb0[33].w
mad r1.y, r1.y, cb0[33].w, r2.x
add r1.w, r1.w, -cb0[33].z
mov r2.x, l(0)
mov r2.y, cb0[32].z
loop 
  ige r2.z, r2.y, cb0[32].w
  breakc_nz r2.z
  itof r2.z, r2.y
  mad r4.x, r2.z, cb0[34].z, r1.y
  mov r2.z, r2.x
  mov r2.w, cb0[32].z
  loop 
    ige r3.x, r2.w, cb0[32].w
    breakc_nz r3.x
    itof r3.x, r2.w
    mad r4.y, r3.x, cb0[34].y, r1.z
    sample_c_lz r3.x, r4.xyxx, t5.xxxx, s5, r1.w
    add r2.z, r2.z, r3.x
    iadd r2.w, r2.w, l(1)
  endloop 
  mov r2.x, r2.z
  iadd r2.y, r2.y, l(1)
endloop 
div r1.x, r2.x, r1.x
mov r2.xyz, icb[r3.y + 0].xyzx
mov r2.w, l(1.000000)
movc r2.xyzw, cb0[32].yyyy, r2.xyzw, l(1.000000,1.000000,1.000000,1.000000)
dp3_sat r1.y, l(-1.000000, 1.000000, -1.000000, 0.000000), v0.xyzx
dp3_sat r1.z, l(1.000000, 1.000000, -1.000000, 0.000000), v0.xyzx
mul r1.z, r1.z, l(0.050000)
mad r1.y, r1.y, l(0.050000), r1.z
mov_sat r1.z, -v0.y
mad r1.y, r1.z, l(0.050000), r1.y
dp3_sat r1.z, l(1.000000, 1.000000, 1.000000, 0.000000), v0.xyzx
mad r1.y, r1.z, l(0.050000), r1.y
mul r1.z, r1.y, l(0.500000)
dp3_sat r1.w, cb0[45].xyzx, v0.xyzx
add r1.w, r1.w, r1.y
mad r1.y, -r1.y, l(0.500000), r1.w
mad r1.x, r1.x, r1.y, r1.z
mul r1.xyzw, r2.xyzw, r1.xxxx
mul o0.xyzw, r0.xyzw, r1.xyzw
ret 
// Approximately 67 instruction slots used
