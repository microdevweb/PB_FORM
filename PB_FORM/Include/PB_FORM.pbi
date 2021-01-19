;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; PROTOTYPES OF CLASS
;*********************************************************************************************************************************************
DeclareModule PB_FORM
  Interface Listener
    ;{ GETTERS
    getCallback()
    ;}
    ;{ SETTERS
    setCallback(callback)
    ;}
  EndInterface
  Interface FormFlag
    ;{ GETTERS
    isSystemMenu()
    isMinimizeGadget()
    isMaximizeGadget()
    isSizeGadget()
    isInvisible()
    isTitleBar()
    isBorderLess()
    isScreenCentered()
    isWindowCentered()
    isMaximized()
    isMinimized()
    isNoGadget()
    isNoActivated()
    ;}
    ;{ SETTERS
    setSystemMenu(state.b)
    setMinimizeGadget(state.b)
    setMaximizeGadget(state.b)
    setSizeGadget(state.b)
    setInvisible(state.b)
    setTitleBar(state.b)
    setBorderLess(state.b)
    setScreenCentered(state.b)
    setWindowCentered(state.b)
    setMaximized(state.b)
    setMinimized(state.b)
    setNoGadget(state.b)
    setNoActivated(state.b)
    ;}
  EndInterface
  Interface Sizes
    ;{ GETTERS
    getWidth()
    getHeight()
    getMaxWidth()
    getMaxHeight()
    getMinWidth()
    getMinHeight()
    ;}
    ;{ SETTERS
    setWidth(w)
    setHeighth()
    setMaxWidth(w)
    setMaxHeight(h)
    setMinWidth(w)
    setMinHeight(h)
    ;}
  EndInterface
  Interface Position
    ;{ GETTERS
    getPosX()
    getPosY()
    ;}
    ;{ SETTERS
    setPosX(x)
    setPosY(y)
    ;}
  EndInterface
  Interface Menu
    addMenuTitle(menuTitle)
  EndInterface
  Interface MenuTitle
    ;{ GETTERS
    getTitle.s()
    ;}
    ;{ SETTERS
    setTitle(title.s)
    ;}
    ;{ PUBLIC METHODS
    addItem(item)
    ;}
  EndInterface
  Interface MenuTextItem
    ;{ GETTERS
    getTitle.s()
    getlistener()
    ;}
    ;{ SETTERS
    setTitle(title.s)
    ;}
    ;{ PUBLIC METHODS
    setShortCut(shortcut)
    ;}
  EndInterface
  Interface Form
    ;{ GETTERS
    getFlag()
    getSize()
    getPosition()
    getTitle.s()
    isMainForm()
    getID()
    ;}
    ;{ SETTERS
    setTitle(title.s)
    setMainForm(state.b)
    setMainLayout(layout)
    ;}
    ;{ PUBLIC METHODS
    open(motherWindow = 0)
    close()
    addCloseListener(listener)
    addSizeListener(listener)
    setMenu(menu)
    free()
    ;}
  EndInterface
  Interface ShortCut
    ;{ GETTERS
    getKeys() 
    getHelpText.s()
    ;}
    ;{ SETTERS
    setKeys(keys)
    setHelpText(text.s)
    ;}
  EndInterface
  Interface Margins
    ;{ GETTERS
    getRight()
    getLeft()
    getTop()
    getBotom()
    ;}
    ;{ SETTERS
    setRight(value)
    setLeft(value)
    setTop(value)
    setBotom(value)
    ;}
  EndInterface
  Interface Paddings
    ;{ GETTERS
    getRight()
    getLeft()
    getTop()
    getBotom()
    ;}
    ;{ SETTERS
    setRight(value)
    setLeft(value)
    setTop(value)
    setBotom(value)
    ;}
  EndInterface
  Interface __Layout
    ;{ GETTERS
    getSpace()
    getMargins()
    getPaddings()
    ;}
    ;{ SETTERS
    setSpace(space)
    ;}
    ;{ PUBLIC METHODS
    addContent(content)
    ;}
  EndInterface
  Interface VLayout Extends __Layout
    
  EndInterface
  
  Declare newForm(x,y,w,h,title.s)
  Declare newListener(*callack)
  Declare newTextMenu()
  Declare newMenuTitle(title.s)
  Declare newMenuTextItem(title.s,*listener)
  Declare newMenuItemBar()
  Declare newShortCut(keys.i,helpText.s = "")
  Declare newVLayout()
EndDeclareModule
XIncludeFile "../Src/_PB_FORM.pbi"

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 189
; FirstLine = 59
; Folding = BAAQ0--
; EnableXP