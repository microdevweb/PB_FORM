;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; ABSTRACT CLASS Gadget  SOURCE CODE 
;***************************************************************
Procedure GADGET_getSizes(*this._gadget)
  With *this
    ProcedureReturn \sizes
  EndWith
EndProcedure

Procedure GADGET_getFlags(*this._gadget)
  With *this
    ProcedureReturn \flag
  EndWith
EndProcedure

Procedure GADGET_super(*this._gadget)
  With *this
    \sizes = newSize(0,0)
    \methods = ?S_gadget
    \isGadget = #True
    ProcedureReturn ?E_gadget - ?S_gadget
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 23
; Folding = -
; EnableXP