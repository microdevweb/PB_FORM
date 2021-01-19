;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS Listener SOURCE CODE
;*********************************************************************************************************************************************
;- Listener SRC
;{
;{ GETTERS
Procedure LISTENER_getCallback(*this._listener)
  With *this
    ProcedureReturn \callback
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure LISTENER_setCallback(*this._listener,*callback)
  With *this
    \callback = *callback
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newListener(*callack)
  Protected *this._listener = AllocateStructure(_listener)
  With *this
    \methods = ?S_listener
    \callback = *callack
    ProcedureReturn *this
  EndWith
EndProcedure
;}

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 5
; FirstLine = 3
; Folding = --
; EnableXP