;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetDate   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure GADGETDATE_evChange()
  Protected *this._gadgetDate = GetGadgetData(EventGadget())
  With *this
    \value = GetGadgetState(\id)
    If \listener And \listener\callback
      \listener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETDATE_build(*this._gadgetDate)
  With *this
    Protected xml.s = "<date id='#PB_Any' name='"+*this+"' text='"+\mask+"'"
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

Procedure GADGETDATE_makeId(*this._gadgetDate,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    SetGadgetState(\id,\value)
    
    BindGadgetEvent(\id,@GADGETDATE_evChange())
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETDATE_getValue(*this._gadgetDate)
  With *this
    ProcedureReturn \value
  EndWith
EndProcedure

Procedure.s GADGETDATE_getMask(*this._gadgetDate)
  With *this
    ProcedureReturn \mask
  EndWith
EndProcedure

Procedure GADGETDATE_getListener(*this._gadgetDate)
  With *this
    ProcedureReturn \listener
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETDATE_setValue(*this._gadgetDate,value)
  With *this
    \value = value
    If IsGadget(\id)
      SetGadgetState(\id,\value)
    EndIf
  EndWith
EndProcedure

Procedure GADGETDATE_setMask(*this._gadgetDate,mask.s)
  With *this
     \mask = mask
  EndWith
EndProcedure

Procedure GADGETDATE_setFlags(*this._gadgetDate,flags)
  With *this
    Protected *f._gadgetDateFlags = \flag
    *f\upDown = #False
    *f\ckeckBox = #False
    If flags & #PB_Date_UpDown = #PB_Date_UpDown
      *f\upDown = #True
    EndIf
    If flags & #PB_Date_CheckBox = #PB_Date_CheckBox
      *f\ckeckBox = #True
    EndIf
  EndWith
EndProcedure

Procedure GADGETDATE_setListener(*this._gadgetDate,*listener)
  With *this
    \listener = *listener
    ProcedureReturn *listener
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newDateGadget(mask.s,value)
  Protected *this._gadgetDate = AllocateStructure(_gadgetDate)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_GADGETDATE - ?S_GADGETDATE
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_GADGETDATE,\methods + mothenL,ClassL)
    \flag = newGadgetDateFlags()
    \value = value
    \mask = mask
    \build = @GADGETDATE_build()
    \makeId = @GADGETDATE_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 117
; Folding = AA5
; EnableXP