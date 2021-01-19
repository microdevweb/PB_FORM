;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS FormFlag SOURCE CODE
;*********************************************************************************************************************************************
;- FormFlag SRC
;{
;{ GETTERS
Procedure FORM_FLAG_isSystemMenu(*this._FormFlag)
  With *this
    ProcedureReturn \sytemMenu
  EndWith
EndProcedure
Procedure FORM_FLAG_isMinimizeGadget(*this._FormFlag)
  With *this
    ProcedureReturn \minizeGadget
  EndWith
EndProcedure
Procedure FORM_FLAG_isMaximizeGadget(*this._FormFlag)
  With *this
    ProcedureReturn \maximizeGadget
  EndWith
EndProcedure
Procedure FORM_FLAG_isSizeGadget(*this._FormFlag)
  With *this
    ProcedureReturn \sizeGadget
  EndWith
EndProcedure
Procedure FORM_FLAG_isInvisible(*this._FormFlag)
  With *this
    ProcedureReturn \invisible
  EndWith
EndProcedure
Procedure FORM_FLAG_isTitleBar(*this._FormFlag)
  With *this
    ProcedureReturn \titleBar
  EndWith
EndProcedure
Procedure FORM_FLAG_isBorderLess(*this._FormFlag)
  With *this
    ProcedureReturn \borderLess
  EndWith
EndProcedure
Procedure FORM_FLAG_isScreenCentered(*this._FormFlag)
  With *this
    ProcedureReturn \screenCentered
  EndWith
EndProcedure
Procedure FORM_FLAG_isWindowCentered(*this._FormFlag)
  With *this
    ProcedureReturn \windowCentered
  EndWith
EndProcedure
Procedure FORM_FLAG_isMaximized(*this._FormFlag)
  With *this
    ProcedureReturn \maximize
  EndWith
EndProcedure
Procedure FORM_FLAG_isMinimized(*this._FormFlag)
  With *this
    ProcedureReturn \minimize
  EndWith
EndProcedure
Procedure FORM_FLAG_isNoGadget(*this._FormFlag)
  With *this
    ProcedureReturn \noGadget
  EndWith
EndProcedure
Procedure FORM_FLAG_isNoActivated(*this._FormFlag)
  With *this
    ProcedureReturn \noActivate
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure FORM_FLAG_setSystemMenu(*this._FormFlag,state.b)
  With *this
    \sytemMenu = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setMinimizeGadget(*this._FormFlag,state.b)
  With *this
    \minizeGadget = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setMaximizeGadget(*this._FormFlag,state.b)
  With *this
    \maximizeGadget = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setSizeGadget(*this._FormFlag,state.b)
  With *this
    \sizeGadget = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setInvisible(*this._FormFlag,state.b)
  With *this
    \invisible = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setTitleBar(*this._FormFlag,state.b)
  With *this
    \titleBar = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setBorderLess(*this._FormFlag,state.b)
  With *this
    \borderLess = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setScreenCentered(*this._FormFlag,state.b)
  With *this
    \screenCentered = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setWindowCentered(*this._FormFlag,state.b)
  With *this
    \windowCentered = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setMaximized(*this._FormFlag,state.b)
  With *this
    \maximize = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setMinimized(*this._FormFlag,state.b)
  With *this
    \minimize = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setNoGadget(*this._FormFlag,state.b)
  With *this
    \noGadget = state
  EndWith
EndProcedure
Procedure FORM_FLAG_setNoActivated(*this._FormFlag,state.b)
  With *this
    \noActivate = state
  EndWith
EndProcedure
;}
;{ PEOTECTED ABSTRACT METHODS
Procedure FORM_FLAG_get(*this._FormFlag,*parent._form)
  With *this
    Protected flag
    If \sytemMenu
      flag | #PB_Window_SystemMenu
    EndIf
    If \screenCentered
      flag | #PB_Window_ScreenCentered
    EndIf
    If \windowCentered
      flag | #PB_Window_WindowCentered
    EndIf
    If \sizeGadget
      flag | #PB_Window_SizeGadget
    EndIf
    If \maximize
      flag | #PB_Window_Maximize
    EndIf
    If \minimize
      flag | #PB_Window_Minimize
    EndIf
    If \maximizeGadget
      flag | #PB_Window_MaximizeGadget
    EndIf
    If \minizeGadget
      flag | #PB_Window_MinimizeGadget
    EndIf
    If \titleBar
      flag | #PB_Window_TitleBar
    EndIf
    If \invisible
      flag | #PB_Window_Invisible
    EndIf
    If \noGadget
      flag | #PB_Window_NoGadgets
    EndIf
    If \noActivate
      flag | #PB_Window_NoActivate
    EndIf
    ProcedureReturn flag
  EndWith
EndProcedure
;}
; PROTECTED CONSTRUCTOR
Procedure newFormFlag()
  Protected *this._FormFlag = AllocateStructure(_FormFlag)
  With *this
    \methods = ?s_form_flag
    ; set abstract methods address
    \get = @FORM_FLAG_get()
    ProcedureReturn *this
  EndWith
EndProcedure
;}

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 198
; Folding = ------
; EnableXP