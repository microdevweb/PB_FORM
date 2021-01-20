;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS Form SOURCE CODE
;*********************************************************************************************************************************************
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

Procedure FORM_getID(*this._form)
  With *this
    ProcedureReturn \id
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure FORM_setTitle(*this._form,title.s)
  With *this
    \title = title
  EndWith
EndProcedure

Procedure FORM_setMainForm(*this._form,state.b)
  With *this
    \mainForm = state
  EndWith
EndProcedure

Procedure FORM_setMainLayout(*this._form,*layout)
  With *this
    \mainLayout = *layout
    ProcedureReturn *layout
  EndWith
EndProcedure
;}
;{ PRIVATE METHODS
Procedure FORM_eventClose()
  Protected *this._form = GetWindowData(EventWindow())
  With *this
    ForEach \closeListener()
      ; if the return a avorted value
      If \closeListener()\callback(*this)
        ProcedureReturn 
      EndIf
    Next
    CloseWindow(\id)
    \id = 0
    UnbindEvent(#PB_Event_CloseWindow,@FORM_eventClose(),\id)  
    UnbindEvent(#PB_Event_SizeWindow,@FORM_eventSize(),\id)
    If \mainForm
      End
    EndIf
  EndWith
EndProcedure

Procedure FORM_eventSize()
  Protected *this._form = GetWindowData(EventWindow())
  With *this
    Protected nw = #PB_Ignore,
              nh = #PB_Ignore,
              resize.b = #False
    ForEach \sizeListener()
      ; if the listener the a avorted value
      If \sizeListener()\callback(*this)
        ProcedureReturn 
      EndIf
    Next
    If \size\maxWidht And WindowWidth(\id) > \size\maxWidht
      nw = \size\maxWidht
      resize = #True
    EndIf
    If \size\maxHeight And WindowHeight(\id) > \size\maxHeight
      nh = \size\maxHeight
      resize = #True
    EndIf
    If \size\minWidht And WindowWidth(\id) < \size\minWidht
      nw = \size\minWidht
      resize = #True
    EndIf
    If \size\minHeight And WindowHeight(\id) < \size\minHeight
      nh = \size\minHeight
      resize = #True
    EndIf
    If resize
      ResizeWindow(\id,#PB_Ignore,#PB_Ignore,nw,nh)
    EndIf
    ; resize main layout
    If \mainLayout
      \mainLayout\build(\mainLayout,0,0,WindowWidth(\id),WindowHeight(\id),0)
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
    ; build menu
    If \menu
      \menu\build(\menu,*this)
    EndIf
    ; build layout
    If \mainLayout
      \mainLayout\build(\mainLayout,0,0,WindowWidth(\id),WindowHeight(\id),0)
    EndIf
    BindEvent(#PB_Event_CloseWindow,@FORM_eventClose(),\id)
    BindEvent(#PB_Event_SizeWindow,@FORM_eventSize(),\id)
  EndWith   
EndProcedure

Procedure FORM_close(*this._form)
  With *this
    CloseWindow(\id)
    \id = 0
    UnbindEvent(#PB_Event_CloseWindow,@FORM_eventClose(),\id)  
    UnbindEvent(#PB_Event_SizeWindow,@FORM_eventSize(),\id)
  EndWith
EndProcedure

Procedure FORM_addCloseListener(*this._form,*listener)
  With *this
    AddElement(\closeListener())
    \closeListener() = *listener
    ProcedureReturn *listener
  EndWith
EndProcedure

Procedure FORM_addSizeListener(*this._form,*listener)
  With *this 
    AddElement(\sizeListener())
    \sizeListener() = *listener
    ProcedureReturn *listener
  EndWith
EndProcedure

Procedure FORM_free(*this._form)
  With *this
    FreeStructure(\position)
    FreeStructure(\size)
    FreeStructure(\flag)
    ForEach \closeListener()
      FreeStructure(\closeListener())
    Next
    ForEach \sizeListener()
      FreeStructure(\sizeListener())
    Next
    MENU_free(\menu)
    FreeStructure(*this)
  EndWith
EndProcedure

Procedure FORM_setMenu(*this._form,*menu)
  With *this
    \menu = *menu
    ProcedureReturn *menu
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

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 137
; FirstLine = 71
; Folding = A+O5
; EnableXP