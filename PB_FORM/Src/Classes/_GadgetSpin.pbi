;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetSpin   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure GADGETSPIN_evChange()
  Protected *this._gadgetSpin = GetGadgetData(EventGadget())
  With *this
    \value = GetGadgetState(\id)
    SetGadgetText(\id,Str(\value))
    If \listener And \listener\callback
      \listener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETSPIN_build(*this._gadgetSpin)
  With *this
    Protected xml.s = "<spin id='#PB_Any' name='"+*this+"'"
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

Procedure GADGETSPIN_makeId(*this._gadgetSpin,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    SetGadgetState(\id,\value)
    SetGadgetText(\id,Str(\value))
    BindGadgetEvent(\id,@GADGETSPIN_evChange())
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETSPIN_getValue(*this._gadgetSpin)
  With *this
    ProcedureReturn \value
  EndWith
EndProcedure

Procedure GADGETSPIN_getminimumValue(*this._gadgetSpin)
  With *this
    ProcedureReturn \min
  EndWith
EndProcedure

Procedure GADGETSPIN_getmaximuValue(*this._gadgetSpin)
  With *this
    ProcedureReturn \max
  EndWith
EndProcedure

Procedure GADGETSPIN_getListener(*this._gadgetSpin)
  With *this
    ProcedureReturn \listener
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETSPIN_setValue(*this._gadgetSpin,value)
  With *this
    \value = value
    If IsGadget(\id)
      SetGadgetText(\id,Str(\value))
      SetGadgetState(\id,\value)
    EndIf
  EndWith
EndProcedure

Procedure GADGETSPIN_setminimumValue(*this._gadgetSpin,value)
  With *this
    \min = value
    If IsGadget(\id)
      SetGadgetAttribute(\id,#PB_Spin_Minimum,\min)
    EndIf
  EndWith
EndProcedure

Procedure GADGETSPIN_setmaximuValue(*this._gadgetSpin,value)
  With *this
    \max = value
    If IsGadget(\id)
      SetGadgetAttribute(\id,#PB_Spin_Maximum,\max)
    EndIf
  EndWith
EndProcedure

Procedure GADGETSPIN_setFlags(*this._gadgetSpin,flags)
  With *this
    Protected *f._gadgetSpinFlags = \flag
    *f\numeric = #False
    *f\readOnly = #False
    If flags & #PB_Spin_ReadOnly = #PB_Spin_ReadOnly
      *f\readOnly = #True
    EndIf
    If flags & #PB_Spin_Numeric = #PB_Spin_Numeric
      *f\numeric = #True
    EndIf
  EndWith
EndProcedure

Procedure GADGETSPIN_setListener(*this._gadgetSpin,*listener)
  With *this
    \listener = *listener
    ProcedureReturn *listener
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newSpinGadget(minimum,maximum)
  Protected *this._gadgetSpin = AllocateStructure(_gadgetSpin)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetSpin - ?S_gadgetSpin
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetSpin,\methods + mothenL,ClassL)
    \flag = newGadgetSpinFlags()
    \min = minimum
    \max = maximum
    \build = @GADGETSPIN_build()
    \makeId = @GADGETSPIN_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 137
; Folding = AAw
; EnableXP