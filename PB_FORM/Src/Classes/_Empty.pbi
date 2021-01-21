;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS Empty   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS

;}
;{ PROTECTED ABSTRACT METHODS
Procedure.s EMPTY_build(*this._empty)
  With *this
    Protected xml.s = "<empty"
    If \sizes\widht
      xml + " width='"+Str(\sizes\widht)+"' "
    EndIf
    If \sizes\height
      xml + " height='"+Str(\sizes\height)+"' "
    EndIf
    If \sizes\minWidht
      xml + " minwidht='"+Str(\sizes\minWidht)+"'"
    EndIf 
    If \sizes\minHeight
      xml + " minheight='"+Str(\sizes\minHeight)+"'"
    EndIf
    If \sizes\maxWidht
      xml + " maxwidht='"+Str(\sizes\maxWidht)+"'"
    EndIf 
    If \sizes\maxHeight
      xml + " maxheight='"+Str(\sizes\maxHeight)+"'"
    EndIf
    xml + "/>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

;}
;{ GETTERS

;}
;{ SETTERS

;}
; PUBLIC CONSTRUCTOR
Procedure newEmpty()
  Protected *this._empty = AllocateStructure(_empty)
  With *this
    GADGET_super(*this)
    \methods = ?S_gadget
    \build = @EMPTY_build()
    \makeId = 0
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 48
; FirstLine = 15
; Folding = --
; EnableXP