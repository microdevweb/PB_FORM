;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetString   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure GADGETSTRING_eventChange()
  Protected *this._gadgetString = GetGadgetData(EventGadget())
  With *this
    \value = GetGadgetText(\id)
    If \eventChangeListener
      \eventChangeListener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}
Procedure GADGETSTRING_setFlags(*this._gadgetString,flags)
  With *this
    Protected *f._gadetstringFlags = \flag
    *f\borderLess = #False
    *f\lowerCase = #False
    *f\numeric = #False
    *f\password = #False
    *f\readOnly = #False
    *f\upperCase = #False
    If flags & #PB_String_LowerCase = #PB_String_LowerCase
      *f\lowerCase = #True
    EndIf
    If flags & #PB_String_UpperCase = #PB_String_UpperCase
      *f\upperCase = #True
    EndIf
    If flags & #PB_String_Numeric = #PB_String_Numeric
      *f\numeric = #True
    EndIf
    If flags & #PB_String_Password = #PB_String_Password
      *f\password = #True
    EndIf
    If flags & #PB_String_BorderLess = #PB_String_BorderLess
      *f\borderLess = #True
    EndIf
  EndWith
EndProcedure
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETSTRING_build(*this._gadgetString)
  With *this
    Protected xml.s = "<string id='#PB_Any' name='"+*this+"' text="+Chr(34)+\value+Chr(34)
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

Procedure GADGETSTRING_makeId(*this._gadgetString,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    BindGadgetEvent(\id,@GADGETSTRING_eventChange())
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure.s GADGETSTRING_getValue(*this._gadgetString)
  With *this
    ProcedureReturn \value
  EndWith
EndProcedure

Procedure GADGETSTRING_getChangeListener(*this._gadgetString)
  With *this
    ProcedureReturn \eventChangeListener
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETSTRING_setValue(*this._gadgetString,value.s)
  With *this
    \value = value
    If IsGadget(\id)
      SetGadgetText(\id,\value)
    EndIf
  EndWith
EndProcedure

Procedure GADGETSTRING_setChangeListener(*this._gadgetString,*listener)
  With *this
    \eventChangeListener = *listener
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newStringGadget(value.s = "")
  Protected *this._gadgetString = AllocateStructure(_gadgetString)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetString - ?S_gadgetString
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetString,\methods + mothenL,ClassL)
    \flag = newGadgetStringFlags()
    \value = value
    \build = @GADGETSTRING_build()
    \makeId = @GADGETSTRING_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 113
; Folding = AA+
; EnableXP