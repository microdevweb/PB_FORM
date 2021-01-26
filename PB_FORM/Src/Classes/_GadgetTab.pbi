;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetTab   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure GADGETTAB_evChange()
  Protected *this._gadgetTab = GetGadgetData(EventGadget())
  With *this
    If \listener And \listener\callback
      \listener\callback(*this)
    EndIf
  EndWith
EndProcedure
;}

;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETTAB_build(*this._gadgetTab)
  With *this
    Protected xml.s = "<tab text="+Chr(34)+\title+Chr(34)+" name= '"+Str(*this)+"' id = '#PB_Any'>"+Chr(10)
    If \content
      xml + \content\build(\content)
    EndIf
    xml + "</tab>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

Procedure GADGETTAB_makeId(*this._gadgetTab,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    BindGadgetEvent(\id,@GADGETTAB_evChange())
  EndWith
EndProcedure

;}
;{ GETTERS
Procedure.s GADGETTAB_getTitle(*this._gadgetTab)
  With *this
    ProcedureReturn \title
  EndWith
EndProcedure

Procedure GADGETTAB_getContent(*this._gadgetTab)
  With *this
    ProcedureReturn \content
  EndWith
EndProcedure

Procedure GADGETTAB_getListener(*this._gadgetTab)
  With *this
    ProcedureReturn \listener
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETTAB_setTitle(*this._gadgetTab,title.s)
  With *this
    \title = title
    If IsGadget(\id)
      SetGadgetText(\id,\title)
    EndIf
  EndWith
EndProcedure

Procedure GADGETTAB_setContent(*this._gadgetTab,*content)
  With *this
    \content = *content
    ProcedureReturn *content
  EndWith
EndProcedure

Procedure GADGETTAB_setListener(*this._gadgetTab,*listener)
  With *this
     \listener = *listener
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newTabGadget(title.s)
  Protected *this._gadgetTab = AllocateStructure(_gadgetTab)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetTab - ?S_gadgetTab
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetTab,\methods + mothenL,ClassL)
    \title = title
    \build = @GADGETTAB_build()
    \makeId = @GADGETTAB_makeId()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 82
; FirstLine = 43
; Folding = -O-
; EnableXP