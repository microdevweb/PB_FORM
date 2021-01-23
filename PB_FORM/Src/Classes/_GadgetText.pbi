;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetText   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS

;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETTEXT_build(*this._gadgetText)
  With *this
    Protected xml.s = "<text id='#PB_Any' name='"+*this+"' text='"+\title+"'"
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
    xml + "/>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

Procedure GADGETTEXT_makeId(*this._gadgetText,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure.s GADGETSTRING_getTitle(*this._gadgetText)
  With *this
    ProcedureReturn \title
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure GADGETSTRING_setTitle(*this._gadgetText,title.s)
  With *this
    \title = title
    If IsGadget(\id)
      SetGadgetText(\id,\title)
    EndIf
  EndWith
EndProcedure

Procedure GADGETTEXT_setFlags(*this._gadgetText,flags)
  With *this
    Protected *f._gadgetTextFlags = \flag
    If flags & #PB_Text_Center= #PB_Text_Center
      *f\center = #True
    EndIf
    If flags & #PB_Text_Right = #PB_Text_Right
      *f\right = #True
    EndIf
    If flags & #PB_Text_Border = #PB_Text_Border
      *f\border = #True
    EndIf
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newGadgetText(title.s)
  Protected *this._gadgetText = AllocateStructure(_gadgetText)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetText - ?S_gadgetText
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetText,\methods + mothenL,ClassL)
    \flag = newGadgetTextFlags()
    \title = title
    \build = @GADGETTEXT_build()
    \makeId = @GADGETTEXT_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 83
; FirstLine = 32
; Folding = W6
; EnableXP