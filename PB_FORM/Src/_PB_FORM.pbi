;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; SOURCE CODE
;*********************************************************************************************************************************************
Module PB_FORM
  ;- PRIVATE prototypes
  
  ;{
  Declare newSize(w,h)
  Declare newPosition(x,y)
  ;}

  ;- Prototypes
  ;{
  Prototype p_flag_get(*this,*parent)
  ;}
  
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
  ;}
  ;- Form Class
  Structure _form
    *methods
    id.i
    *size._size
    *position._position
    *flag._FormFlag
    mainForm.b
    title.s
  EndStructure
  
  ;- Flag SRC

  
  ;- FormFlag SRC
  ;{
  ;{ GETTERS
  Procedure FORM_FLAG_isSystemMenu(*this._FormFlag)
    With *this
      ProcedureReturn \sytemMenu
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isMinimizeGadget(*this._FormFlag)
    With *this
      ProcedureReturn \minizeGadget
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isMaximizeGadget(*this._FormFlag)
    With *this
      ProcedureReturn \maximizeGadget
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isSizeGadget(*this._FormFlag)
    With *this
      ProcedureReturn \sizeGadget
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isInvisible(*this._FormFlag)
    With *this
      ProcedureReturn \invisible
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isTitleBar(*this._FormFlag)
    With *this
      ProcedureReturn \titleBar
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isBorderLess(*this._FormFlag)
    With *this
      ProcedureReturn \borderLess
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isScreenCentered(*this._FormFlag)
    With *this
      ProcedureReturn \screenCentered
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isWindowCentered(*this._FormFlag)
    With *this
      ProcedureReturn \windowCentered
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isMaximized(*this._FormFlag)
    With *this
      ProcedureReturn \maximize
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isMinimized(*this._FormFlag)
    With *this
      ProcedureReturn \minimize
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isNoGadget(*this._FormFlag)
    With *this
      ProcedureReturn \noGadget
    EndWith
  EndProcedure
  Procedure FORM_FLAG_isNoActivated(*this._FormFlag)
    With *this
      ProcedureReturn \noActivate
    EndWith
  EndProcedure
  ;}
  ;{ SETTERS
  Procedure FORM_FLAG_setSystemMenu(*this._FormFlag,state.b)
    With *this
      \sytemMenu = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setMinimizeGadget(*this._FormFlag,state.b)
    With *this
      \minizeGadget = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setMaximizeGadget(*this._FormFlag,state.b)
    With *this
       \maximizeGadget = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setSizeGadget(*this._FormFlag,state.b)
    With *this
       \sizeGadget = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setInvisible(*this._FormFlag,state.b)
    With *this
      \invisible = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setTitleBar(*this._FormFlag,state.b)
    With *this
      \titleBar = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setBorderLess(*this._FormFlag,state.b)
    With *this
      \borderLess = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setScreenCentered(*this._FormFlag,state.b)
    With *this
      \screenCentered = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setWindowCentered(*this._FormFlag,state.b)
    With *this
      \windowCentered = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setMaximized(*this._FormFlag,state.b)
    With *this
      \maximize = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setMinimized(*this._FormFlag,state.b)
    With *this
      \minimize = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setNoGadget(*this._FormFlag,state.b)
    With *this
      \noGadget = state
    EndWith
  EndProcedure
  Procedure FORM_FLAG_setNoActivated(*this._FormFlag,state.b)
    With *this
      \noActivate = state
    EndWith
  EndProcedure
  ;}
  ;{ PEOTECTED ABSTRACT METHODS
  Procedure FORM_FLAG_get(*this._FormFlag,*parent._form)
    With *this
      Protected flag
      If \sytemMenu
        flag | #PB_Window_SystemMenu
      EndIf
      If \screenCentered
        flag | #PB_Window_ScreenCentered
      EndIf
      If \windowCentered
        flag | #PB_Window_WindowCentered
      EndIf
      If \sizeGadget
        flag | #PB_Window_SizeGadget
      EndIf
      If \maximize
        flag | #PB_Window_Maximize
      EndIf
      If \minimize
        flag | #PB_Window_Minimize
      EndIf
      If \maximizeGadget
        flag | #PB_Window_MaximizeGadget
      EndIf
      If \minizeGadget
        flag | #PB_Window_MinimizeGadget
      EndIf
      If \titleBar
        flag | #PB_Window_TitleBar
      EndIf
      If \invisible
        flag | #PB_Window_Invisible
      EndIf
      If \noGadget
        flag | #PB_Window_NoGadgets
      EndIf
      If \noActivate
        flag | #PB_Window_NoActivate
      EndIf
      ProcedureReturn flag
    EndWith
  EndProcedure
  ;}
  ; PROTECTED CONSTRUCTOR
  Procedure newFormFlag()
    Protected *this._FormFlag = AllocateStructure(_FormFlag)
    With *this
      \methods = ?s_form_flag
      ; set abstract methods address
      \get = @FORM_FLAG_get()
      ProcedureReturn *this
    EndWith
  EndProcedure
  ;}
  
  ;- Size SRC
  ;{
  ;{ GETTERS
  Procedure getWidth(*this._size)
    With *this
      ProcedureReturn \widht
    EndWith
  EndProcedure
  Procedure getHeight(*this._size)
    With *this
      ProcedureReturn \height
    EndWith
  EndProcedure
  Procedure getMaxWidth(*this._size)
    With *this
      ProcedureReturn \maxWidht
    EndWith
  EndProcedure
  Procedure getMaxHeight(*this._size)
    With *this
      ProcedureReturn \maxHeight
    EndWith
  EndProcedure
  Procedure getMinWidth(*this._size)
    With *this
      ProcedureReturn \minWidht
    EndWith
  EndProcedure
  Procedure getMinHeight(*this._size)
    With *this
      ProcedureReturn \minHeight
    EndWith
  EndProcedure
  ;}
  ;{ SETTERS
  Procedure setWidth(*this._size,w)
    With *this
       \widht = w
    EndWith
  EndProcedure
  Procedure setHeight(*this._size,h)
    With *this
       \height = h
    EndWith
  EndProcedure
  Procedure setMaxWidth(*this._size,w)
    With *this
       \maxWidht = w
    EndWith
  EndProcedure
  Procedure setMaxHeight(*this._size,h)
    With *this
       \maxHeight = h
    EndWith
  EndProcedure
  Procedure setMinWidth(*this._size,w)
    With *this
       \minWidht = w
    EndWith
  EndProcedure
  Procedure setMinHeight(*this._size,h)
    With *this
       \minHeight = h
    EndWith
  EndProcedure
  ;}
  ; PROTECTED CONSTRUCTOR
  Procedure newSize(w,h)
    Protected *this._size = AllocateStructure(_size)
    With *this
      \methods = ?S_size
      \widht = w
      \height = h
      ProcedureReturn *this
    EndWith
  EndProcedure
  ;}
  
  ;- Position SRC
  ;{
  ;{ GETTERS
  Procedure POSITION_getPosX(*this._position)
    With *this
      ProcedureReturn \posX
    EndWith
  EndProcedure
  Procedure POSITION_getPosY(*this._position)
    With *this
      ProcedureReturn \posY
    EndWith
  EndProcedure
  ;}
  ;{ SETTERS
  Procedure POSITION_setPosX(*this._position,x)
    With *this
      \posX = x
    EndWith
  EndProcedure
  Procedure POSITION_setPosY(*this._position,y)
    With *this
      \posY = x
    EndWith
  EndProcedure
  ;}
  ; PROTECTED CONSTRUCTOR
  Procedure newPosition(x,y)
    Protected *this._position = AllocateStructure(_position)
    With *this
      \methods = ?S_position
      \posX = x
      \posY = y
      ProcedureReturn *this
    EndWith
  EndProcedure
  ;}
  
  ; Form SRC
  ;{
  ;{ GETTERS
  Procedure FORM_getFlag(*this._form)
    With *this
      ProcedureReturn \flag
    EndWith
  EndProcedure
  
  Procedure FORM_getSize(*this._form)
    With *this
      ProcedureReturn \size
    EndWith
  EndProcedure
  
  Procedure FORM_getPosition(*this._form)
    With *this
      ProcedureReturn \position
    EndWith
  EndProcedure
  
  Procedure.s FORM_getTitle(*this._form)
    With *this
      ProcedureReturn \title
    EndWith
  EndProcedure
  
  Procedure FORM_isMainForm(*this._form)
    With *this
      ProcedureReturn \mainForm
    EndWith
  EndProcedure
  ;}
  ;{ SETTERS
  Procedure.s FORM_setTitle(*this._form,title.s)
    With *this
      \title = title
    EndWith
  EndProcedure
  
  Procedure.s FORM_setMainForm(*this._form,state.b)
    With *this
       \mainForm = state
    EndWith
  EndProcedure
  ;}
  ;{ PRIVATE METHODS
  Procedure FORM_eventClose()
    Protected *this._form = GetWindowData(EventWindow())
    With *this
      CloseWindow(\id)
      If \mainForm
        End
      EndIf
    EndWith
  EndProcedure
  ;}
  ;{ PUBLIC METHODS
  Procedure FORM_open(*this._form,*mother._form = 0)
    With *this
      If Not *mother
        \id = OpenWindow(#PB_Any,\position\posX,\position\posY,\size\widht,\size\height,\title,\flag\get(\flag,*this))
      Else
        \id = OpenWindow(#PB_Any,\position\posX,\position\posY,\size\widht,\size\height,\title,\flag\get(\flag,*this),WindowID(*mother\id))
      EndIf
      SetWindowData(\id,*this)
      BindEvent(#PB_Event_CloseWindow,@FORM_eventClose(),\id)
    EndWith   
  EndProcedure
  
  Procedure FORM_close(*this._form)
    With *this
      CloseWindow(\id)
      UnbindEvent(#PB_Event_CloseWindow,@FORM_eventClose(),\id)  
    EndWith
  EndProcedure
  ;}
  ; PUBLIC CONSTRUCTOR
  Procedure newForm(x,y,w,h,title.s)
    Protected *this._form = AllocateStructure(_form)
    With *this
      \methods = ?S_form
      \size = newSize(w,h)
      \position = newPosition(x,y)
      \title = title
      \flag = newFormFlag()
      \flag\sytemMenu = #True
      ProcedureReturn *this
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
    ;}
    ;{ SETTERS
    Data.i @FORM_setTitle()
    Data.i @FORM_setMainForm()
    ;}
    ;{ PUBLIC METHODS
    Data.i @FORM_open()
    Data.i @FORM_close()
    ;}
    E_form:
  EndDataSection
EndModule
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 433
; FirstLine = 50
; Folding = AAAAAAAAAAwweBg8
; EnableXP