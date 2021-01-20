;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetButton   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure GADGETBUTTON_eventClick()
  Protected *this._gadgetButton = GetGadgetData(EventGadget())
  With *this
    If \clickListener\callback
      \clickListener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}
;{ PROTECTED ABSTRACT METHODS
Procedure GADGETBUTTON_build(*this._gadgetButton,x,y,w,h,*parent._content)
  With *this
    If Not IsGadget(\id)
      \id = ButtonGadget(#PB_Any,x,y,w,h,\title,\flag\get(\flag,*this))
      SetGadgetData(\id,*this)
      If \clickListener
        BindGadgetEvent(\id,@GADGETBUTTON_eventClick())
      EndIf
    Else
      ResizeGadget(\id,x,y,w,h)
    EndIf
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newGadgetButton(title.s,*ClickListener)
  Protected *this._gadgetButton = AllocateStructure(_gadgetButton)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetbutton - ?S_gadgetbutton
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetButton,\methods + mothenL,ClassL)
    \flag = newGadgetButtonFlags()
    \title = title
    \clickListener = *ClickListener
    \build = @GADGETBUTTON_build()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 21
; FirstLine = 11
; Folding = -
; EnableXP