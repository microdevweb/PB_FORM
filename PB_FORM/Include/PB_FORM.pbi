;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; PROTOTYPES OF CLASS
;*********************************************************************************************************************************************
DeclareModule FORM
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
  Interface CanvasFlags
    ;{ GETTERS
    isBorder()
    isKeyboard()
    isDrawFocus()
    isContainer()
    ;}
    ;{ SETTERS
    setBorder(state.b)
    setKeyboard(state.b)
    setDrawFocus(state.b)
    setContainer(state.b)
    ;}
  EndInterface
  Interface TextFlags
    ;{ GETTERS
    isCenter()
    isRight()
    isBorder()
    ;}
    ;{ SETTERS
    setCenter(state.b)
    setRight(state.b)
    setBorder(state.b)
    ;}
  EndInterface
  Interface SpinFlags
    ;{ GETTERS
    isReadOnly()
    isNumeric()
    ;}
    ;{ SETTERS
    setReadOnly(state.b)
    setNumeric(state.b)
    ;}
  EndInterface
  Interface DateFlags
    ;{ GETTERS
    isUpDown()
    isCheckBox()
    ;}
    ;{ SETTERS
    setUpDown(state.b)
    setCheckBox(state.b)
    ;}
  EndInterface
  Interface TrackBarFlags
    ;{ GETTERS
    isTicks()
    isVertical()
    ;}
    ;{ SETTERS
    setTicks(state.b)
    setVertical(state.b)
    ;}
  EndInterface
  Interface CheckBoxFlags
    ;{ GETTERS
    isRight()
    isCenter()
    isThreeState()
    ;}
    ;{ SETTERS
    setRight(state.b)
    setCenter(state.b)
    setThreeState(state.b)
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
  
  Interface __Layout
    ;{ GETTERS
    getSpace()
    getExpand()
    getAlignement()
    getSizes()
    getFont()
    ;}
    ;{ SETTERS
    setSpace(space)
    setExpand(expand)
    setAlignement(alignement)
    setFont(font)
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
    ;{ GETTERS
    getSizes()
    getFlags()
    getId()
    getFont()
    getBackgroundColor()
    getFrontColor()
    ;}
    ;{ SETTERS
    setSizes(width,height)
    setFont(font)
    setBackgroundColor(color)
    setFrontColor(color)
    ;}
  EndInterface
  Interface Button_gadget Extends __Gadget
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
  Interface String_gadget Extends __Gadget
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
  Interface Frame_gadget Extends __Gadget
    ;{ GETTERS
    getContent()
    ;}
    ;{ SETTERS
    setContent(content)
    ;}
  EndInterface
  Interface Custom_gadget Extends __Gadget
    setFlags(flags)
  EndInterface 
  Interface Text_gadget Extends __Gadget
    ;{ GETTERS
    getTitle.s()
    ;}
    ;{ SETTERS
    setTitle(title.s)
    setFlags(flag)
    ;}
  EndInterface 
  Interface Spin_gadget Extends __Gadget
    ;{ GETTERS
    getValue()
    getminimumValue()
    getmaximuValue()
    getListener()
    ;}
    ;{ SETTERS
    setValue(value)
    setminimumValue(value)
    setmaximuValue(value)
    setFlags(flags)
    setListener(listener)
    ;}
  EndInterface 
  Interface Panel_gadget Extends __Gadget
    ;{ GETTERS
    getTab(nTab)
    ;}
    ;{ PUBLIC METHODS
    addTab(tab)
    ;}
  EndInterface 
  Interface Tab_gadget Extends __Gadget
    ;{ GETTERS
    getTitle.s()
    getContent()
    getListener()
    ;}
    ;{ SETTERS
    setTitle(title.s)
    setContent(content)
    setListener(listener)
    ;}
  EndInterface 
  Interface Date_gadget Extends __Gadget
    ;{ GETTERS
    getValue()
    getMask.s()
    getListener()
    ;}
    ;{ SETTERS
    setValue(value)
    setMask(mask.s)
    setFlags(flags)
    setListener(listener)
    ;}
  EndInterface  
  Interface TrackBar_gadget Extends __Gadget
    ;{ GETTERS
    getValue()
    getMin()
    getMax()
    getListener()
    ;}
    ;{ SETTERS
    setValue(value)
    setMin(min)
    setMax(max)
    setFlags(flags)
    setListener(listener)
    ;}
  EndInterface
  Interface CheckBox_gadget Extends __Gadget
    ;{ GETTERS
    getState()
    getTitle.s()
    getListener()
    ;}
    ;{ SETTERS
    setState(state)
    setTitle(title.s)
    setListener(listener)
    setFlags(flags)
    ;}
  EndInterface
  Interface Option_gadget Extends __Gadget
    ;{ GETTERS
    getState()
    getTitle.s()
    getListener()
    ;}
    ;{ SETTERS
    setState(state.b)
    setTitle(title.s)
    setListener(listener)
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
  
  Declare newButtonGadget(title.s,*ClickListener)
  Declare newStringGadget(value.s = "")
  Declare newFrameGadget(title.s)
  Declare newCustomGadget(*build,*event)
  Declare newTextGadget(title.s)
  Declare newSpinGadget(minimum,maximum)
  Declare newPanelGadget()
  Declare newTabGadget(title.s)
  Declare newDateGadget(mask.s,value)
  Declare newTrackBarGadget(min,max,value)
  Declare newCheckBoxGadget(title.s,state = #PB_Checkbox_Unchecked)
  Declare newOptionGadget(title.s,group,state = #False)
  Declare newEmpty()
EndDeclareModule
XIncludeFile "../Src/_PB_FORM.pbi"

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 434
; FirstLine = 62
; Folding = BAAAAOAAAAAAAAA5-
; EnableXP