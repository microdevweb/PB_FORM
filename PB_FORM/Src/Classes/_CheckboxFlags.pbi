;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS CheckboxFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s CHECKBOXFLAGS_get(*this._checkboxFlags)
  With *this
    Protected flags.s
    If \right
      If Len(flags):flags+"|":EndIf
      flags +"#PB_CheckBox_Right"
    EndIf
    If \center
      If Len(flags):flags+"|":EndIf
      flags +"#PB_CheckBox_Center"
    EndIf
    If \threeState
      If Len(flags):flags+"|":EndIf
      flags +"#PB_CheckBox_ThreeState"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure CHECKBOXFLAGS_isRight(*this._checkboxFlags)
  With *this
    ProcedureReturn \right
  EndWith
EndProcedure

Procedure CHECKBOXFLAGS_isCenter(*this._checkboxFlags)
  With *this
    ProcedureReturn \center
  EndWith
EndProcedure

Procedure CHECKBOXFLAGS_isThreeState(*this._checkboxFlags)
  With *this
    ProcedureReturn \threeState
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure CHECKBOXFLAGS_setRight(*this._checkboxFlags,state.b)
  With *this
     \right = state
  EndWith
EndProcedure

Procedure CHECKBOXFLAGS_setCenter(*this._checkboxFlags,state.b)
  With *this
     \center = state
  EndWith
EndProcedure

Procedure CHECKBOXFLAGS_setThreeState(*this._checkboxFlags,state.b)
  With *this
     \threeState = state
  EndWith
EndProcedure

 
;}
; PROTECTED CONSTRUCTOR
Procedure newCheckboxFlags()
  Protected *this._checkboxFlags = AllocateStructure(_checkboxFlags)
  With *this
    \methods = ?S_CHECKBOX_FLAGS
    \get = @CHECKBOXFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 21
; FirstLine = 6
; Folding = --
; EnableXP