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
Procedure.s GADGETBUTTON_build(*this._gadgetButton)
  With *this
    Protected xml.s = "<button id='#PB_Any' name='"+*this+"' text='"+\title+"'"
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
    xml + "/>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

Procedure GADGETBUTTON_makeId(*this._gadgetButton,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    BindGadgetEvent(\id,@GADGETBUTTON_eventClick())
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure.s GADGETBUTTON_getTitle(*this._gadgetButton)
  With *this
    ProcedureReturn \title
  EndWith
EndProcedure

Procedure GADGETBUTTON_getShortcut(*this._gadgetButton)
  With *this
     ProcedureReturn \shotCut 
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETBUTTON_setTitle(*this._gadgetButton,title.s)
  With *this
     \title = title
  EndWith
EndProcedure

Procedure GADGETBUTTON_setShortcut(*this._gadgetButton,*shortcut)
  With *this
     \shotCut = *shortcut
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
    \makeId = @GADGETBUTTON_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 29
; FirstLine = 6
; Folding = ---
; EnableXP