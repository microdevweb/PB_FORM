﻿;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetButtonFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETBTFLAGS_get(*this._gadgetbuttonFlags)
  With *this
    Protected flags.s
    If \def
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Button_Default"
    EndIf
    If \right
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Button_Right"
    EndIf
    If \left
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Button_Left"
    EndIf
    If \mutliligne
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Button_MultiLine"
    EndIf
    If \toggle
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Button_Toggle"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETBTFLAGS_isDefault(*this._gadgetbuttonFlags)
  With *this
    ProcedureReturn \def
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_isRight(*this._gadgetbuttonFlags)
  With *this
    ProcedureReturn \right
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_isLeft(*this._gadgetbuttonFlags)
  With *this
    ProcedureReturn \left
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_isMultiLine(*this._gadgetbuttonFlags)
  With *this
    ProcedureReturn \mutliligne
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_isToogle(*this._gadgetbuttonFlags)
  With *this
    ProcedureReturn \toggle
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETBTFLAGS_setDefault(*this._gadgetbuttonFlags,state.b)
  With *this
    \def = state
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_setRight(*this._gadgetbuttonFlags,state.b)
  With *this
    \right = state
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_setLeft(*this._gadgetbuttonFlags,state.b)
  With *this
    \left = state
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_setMultiLine(*this._gadgetbuttonFlags,state.b)
  With *this
    \mutliligne = state
  EndWith
EndProcedure
Procedure GADGETBTFLAGS_setToogle(*this._gadgetbuttonFlags,state.b)
  With *this
    \toggle = state
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newGadgetButtonFlags()
  Protected *this._gadgetbuttonFlags = AllocateStructure(_gadgetbuttonFlags)
  With *this
    \methods = ?S_gadgetbtflags
    \get = @GADGETBTFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 30
; FirstLine = 10
; Folding = DE+
; EnableXP