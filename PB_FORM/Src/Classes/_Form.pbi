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
    ForEach \sizeListener()
      \sizeListener()\callback(*this)
    Next
  EndWith  
EndProcedure

Procedure.s FORM_buildXml(*this._form)
  With *this
    Protected flags.s = \flag\get(*this)
    Protected xml.s = "<window id='#PB_Any' name='"+Str(*this)+"' text = '"+\title+"'"
    If \size\minWidht
      xml + " minwidht='"+Str(\size\minWidht)+"'"
    EndIf 
    If \size\minHeight
      xml + " minheight='"+Str(\size\minHeight)+"'"
    EndIf
    If \size\maxWidht
      xml + " maxwidht='"+Str(\size\maxWidht)+"'"
    EndIf 
    If \size\maxHeight
      xml + " maxheight='"+Str(\size\maxHeight)+"'"
    EndIf
    If Len(flags)
      xml + " flags = '" + \flag\get(\flag)+"'"
    EndIf
    xml + ">"+Chr(10)
    If \mainLayout
      xml + \mainLayout\build(\mainLayout)
    EndIf
    xml + "</window>"+Chr(10)
    Debug xml
    ProcedureReturn xml
  EndWith
EndProcedure
;}
;{ PUBLIC METHODS
Procedure FORM_open(*this._form,*mother._form = 0)
  With *this
    \xml = ParseXML(#PB_Any,FORM_buildXml(*this))
    If \Xml And XMLStatus(\xml) = #PB_XML_Success
      \dialog = CreateDialog(#PB_Any)
      If Not \dialog
        MessageRequester("PB FORM DIALOG ERROR","Cannot create dialog",#PB_MessageRequester_Error)
        End
      EndIf
      If Not *mother
        OpenXMLDialog(\dialog,\xml,Str(*this),\position\posX,\position\posY,\size\widht,\size\height)
      Else
        OpenXMLDialog(\dialog,\xml,Str(*this),\position\posX,\position\posY,\size\widht,\size\height,WindowID(*mother\id))
      EndIf
      \id = DialogWindow(\dialog)
      SetWindowData(\id,*this)
      ; create menu
      If \menu
        \menu\build(\menu,*this)
      EndIf
      ; create gadget id and bind event for each gadget
      If \mainLayout
        \mainLayout\makeId(\mainLayout,*this)
      EndIf
      BindEvent(#PB_Event_CloseWindow,@FORM_eventClose(),\id)
      BindEvent(#PB_Event_SizeWindow,@FORM_eventSize(),\id)
    Else
      MessageRequester("PB FORM XML ERROR",XMLError(\xml) + " (Line: " + XMLErrorLine(\xml) + ")",#PB_MessageRequester_Error)
      End
    EndIf
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
;     MENU_free(\menu)
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
; CursorPosition = 117
; FirstLine = 39
; Folding = Ayem
; EnableXP