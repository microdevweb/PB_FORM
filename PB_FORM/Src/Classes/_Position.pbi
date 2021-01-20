;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS Position SOURCE CODE
;*********************************************************************************************************************************************
;- Position SRC
;{
;{ GETTERS
Procedure POSITION_getPosX(*this._position)
  With *this
    ProcedureReturn \posX
  EndWith
EndProcedure
Procedure POSITION_getPosY(*this._position)
  With *this
    ProcedureReturn \posY
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure POSITION_setPosX(*this._position,x)
  With *this
    \posX = x
  EndWith
EndProcedure
Procedure POSITION_setPosY(*this._position,y)
  With *this
    \posY = y
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newPosition(x,y)
  Protected *this._position = AllocateStructure(_position)
  With *this
    \methods = ?S_position
    \posX = x
    \posY = y
    ProcedureReturn *this
  EndWith
EndProcedure
;}

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 29
; FirstLine = 7
; Folding = --
; EnableXP