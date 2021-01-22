;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; PROTOTYPES OF CLASS
;*********************************************************************************************************************************************
DeclareModule PB_FORM
  #LAYOUT_EXPAND_YES   = -1
  #LAYOUT_EXPAND_NO    = -2
  #LAYOUT_EXPAND_EQUAL = -3
  Enumeration  
    #ALIGN_TOP
    #ALIGN_CENTER
    #ALIGN_BOTTOM
    #ALIGN_LEFT
    #ALIGN_RIGHT
  EndEnumeration
  
  Interface Listener
    ;{ GETTERS
    getCallback()
    ;}
    ;{ SETTERS
    setCallback(callback)
    ;}
  EndInterface
  Interface FormFlags
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
  Interface ButtonFlags
    ;{ GETTERS
    isDefault()
    isRight()
    isLeft()
    isMultiLine()
    isToogle()
    ;}
    ;{ SETTERS
    setDefault(state.b)
    setRight(state.b)
    setLeft(state.b)
    setMultiLine(state.b)
    setToogle(state.b)
  ;}
  EndInterface
  Interface StringFlags
    ;{ GETTERS
    isNumeric()
    isPassword()
    isReadOnly()
    isLowerCase()
    isUpperCase()
    isBorderLess()
    ;}
    ;{ SETTERS
    setNumeric(state.b)
    setPassword(state.b)
    setReadOnly(state.b)
    setLowerCase(state.b)
    setUpperCase(state.b)
    setBorderLess(state.b)
    ;}
  EndInterface
  Interface FrameFlags
    ;{ GETTERS
    isSingle()
    isDouble()
    isFlat()
    ;}
    ;{ SETTERS
    setSingle(state.b)
    setDouble(state.b)
    setFlat(state.b)
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
    setHeight(h)
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
    setFlags(flags)
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
    getExpand()
    getAlignement()
    getSizes()
    ;}
    ;{ SETTERS
    setSpace(space)
    setExpand(expand)
    setAlignement(alignement)
    ;}
    ;{ PUBLIC METHODS
    addContent(content)
    ;}
  EndInterface
  Interface VLayout Extends __Layout
    
  EndInterface
  Interface HLayout Extends __Layout
    
  EndInterface
  Interface __Gadget
    getSizes()
    getFlags()
    setSizes(width,height)
  EndInterface
  Interface GadgetButton Extends __Gadget
    ;{ GETTERS
    getTitle.s()
    getShortcut()
    ;}
    ;{ SETTERS
    setTitle(title.s)
    setShortcut(shortcut)
    setFlags(flags)
    ;}
  EndInterface
  Interface GadgetString Extends __Gadget
    ;{ GETTERS
    getValue.s()
    getChangeListener()
    ;}
    ;{ SETTERS
    setValue(value.s)
    setChangeListener(listener)
    setFlags(flags)
    ;}
  EndInterface 
  Interface GadgetFrame Extends __Gadget
    ;{ GETTERS
    getContent()
    ;}
    ;{ SETTERS
    setContent(content)
    ;}
  EndInterface
  Interface Empty Extends __Gadget
    
  EndInterface
  
  Declare newForm(x,y,w,h,title.s)
  Declare newListener(*callack)
  Declare newTextMenu()
  Declare newMenuTitle(title.s)
  Declare newMenuTextItem(title.s,*listener)
  Declare newMenuItemBar()
  Declare newShortCut(keys.i,helpText.s = "")
  Declare newVLayout()
  Declare newHLayout()
  Declare newGadgetButton(title.s,*ClickListener)
  Declare newGadgetString(value.s = "")
  Declare newGadgetFrame(title.s)
  Declare newEmpty()
EndDeclareModule
XIncludeFile "../Src/_PB_FORM.pbi"

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 275
; FirstLine = 42
; Folding = BAOAAIAAg9-
; EnableXP