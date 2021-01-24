;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetSpinFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETSPINFLAGS_get(*this._gadgetSpinFlags)
  With *this
    Protected flags.s
    If \readOnly
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Spin_ReadOnly"
    EndIf
    If \numeric
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Spin_Numeric"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETSPINFLAGS_isReadOnly(*this._gadgetSpinFlags)
  With *this
    ProcedureReturn \readOnly
  EndWith
EndProcedure

Procedure GADGETSPINFLAGS_isNumeric(*this._gadgetSpinFlags)
  With *this
    ProcedureReturn \numeric
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETSPINFLAGS_setReadOnly(*this._gadgetSpinFlags,state.b)
  With *this
     \readOnly = state
  EndWith
EndProcedure

Procedure GADGETSPINFLAGS_setNumeric(*this._gadgetSpinFlags,state.b)
  With *this
     \numeric = state
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newGadgetSpinFlags()
  Protected *this._gadgetSpinFlags = AllocateStructure(_gadgetSpinFlags)
  With *this
    \methods = ?S_spinFlags
    \get = @GADGETSPINFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 54
; FirstLine = 24
; Folding = --
; EnableXP