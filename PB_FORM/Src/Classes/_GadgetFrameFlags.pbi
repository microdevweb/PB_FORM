;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetFrameFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETSFRAMEFLAGS_get(*this._gadgetframeFlags)
  With *this
    Protected flags.s
    If \single
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Frame_Single"
    EndIf
    If \double
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Frame_Double"
    EndIf
    If \flat
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Frame_Flat"
    EndIf
    
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETSFRAMEFLAGS_isSingle(*this._gadgetframeFlags)
  With *this
    ProcedureReturn \single
  EndWith
EndProcedure

Procedure GADGETSFRAMEFLAGS_isDouble(*this._gadgetframeFlags)
  With *this
    ProcedureReturn \double
  EndWith
EndProcedure

Procedure GADGETSFRAMEFLAGS_isFlat(*this._gadgetframeFlags)
  With *this
    ProcedureReturn \flat
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure GADGETSFRAMEFLAGS_setSingle(*this._gadgetframeFlags,state.b)
  With *this
     \single = state
  EndWith
EndProcedure

Procedure GADGETSFRAMEFLAGS_setDouble(*this._gadgetframeFlags,state.b)
  With *this
     \double = state
  EndWith
EndProcedure

Procedure GADGETSFRAMEFLAGS_setFlat(*this._gadgetframeFlags,state.b)
  With *this
     \flat = state
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newGadgetFrameFlags()
  Protected *this._gadgetframeFlags = AllocateStructure(_gadgetframeFlags)
  With *this
    \methods = ?S_gadgetframeFlags
    \get = @GADGETSFRAMEFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 21
; FirstLine = 4
; Folding = Dh
; EnableXP