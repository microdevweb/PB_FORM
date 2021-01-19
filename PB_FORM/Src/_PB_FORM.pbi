;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; SOURCE CODE
;*********************************************************************************************************************************************
Module PB_FORM
  ;- PRIVATE prototypes 
  Declare newSize(w,h)
  Declare newPosition(x,y)
  Declare FORM_eventClose()
  Declare FORM_eventSize()
  Declare MENU_TITLE_free(*this)
  Declare MENU_free(*this)
  Declare ITEM_TEXT_free(*this)
  
  XIncludeFile "_members.pbi"
  
  XIncludeFile "Classes/_FormFlag.pbi"
  XIncludeFile "Classes/_Size.pbi"
  XIncludeFile "Classes/_Position.pbi"
  XIncludeFile "Classes/_Form.pbi"
  XIncludeFile "Classes/_Listener.pbi"
  XIncludeFile "Classes/_Menu.pbi"
  XIncludeFile "Classes/_MenuTitle.pbi"
  XIncludeFile "Classes/_MenuItemText.pbi"
  XIncludeFile "Classes/_MenuItemBar.pbi"
  XIncludeFile "Classes/_ShortCut.pbi"
  
  XIncludeFile "_datasection.pbi"
  
  
EndModule
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 14
; Folding = -
; EnableXP