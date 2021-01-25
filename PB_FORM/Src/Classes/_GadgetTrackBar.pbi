;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetTrackBar   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure GADGETTRACKBAR_evChange()
  Protected *this._gadgetTrackBar = GetGadgetData(EventGadget())
  With *this
    \value = GetGadgetState(\id)
    If \listener And \listener\callback
      \listener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETTRACKBAR_build(*this._gadgetTrackBar)
  With *this
    Protected xml.s = "<trackbar id = '#PB_Any' name = '"+*this+"' min = '"+Str(\minimum)+"'" + " max = '"+Str(\maximum)+"'"+ " value = '"+Str(\value)+"'"
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

Procedure GADGETTRACKBAR_makeId(*this._gadgetTrackBar,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    
    BindGadgetEvent(\id,@GADGETTRACKBAR_evChange())
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETTRACKBAR_getValue(*this._gadgetTrackBar)
  With *this
    ProcedureReturn \value
  EndWith
EndProcedure

Procedure GADGETTRACKBAR_getMin(*this._gadgetTrackBar)
  With *this
    ProcedureReturn \minimum
  EndWith
EndProcedure

Procedure GADGETTRACKBAR_getMax(*this._gadgetTrackBar)
  With *this
    ProcedureReturn \maximum
  EndWith
EndProcedure

Procedure GADGETTRACKBAR_getListener(*this._gadgetTrackBar)
  With *this
    ProcedureReturn \listener
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETTRACKBAR_setValue(*this._gadgetTrackBar,value)
  With *this
    \value = value
    If IsGadget(\id)
      SetGadgetState(\id,\value)
    EndIf
  EndWith
EndProcedure

Procedure GADGETTRACKBAR_setMin(*this._gadgetTrackBar,min)
  With *this
    \minimum = min
    If IsGadget(\id)
      SetGadgetAttribute(\id,#PB_TrackBar_Minimum,\minimum)
    EndIf
  EndWith
EndProcedure

Procedure GADGETTRACKBAR_setMax(*this._gadgetTrackBar,max)
  With *this
    \maximum = max
    If IsGadget(\id)
      SetGadgetAttribute(\id,#PB_TrackBar_Maximum,\maximum)
    EndIf
  EndWith
EndProcedure

Procedure GADGETTRACKBAR_setFlags(*this._gadgetTrackBar,flags)
  With *this
    Protected *f._trackBarFlags = \flag
    *f\ticks = #False
    *f\vertical = #False
    If flags & #PB_TrackBar_Ticks = #PB_TrackBar_Ticks
      *f\ticks = #True
    EndIf
    If flags & #PB_TrackBar_Vertical = #PB_TrackBar_Vertical
      *f\vertical = #True
    EndIf
  EndWith
EndProcedure

Procedure GADGETTRACKBAR_setListener(*this._gadgetTrackBar,*listener)
  With *this
    \listener = *listener
    ProcedureReturn *listener
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newGadgetTrackBar(min,max,value)
  Protected *this._gadgetTrackBar = AllocateStructure(_gadgetTrackBar)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_GADGETTRACKBAR - ?S_GADGETTRACKBAR
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_GADGETTRACKBAR,\methods + mothenL,ClassL)
    \flag = newTrackBarFlags()
    \value = value
    \minimum = min
    \maximum = max
    \build = @GADGETTRACKBAR_build()
    \makeId = @GADGETTRACKBAR_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 9
; FirstLine = 3
; Folding = -Wg
; EnableXP