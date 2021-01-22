;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetCanvasFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETSCANVASFLAGS_get(*this._gadgetCanvasFlags)
  With *this
    Protected flags.s
    If \border
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Canvas_Border"
    EndIf
    If \Keyboard
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Canvas_Keyboard"
    EndIf
    If \drawFocus
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Canvas_DrawFocus"
    EndIf
    If \container
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Canvas_Container"
    EndIf
    
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETSCANVASFLAGS_isBorder(*this._gadgetCanvasFlags)
  With *this
    ProcedureReturn \border
  EndWith
EndProcedure

Procedure GADGETSCANVASFLAGS_isKeyboard(*this._gadgetCanvasFlags)
  With *this
    ProcedureReturn \Keyboard
  EndWith
EndProcedure

Procedure GADGETSCANVASFLAGS_isDrawFocus(*this._gadgetCanvasFlags)
  With *this
    ProcedureReturn \drawFocus
  EndWith
EndProcedure

Procedure GADGETSCANVASFLAGS_isContainer(*this._gadgetCanvasFlags)
  With *this
    ProcedureReturn \container
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure GADGETSCANVASFLAGS_setBorder(*this._gadgetCanvasFlags,state.b)
  With *this
     \border = state
  EndWith
EndProcedure

Procedure GADGETSCANVASFLAGS_setKeyboard(*this._gadgetCanvasFlags,state.b)
  With *this
     \Keyboard = state
  EndWith
EndProcedure

Procedure GADGETSCANVASFLAGS_setDrawFocus(*this._gadgetCanvasFlags,state.b)
  With *this
     \drawFocus = state
  EndWith
EndProcedure

Procedure GADGETSCANVASFLAGS_setContainer(*this._gadgetCanvasFlags,state.b)
  With *this
     \container = state
  EndWith
EndProcedure

;}
; PROTECTED CONSTRUCTOR
Procedure newGadgetCanvasFlags()
  Protected *this._gadgetCanvasFlags = AllocateStructure(_gadgetCanvasFlags)
  With *this
    \methods = ?S_gadgetCanvasFlags
    \get = @GADGETSCANVASFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 82
; FirstLine = 47
; Folding = ---
; EnableXP