;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; ABSTRACT CLASS Gadget  SOURCE CODE 
;***************************************************************
;{ GETTERS
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

Procedure GADGET_getId(*this._gadget)
  With *this
    ProcedureReturn \id
  EndWith
EndProcedure

Procedure GADGET_getFont(*this._gadget)
  With *this
    ProcedureReturn \font 
  EndWith
EndProcedure

Procedure GADGET_getBgColor(*this._gadget)
  With *this
    ProcedureReturn \colors\bgColor
  EndWith
EndProcedure

Procedure GADGET_getFgColor(*this._gadget)
  With *this
    ProcedureReturn \colors\fgColor
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure GADGET_setSizes(*this._gadget,width,height)
  With *this
    \sizes\widht = width
    \sizes\height = height
  EndWith
EndProcedure

Procedure GADGET_setFont(*this._gadget,font)
  With *this
    \font = font
  EndWith
EndProcedure

Procedure GADGET_setBgColor(*this._gadget,color)
  With *this
     \colors\bgColor = color
  EndWith
EndProcedure

Procedure GADGET_setFgColor(*this._gadget,color)
  With *this
     \colors\fgColor = color
  EndWith
EndProcedure
;}


Procedure GADGET_super(*this._gadget)
  With *this
    \sizes = newSize(0,0)
    \methods = ?S_gadget
    \isGadget = #True
    \font = -1
    ProcedureReturn ?E_gadget - ?S_gadget
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 65
; FirstLine = 8
; Folding = BC-
; EnableXP