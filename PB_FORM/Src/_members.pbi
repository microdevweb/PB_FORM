;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; MEMBERS SOURCE CODE
;*********************************************************************************************************************************************
;- Prototypes
  Prototype p_flag_get(*this,*parent)
  Prototype p_listener_callback(*parent)
  Prototype p_menu_build(*this,*parent)
  ;- Listener Class
  Structure _listener
    *methods
    *callback.p_listener_callback
  EndStructure
  ;- Flag Class ABSTRACT
  Structure _flag
    *methods
    get.p_flag_get
  EndStructure
  ;- FormFlag Class extends of Flag
  Structure _FormFlag Extends _flag
    sytemMenu.b
    minizeGadget.b
    maximizeGadget.b
    sizeGadget.b
    invisible.b
    titleBar.b
    borderLess.b
    screenCentered.b
    windowCentered.b
    maximize.b
    minimize.b
    noGadget.b
    noActivate.b
  EndStructure
  ;- Size Class 
  Structure _size
    *methods
    widht.i
    height.i
    maxWidht.i
    maxHeight.i
    minWidht.i
    minHeight.i
  EndStructure
  ;- Position Class
  Structure _position
    *methods
    posX.i
    posY.i
  EndStructure
  ;- Form Class
  Structure _form 
    *methods
    id.i
    *size._size
    *position._position
    *flag._FormFlag
    mainForm.b
    title.s
    List *closeListener._listener()
    List *sizeListener._listener()
    *menu._menu
  EndStructure
   ;- Shortcut Class
  Structure _shortCut
    *methods
    keys.i
    helpText.s
  EndStructure
  ;- MenuItem ABSTRACT Class
  Structure _menuItem
    *methods
    *listener._listener
    id.i
    *shortCut._shortCut
    build.p_menu_build
  EndStructure
  ;- MenuBar extens menuItem
  Structure _menuBar Extends _menuItem
    
  EndStructure
  ;- MenuText extends menuItem
  Structure _menuText Extends _menuItem
    title.s
  EndStructure
  ;- MenuImage extends  menuText
  Structure _menuImage Extends _menuText
    imageId.i
  EndStructure
  ;- MenuTitle Class
  Structure _menuTitle
    *methods
    title.s
    build.p_menu_build
    List *items._menuItem()
  EndStructure
  ;- Menu ABSTRACT Class
  Structure _menu
    *methods
    id.i
    windowId.i
    build.p_menu_build
    List *titles._menuTitle()
  EndStructure
  
  
  
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 77
; FirstLine = 66
; Folding = ---
; EnableXP