;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.2
; LICENCE  : MIT
; CLASS ShortCut SOURCE CODE
;*********************************************************************************************************************************************
;{ GETTERS
Global gLastShortCutID = 20000
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
    \methods = ?S_shortCut
    \keys = keys
    \helpText = helpText
    \lastID = gLastShortCutID
    gLastShortCutID + 1
    ProcedureReturn *this
  EndWith
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 40
; FirstLine = 11
; Folding = --
; EnableXP