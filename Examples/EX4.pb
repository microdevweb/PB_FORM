;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; EXMAPLE  : use Layout
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 

Procedure evCloseMainForm(*form.PB_FORM::Form)
  If MessageRequester("Close Main Form","do you want exit",#PB_MessageRequester_YesNo) = #PB_MessageRequester_No
    ProcedureReturn #True
  EndIf
EndProcedure

Procedure evSizeMainForm(*form.PB_FORM::Form)
  With *form
    Debug WindowWidth(*form\getID())
  EndWith
EndProcedure

Procedure evMenuOption(*menu.PB_FORM::MenuTextItem)
  With *menu
    Select *menu\getTitle()
      Case "Open"
        Debug "you're chose Open option"
      Case "New"
        Debug "you're chose New option"
      Case "Save"
        Debug "you're chose Save option"
      Case "Save As" 
        Debug "you're chose Save As option"
    EndSelect
  EndWith
EndProcedure

Procedure openMainForm()
  UseModule PB_FORM
  mainForm = newForm(0,0,800,600,"Example 4 (Turn on dialog technologies)")
  mainForm\setMainForm(#True)
  Define flag.FormFlag = mainForm\getFlag()
  flag\setScreenCentered(#True)
  flag\setSizeGadget(#True)
  mainForm\addCloseListener(newListener(@evCloseMainForm()))
  mainForm\addSizeListener(newListener(@evSizeMainForm()))
  ; add a menu
  Define menu.Menu = mainForm\setMenu(newTextMenu())
  ; add menu file
  Define menuFile.MenuTitle = menu\addMenuTitle(newMenuTitle("File"))
  Define opOpen.MenuTextItem = menuFile\addItem(newMenuTextItem("Open",newListener(@evMenuOption())))
  opOpen\setShortCut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_O,"CTRL + O"))
  Define opNew.MenuTextItem = menuFile\addItem(newMenuTextItem("New",newListener(@evMenuOption())))
  opNew\setShortCut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_N,"CTRL + N"))
  menuFile\addItem(newMenuItemBar())
  Define opSave.MenuTextItem = menuFile\addItem(newMenuTextItem("Save",newListener(@evMenuOption())))
  opSave\setShortCut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_S,"CTRL + S"))
  Define opSaveAs.MenuTextItem = menuFile\addItem(newMenuTextItem("Save As",newListener(@evMenuOption())))
  opSaveAs\setShortCut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_Shift|#PB_Shortcut_S,"CTRL + Shift + S"))
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 58
; FirstLine = 35
; Folding = -
; EnableXP