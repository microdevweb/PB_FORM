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

  XIncludeFile "_members.pbi"
  
  XIncludeFile "Classes/_FormFlag.pbi"
  XIncludeFile "Classes/_Size.pbi"
  XIncludeFile "Classes/_Position.pbi"
  XIncludeFile "Classes/_Form.pbi"
  XIncludeFile "Classes/_Listener.pbi"
  XIncludeFile "Classes/_Menu.pbi"
  XIncludeFile "Classes/_MenuTitle.pbi"
  
 
  ;- MENU TEXT SRC
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
EndModule
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 24
; FirstLine = 18
; Folding = fAAI9
; EnableXP