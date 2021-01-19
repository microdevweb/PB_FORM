﻿;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; datasection SOURCE CODE
;*********************************************************************************************************************************************
;- FormFlag address
DataSection
  s_form_flag:
  ;{ GETTERS
  Data.i @FORM_FLAG_isSystemMenu()
  Data.i @FORM_FLAG_isMinimizeGadget()
  Data.i @FORM_FLAG_isMaximizeGadget()
  Data.i @FORM_FLAG_isSizeGadget()
  Data.i @FORM_FLAG_isInvisible()
  Data.i @FORM_FLAG_isTitleBar()
  Data.i @FORM_FLAG_isBorderLess()
  Data.i @FORM_FLAG_isScreenCentered()
  Data.i @FORM_FLAG_isWindowCentered()
  Data.i @FORM_FLAG_isMaximized()
  Data.i @FORM_FLAG_isMinimized()
  Data.i @FORM_FLAG_isNoGadget()
  Data.i @FORM_FLAG_isNoActivated()
  ;}
  ;{ SETTERS
  Data.i @FORM_FLAG_setSystemMenu()
  Data.i @FORM_FLAG_setMinimizeGadget()
  Data.i @FORM_FLAG_setMaximizeGadget()
  Data.i @FORM_FLAG_setSizeGadget()
  Data.i @FORM_FLAG_setInvisible()
  Data.i @FORM_FLAG_setTitleBar()
  Data.i @FORM_FLAG_setBorderLess()
  Data.i @FORM_FLAG_setScreenCentered()
  Data.i @FORM_FLAG_setWindowCentered()
  Data.i @FORM_FLAG_setMaximized()
  Data.i @FORM_FLAG_setMinimized()
  Data.i @FORM_FLAG_setNoGadget()
  Data.i @FORM_FLAG_setNoActivated()
  ;}
  e_form_flag:
EndDataSection

;- Position address
DataSection
  S_position:
  ;{ GETTERS
  Data.i @POSITION_getPosX()
  Data.i @POSITION_getPosY()
  ;}
  ;{ SETTERS
  Data.i @POSITION_setPosX()
  Data.i @POSITION_setPosY()
  ;}
  E_position:
EndDataSection

;- Size address
DataSection
  S_size:
  ;{ GETTERS
  Data.i @getWidth()
  Data.i @getHeight()
  Data.i @getMaxWidth()
  Data.i @getMaxHeight()
  Data.i @getMinWidth()
  Data.i @getMinHeight()
  ;}
  ;{ SETTERS
  Data.i @setWidth()
  Data.i @setHeight()
  Data.i @setMaxWidth()
  Data.i @setMaxHeight()
  Data.i @setMinWidth()
  Data.i @setMinHeight()
  ;}
  E_size:
EndDataSection

;- Form address
DataSection
  S_form:
  ;{ GETTERS
  Data.i @FORM_getFlag()
  Data.i @FORM_getSize()
  Data.i @FORM_getPosition()
  Data.i @FORM_getTitle()
  Data.i @FORM_isMainForm()
  Data.i @FORM_getID()
  ;}
  ;{ SETTERS
  Data.i @FORM_setTitle()
  Data.i @FORM_setMainForm()
  ;}
  ;{ PUBLIC METHODS
  Data.i @FORM_open()
  Data.i @FORM_close()
  Data.i @FORM_addCloseListener()
  Data.i @FORM_addSizeListener()
  Data.i @FORM_setMenu()
  Data.i @FORM_free()
  ;}
  E_form:
EndDataSection

;-Listener address
DataSection
  S_listener:
  ;{ GETTERS
  Data.i @LISTENER_getCallback()
  ;}
  ;{ SETTERS
  Data.i @LISTENER_setCallback()
  ;}
  E_listener:
EndDataSection

;- Menu address
DataSection
  S_menu:
  Data.i @MENU_addMenuTitle()
  E_menu:
EndDataSection
;- MenuTitle address
DataSection
  S_menuTitle:
  ;{ GETTERS
  Data.i @MENU_TITLE_getTitle()
  ;}
  ;{ SETTERS
  Data.i @MENU_TITLE_setTitle()
  ;}
  ;{ PUBLIC METHODS
  Data.i @MENU_TITLE_addItem()
  ;}
  E_menuTitle:
EndDataSection

;- Menu text address
DataSection
  S_menuText:
  
  E_menuText:
EndDataSection
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 143
; Folding = ----
; EnableXP