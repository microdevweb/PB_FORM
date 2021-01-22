;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetStringFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETSTRINGFLAGS_get(*this._gadetstringFlags)
  With *this
    Protected flags.s
    If \numeric
      If Len(flags):flags+"|":EndIf
      flags +"#PB_String_Numeric"
    EndIf
    If \password
      If Len(flags):flags+"|":EndIf
      flags +"#PB_String_Password"
    EndIf
    If \upperCase
      If Len(flags):flags+"|":EndIf
      flags +"#PB_String_UpperCase"
    EndIf
    If \lowerCase
      If Len(flags):flags+"|":EndIf
      flags +"#PB_String_LowerCase"
    EndIf
    If \readOnly
      If Len(flags):flags+"|":EndIf
      flags +"#PB_String_ReadOnly"
    EndIf
    If \borderLess
      If Len(flags):flags+"|":EndIf
      flags +"#PB_String_BorderLess"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETSTRINGFLAGS_isNumeric(*this._gadetstringFlags)
  With *this
    ProcedureReturn \numeric
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_isPassword(*this._gadetstringFlags)
  With *this
    ProcedureReturn \password
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_isReadOnly(*this._gadetstringFlags)
  With *this
    ProcedureReturn \readOnly
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_isLowerCase(*this._gadetstringFlags)
  With *this
    ProcedureReturn \lowerCase
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_isUpperCase(*this._gadetstringFlags)
  With *this
    ProcedureReturn \upperCase
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_isBorderLess(*this._gadetstringFlags)
  With *this
    ProcedureReturn \borderLess
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETSTRINGFLAGS_setNumeric(*this._gadetstringFlags,state.b)
  With *this
    \numeric = state
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_setPassword(*this._gadetstringFlags,state.b)
  With *this
    \password = state
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_setReadOnly(*this._gadetstringFlags,state.b)
  With *this
    \readOnly = state
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_setLowerCase(*this._gadetstringFlags,state.b)
  With *this
    \lowerCase = state
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_setUpperCase(*this._gadetstringFlags,state.b)
  With *this
    \upperCase = state
  EndWith
EndProcedure
Procedure GADGETSTRINGFLAGS_setBorderLess(*this._gadetstringFlags,state.b)
  With *this
    \borderLess = state
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newGadgetStringFlags()
  Protected *this._gadetstringFlags = AllocateStructure(_gadetstringFlags)
  With *this
    \methods = ?S_gadgetStringFlags
    \get = @GADGETSTRINGFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 34
; FirstLine = 6
; Folding = DIg
; EnableXP