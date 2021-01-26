;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.15
; LICENCE  : MIT
; CLASS comboBoxGadget   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure COMBOBOXGADGET_evChange()
  Protected *this._comboBoxGadget = GetGadgetData(EventGadget())
  With *this
    \current = GetGadgetItemData(\id,GetGadgetState(\id))
    If \listener And \listener\callback
      \listener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s COMBOBOXGADGET_build(*this._comboBoxGadget)
  With *this
    Protected xml.s = "<combobox id='#PB_Any' name='"+*this+"'"
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

Procedure COMBOBOXGADGET_makeId(*this._comboBoxGadget,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    Protected n = 0,s
    ForEach \myContent()
      AddGadgetItem(\id,n,\myContent()\text)
      If \myContent()\actif
        s = n
      EndIf
      SetGadgetItemData(\id,n,\myContent())
    Next
    SetGadgetState(\id,s)
    BindGadgetEvent(\id,@COMBOBOXGADGET_evChange())
  EndWith
EndProcedure
;}

;{ GETTERS
Procedure COMBOBOXGADGET_getContent(*this._comboBoxGadget,number)
  With *this
    If SelectElement(\myContent(),number)
      ProcedureReturn \myContent()
    EndIf
    ProcedureReturn 0
  EndWith
EndProcedure

Procedure COMBOBOXGADGET_getCurrentContent(*this._comboBoxGadget)
  With *this
    If IsGadget(\id)
      ProcedureReturn \current
    EndIf
    ProcedureReturn 0
  EndWith
EndProcedure

Procedure COMBOBOXGADGET_getListener(*this._comboBoxGadget)
  With *this
    ProcedureReturn \listener
  EndWith
EndProcedure

;}
;{ SETTERS
Procedure COMBOBOXGADGET_setListener(*this._comboBoxGadget,*listener)
  With *this
     \listener = *listener
  EndWith
EndProcedure

Procedure COMBOBOXGADGET_setFlags(*this._comboBoxGadget,flags)
  With *this
    Protected *f._comboboxFlags = \flag
    *f\editable = #False
    *f\lowercase = #False
    *f\uppercase = #False
    
    If flags & #PB_ComboBox_Editable = #PB_ComboBox_Editable
      *f\editable = #True
    EndIf
    
    If flags & #PB_ComboBox_LowerCase = #PB_ComboBox_LowerCase
      *f\lowercase = #True
    EndIf
    
    If flags & #PB_ComboBox_UpperCase = #PB_ComboBox_UpperCase
      *f\uppercase = #True
    EndIf
  EndWith
EndProcedure
;}
;{ PUBLIC METHODS
Procedure COMBOBOXGADGET_addContent(*this._comboBoxGadget,*content)
  With *this
    AddElement(\myContent())
    \myContent() = *content
    ProcedureReturn *content
  EndWith
EndProcedure
;}

; PUBLIC CONSTRUCTOR
Procedure newComboBoxGadget()
  Protected *this._comboBoxGadget = AllocateStructure(_comboBoxGadget)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_COMBOBOXGADGET - ?S_COMBOBOXGADGET
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_COMBOBOXGADGET,\methods + mothenL,ClassL)
    \flag = newComboBoxFlags()
    
    \build = @COMBOBOXGADGET_build()
    \makeId = @COMBOBOXGADGET_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 81
; FirstLine = 51
; Folding = -K-
; EnableXP