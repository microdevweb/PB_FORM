;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetDateFlags   SOURCE CODE extends of Flags
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETDATEFLAGS_get(*this._gadgetDateFlags)
  With *this
    Protected flags.s
    If \upDown
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Date_UpDown"
    EndIf
    If \ckeckBox
      If Len(flags):flags+"|":EndIf
      flags +"#PB_Date_CheckBox"
    EndIf
    ProcedureReturn flags
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure GADGETDATEFLAGS_isUpDown(*this._gadgetDateFlags)
  With *this
    ProcedureReturn \upDown
  EndWith
EndProcedure

Procedure GADGETDATEFLAGS_isCheckBox(*this._gadgetDateFlags)
  With *this
    ProcedureReturn \ckeckBox
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure GADGETDATEFLAGS_setUpDown(*this._gadgetDateFlags,state.b)
  With *this
     \upDown = state
  EndWith
EndProcedure

Procedure GADGETDATEFLAGS_setCheckBox(*this._gadgetDateFlags,state.b)
  With *this
     \ckeckBox = state
  EndWith
EndProcedure
 
;}
; PROTECTED CONSTRUCTOR
Procedure newGadgetDateFlags()
  Protected *this._gadgetDateFlags = AllocateStructure(_gadgetDateFlags)
  With *this
    \methods = ?S_DATEFLAGS
    \get = @GADGETDATEFLAGS_get()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 55
; Folding = B9
; EnableXP