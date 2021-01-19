;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS Size SOURCE CODE
;*********************************************************************************************************************************************
;- Size SRC
;{
;{ GETTERS
Procedure getWidth(*this._size)
  With *this
    ProcedureReturn \widht
  EndWith
EndProcedure
Procedure getHeight(*this._size)
  With *this
    ProcedureReturn \height
  EndWith
EndProcedure
Procedure getMaxWidth(*this._size)
  With *this
    ProcedureReturn \maxWidht
  EndWith
EndProcedure
Procedure getMaxHeight(*this._size)
  With *this
    ProcedureReturn \maxHeight
  EndWith
EndProcedure
Procedure getMinWidth(*this._size)
  With *this
    ProcedureReturn \minWidht
  EndWith
EndProcedure
Procedure getMinHeight(*this._size)
  With *this
    ProcedureReturn \minHeight
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure setWidth(*this._size,w)
  With *this
    \widht = w
  EndWith
EndProcedure
Procedure setHeight(*this._size,h)
  With *this
    \height = h
  EndWith
EndProcedure
Procedure setMaxWidth(*this._size,w)
  With *this
    \maxWidht = w
  EndWith
EndProcedure
Procedure setMaxHeight(*this._size,h)
  With *this
    \maxHeight = h
  EndWith
EndProcedure
Procedure setMinWidth(*this._size,w)
  With *this
    \minWidht = w
  EndWith
EndProcedure
Procedure setMinHeight(*this._size,h)
  With *this
    \minHeight = h
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newSize(w,h)
  Protected *this._size = AllocateStructure(_size)
  With *this
    \methods = ?S_size
    \widht = w
    \height = h
    ProcedureReturn *this
  EndWith
EndProcedure
;}

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 5
; Folding = ---
; EnableXP