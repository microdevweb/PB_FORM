;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.13
; LICENCE  : MIT
; CLASS checkBoxGadget   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure CHECKBOXGADGET_evChange()
  Protected *this._checkboxGadget = GetGadgetData(EventGadget())
  With *this
    \state = GetGadgetState(\id)
    If \listener And \listener\callback
      \listener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s CHECKBOXGADGET_build(*this._checkboxGadget)
  With *this
    Protected xml.s = "<checkbox id='#PB_Any' name='"+*this+"' text='"+\title+"'"
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

Procedure CHECKBOXGADGET_makeId(*this._checkboxGadget,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    SetGadgetState(\id,\state)
    
    BindGadgetEvent(\id,@CHECKBOXGADGET_evChange())
  EndWith
EndProcedure
;}

;{ GETTERS
Procedure CHECKBOXGADGET_getState(*this._checkboxGadget)
  With *this
    ProcedureReturn \state
  EndWith
EndProcedure

Procedure CHECKBOXGADGET_getListener(*this._checkboxGadget)
  With *this
    ProcedureReturn \listener
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure CHECKBOXGADGET_setState(*this._checkboxGadget,state)
  With *this
    \state = state
    If IsGadget(\id)
      SetGadgetState(\id,\state)
    EndIf
  EndWith
EndProcedure

Procedure CHECKBOXGADGET_setListener(*this._checkboxGadget,*listener)
  With *this
     \listener = *listener
  EndWith
EndProcedure

Procedure CHECKBOXGADGET_setFlags(*this._checkboxGadget,flags)
  With *this
    Protected *f._checkboxFlags = \flag
    *f\right = #False
    *f\center = #False
    *f\threeState = #False
    
    If flags & #PB_CheckBox_Right = #PB_CheckBox_Right
      *f\right = #True
    EndIf
    
    If flags & #PB_CheckBox_Center = #PB_CheckBox_Center
      *f\center = #True
    EndIf
    
    If flags & #PB_CheckBox_ThreeState = #PB_CheckBox_ThreeState
      *f\threeState = #True
    EndIf
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newCheckBoxGadget(title.s,state = #PB_Checkbox_Unchecked)
  Protected *this._checkboxGadget = AllocateStructure(_checkboxGadget)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_CHECKBOX_GADGET - ?S_CHECKBOX_GADGET
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_CHECKBOX_GADGET,\methods + mothenL,ClassL)
    \flag = newCheckboxFlags()
    \state = state
    \title = title
    \build = @CHECKBOXGADGET_build()
    \makeId = @CHECKBOXGADGET_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 128
; FirstLine = 3
; Folding = EE-
; EnableXP