;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.15
; LICENCE  : MIT
; CLASS comboContent   SOURCE CODE extends of Gadget
;***************************************************************
;{ GETTERS
Procedure.s COMBOCONTENT_getText(*this._comboContent)
  With *this
    ProcedureReturn \text
  EndWith
EndProcedure

Procedure COMBOCONTENT_getData(*this._comboContent)
  With *this
    ProcedureReturn \data
  EndWith
EndProcedure

Procedure COMBOCONTENT_isActif(*this._comboContent)
  With *this
    ProcedureReturn \actif
  EndWith
EndProcedure
;}

;{ SETTERS
Procedure COMBOCONTENT_setText(*this._comboContent,text.s)
  With *this
     \text = text
  EndWith
EndProcedure

Procedure COMBOCONTENT_setData(*this._comboContent,*data)
  With *this
     \data = *data
  EndWith
EndProcedure

Procedure COMBOCONTENT_setActif(*this._comboContent,state.b)
  With *this
     \actif = state
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newComboContent(text.s,actif.b = #False)
  Protected *this._comboContent = AllocateStructure(_comboContent)
  With *this
    \methods = ?S_COMBOCONTENT
    \text = text
    \actif = actif
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 40
; Folding = d8
; EnableXP