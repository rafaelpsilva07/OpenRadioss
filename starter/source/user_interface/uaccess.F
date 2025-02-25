Copyright>        OpenRadioss
Copyright>        Copyright (C) 1986-2022 Altair Engineering Inc.
Copyright>    
Copyright>        This program is free software: you can redistribute it and/or modify
Copyright>        it under the terms of the GNU Affero General Public License as published by
Copyright>        the Free Software Foundation, either version 3 of the License, or
Copyright>        (at your option) any later version.
Copyright>    
Copyright>        This program is distributed in the hope that it will be useful,
Copyright>        but WITHOUT ANY WARRANTY; without even the implied warranty of
Copyright>        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
Copyright>        GNU Affero General Public License for more details.
Copyright>    
Copyright>        You should have received a copy of the GNU Affero General Public License
Copyright>        along with this program.  If not, see <https://www.gnu.org/licenses/>.
Copyright>    
Copyright>    
Copyright>        Commercial Alternative: Altair Radioss Software 
Copyright>    
Copyright>        As an alternative to this open-source version, Altair also offers Altair Radioss 
Copyright>        software under a commercial license.  Contact Altair to discuss further if the 
Copyright>        commercial version may interest you: https://www.altair.com/radioss/.    
Chd|====================================================================
Chd|  ST_UACCESS_DUM                source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        STARTER0                      source/starter/starter0.F     
Chd|-- calls ---------------
Chd|====================================================================
      SUBROUTINE ST_UACCESS_DUM(IERR)
#include      "implicit_f.inc"
      INTEGER IERR
      IERR=0
      END      
C
Chd|====================================================================
Chd|  SET_U_GEO                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        HM_READ_PROP28                source/properties/xelem/hm_read_prop28.F
Chd|        HM_READ_PROP32                source/properties/spring/hm_read_prop32.F
Chd|        HM_READ_PROP33_CYL_JNT        source/properties/spring/hm_read_prop33_cyl_jnt.F
Chd|        HM_READ_PROP33_FIX_JNT        source/properties/spring/hm_read_prop33_fix_jnt.F
Chd|        HM_READ_PROP33_FREE_JNT       source/properties/spring/hm_read_prop33_free_jnt.F
Chd|        HM_READ_PROP33_OLD_JNT        source/properties/spring/hm_read_prop33_old_jnt.F
Chd|        HM_READ_PROP33_PLAN_JNT       source/properties/spring/hm_read_prop33_plan_jnt.F
Chd|        HM_READ_PROP33_REV_JNT        source/properties/spring/hm_read_prop33_rev_jnt.F
Chd|        HM_READ_PROP33_SPH_JNT        source/properties/spring/hm_read_prop33_sph_jnt.F
Chd|        HM_READ_PROP33_TRANS_JNT      source/properties/spring/hm_read_prop33_trans_jnt.F
Chd|        HM_READ_PROP33_UNIV_JNT       source/properties/spring/hm_read_prop33_univ_jnt.F
Chd|        HM_READ_PROP34                source/properties/sph/hm_read_prop34.F
Chd|        HM_READ_PROP35                source/properties/spring/hm_read_prop35.F
Chd|        HM_READ_PROP36                source/properties/spring/hm_read_prop36.F
Chd|        HM_READ_PROP44                source/properties/spring/hm_read_prop44.F
Chd|        HM_READ_PROP45                source/properties/spring/hm_read_prop45.F
Chd|        HM_READ_PROP46                source/properties/spring/hm_read_prop46.F
Chd|        HM_READ_PROP_USER4            source/properties/user_spring_solid/hm_read_prop_user4.F
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION SET_U_GEO(IVAR,A)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "param_c.inc"
#include      "scr19_c.inc"
#include      "scr17_c.inc"
#include      "units_c.inc"
      INTEGER IVAR
      my_real
     .      A
C
      IF(IVAR.GT.BGEOSIZE)THEN
         CALL ANCMSG(MSGID=374,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               I1=IVAR,
     .               I2=BGEOSIZE)
        SET_U_GEO = BGEOSIZE
        RETURN
      ENDIF
      NUPARAM = MAX(NUPARAM,IVAR)
      BUFGEO0(IVAR) = A
      SET_U_GEO = 0
C
      RETURN
      END
C
Chd|====================================================================
Chd|  SET_U_PNU                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        HM_READ_PROP28                source/properties/xelem/hm_read_prop28.F
Chd|        HM_READ_PROP32                source/properties/spring/hm_read_prop32.F
Chd|        HM_READ_PROP33_CYL_JNT        source/properties/spring/hm_read_prop33_cyl_jnt.F
Chd|        HM_READ_PROP33_FIX_JNT        source/properties/spring/hm_read_prop33_fix_jnt.F
Chd|        HM_READ_PROP33_FREE_JNT       source/properties/spring/hm_read_prop33_free_jnt.F
Chd|        HM_READ_PROP33_OLD_JNT        source/properties/spring/hm_read_prop33_old_jnt.F
Chd|        HM_READ_PROP33_PLAN_JNT       source/properties/spring/hm_read_prop33_plan_jnt.F
Chd|        HM_READ_PROP33_REV_JNT        source/properties/spring/hm_read_prop33_rev_jnt.F
Chd|        HM_READ_PROP33_SPH_JNT        source/properties/spring/hm_read_prop33_sph_jnt.F
Chd|        HM_READ_PROP33_TRANS_JNT      source/properties/spring/hm_read_prop33_trans_jnt.F
Chd|        HM_READ_PROP33_UNIV_JNT       source/properties/spring/hm_read_prop33_univ_jnt.F
Chd|        HM_READ_PROP35                source/properties/spring/hm_read_prop35.F
Chd|        HM_READ_PROP36                source/properties/spring/hm_read_prop36.F
Chd|        HM_READ_PROP44                source/properties/spring/hm_read_prop44.F
Chd|        HM_READ_PROP45                source/properties/spring/hm_read_prop45.F
Chd|        HM_READ_PROP46                source/properties/spring/hm_read_prop46.F
Chd|        HM_READ_PROP_USER4            source/properties/user_spring_solid/hm_read_prop_user4.F
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION SET_U_PNU(IVAR,IP,K)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "param_c.inc"
#include      "scr19_c.inc"
#include      "units_c.inc"
      INTEGER KFUNC,KMAT,KPID,KTAB
      PARAMETER (KFUNC=29)
      PARAMETER (KMAT=31)
      PARAMETER (KPID=33)
      PARAMETER (KTAB=37)
      INTEGER IVAR,IP,K
C
      IF(K.EQ.KPID)THEN
        IF(IVAR.GT.MAXPID)THEN
          CALL ANCMSG(MSGID=375,
     .                MSGTYPE=MSGERROR,
     .                ANMODE=ANINFO,
     .                I2=IVAR,
     .                C2='PID',
     .                I3=MAXPID,
     .                C3='MAXPID')
          SET_U_PNU = NJPID
          RETURN
        ENDIF
        NJPID = MAX(NJPID,IVAR)
        JPID(IVAR) = IP
      ELSEIF(K.EQ.KMAT)THEN
        IF(IVAR.GT.MAXMAT)THEN
          CALL ANCMSG(MSGID=375,
     .                MSGTYPE=MSGERROR,
     .                ANMODE=ANINFO,
     .                I2=IVAR,
     .                C2='MAT',
     .                I3=MAXMAT,
     .                C3='MAXMAT')
          SET_U_PNU = NJMAT
          RETURN
        ENDIF
        NJMAT = MAX(NJMAT,IVAR)
        JMAT(IVAR) = IP
      ELSEIF(K.EQ.KFUNC)THEN
        IF(IVAR.GT.MAXFUNC)THEN
          CALL ANCMSG(MSGID=375,
     .                MSGTYPE=MSGERROR,
     .                ANMODE=ANINFO,
     .                C2='FUNC',
     .                I2=IVAR,
     .                C3='MAXFUNC',
     .                I3=MAXFUNC)
          SET_U_PNU = NJFUNC
          RETURN
        ENDIF
        NJFUNC = MAX(NJFUNC,IVAR)
        JFUNC(IVAR) = IP
      ELSEIF(K.EQ.KTAB)THEN
        IF(IVAR.GT.MAXTAB)THEN
          CALL ANCMSG(MSGID=375,
     .                MSGTYPE=MSGERROR,
     .                ANMODE=ANINFO,
     .                I2=IVAR,
     .                C2='TAB',
     .                I3=MAXTAB,
     .                C3='MAXTAB')
          SET_U_PNU = NJTAB
          RETURN
        ENDIF
        NJTAB = MAX(NJTAB,IVAR)
        JTAB(IVAR) = IP
      ENDIF
      SET_U_PNU = 0
C
      RETURN
      END
C
Chd|====================================================================
Chd|  GET_U_MAT                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        RINI36                        source/properties/spring/hm_read_prop36.F
Chd|        GET_U_MAT                     source/user_interface/uaccess.F
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        GET_U_MAT                     source/user_interface/uaccess.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      my_real FUNCTION
     .      GET_U_MAT(IVAR,IM)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "param_c.inc"
#include      "units_c.inc"
#include      "r4r8_p.inc"
#include      "scr05_c.inc"
      INTEGER IVAR,IM,NVAR,DEPLA,IADBUF
C=======================================================================
C
      DEPLA = 9+(IM-1)*NPROPMI
      CALL GET_VAR_USER_I(11,DEPLA,NVAR)
C
      IF(IVAR.EQ.0)THEN
C       GET_U_MAT = PM(1,IM)
        DEPLA = (IM-1)*NPROPM+1
        IF (IRESP.EQ.1) THEN
           CALL GET_VAR_USER_F_SP(1,DEPLA,GET_U_MAT)
        ELSE
           CALL GET_VAR_USER_F(1,DEPLA,GET_U_MAT)
        ENDIF
      ELSEIF(IVAR.GT.NVAR)THEN
         CALL ANCMSG(MSGID=376,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               I2=IVAR,
     .               C2='MATERIAL',
     .               I3=NVAR,
     .               C3='NUPARAM')
      ELSE
C
        DEPLA = 7+(IM-1)*NPROPMI
        CALL GET_VAR_USER_I(11,DEPLA,IADBUF)
        DEPLA = IADBUF-1+IVAR
        IF (IRESP.EQ.1) THEN
           CALL GET_VAR_USER_F_SP(2,DEPLA,GET_U_MAT)
        ELSE
           CALL GET_VAR_USER_F(2,DEPLA,GET_U_MAT)
        ENDIF
      ENDIF
C
      RETURN
      END
C
Chd|====================================================================
Chd|  GET_U_GEO                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        HM_READ_PART                  source/model/assembling/hm_read_part.F
Chd|        I11STI3                       source/interfaces/inter3d1/i11sti3.F
Chd|        I20STI3E                      source/interfaces/inter3d1/i20sti3.F
Chd|        INIT_SKEW45                   source/elements/joint/rjoint/rini45.F
Chd|        INSPCND                       source/elements/sph/inspcnd.F 
Chd|        RINI32                        source/properties/spring/hm_read_prop32.F
Chd|        RINI33                        source/elements/joint/rjoint/rini33.F
Chd|        RINI33_RB                     source/elements/joint/rjoint/rini33_rb.F
Chd|        RINI35                        source/elements/spring/rini35.F
Chd|        RINI36                        source/properties/spring/hm_read_prop36.F
Chd|        RINI44                        source/elements/spring/rini44.F
Chd|        RINI45                        source/elements/joint/rjoint/rini45.F
Chd|        RINI45_RB                     source/elements/joint/rjoint/rini45_rb.F
Chd|        RINI46                        source/elements/spring/rini46.F
Chd|        SPGRHEAD                      source/elements/sph/spgrhead.F
Chd|        SPGRTAILS                     source/elements/sph/spgrtails.F
Chd|        SPINIH                        source/elements/sph/spinih.F  
Chd|        SPINIT3                       source/elements/sph/spinit3.F 
Chd|        XINI28                        source/elements/xelem/xini28.F
Chd|        GET_U_GEO                     source/user_interface/uaccess.F
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        GET_U_GEO                     source/user_interface/uaccess.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      my_real FUNCTION
     .      GET_U_GEO(IVAR,IP)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "param_c.inc"
#include      "units_c.inc"
#include      "r4r8_p.inc"
C
#include      "scr05_c.inc"
C
      INTEGER IVAR,IP,NVAR,DEPLA
      my_real
     .      NV
      DOUBLE PRECISION NV2
C
      DEPLA = 26+(IP-1)*NPROPG
      IF (IRESP.EQ.1) THEN
         CALL GET_VAR_USER_F_SP(3,DEPLA,NV)
      ELSE
         CALL GET_VAR_USER_F(3,DEPLA,NV)
      ENDIF
      NVAR = NINT(NV)
C
      IF(IVAR.GT.NVAR)THEN
         CALL ANCMSG(MSGID=376,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               I2=IVAR,
     .               C2='PROPERTY',
     .               I3=NVAR,
     .               C3='NUPARAG')
      ELSE
C
        DEPLA = 27+(IP-1)*NPROPG
        IF (IRESP.EQ.1) THEN
           CALL GET_VAR_USER_F_SP(3,DEPLA,NV)
           DEPLA=NINT(NV)-1+IVAR
C Sav Buf Point = 4 is BUFGEO which is now in Double precision
           CALL GET_VAR_USER_F(4,DEPLA,NV2)
           NV = NV2
        ELSE
           CALL GET_VAR_USER_F(3,DEPLA,NV)
           DEPLA=NINT(NV)-1+IVAR
           CALL GET_VAR_USER_F(4,DEPLA,NV)
        ENDIF
        GET_U_GEO = NV
C
      ENDIF
C
      RETURN
      END
C
Chd|====================================================================
Chd|  RESET_U_GEO                   source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        RINI33_RB                     source/elements/joint/rjoint/rini33_rb.F
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION RESET_U_GEO(IVAR,IP,A)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "param_c.inc"
#include      "units_c.inc"
#include      "r4r8_p.inc"
C
#include      "scr05_c.inc"
      INTEGER IVAR,IP,NVAR,IER,DEPLA
      my_real
     .      A,NV
      DOUBLE PRECISION A2
C
      IER = 0
C
      DEPLA = 26+(IP-1)*NPROPG
      IF (IRESP.EQ.1) THEN
         CALL GET_VAR_USER_F_SP(3,DEPLA,NV)
      ELSE
         CALL GET_VAR_USER_F(3,DEPLA,NV)
      ENDIF
      NVAR = NINT(NV)
C
      IF(IVAR.GT.NVAR)THEN
         CALL ANCMSG(MSGID=376,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               I2=IVAR,
     .               C2='PROPERTY',
     .               I3=NVAR,
     .               C3='NUPARAG')
         IER = 1
      ELSE
C
        DEPLA = 27+(IP-1)*NPROPG
      IF (IRESP.EQ.1) THEN
         CALL GET_VAR_USER_F_SP(3,DEPLA,NV)
         DEPLA=NINT(NV)-1+IVAR
C Sav Buf Point = 4 is BUFGEO which is now in Double precision 
         A2 = A      
         CALL SET_VAR_USER_F(4,DEPLA,A2)
      ELSE
         CALL GET_VAR_USER_F(3,DEPLA,NV)
         DEPLA=NINT(NV)-1+IVAR
         CALL SET_VAR_USER_F(4,DEPLA,A)
      ENDIF
C
      ENDIF
C
      RESET_U_GEO=IER
      RETURN
      END
C
Chd|====================================================================
Chd|  GET_U_PNU                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        RINI32                        source/properties/spring/hm_read_prop32.F
Chd|        RINI33                        source/elements/joint/rjoint/rini33.F
Chd|        RINI36                        source/properties/spring/hm_read_prop36.F
Chd|        RINI45                        source/elements/joint/rjoint/rini45.F
Chd|        XINI28                        source/elements/xelem/xini28.F
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION GET_U_PNU(IVAR,IP,K)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "param_c.inc"
#include      "units_c.inc"
#include      "r4r8_p.inc"
C
#include      "scr05_c.inc"
      INTEGER IVAR,IP,K,NVAR,DEPLA
      DOUBLE PRECISION NV2
      my_real
     .      NV
C
      DEPLA = K-1+(IP-1)*NPROPG
      IF (IRESP.EQ.1) THEN
         CALL GET_VAR_USER_F_SP(3,DEPLA,NV)
      ELSE
         CALL GET_VAR_USER_F(3,DEPLA,NV)
      ENDIF
      NVAR = NINT(NV)
C
      IF(IVAR.GT.NVAR)THEN
C
         CALL ANCMSG(MSGID=377,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               C1='GET_U_PNU',
     .               C2='IVAR,IP,K',
     .               C3='IVAR',I1=IVAR,
     .               C4='K',I2=K,
     .               C5='IVAR',I3=IVAR,
     .               I4=NVAR)
C
      ELSE
C
        DEPLA = K+(IP-1)*NPROPG
        IF (IRESP.EQ.1) THEN
          CALL GET_VAR_USER_F_SP(3,DEPLA,NV)
          DEPLA = NINT(NV)-1+IVAR
C Sav Buf Point = 4 is BUFGEO which is now in Double precision
          CALL GET_VAR_USER_F(4,DEPLA,NV2)
          NV=NV2
        ELSE
          CALL GET_VAR_USER_F(3,DEPLA,NV)
          DEPLA = NINT(NV)-1+IVAR
          CALL GET_VAR_USER_F(4,DEPLA,NV)
        ENDIF
        GET_U_PNU = NINT(NV)
C
      ENDIF
C
      RETURN
      END
Chd|====================================================================
Chd|  GET_U_MNU                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION GET_U_MNU(IVAR,IM,K)
      USE MESSAGE_MOD
C------------------------------------------
#include      "implicit_f.inc"
#include      "param_c.inc"
#include      "units_c.inc"
#include      "r4r8_p.inc"
#include      "scr05_c.inc"
C------------------------------------------
      INTEGER IVAR,IM,K,KFUNC,DEPLA,NFUNC
      PARAMETER (KFUNC=29)
C=======================================================================
C
      DEPLA = 10+(IM-1)*NPROPMI
      CALL GET_VAR_USER_I(11,DEPLA,NFUNC)
      IF(IVAR > NFUNC)THEN
         CALL ANCMSG(MSGID=377,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               C1='GET_U_MNU',
     .               C2='IVAR,IM,K',
     .               C3='IVAR',I1=IVAR,
     .               C4='K',I2=K,
     .               C5='IVAR',I3=IVAR,
     .               I4=NFUNC)
      ELSEIF(K.EQ.KFUNC) THEN
C
         DEPLA = 10+IVAR+(IM-1)*NPROPMI
         CALL GET_VAR_USER_I(11,DEPLA,GET_U_MNU)
      ENDIF
C
      RETURN
      END
C
Chd|====================================================================
Chd|  GET_U_PID                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        RINI36                        source/properties/spring/hm_read_prop36.F
Chd|        GET_U_P                       source/user_interface/uaccess.F
Chd|-- calls ---------------
Chd|====================================================================
      INTEGER FUNCTION GET_U_PID(IP)
#include      "implicit_f.inc"
#include      "param_c.inc"
#include      "r4r8_p.inc"
C
#include      "scr05_c.inc"
C
      INTEGER IP,DEPLA,NV
C---------------------------------------------------------------
C
      DEPLA = 1+(IP-1)*NPROPGI
      CALL GET_VAR_USER_I(12,DEPLA,NV)
      GET_U_PID = NV
C
      RETURN
      END
C
Chd|====================================================================
Chd|  GET_U_MID                     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        GET_U_M                       source/user_interface/uaccess.F
Chd|-- calls ---------------
Chd|====================================================================
      INTEGER FUNCTION GET_U_MID(IM)
#include      "implicit_f.inc"
#include      "param_c.inc"
#include      "r4r8_p.inc"
C
#include      "scr05_c.inc"
      INTEGER IM,DEPLA,MID
C-------------------------------------------------
      DEPLA = 1+(IM-1)*NPROPMI
      CALL GET_VAR_USER_I(11,DEPLA,MID)
      GET_U_MID = MID
C
      RETURN
      END
#include "my_real.inc"
Chd|====================================================================
Chd|  GET_U_FUNC_N                  source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|====================================================================
      INTEGER FUNCTION GET_U_FUNC_N(IFUNC)
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
#include      "r4r8_p.inc"
#include      "scr05_c.inc"
      INTEGER IFUNC,I,NPFI,NPFIP
      CALL GET_VAR_USER_I(5,IFUNC,NPFI)
      CALL GET_VAR_USER_I(5,IFUNC+1,NPFIP)
      GET_U_FUNC_N=(NPFIP-NPFI)/2
      RETURN
      END
#include "my_real.inc"
Chd|====================================================================
Chd|  GET_U_FUNC_X                  source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        FRETITL2                      source/starter/freform.F      
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
*      my_real FUNCTION GET_U_FUNC_X(IFUNC,N)
*      USE MESSAGE_MOD
*C-----------------------------------------------
*C   I m p l i c i t   T y p e s
*C-----------------------------------------------
*#include      "implicit_f.inc"
*#include      "r4r8_p.inc"
*#include      "scr05_c.inc"
*#include      "scr17_c.inc"
*      INTEGER IFUNC,I,NPFI,NPFIP,N,NMAX
*      my_real
*     .    XX
*      INTEGER GET_U_NUMFUN
*      EXTERNAL GET_U_NUMFUN
*      CALL GET_VAR_USER_I(5,IFUNC,NPFI)
*      CALL GET_VAR_USER_I(5,IFUNC+1,NPFIP)
*      NMAX=(NPFIP-NPFI)/2
*      I=NPFI+(N-1)*2
*      IF (N.GT.NMAX.OR.N.LE.0) THEN
*        MSGIDOPT=NOM_OPT(1,INOM_OPT(20)+IFUNC)
*        CALL FRETITL2(MSGTITROPT,
*     .                NOM_OPT(LNOPT1-LTITR+1,INOM_OPT(20)+IFUNC),LTITR)
*        CALL ANCMSG(MSGID=841,
*     .              MSGTYPE=MSGERROR,
*     .              ANMODE=ANINFO_BLIND_2,
*     .              I1=MSGIDOPT,
*     .              C1=MSGTITROPT,
*     .              C2='X',
*     .              I2=N,
*     .              I3=NMAX)
*      END IF
*      IF (IRESP.EQ.1) THEN
*          CALL GET_VAR_USER_F_SP(6,I,XX)
*      ELSE
*          CALL GET_VAR_USER_F(6,I,XX)
*      ENDIF
*      GET_U_FUNC_X=XX
*      RETURN
*      END
#include "my_real.inc"
Chd|====================================================================
Chd|  GET_U_FUNC_Y                  source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      my_real FUNCTION GET_U_FUNC_Y(IFUNC,N)
      USE MESSAGE_MOD
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
#include      "r4r8_p.inc"
#include      "scr05_c.inc"
      INTEGER IFUNC,I,NPFI,NPFIP,N,NMAX
      my_real
     .    YY
      INTEGER GET_U_NUMFUN
      EXTERNAL GET_U_NUMFUN
      CALL GET_VAR_USER_I(5,IFUNC,NPFI)
      CALL GET_VAR_USER_I(5,IFUNC+1,NPFIP)
      NMAX=(NPFIP-NPFI)/2
      I=NPFI+(N-1)*2
      IF (N.GT.NMAX.OR.N.LE.0) THEN
        CALL ANCMSG(MSGID=841,
     .              MSGTYPE=MSGERROR,
     .              ANMODE=ANINFO_BLIND_2,
     .              C2='X',
     .              I2=N,
     .              I3=NMAX)
      END IF
      IF (IRESP.EQ.1) THEN
          CALL GET_VAR_USER_F_SP(6,I+1,YY)
      ELSE
          CALL GET_VAR_USER_F(6,I+1,YY)
      ENDIF
      GET_U_FUNC_Y=YY
      RETURN
      END
#include "my_real.inc"
Chd|====================================================================
Chd|  GET_U_FUNC                    source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        HM_READ_RETRACTOR             source/tools/seatbelts/hm_read_retractor.F
Chd|        RINI33                        source/elements/joint/rjoint/rini33.F
Chd|        RINI45                        source/elements/joint/rjoint/rini45.F
Chd|        XINI28                        source/elements/xelem/xini28.F
Chd|-- calls ---------------
Chd|====================================================================
      my_real FUNCTION GET_U_FUNC(IFUNC,XX,DERI)
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
#include      "r4r8_p.inc"
#include      "scr05_c.inc"
      INTEGER IFUNC,I,NPFI,NPFIP
      my_real
     .    ABC,DERI,XX,DX1,DX2,TFI,TFI1,TFI2,TFIP
      CALL GET_VAR_USER_I(5,IFUNC,NPFI)
      CALL GET_VAR_USER_I(5,IFUNC+1,NPFIP)
      IF (IRESP.EQ.1) THEN
          CALL GET_VAR_USER_F_SP(6,NPFI,DX2)
      ELSE
          CALL GET_VAR_USER_F(6,NPFI,DX2)
      ENDIF
      DX2=DX2-XX
      DO 100 I=NPFI+2,NPFIP-2,2
      IF (IRESP.EQ.1) THEN
          CALL GET_VAR_USER_F_SP(6,I,TFI)
          CALL GET_VAR_USER_F_SP(6,I+1,TFIP)
          CALL GET_VAR_USER_F_SP(6,I-1,TFI1)
          CALL GET_VAR_USER_F_SP(6,I-2,TFI2)

      ELSE
          CALL GET_VAR_USER_F(6,I,TFI)
          CALL GET_VAR_USER_F(6,I+1,TFIP)
          CALL GET_VAR_USER_F(6,I-1,TFI1)
          CALL GET_VAR_USER_F(6,I-2,TFI2)
      ENDIF
       DX1 = -DX2
       DX2 = TFI - XX
       IF(DX2.GE.ZERO.OR.I.EQ.NPFIP-2)THEN
         DERI = (TFIP - TFI1) / (TFI - TFI2)
         IF(DX1.LE.DX2)THEN
           GET_U_FUNC = TFI1 + DX1 * DERI
         ELSE
           GET_U_FUNC = TFIP - DX2 * DERI
         ENDIF
         RETURN
       ENDIF
 100  CONTINUE
      RETURN
      END
Chd|====================================================================
Chd|  GET_U_FUNC_DERI               source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        RINI45                        source/elements/joint/rjoint/rini45.F
Chd|-- calls ---------------
Chd|====================================================================
      my_real FUNCTION GET_U_FUNC_DERI(IFUNC)
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
#include      "r4r8_p.inc"
#include      "scr05_c.inc"
      INTEGER IFUNC,I,NPFI,NPFIP
      my_real
     .    ABC,DERI,DX1,DX2,TFI,TFI1,TFI2,TFIP,
     .    DERIMAX
     
      GET_U_FUNC_DERI = 0    
      CALL GET_VAR_USER_I(5,IFUNC,NPFI)
      CALL GET_VAR_USER_I(5,IFUNC+1,NPFIP)

      DO I=NPFI+2,NPFIP-2,2
        IF (IRESP.EQ.1) THEN
          CALL GET_VAR_USER_F_SP(6,I,TFI)
          CALL GET_VAR_USER_F_SP(6,I+1,TFIP)
          CALL GET_VAR_USER_F_SP(6,I-1,TFI1)
          CALL GET_VAR_USER_F_SP(6,I-2,TFI2)
        ELSE
          CALL GET_VAR_USER_F(6,I,TFI)
          CALL GET_VAR_USER_F(6,I+1,TFIP)
          CALL GET_VAR_USER_F(6,I-1,TFI1)
          CALL GET_VAR_USER_F(6,I-2,TFI2)
        ENDIF            
        DERI = ABS((TFIP - TFI1) / (TFI - TFI2))
        GET_U_FUNC_DERI = MAX(GET_U_FUNC_DERI,DERI)       
      END DO
 
      RETURN
      END       
Chd|====================================================================
Chd|  GET_U_M                       source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        GET_U_MID                     source/user_interface/uaccess.F
Chd|====================================================================
      INTEGER FUNCTION GET_U_M(MID)
      INTEGER MID,I,GET_U_MID
      EXTERNAL GET_U_MID
#include      "com04_c.inc"
C
      GET_U_M = 0
      DO I=1,NUMMAT
        IF(GET_U_MID(I).EQ.MID)THEN
          GET_U_M = I
          RETURN
        ENDIF
      ENDDO
      RETURN
      END
Chd|====================================================================
Chd|  GET_U_P                       source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        GET_U_PID                     source/user_interface/uaccess.F
Chd|====================================================================
      INTEGER FUNCTION GET_U_P(PID)
      INTEGER PID,I,GET_U_PID
      EXTERNAL GET_U_PID
#include      "com04_c.inc"
C
      GET_U_P = 0
      DO I=1,NUMGEO
        IF(GET_U_PID(I).EQ.PID)THEN
          GET_U_P = I
          RETURN
        ENDIF
      ENDDO
      RETURN
      END
C
Chd|====================================================================
Chd|  SET_U_SENS_IPAR               source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION SET_U_SENS_IPAR(IVAR,VAR)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "r4r8_p.inc"
#include      "param_c.inc"
#include      "com04_c.inc"
#include      "units_c.inc"
#include      "scr_usens_c.inc"
C
      INTEGER IVAR, NSENS,K,L, VAR,ITYP
C
      NSENS = KSENS_CUR
C
      SET_U_SENS_IPAR = -1
      IF(IVAR.GT.NSENPARI)THEN
C
         CALL ANCMSG(MSGID=374,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               I1=IVAR,
     .               I2=NSENPARI)
C
        SET_U_SENS_IPAR = NSENPARI
        RETURN
      ENDIF
C
      K = (NSENS-1)*NSENSI
C
      CALL  GET_VAR_USER_I(9,K+2,ITYP)
C
      IF (ITYP.GE.29 .AND. ITYP.LE.31)THEN
C
        CALL SET_VAR_USER_I(9,K+ISENPARI+IVAR,VAR)
C
        SET_U_SENS_IPAR = 0
      ENDIF
C
      RETURN
      END
C
Chd|====================================================================
Chd|  SET_U_SENS_FPAR               source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION SET_U_SENS_FPAR(IVAR,VAR)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "r4r8_p.inc"
#include      "param_c.inc"
#include      "com04_c.inc"
#include      "units_c.inc"
#include      "scr_usens_c.inc"
C
#include      "scr05_c.inc"
C
      INTEGER NSENS,IVAR, K,L,ITYP,DEPLA
      my_real
     .        VAR,NV
C
      NSENS = KSENS_CUR
C
      SET_U_SENS_FPAR = -1
      IF(IVAR.GT.NSENPARR)THEN
         CALL ANCMSG(MSGID=374,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO,
     .               I1=IVAR,
     .               I2=NSENPARR)
        SET_U_SENS_FPAR = NSENPARR
        RETURN
      ENDIF
C
      K = (NSENS-1)*NSENSI +2
      L = (NSENS-1)*NSENSR + ISENPARR+IVAR
      CALL GET_VAR_USER_I(9,K,ITYP)
C
      IF (ITYP.GE.29 .AND. ITYP.LE.31)THEN
C
       IF (IRESP.EQ.1) THEN
         CALL SET_VAR_USER_F_SP(10,L,VAR)
       ELSE
         CALL SET_VAR_USER_F(10,L,VAR)
       ENDIF
C
       SET_U_SENS_FPAR = 0
      ENDIF
C
      RETURN
      END
C
Chd|====================================================================
Chd|  GET_U_NUMFUN                  source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        ANCMSG                        source/output/message/message.F
Chd|        MESSAGE_MOD                   share/message_module/message_mod.F
Chd|====================================================================
      INTEGER FUNCTION GET_U_NUMFUN(IDFUN)
      USE MESSAGE_MOD
#include      "implicit_f.inc"
C
C-----------------------------------------------
C   A n a l y s e   M o d u l e
C-----------------------------------------------
#include      "param_c.inc"
#include      "units_c.inc"
#include      "com04_c.inc"
#include      "scr03_c.inc"
      INTEGER IDFUN
C
      INTEGER J,ID,DEPLA
C
      IF (CODVERS.LT.44 .OR. INVERS.LT.40) THEN
C
         CALL ANCMSG(MSGID=421,
     .               MSGTYPE=MSGERROR,
     .               ANMODE=ANINFO_BLIND_2)
C
        RETURN
      ENDIF
C
      GET_U_NUMFUN = 0
      IF(IDFUN.LE.0)THEN
        RETURN
      ENDIF
C
      DO J=1,NFUNCT
C
        DEPLA=NFUNCT+1+J
        CALL GET_VAR_USER_I(5,DEPLA,ID)
        IF(IDFUN.EQ.ID)THEN
          GET_U_NUMFUN = J
          RETURN
        ENDIF
      ENDDO
C
      RETURN
      END

C
Chd|====================================================================
Chd|  GET_U_SKEW                    source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|        INIT_SKEW45                   source/elements/joint/rjoint/rini45.F
Chd|        RINI33_RB                     source/elements/joint/rjoint/rini33_rb.F
Chd|        GET_SKEW                      source/elements/joint/rjoint/rini33.F
Chd|-- calls ---------------
Chd|====================================================================
      INTEGER FUNCTION GET_U_SKEW(IDSKW,N1,N2,N3,V)
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
#include      "com04_c.inc"
#include      "r4r8_p.inc"
#include      "scr05_c.inc"
#include      "param_c.inc"
       INTEGER I,IDSKW,ID,NSKW,DEPLA,N1,N2,N3
       my_real
     .        V(*)
C=======================================================================
C
       DO I=1,NUMSKW
C
        DEPLA = 4+I*LISKN
        CALL GET_VAR_USER_I(7,DEPLA,ID)
        IF(ID.EQ.IDSKW) THEN
C
           DEPLA=I*LISKN
           CALL GET_VAR_USER_I(7,DEPLA+1,N1)
           CALL GET_VAR_USER_I(7,DEPLA+2,N2)
           CALL GET_VAR_USER_I(7,DEPLA+3,N3)
C
           DEPLA=I*LSKEW+1
           IF (IRESP.EQ.1) THEN
              CALL GET_ARRAY_USER_F_SP(8,DEPLA,V,LSKEW)
           ELSE
              CALL GET_ARRAY_USER_F(8,DEPLA,V,LSKEW)
           ENDIF
           GET_U_SKEW = I
           RETURN
C
        ENDIF
C
      ENDDO
      GET_U_SKEW = 0
      RETURN
      END
      
Chd|====================================================================
Chd|  UELT_SPMD_ADDITIONAL_NODE     source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|        IFRONTPLUS                    source/spmd/node/frontplus.F  
Chd|        USR2SYS                       source/system/sysfus.F        
Chd|        RESTMOD                       share/modules1/restart_mod.F  
Chd|====================================================================
      SUBROUTINE UELT_SPMD_ADDITIONAL_NODE(NODID)
C-----------------------------------------------
      USE RESTMOD
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
#include      "com01_c.inc"
#include      "userlib.inc"
C-----------------------------------------------
      INTEGER NODID,INODID,P
      CHARACTER MESS*40
      INTEGER USR2SYS
      EXTERNAL USR2SYS
      DATA MESS/'USER NODES CONVERSION                 '/
C-----------------------------------------------

      INODID=USR2SYS(NODID,ITABM1,MESS,NODID)
      
      IF(INODID/=0)THEN
        IF(USER_GRP_DOMAIN/=0)THEN
          CALL IFRONTPLUS(INODID,USER_GRP_DOMAIN)
        ELSE
          DO P=1,NSPMD
             CALL IFRONTPLUS(INODID,P)
          ENDDO  
        ENDIF
      ENDIF      
      
      RETURN
      END
Chd|====================================================================
Chd|  WRITE_IOUT                    source/user_interface/uaccess.F
Chd|-- called by -----------
Chd|-- calls ---------------
Chd|====================================================================
      SUBROUTINE WRITE_IOUT(LINE,LEN1)
#include "implicit_f.inc"
#include      "comlock.inc"
C-----------------------------------------------
C   C o m m o n   B l o c k s
C-----------------------------------------------
#include "units_c.inc"
C-----------------------------------------------
C-----------------------------------------------
C   D u m m y   A r g u m e n t s
C-----------------------------------------------
#ifndef ncharline
#define ncharline 500
#endif
      CHARACTER(len=ncharline)  LINE
      INTEGER LEN1

      WRITE(IOUT,'(A)') LINE(1:LEN1)


      END
C-----------------------------------------------
