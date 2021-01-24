;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetFrame   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS

;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETFRAME_build(*this._gadgetFrame)
  With *this
    Protected xml.s = "<frame text="+Chr(34)+\title+Chr(34)
    Protected flags.s = \flag\get(\flag)
    If Len(flags)
      xml + " flags='"+flags+"' "
    EndIf
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
    xml + ">"+Chr(10)
    If \content And \content\build
      xml + \content\build(\content)+Chr(10)
    EndIf
    xml + "</frame>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

;}
;{ GETTERS
Procedure GADGETFRAME_getContent(*this._gadgetFrame)
  With *this
    ProcedureReturn \content
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETFRAME_setContent(*this._gadgetFrame,*content)
  With *this
    \content = *content
    ProcedureReturn *content
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newGadgetFrame(title.s)
  Protected *this._gadgetFrame = AllocateStructure(_gadgetFrame)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetFrame - ?S_gadgetFrame
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetFrame,\methods + mothenL,ClassL)
    \title = title
    \flag = newGadgetFrameFlags()
    \build = @GADGETFRAME_build()
    \makeId = 0
    \isFrame = #True
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 14
; FirstLine = 10
; Folding = u-
; EnableXP