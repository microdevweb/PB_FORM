;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS ComboboxFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s COMBOBOXFLAGS_get(*this._comboboxFlags)
  With *this
    Protected flags.s
    If \editable
      If Len(flags):flags+"|":EndIf
      flags +"#PB_ComboBox_Editable"
    EndIf
    If \lowercase
      If Len(flags):flags+"|":EndIf
      flags +"#PB_ComboBox_LowerCase"
    EndIf
    If \uppercase
      If Len(flags):flags+"|":EndIf
      flags +"#PB_ComboBox_UpperCase"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure COMBOBOXFLAGS_isEditable(*this._comboboxFlags)
  With *this
    ProcedureReturn \editable
  EndWith
EndProcedure

Procedure COMBOBOXFLAGS_isLowerCase(*this._comboboxFlags)
  With *this
    ProcedureReturn \lowercase
  EndWith
EndProcedure

Procedure COMBOBOXFLAGS_isUperCase(*this._comboboxFlags)
  With *this
    ProcedureReturn \uppercase
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure COMBOBOXFLAGS_setEditable(*this._comboboxFlags,state.b)
  With *this
     \editable = state
  EndWith
EndProcedure

Procedure COMBOBOXFLAGS_setLowerCase(*this._comboboxFlags,state.b)
  With *this
     \lowercase = state
  EndWith
EndProcedure

Procedure COMBOBOXFLAGS_setUperCase(*this._comboboxFlags,state.b)
  With *this
     \uppercase = state
  EndWith
EndProcedure
 
;}
; PROTECTED CONSTRUCTOR
Procedure newComboBoxFlags()
  Protected *this._comboboxFlags = AllocateStructure(_comboboxFlags)
  With *this
    \methods = ?S_COMBOBOXFLAGS
    \get = @COMBOBOXFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 21
; Folding = Dh
; EnableXP