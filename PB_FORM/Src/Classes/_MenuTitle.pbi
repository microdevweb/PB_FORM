;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS MenuTitle SOURCE CODE
;*********************************************************************************************************************************************
;- MENU_TITLE SRC
;{
;{ PROTECTED ABSTRACT METHODS
Procedure MENU_TITLE_build(*this._menuTitle,*parent._menu)
  With *this
    MenuTitle(\title)
    ForEach \items()
      \items()\build(\items(),*parent)
    Next
  EndWith
EndProcedure
;}
;{ PROTECTED METHODS
Procedure MENU_TITLE_free(*this._menuTitle)
  With *this
    ForEach \items()
      ITEM_TEXT_free(\items())
    Next
    FreeStructure(*this)
  EndWith
EndProcedure
;}
;{ GETTERS
Procedure.s MENU_TITLE_getTitle(*this._menuTitle)
  With *this
    ProcedureReturn \title
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure MENU_TITLE_setTitle(*this._menuTitle,title.s)
  With *this
    \title = title
  EndWith
EndProcedure
;}
;{ PUBLIC METHODS
Procedure MENU_TITLE_addItem(*this._menuTitle,*item)
  With *this
    AddElement(\items())
    \items() = *item
    ProcedureReturn \items()
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newMenuTitle(title.s)
  Protected *this._menuTitle = AllocateStructure(_menuTitle)
  With *this
    \methods = ?S_menuTitle
    \title = title
    \build = @MENU_TITLE_build()
    ProcedureReturn *this
  EndWith
EndProcedure
;}

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 25
; FirstLine = 5
; Folding = ---
; EnableXP