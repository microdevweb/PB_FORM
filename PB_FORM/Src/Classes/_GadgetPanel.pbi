;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetPanel   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS

;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETPANEL_build(*this._gadgetPanel)
  With *this
    Protected xml.s = "<panel name = '"+Str(*this)+"' id = '#PB_Any'>"+Chr(10)
    ForEach \myTabs()
      xml + \myTabs()\build(\myTabs())
    Next
    xml + "</panel>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

Procedure GADGETPANEL_makeId(*this._gadgetPanel,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
  EndWith
EndProcedure

;}
;{ GETTERS
Procedure GADGETPANEL_getTab(*this._gadgetPanel,Ntab)
  With *this
    If SelectElement(\myTabs(),Ntab)
      ProcedureReturn \myTabs()
    EndIf
    ProcedureReturn 0
  EndWith
EndProcedure
;}
;{ PUBLIC METHODS
Procedure GADGETPANEL_addTab(*this._gadgetPanel,*tab)
  With *this
    AddElement(\myTabs())
    \myTabs() = *tab
    ProcedureReturn *tab
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newGadgetPanel()
  Protected *this._gadgetPanel = AllocateStructure(_gadgetPanel)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetPanel - ?S_gadgetPanel
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetPanel,\methods + mothenL,ClassL)
    
    \build = @GADGETPANEL_build()
    \makeId = @GADGETPANEL_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 61
; FirstLine = 40
; Folding = --
; EnableXP