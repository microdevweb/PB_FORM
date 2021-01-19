;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS MenuItemBar SOURCE CODE
;*********************************************************************************************************************************************
Procedure MENU_BAR_build(*this._menuBar,*parent._menu)
  With *this
    MenuBar()
  EndWith
EndProcedure

Procedure newMenuItemBar()
  Protected *this._menuBar = AllocateStructure(_menuBar)
  With *this
    \build = @MENU_BAR_build()
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 17
; Folding = -
; EnableXP