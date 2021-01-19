;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.2
; LICENCE  : MIT
; CLASS ShortCut SOURCE CODE
;*********************************************************************************************************************************************
;{ GETTERS
Procedure SHORTCUT_getKeys(*this._shortCut)
  With *this
    ProcedureReturn \keys
  EndWith
EndProcedure
Procedure.s SHORTCUT_getHelpText(*this._shortCut)
  With *this
    ProcedureReturn \helpText
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure SHORTCUT_setKeys(*this._shortCut,keys)
  With *this
     \keys = keys
  EndWith
EndProcedure
Procedure SHORTCUT_setHelpText(*this._shortCut,text.s)
  With *this
     \helpText = text
  EndWith
EndProcedure
;}
; CONSTRUCTOR
Procedure newShortCut(keys.i,helpText.s = "")
  Protected *this._shortCut = AllocateStructure(_shortCut)
  With *this
    \methods = S_shortCut
    \keys = keys
    \helpText = helpText
    ProcedureReturn *this
  EndWith
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 20
; FirstLine = 3
; Folding = --
; EnableXP