;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.14
; LICENCE  : MIT
; CLASS optionGadget   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure OPTIONGADGET_evChange()
  Protected *this._optionGadget = GetGadgetData(EventGadget())
  With *this
    \state = GetGadgetState(\id)
    If \listener And \listener\callback
      \listener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s OPTIONGADGET_build(*this._optionGadget)
  With *this
    Protected xml.s = "<option id='#PB_Any' name='"+*this+"' text='"+\title+"' group = '"+Str(\group)+"'" 
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

Procedure OPTIONGADGET_makeId(*this._optionGadget,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    SetGadgetState(\id,\state)
    
    BindGadgetEvent(\id,@OPTIONGADGET_evChange())
  EndWith
EndProcedure
;}

;{ GETTERS
Procedure OPTIONGADGET_getState(*this._optionGadget)
  With *this
    ProcedureReturn \state
  EndWith
EndProcedure

Procedure.s OPTIONGADGET_getTitle(*this._optionGadget)
  With *this
    ProcedureReturn \title
  EndWith
EndProcedure


Procedure OPTIONGADGET_getListener(*this._optionGadget)
  With *this
    ProcedureReturn \listener
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure OPTIONGADGET_setState(*this._optionGadget,state)
  With *this
    \state = state
    If IsGadget(\id)
      SetGadgetState(\id,\state)
    EndIf
  EndWith
EndProcedure

Procedure OPTIONGADGET_setTitle(*this._optionGadget,title.s)
  With *this
    \title = title
    If IsGadget(\id)
      SetGadgetText(\id,\title)
    EndIf
  EndWith
EndProcedure


Procedure OPTIONGADGET_setListener(*this._optionGadget,*listener)
  With *this
     \listener = *listener
  EndWith
EndProcedure

;}
; PUBLIC CONSTRUCTOR
Procedure newOptionGadget(title.s,group,state = #False)
  Protected *this._optionGadget = AllocateStructure(_optionGadget)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_OPTIONGADGET - ?S_OPTIONGADGET
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_OPTIONGADGET,\methods + mothenL,ClassL)
    \flag = 0
    \state = state
    \title = title
    \group = group
    \build = @OPTIONGADGET_build()
    \makeId = @OPTIONGADGET_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 22
; FirstLine = 6
; Folding = dA+
; EnableXP