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
C     REAL
#include "my_real.inc"
      my_real
Chd|====================================================================
Chd|  ALEAT                         source/system/aleat.F         
Chd|-- called by -----------
Chd|        IMP_INIS                      source/implicit/imp_pcg.F     
Chd|        IMP_INISI                     source/implicit/imp_pcg.F     
Chd|        SMS_INIS                      source/ams/sms_proj.F         
Chd|-- calls ---------------
Chd|====================================================================
     .      FUNCTION ALEAT()
C-----------------------------------------------
C   I m p l i c i t   T y p e s
C-----------------------------------------------
#include      "implicit_f.inc"
C-----------------------------------------------
C   C o m m o n   B l o c k s
C-----------------------------------------------
C#include      "scr06_c.inc"
C-----------------------------------------------
C   L o c a l   V a r i a b l e s
C-----------------------------------------------
      INTEGER I,IFIRST
      SAVE I,IFIRST
      DATA I/0/
      DATA IFIRST/0/
C
C      IF(IFIRST.EQ.0.AND.SEED.NE.0.0)THEN
C        I = SEED*32768 + 32768
C        IFIRST=1
C      ENDIF
C
      I=MOD(25173*I+13849,65536)
      ALEAT=(I-32768.)/32768.
      RETURN
      END
