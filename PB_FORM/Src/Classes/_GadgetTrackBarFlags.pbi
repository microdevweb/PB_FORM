;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetTrackBarFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s TRACKBARFLAGS_get(*this._trackBarFlags)
  With *this
    Protected flags.s
    If \ticks
      If Len(flags):flags+"|":EndIf
      flags +"#PB_TrackBar_Ticks"
    EndIf
    If \vertical
      If Len(flags):flags+"|":EndIf
      flags +"#PB_TrackBar_Vertical"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure TRACKBARFLAGS_isTicks(*this._trackBarFlags)
  With *this
    ProcedureReturn \ticks
  EndWith
EndProcedure

Procedure TRACKBARFLAGS_isVertical(*this._trackBarFlags)
  With *this
    ProcedureReturn \vertical
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure TRACKBARFLAGS_setTicks(*this._trackBarFlags,state.b)
  With *this
     \ticks = state
  EndWith
EndProcedure

Procedure TRACKBARFLAGS_setVertical(*this._trackBarFlags,state.b)
  With *this
     \vertical = state
  EndWith
EndProcedure
 
;}
; PROTECTED CONSTRUCTOR
Procedure newTrackBarFlags()
  Protected *this._trackBarFlags = AllocateStructure(_trackBarFlags)
  With *this
    \methods = ?S_TRACKBARFLAGS
    \get = @TRACKBARFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 44
; Folding = g7
; EnableXP