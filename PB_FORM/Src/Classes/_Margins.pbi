;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS Margins SOURCE CODE
;***************************************************************
;{ GETTERS
Procedure MARGINS_getRight(*this._margins)
  With *this
    ProcedureReturn \right
  EndWith 
EndProcedure
Procedure MARGINS_getLeft(*this._margins)
  With *this
    ProcedureReturn \left
  EndWith 
EndProcedure
Procedure MARGINS_getTop(*this._margins)
  With *this
    ProcedureReturn \top
  EndWith 
EndProcedure
Procedure MARGINS_getBotom(*this._margins)
  With *this
    ProcedureReturn \botom
  EndWith 
EndProcedure
;}
;{ SETTERS
Procedure MARGINS_setRight(*this._margins,value)
  With *this
     \right = value
  EndWith 
EndProcedure
Procedure MARGINS_setLeft(*this._margins,value)
  With *this
     \left = value
  EndWith 
EndProcedure
Procedure MARGINS_setTop(*this._margins,value)
  With *this
     \top = value
  EndWith 
EndProcedure
Procedure MARGINS_setBotom(*this._margins,value)
  With *this
     \botom = 
  EndWith 
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newMargins(right,left,up,botom)
  Protected *this._margins = AllocateStructure(_margins)
  With *this
    \methods = ?S_margins
    \right = right
    \left = left
    \top = top
    \botom = botom
    ProcedureReturn  *this
  EndWith
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 60
; Folding = g5
; EnableXP