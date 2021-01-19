;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS Paddings SOURCE CODE
;***************************************************************
;{ GETTERS
Procedure PADDINGS_getRight(*this._paddings)
  With *this
    ProcedureReturn \right
  EndWith 
EndProcedure
Procedure PADDINGS_getLeft(*this._paddings)
  With *this
    ProcedureReturn \left
  EndWith 
EndProcedure
Procedure PADDINGS_getTop(*this._paddings)
  With *this
    ProcedureReturn \top
  EndWith 
EndProcedure
Procedure PADDINGS_getBotom(*this._paddings)
  With *this
    ProcedureReturn \botom
  EndWith 
EndProcedure
;}
;{ SETTERS
Procedure PADDINGS_setRight(*this._paddings,value)
  With *this
     \right = value
  EndWith 
EndProcedure
Procedure PADDINGS_setLeft(*this._paddings,value)
  With *this
     \left = value
  EndWith 
EndProcedure
Procedure PADDINGS_setTop(*this._paddings,value)
  With *this
     \top = value
  EndWith 
EndProcedure
Procedure PADDINGS_setBotom(*this._paddings,value)
  With *this
     \botom = 
  EndWith 
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newPaddings(right,left,up,botom)
  Protected *this._paddings = AllocateStructure(_paddings)
  With *this
    \methods = ?S_paddings
    \right = right
    \left = left
    \top = top
    \botom = botom
    ProcedureReturn  *this
  EndWith
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 60
; FirstLine = 33
; Folding = ---
; EnableXP