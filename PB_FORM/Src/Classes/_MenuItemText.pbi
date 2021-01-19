;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS MenuItemText SOURCE CODE
;*********************************************************************************************************************************************
;- MENU item TEXT SRC
;{
;{ PROTECTED ABSTRACT METHODS
Procedure ITEM_TEXT_build(*this._menuText,*parent._menu)
  With *this
    
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newTextItem(title.s,*listener)
  Protected *this._menuText = AllocateStructure(_menuText)
  With *this
    \methods = S_menuText
    \build = @ITEM_TEXT_build()
  EndWith
EndProcedure
;}

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 15
; Folding = -
; EnableXP