;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetTextFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETTEXTFLAGS_get(*this._gadgetTextFlags)
  With *this
    Protected flags.s
    If \center
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Text_Center"
    EndIf
    If \right
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Text_Right"
    EndIf
    If \border
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Text_Border"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETTEXTFLAGS_isCenter(*this._gadgetTextFlags)
  With *this
    ProcedureReturn \center
  EndWith
EndProcedure

Procedure GADGETTEXTFLAGS_isRight(*this._gadgetTextFlags)
  With *this
    ProcedureReturn \right
  EndWith
EndProcedure

Procedure GADGETTEXTFLAGS_isBorder(*this._gadgetTextFlags)
  With *this
    ProcedureReturn \border
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETTEXTFLAGS_setCenter(*this._gadgetTextFlags,state.b)
  With *this
     \center = state
  EndWith
EndProcedure

Procedure GADGETTEXTFLAGS_setRight(*this._gadgetTextFlags,state.b)
  With *this
     \right = state
  EndWith
EndProcedure

Procedure GADGETTEXTFLAGS_setBorder(*this._gadgetTextFlags,state.b)
  With *this
     \border = state
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newGadgetTextFlags()
  Protected *this._gadgetTextFlags = AllocateStructure(_gadgetTextFlags)
  With *this
    \methods = ?S_textFlags
    \get = @GADGETTEXTFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 21
; Folding = D6
; EnableXP