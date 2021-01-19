;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; ABSTRACT CLASS Layout SOURCE CODE
;*********************************************************************************************************************************************
;{ GETTERS
Procedure LAYOUT_getSpace(*this._layout)
  With *this
    ProcedureReturn \space
  EndWith
EndProcedure
Procedure LAYOUT_getMargins(*this._layout)
  With *this
    ProcedureReturn \margins
  EndWith
EndProcedure
Procedure LAYOUT_getPaddings(*this._layout)
  With *this
    ProcedureReturn \paddings
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure LAYOUT_setSpace(*this._layout,space)
  With *this
    \space = space
  EndWith
EndProcedure
;}
;{ PUBLIC METHODS
Procedure LAYOUT_addContent(*this._layout,*content)
  With *this
    AddElement(\myContents())
    \myContents() = *content
    ProcedureReturn *content
  EndWith
EndProcedure
;}
; SUPER CONSTRUCTOR
Procedure LAYOUT_super(*this._layout)
  With *this
    \margins = newMargins(0,0,0,0)
    \paddings = newPaddings(0,0,0,0)
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 32
; Folding = x8
; EnableXP