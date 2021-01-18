;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; PROTOTYPES OF CLASS
;*********************************************************************************************************************************************
DeclareModule PB_FORM
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
  Interface Form
    ;{ GETTERS
    getFlag()
    getSize()
    getPosition()
    getTitle.s()
    isMainForm()
    ;}
    ;{ SETTERS
    setTitle(title.s)
    setMainForm(state.b)
    ;}
    ;{ PUBLIC METHODS
    open(motherWindow = 0)
    close()
    ;}
  EndInterface
  
  Declare newForm(x,y,w,h,title.s)
  
EndDeclareModule
XIncludeFile "../Src/_PB_FORM.pbi"

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 78
; FirstLine = 24
; Folding = 0--
; EnableXP