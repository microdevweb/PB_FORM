;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; CLASS MenuItemText SOURCE CODE
;*********************************************************************************************************************************************
;- MENU item TEXT SRC
Global NewMap *GItemsText()
;{ PRIVATE METHODS
Procedure ITEM_TEXT_eventMenu()
  If FindMapElement(*GItemsText(),Str(EventMenu()))
    Protected *this._menuText = *GItemsText()
    With *this
      If \listener
        \listener\callback(*this)
      EndIf
    EndWith
  EndIf
EndProcedure
;}
;{ GETTERS
Procedure.s ITEM_TEXT_getTitle(*this._menuText)
  With *this
    ProcedureReturn \title 
  EndWith
EndProcedure

Procedure ITEM_TEXT_getlistener(*this._menuText)
  With *this
    ProcedureReturn \listener 
  EndWith
EndProcedure
;}
;{ SETTERS
Procedure ITEM_TEXT_setTitle(*this._menuText,titles.s)
  With *this
     \title = titles
  EndWith
EndProcedure
;}
;{ PROTECTED ABSTRACT METHODS
Procedure ITEM_TEXT_build(*this._menuText,*parent._menu)
  With *this
    Protected text.s = \title
    If \shortCut And Len(\shortCut\helpText)
      text + Chr(9) + \shortCut\helpText
    EndIf
    MenuItem(\id,text)
    If \shortCut
      AddKeyboardShortcut(*parent\windowId,\shortCut\keys,\id)
    EndIf
    BindMenuEvent(*parent\id,\id,@ITEM_TEXT_eventMenu())
  EndWith
EndProcedure
;}
;{ PROTECTED METHODS
Procedure ITEM_TEXT_free(*this._menuText)
  With *this
    FreeStructure(\listener)
    FreeStructure(\shortCut)
    FreeStructure(*this)
  EndWith
EndProcedure
;}
;{ PUBLIC METHODS
Procedure ITEM_TEXT_setShortCut(*this._menuText,*shortcut)
  With *this
    \shortCut = *shortcut
    ProcedureReturn *shortcut
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newMenuTextItem(title.s,*listener)
  Protected *this._menuText = AllocateStructure(_menuText)
  Static lastId = 40000
  With *this
    \methods = ?S_menuText
    \title = title
    \listener = *listener
    \build = @ITEM_TEXT_build()
    AddMapElement(*GItemsText(),Str(lastId))
    *GItemsText() = *this
    \id = lastId
    lastId + 1 
    ProcedureReturn *this
  EndWith
EndProcedure


; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 57
; FirstLine = 33
; Folding = ---
; EnableXP