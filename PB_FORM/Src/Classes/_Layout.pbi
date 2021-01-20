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

Procedure LAYOUT_getExpand(*this._layout)
  With *this
    ProcedureReturn \expand
  EndWith
EndProcedure

Procedure LAYOUT_getAlign(*this._layout)
  With *this
    ProcedureReturn \align
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure LAYOUT_setSpace(*this._layout,space)
  With *this
    \space = space
  EndWith
EndProcedure

Procedure LAYOUT_setExpand(*this._layout,expand)
  With *this
    \expand = expand
  EndWith
EndProcedure

Procedure LAYOUT_setAlign(*this._layout,align)
  With *this
    \align = align
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
;{ PROTECTED ABSTRACT METHODS
Procedure LAYOUT_makeId(*this._layout,*form)
  With *this
    ForEach \myContents()
      \myContents()\makeId(\myContents(),*form)
    Next
  EndWith
EndProcedure
;}
; SUPER CONSTRUCTOR
Procedure LAYOUT_super(*this._layout)
  With *this
;     \sizes = newSize(0,0)
    \makeId = @LAYOUT_makeId()
    \expand = PB_FORM::#LAYOUT_EXPAND_NO
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 69
; FirstLine = 33
; Folding = ---
; EnableXP