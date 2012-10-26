//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
//
//   fxc /T cs_4_0 /Fo TessellatorCS40_TessellateVerticesCS.o /Fc
//    TessellatorCS40_TessellateVerticesCS.asm
//    TessellatorCS40_TessellateVerticesCS.hlsl /E CSTessellationVertices
//
//
// Buffer Definitions: 
//
// cbuffer cbCS
// {
//
//   uint4 g_param;                     // Offset:    0 Size:    16
//
// }
//
// Resource bind info for InputTriIDIndexID
// {
//
//   uint2 $Element;                    // Offset:    0 Size:     8
//
// }
//
// Resource bind info for InputEdgeFactor
// {
//
//   float4 $Element;                   // Offset:    0 Size:    16
//
// }
//
// Resource bind info for TessedVerticesOut
// {
//
//   struct
//   {
//       
//       uint BaseTriID;                // Offset:    0
//       float2 bc;                     // Offset:    4
//
//   } $Element;                        // Offset:    0 Size:    12
//
// }
//
//
// Resource Bindings:
//
// Name                                 Type  Format         Dim Slot Elements
// ------------------------------ ---------- ------- ----------- ---- --------
// InputTriIDIndexID                 texture  struct         r/o    0        1
// InputEdgeFactor                   texture  struct         r/o    1        1
// TessedVerticesOut                     UAV  struct         r/w    0        1
// cbCS                              cbuffer      NA          NA    1        1
//
//
//
// Input signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// no Input
//
// Output signature:
//
// Name                 Index   Mask Register SysValue Format   Used
// -------------------- ----- ------ -------- -------- ------ ------
// no Output
cs_4_0
dcl_globalFlags refactoringAllowed
dcl_immediateConstantBuffer { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} }
dcl_constantbuffer cb1[1], immediateIndexed
dcl_resource_structured t0, 8 
dcl_resource_structured t1, 16 
dcl_uav_structured u0, 12
dcl_input vThreadID.x
dcl_temps 14
dcl_thread_group 128, 1, 1
ult r0.x, vThreadID.x, cb1[0].x
if_nz r0.x
  ld_structured r0.xz, vThreadID.x, l(0), t0.yxxx
  ld_structured r1.xyzw, r0.z, l(0), t1.xyzw
  ge r2.xyz, l(0.000000, 0.000000, 0.000000, 0.000000), r1.xyzx
  or r0.w, r2.y, r2.x
  or r0.w, r2.z, r0.w
  if_z r0.w
    max r1.xyzw, r1.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000)
    min r1.xyzw, r1.xyzw, l(64.000000, 64.000000, 64.000000, 64.000000)
    and r2.xyzw, r1.xyzw, l(0x007fffff, 0x007fffff, 0x007fffff, 0x007fffff)
    and r3.xyzw, r1.xyzw, l(0x7f800000, 0x7f800000, 0x7f800000, 0x7f800000)
    iadd r3.xyzw, r3.xyzw, l(0x00800000, 0x00800000, 0x00800000, 0x00800000)
    movc r1.xyzw, r2.xyzw, r3.xyzw, r1.xyzw
    ftou r2.xyzw, r1.xyzw
    and r2.xyzw, r2.xyzw, l(1, 1, 1, 1)
    ine r0.w, r2.w, l(0)
    ieq r0.w, r0.w, l(0)
    movc r3.xyz, r2.xyzx, l(1,1,1,0), l(0,0,0,0)
    eq r4.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r1.wxyz
    or r0.w, r0.w, r4.x
    movc r3.w, r0.w, l(0), l(1)
    and r2.w, r4.z, r4.y
    and r2.w, r4.w, r2.w
    and r2.w, r4.x, r2.w
    if_z r2.w
      mul r4.xyzw, r1.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000)
      ieq r5.xyzw, l(1, 1, 1, 1), r3.xyzw
      and r6.xyzw, r5.xyzw, l(1, 1, 1, 1)
      eq r7.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r1.xyzw
      and r7.xyzw, r7.xyzw, l(1, 1, 1, 1)
      or r6.xyzw, r6.xyzw, r7.xyzw
      itof r6.xyzw, r6.xyzw
      mad r6.xyzw, r6.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), r4.xyzw
      round_ni r7.xyzw, r6.xyzw
      round_pi r8.xyzw, r6.xyzw
      ftoi r9.xyzw, r8.xyzw
      eq r10.xyzw, r8.xyzw, r7.xyzw
      if_nz r10.x
        iadd r11.x, r9.x, l(1)
      else 
        if_nz r2.x
          eq r2.x, r7.x, l(1.000000)
          if_nz r2.x
            mov r11.x, l(0)
          else 
            ftoi r2.x, r7.x
            iadd r2.x, r2.x, l(-1)
            uge r12.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.xxxx
            movc r12.yz, r12.yyzy, l(0,128,0.000000,0), l(0,0x00008000,-0.000000,0)
            movc r9.x, r12.x, r12.y, r12.z
            mov r12.y, l(0)
            mov r12.zw, l(0,0,0,0)
            mov r10.x, r9.x
            mov r11.w, l(0)
            loop 
              ige r13.x, r12.w, l(8)
              mov r11.w, l(0)
              breakc_nz r13.x
              and r13.x, r2.x, r10.x
              ine r13.y, r13.x, l(0)
              if_nz r13.x
                not r13.x, r10.x
                and r12.z, r2.x, r13.x
                mov r11.w, l(-1)
                break 
              endif 
              iadd r12.x, r12.w, l(1)
              ishr r10.x, r10.x, l(1)
              mov r12.zw, r12.yyyx
              mov r11.w, r13.y
            endloop 
            and r2.x, r12.z, r11.w
            ishl r2.x, r2.x, l(1)
            iadd r11.x, r2.x, l(1)
          endif 
        else 
          ftoi r2.x, r7.x
          uge r12.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.xxxx
          movc r12.yz, r12.yyzy, l(0,128,0.000000,0), l(0,0x00008000,-0.000000,0)
          movc r9.x, r12.x, r12.y, r12.z
          mov r12.y, l(0)
          mov r12.zw, l(0,0,0,0)
          mov r10.x, r9.x
          mov r11.w, l(0)
          loop 
            ige r13.x, r12.w, l(8)
            mov r11.w, l(0)
            breakc_nz r13.x
            and r13.x, r2.x, r10.x
            ine r13.y, r13.x, l(0)
            if_nz r13.x
              not r13.x, r10.x
              and r12.z, r2.x, r13.x
              mov r11.w, l(-1)
              break 
            endif 
            iadd r12.x, r12.w, l(1)
            ishr r10.x, r10.x, l(1)
            mov r12.zw, r12.yyyx
            mov r11.w, r13.y
          endloop 
          and r2.x, r12.z, r11.w
          ishl r2.x, r2.x, l(1)
          iadd r11.x, r2.x, l(1)
        endif 
      endif 
      if_nz r10.y
        iadd r11.y, r9.y, l(1)
      else 
        if_nz r2.y
          eq r2.x, r7.y, l(1.000000)
          if_nz r2.x
            mov r11.y, l(0)
          else 
            ftoi r2.x, r7.y
            iadd r2.x, r2.x, l(-1)
            uge r12.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.xxxx
            movc r9.xy, r12.yzyy, l(128,0.000000,0,0), l(0x00008000,-0.000000,0,0)
            movc r2.y, r12.x, r9.x, r9.y
            mov r9.y, l(0)
            mov r10.xy, l(0,0,0,0)
            mov r11.w, r2.y
            mov r12.x, l(0)
            loop 
              ige r12.y, r10.y, l(8)
              mov r12.x, l(0)
              breakc_nz r12.y
              and r12.y, r2.x, r11.w
              ine r12.z, r12.y, l(0)
              if_nz r12.y
                not r12.y, r11.w
                and r10.x, r2.x, r12.y
                mov r12.x, l(-1)
                break 
              endif 
              iadd r9.x, r10.y, l(1)
              ishr r11.w, r11.w, l(1)
              mov r10.xy, r9.yxyy
              mov r12.x, r12.z
            endloop 
            and r2.x, r10.x, r12.x
            ishl r2.x, r2.x, l(1)
            iadd r11.y, r2.x, l(1)
          endif 
        else 
          ftoi r2.x, r7.y
          uge r12.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.xxxx
          movc r9.xy, r12.yzyy, l(128,0.000000,0,0), l(0x00008000,-0.000000,0,0)
          movc r2.y, r12.x, r9.x, r9.y
          mov r9.y, l(0)
          mov r10.xy, l(0,0,0,0)
          mov r11.w, r2.y
          mov r12.x, l(0)
          loop 
            ige r12.y, r10.y, l(8)
            mov r12.x, l(0)
            breakc_nz r12.y
            and r12.y, r2.x, r11.w
            ine r12.z, r12.y, l(0)
            if_nz r12.y
              not r12.y, r11.w
              and r10.x, r2.x, r12.y
              mov r12.x, l(-1)
              break 
            endif 
            iadd r9.x, r10.y, l(1)
            ishr r11.w, r11.w, l(1)
            mov r10.xy, r9.yxyy
            mov r12.x, r12.z
          endloop 
          and r2.x, r10.x, r12.x
          ishl r2.x, r2.x, l(1)
          iadd r11.y, r2.x, l(1)
        endif 
      endif 
      if_nz r10.z
        iadd r11.z, r9.z, l(1)
      else 
        if_nz r2.z
          eq r2.x, r7.z, l(1.000000)
          if_nz r2.x
            mov r11.z, l(0)
          else 
            ftoi r2.x, r7.z
            iadd r2.x, r2.x, l(-1)
            uge r9.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.xxxx
            movc r2.yz, r9.yyzy, l(0,128,0.000000,0), l(0,0x00008000,-0.000000,0)
            movc r2.y, r9.x, r2.y, r2.z
            mov r9.y, l(0)
            mov r10.xy, l(0,0,0,0)
            mov r2.z, r2.y
            mov r9.z, l(0)
            loop 
              ige r10.z, r10.y, l(8)
              mov r9.z, l(0)
              breakc_nz r10.z
              and r10.z, r2.z, r2.x
              ine r11.w, r10.z, l(0)
              if_nz r10.z
                not r10.z, r2.z
                and r10.x, r2.x, r10.z
                mov r9.z, l(-1)
                break 
              endif 
              iadd r9.x, r10.y, l(1)
              ishr r2.z, r2.z, l(1)
              mov r10.xy, r9.yxyy
              mov r9.z, r11.w
            endloop 
            and r2.x, r10.x, r9.z
            ishl r2.x, r2.x, l(1)
            iadd r11.z, r2.x, l(1)
          endif 
        else 
          ftoi r2.x, r7.z
          uge r9.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.xxxx
          movc r2.yz, r9.yyzy, l(0,128,0.000000,0), l(0,0x00008000,-0.000000,0)
          movc r2.y, r9.x, r2.y, r2.z
          mov r9.y, l(0)
          mov r10.xy, l(0,0,0,0)
          mov r2.z, r2.y
          mov r9.z, l(0)
          loop 
            ige r10.z, r10.y, l(8)
            mov r9.z, l(0)
            breakc_nz r10.z
            and r10.z, r2.z, r2.x
            ine r11.w, r10.z, l(0)
            if_nz r10.z
              not r10.z, r2.z
              and r10.x, r2.x, r10.z
              mov r9.z, l(-1)
              break 
            endif 
            iadd r9.x, r10.y, l(1)
            ishr r2.z, r2.z, l(1)
            mov r10.xy, r9.yxyy
            mov r9.z, r11.w
          endloop 
          and r2.x, r10.x, r9.z
          ishl r2.x, r2.x, l(1)
          iadd r11.z, r2.x, l(1)
        endif 
      endif 
      if_nz r10.w
        iadd r2.x, r9.w, l(1)
      else 
        if_z r0.w
          eq r2.y, r7.w, l(1.000000)
          if_nz r2.y
            mov r2.x, l(0)
          else 
            ftoi r2.y, r7.w
            iadd r2.y, r2.y, l(-1)
            uge r9.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.yyyy
            movc r9.yz, r9.yyzy, l(0,128,0.000000,0), l(0,0x00008000,-0.000000,0)
            movc r2.z, r9.x, r9.y, r9.z
            mov r9.y, l(0)
            mov r9.zw, l(0,0,0,0)
            mov r10.x, r2.z
            mov r10.y, l(0)
            loop 
              ige r10.z, r9.w, l(8)
              mov r10.y, l(0)
              breakc_nz r10.z
              and r10.z, r2.y, r10.x
              ine r10.w, r10.z, l(0)
              if_nz r10.z
                not r10.z, r10.x
                and r9.z, r2.y, r10.z
                mov r10.y, l(-1)
                break 
              endif 
              iadd r9.x, r9.w, l(1)
              ishr r10.x, r10.x, l(1)
              mov r9.zw, r9.yyyx
              mov r10.xy, r10.xwxx
            endloop 
            and r2.y, r9.z, r10.y
            ishl r2.y, r2.y, l(1)
            iadd r2.x, r2.y, l(1)
          endif 
        else 
          ftoi r2.y, r7.w
          uge r9.xyz, l(0x0000ffff, 255, 0x00ffffff, 0), r2.yyyy
          movc r9.yz, r9.yyzy, l(0,128,0.000000,0), l(0,0x00008000,-0.000000,0)
          movc r2.z, r9.x, r9.y, r9.z
          mov r9.y, l(0)
          mov r9.zw, l(0,0,0,0)
          mov r10.x, r2.z
          mov r10.y, l(0)
          loop 
            ige r10.z, r9.w, l(8)
            mov r10.y, l(0)
            breakc_nz r10.z
            and r10.z, r2.y, r10.x
            ine r10.w, r10.z, l(0)
            if_nz r10.z
              not r10.z, r10.x
              and r9.z, r2.y, r10.z
              mov r10.y, l(-1)
              break 
            endif 
            iadd r9.x, r9.w, l(1)
            ishr r10.x, r10.x, l(1)
            mov r9.zw, r9.yyyx
            mov r10.xy, r10.xwxx
          endloop 
          and r2.y, r9.z, r10.y
          ishl r2.y, r2.y, l(1)
          iadd r2.x, r2.y, l(1)
        endif 
      endif 
      add r7.xyzw, r7.xyzw, r7.xyzw
      ftoi r7.xyzw, r7.xyzw
      add r8.xyzw, r8.xyzw, r8.xyzw
      ftoi r8.xyzw, r8.xyzw
      iadd r7.xyzw, r7.xyzw, r5.xyzw
      iadd r8.xyzw, r8.xyzw, r5.xyzw
      itof r7.xyzw, r7.xyzw
      div r7.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r7.xyzw
      itof r8.xyzw, r8.xyzw
      div r8.xyzw, l(1.000000, 1.000000, 1.000000, 1.000000), r8.xwyz
      mad r1.xyzw, r1.xyzw, l(0.500000, 0.500000, 0.500000, 0.500000), l(0.500000, 0.500000, 0.500000, 0.500000)
      round_pi r1.xyzw, r1.xyzw
      ftou r1.xyzw, r1.xyzw
      ishl r1.xyzw, r1.xyzw, l(1)
      round_pi r4.xyzw, r4.xyzw
      ftou r4.xyzw, r4.xyzw
      ishl r4.xyzw, r4.xyzw, l(1)
      iadd r4.xyzw, r4.xyzw, l(1, 1, 1, 1)
      movc r1.xyzw, r5.xyzw, r1.xyzw, r4.xyzw
      iadd r2.y, r1.x, r1.y
      iadd r2.y, r2.y, r1.z
      iadd r2.y, r2.y, l(-3)
      movc r2.z, r0.w, l(3), l(4)
      umax r1.w, r1.w, r2.z
      ushr r2.z, r1.w, l(1)
      iadd r4.x, r2.z, l(-1)
      imul null, r4.y, r4.x, r2.z
      imad r2.z, r4.x, r2.z, -r4.x
      imul null, r2.z, l(3), r2.z
      imad r4.x, l(3), r4.y, l(1)
      movc r0.w, r0.w, r4.x, r2.z
      iadd r0.w, r2.y, r0.w
      mov r4.xyz, r8.xzwx
      mov r8.x, r7.w
    else 
      and r0.w, r2.w, l(3)
      mov r7.xyz, l(0,0,0,0)
      mov r4.xyz, l(0,0,0,0)
      mov r11.xyz, l(0,0,0,0)
      mov r8.xy, l(0,0,0,0)
      mov r6.xyzw, l(0,0,0,0)
      mov r2.xy, l(0,0,0,0)
      mov r1.xyzw, l(0,0,0,0)
    endif 
  else 
    mov r3.xyzw, l(0,0,0,0)
    mov r7.xyz, l(0,0,0,0)
    mov r4.xyz, l(0,0,0,0)
    mov r11.xyz, l(0,0,0,0)
    mov r8.xy, l(0,0,0,0)
    mov r6.xyzw, l(0,0,0,0)
    mov r2.xy, l(0,0,0,0)
    mov r1.xyzw, l(0,0,0,0)
    mov r0.w, l(0)
  endif 
  ieq r0.w, l(3), r0.w
  if_nz r0.w
    ieq r0.w, l(1), r0.x
    movc r2.zw, r0.wwww, l(0,0,0,0), l(0,0,1.000000,0)
    movc r0.xy, r0.xxxx, r2.zwzz, l(0,1.000000,0,0)
  else 
    ult r0.w, r0.x, r2.y
    if_nz r0.w
      iadd r2.zw, r1.xxxy, l(0, 0, -1, -1)
      ult r0.w, r0.x, r2.z
      iadd r2.z, -r1.x, r0.x
      iadd r5.x, l(1), r2.z
      ult r2.z, r5.x, r2.w
      iadd r2.w, -r1.y, r5.x
      iadd r5.z, l(1), r2.w
      mov r5.yw, l(0,1,0,2)
      movc r2.zw, r2.zzzz, r5.xxxy, r5.zzzw
      mov r0.y, l(0)
      movc r2.zw, r0.wwww, r0.xxxy, r2.zzzw
      ult r5.xy, r2.wwww, l(1, 2, 0, 0)
      iadd r4.w, r2.w, l(-2)
      movc r5.z, r5.x, l(0), r4.w
      ieq r5.w, r5.y, l(0)
      and r9.xyz, r1.xyzx, r5.xzwx
      mov r9.w, l(0)
      or r1.xy, r9.ywyy, r9.xzxx
      or r1.x, r1.y, r1.x
      iadd r1.x, r1.x, l(-1)
      and r1.y, r2.w, l(1)
      iadd r1.x, r1.x, -r2.z
      movc r1.x, r1.y, r2.z, r1.x
      and r9.xyz, r3.xyzx, r5.xzwx
      mov r9.w, l(0)
      or r1.yz, r9.yywy, r9.xxzx
      or r1.y, r1.z, r1.y
      dp3 r1.z, r6.xyzx, icb[r2.w + 0].xyzx
      round_pi r2.z, r1.z
      ftoi r2.z, r2.z
      ige r3.x, r1.x, r2.z
      ishl r3.y, r2.z, l(1)
      iadd r3.y, r3.y, -r1.x
      ieq r1.y, l(1), r1.y
      iadd r1.y, r3.y, r1.y
      movc r1.x, r3.x, r1.y, r1.x
      ieq r1.y, r1.x, r2.z
      if_nz r1.y
        mov r6.x, l(0.500000)
      else 
        and r5.xyz, r5.xzwx, r11.xyzx
        mov r5.w, l(0)
        or r3.yz, r5.yywy, r5.xxzx
        or r1.y, r3.z, r3.y
        ilt r1.y, r1.y, r1.x
        iadd r1.y, r1.x, r1.y
        utof r1.y, r1.y
        dp3 r2.z, r7.xyzx, icb[r2.w + 0].xyzx
        mul r1.y, r1.y, r2.z
        utof r1.x, r1.x
        dp3 r2.z, r4.xyzx, icb[r2.w + 0].xyzx
        frc r1.z, r1.z
        mad r1.x, r1.x, r2.z, -r1.y
        mad r1.x, r1.z, r1.x, r1.y
        add r1.y, -r1.x, l(1.000000)
        movc r6.x, r3.x, r1.y, r1.x
      endif 
      ieq r1.x, l(1), r2.w
      add r1.y, -r6.x, l(1.000000)
      movc r6.z, r1.x, l(0), r1.y
      mov r6.y, l(0)
      movc r0.xy, r0.wwww, r6.yxyy, r6.xzxx
    else 
      iadd r0.w, r0.x, -r2.y
      imad r1.x, l(3), r1.w, l(-6)
      utof r1.y, r1.x
      imul null, r1.z, l(-12), r0.w
      imad r1.x, r1.x, r1.x, r1.z
      utof r1.x, r1.x
      sqrt r1.x, r1.x
      add r1.x, -r1.x, r1.y
      add r1.x, r1.x, l(0.001000)
      mad r1.x, r1.x, l(0.166667), l(1.000000)
      ftou r1.x, r1.x
      iadd r1.y, r1.w, -r1.x
      iadd r1.yz, r1.yyxy, l(0, -1, -1, 0)
      imul null, r1.z, r1.z, r1.y
      imad r0.w, r1.z, l(-3), r0.w
      iadd r1.z, r1.y, -r1.x
      imul null, r1.w, l(3), r1.z
      ult r1.w, r0.w, r1.w
      if_nz r1.w
        udiv r1.w, null, r0.w, r1.z
        imad r0.w, -r1.w, r1.z, r0.w
        iadd r0.w, r0.w, r1.x
        round_pi r1.z, r6.w
        ftoi r1.z, r1.z
        ige r2.y, r1.x, r1.z
        ishl r2.z, r1.z, l(1)
        iadd r2.w, r2.z, -r1.x
        ieq r3.x, l(1), r3.w
        iadd r2.w, r2.w, r3.x
        movc r2.w, r2.y, r2.w, r1.x
        ieq r3.y, r2.w, r1.z
        if_nz r3.y
          mov r3.y, l(0.500000)
        else 
          ilt r3.z, r2.x, r2.w
          iadd r3.z, r2.w, r3.z
          utof r3.z, r3.z
          mul r3.z, r8.x, r3.z
          utof r2.w, r2.w
          frc r3.w, r6.w
          mad r2.w, r2.w, r8.y, -r3.z
          mad r2.w, r3.w, r2.w, r3.z
          add r3.z, -r2.w, l(1.000000)
          movc r3.y, r2.y, r3.z, r2.w
        endif 
        and r2.y, r1.w, l(1)
        iadd r1.x, -r0.w, r1.x
        iadd r1.x, r1.y, r1.x
        movc r0.w, r2.y, r0.w, r1.x
        ige r1.x, r0.w, r1.z
        iadd r1.y, r2.z, -r0.w
        iadd r1.y, r1.y, r3.x
        movc r0.w, r1.x, r1.y, r0.w
        ieq r1.y, r0.w, r1.z
        if_nz r1.y
          mov r1.y, l(0.500000)
        else 
          ilt r1.z, r2.x, r0.w
          iadd r1.z, r0.w, r1.z
          utof r1.z, r1.z
          mul r1.z, r8.x, r1.z
          utof r0.w, r0.w
          frc r2.x, r6.w
          mad r0.w, r0.w, r8.y, -r1.z
          mad r0.w, r2.x, r0.w, r1.z
          add r1.z, -r0.w, l(1.000000)
          movc r1.y, r1.x, r1.z, r0.w
        endif 
        mul r2.y, r3.y, l(0.666667)
        mad r2.x, -r3.y, l(0.333333), r1.y
        ieq r0.w, l(1), r1.w
        mad r1.x, r3.y, l(0.666667), r2.x
        add r2.w, -r1.x, l(1.000000)
        movc r1.xy, r0.wwww, r2.xyxx, r2.xwxx
        movc r0.xy, r1.wwww, r1.xyxx, r2.yxyy
      else 
        mov r0.xy, l(0.333333,0.333333,0,0)
      endif 
    endif 
  endif 
  store_structured u0.xyz, vThreadID.x, l(0), r0.zxyz
endif 
ret 
// Approximately 523 instruction slots used
