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
Chd|  EOSPOLYNO                     eos/eospolyno.F               
Chd|-- called by -----------
Chd|        EOSMAIN                       common_source/eos/eosmain.F   
Chd|-- calls ---------------
Chd|====================================================================
      SUBROUTINE EOSPOLYNO(IFLAG,NEL,PM   ,OFF  ,EINT ,MU   ,MU2 , 
     2                     ESPE ,DVOL ,DF   ,VNEW ,MAT  ,PSH ,
     3                     PNEW ,DPDM ,DPDE ,THETA,ECOLD)
C-----------------------------------------------
C   D e s c r i p t i o n
C-----------------------------------------------
C This subroutine contains numerical solving
C of polynomial EOS
C P(x,E) = C0 + C1x + C2x**2 + C3x**3 + (C4+C5x)E
C where C2=0 if x<0
C
C Remark : with laws 10,21,51 x<0 => C2=C3=0
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
#include      "comlock.inc"
C-----------------------------------------------
C   G l o b a l   P a r a m e t e r s
C-----------------------------------------------
#include      "mvsiz_p.inc"
#include      "param_c.inc"
C-----------------------------------------------
C   D u m m y   A r g u m e n t s
C-----------------------------------------------
      INTEGER MAT(*), IFLAG, NEL
      my_real
     .   PM(NPROPM,*), 
     .   OFF(*)  ,EINT(*) ,MU(*)   , 
     .   MU2(*)  ,ESPE(*) ,DVOL(*) ,DF(*)  , 
     .   VNEW(*) ,PSH(*)  ,PNEW(*) ,DPDM(*),
     .   DPDE(*) ,THETA(*),ECOLD(*)
C-----------------------------------------------
C   C o m m o n   B l o c k s
C-----------------------------------------------
#include      "com06_c.inc"
#include      "com08_c.inc"
#include      "vect01_c.inc"
#include      "scr06_c.inc"
C-----------------------------------------------
C   L o c a l   V a r i a b l e s
C-----------------------------------------------
      INTEGER :: I, MX
      my_real :: AA, BB,TFEXTT, DVV, PP
      my_real :: C0,C1,C2,C3,C4,C5,PC,SPH
C-----------------------------------------------
C   S o u r c e  L i n e s
C-----------------------------------------------
      IF(IFLAG == 0) THEN
C-----------------------------------------
C     COMPUTE BULK MODULUS FOR SOUND SPEED
C     COMPUTE COLD COMPRESSION ENERGY
C-----------------------------------------
       MX           = MAT(LFT)
       C0           = PM(104,MX)
       C1           = PM( 32,MX)
       C2           = PM( 33,MX)
       C3           = PM( 34,MX)
       C4           = PM( 35,MX)
       C5           = PM( 36,MX)
       SPH          = PM( 69,MX)
       PSH(LFT:LLT) = PM( 88,MX)

       DO I=LFT,LLT
         PP      = C0 +(C1 +C3 *MU(I)*MU(I))*MU(I)+C2 *MU2(I) + (C4 +C5 *MU(I))*ESPE(I)
         DPDM(I) = C1 + TWO*C2 *MAX(ZERO,MU(I))+THREE*C3 *MU(I)*MU(I) + C5 *ESPE(I)+(C4 +C5 *MU(I))*DF(I)*DF(I)*(PP+PSH(I) )
         DPDE(I) = C4 +C5 *MU(I)
       ENDDO

       DO I=LFT,LLT
         ECOLD(I)=-THREE100*SPH 
         IF(MU(I).GT.ZERO) ECOLD(I)=ECOLD(I)*(ONE+C4 *MU(I)*(ONE-MU(I)))+HALF*C1 *MU2(I)
       ENDDO

      ELSEIF(IFLAG == 1) THEN
C----------------------------------------
C     UPDATE PRESSURE AND INTERNAL ENERGY
C----------------------------------------
       TFEXTT=ZERO
       MX  = MAT(LFT)
       C0  = PM(104,MX)
       C1  = PM( 32,MX)
       C2  = PM( 33,MX)
       C3  = PM( 34,MX)
       C4  = PM( 35,MX)
       C5  = PM( 36,MX)
       PC  = PM( 37,MX)
       PSH(LFT:LLT) = PM( 88,MX)

C
       DO I=LFT,LLT
         AA      = C0 +MU(I)*(C1 +C3 *MU(I)*MU(I))+C2 *MU2(I)
         BB      = C4 +C5 *MU(I)
         DVV     = HALF*DVOL(I)*DF(I) / MAX(EM15,VNEW(I))
         PNEW(I) = PNEW(I) + (AA+BB*(ESPE(I)-PSH(I) *DVV))/(ONE+BB*DVV)
         PNEW(I) = MAX(PNEW(I),PC )*OFF(I)
         EINT(I) = EINT(I) - HALF*DVOL(I)*(PNEW(I)+PSH(I) )
         TFEXTT  = TFEXTT-DVOL(I)*PSH(I) 
       ENDDO
       
#include "atomic.inc"
       TFEXT = TFEXT + TFEXTT
#include "atomend.inc"
C
C------------------------
C     COMPUTE TEMPERATURE
C------------------------

       MX     = MAT(LFT)
       SPH    = PM(69,MX)

       DO I=LFT,LLT
         IF(OFF(I).LT.1..OR.SPH.LE.0.) CYCLE
         THETA(I) = (DF(I)*EINT(I)/VNEW(I)-ECOLD(I))/SPH
         THETA(I) = MAX(ZERO,THETA(I))
       ENDDO
       ELSEIF(IFLAG == 2) THEN
          MX  = MAT(LFT)
          C0  = PM(104,MX)
          C1  = PM( 32,MX)
          C2  = PM( 33,MX)
          C3  = PM( 34,MX)
          C4  = PM( 35,MX)
          C5  = PM( 36,MX)
          SPH = PM( 69,MX)
          PSH(1:NEL) = PM(88,MX)
          PC  = PM(37,MX)
          DO I=1, NEL
             IF (VNEW(I) .GT. ZERO) THEN
                PNEW(I) = C0 +(C1 +C3 *MU(I)*MU(I))*MU(I)+C2 *MU2(I) + (C4 +C5 *MU(I))*ESPE(I)
                DPDM(I) = C1 + TWO*C2 *MAX(ZERO,MU(I))+THREE*C3 *MU(I)*MU(I) + 
     .               C5 *ESPE(I)+(C4 +C5 *MU(I))*DF(I)*DF(I)*(PNEW(I)+PSH(I) )
                DPDE(I) = C4 +C5 *MU(I)
                PNEW(I) = MAX(PNEW(I),PC )*OFF(I)
             ENDIF
          ENDDO
       ENDIF
C------------------------      
      RETURN
      END
