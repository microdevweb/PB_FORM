﻿;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS Menu SOURCE CODE
;*********************************************************************************************************************************************
;- Menu SRC
;{
;{ PROTECTED ABSTRACT METHODS
Procedure TEXT_MENU_build(*this._menu,*parent._form)
  With *this
    \id = CreateMenu(#PB_Any,WindowID(*parent\id))
    \windowId = *parent\id
    ForEach \titles()
      \titles()\build(\titles(),*this)
    Next
  EndWith
EndProcedure
;}
;{ PUBLIC METHODS
Procedure MENU_addMenuTitle(*this._menu,*menuTitle)
  With *this
    AddElement(\titles())
    \titles() = *menuTitle
    ProcedureReturn *menuTitle
  EndWith
EndProcedure


;}
;{ PROTECTED METHODS
Procedure MENU_free(*this._menu)
  With *this
    ForEach \titles()
      MENU_TITLE_free(\titles())
    Next
    FreeStructure(*this)
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newTextMenu()
  Protected *this._menu = AllocateStructure(_menu)
  With *this
    \methods = ?S_menu
    \build = @TEXT_MENU_build()
    ProcedureReturn *this
  EndWith
EndProcedure
;}

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 37
; FirstLine = 12
; Folding = --
; EnableXP