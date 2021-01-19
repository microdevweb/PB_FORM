;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.2
; LICENCE  : MIT
; EXMAPLE  : use Menu shortcut
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 
Procedure eventMenuOpen(*menu.PB_FORM::MenuTextItem)
  Debug "Click on menu open"
EndProcedure
Procedure eventMenuNew(*menu.PB_FORM::MenuTextItem)
  Debug "Click on menu new"
EndProcedure
Procedure eventMenuSave(*menu.PB_FORM::MenuTextItem)
  Debug "Click on menu Save"
EndProcedure

Procedure openMainForm()
  mainForm = PB_FORM::newForm(0,0,800,600,"Example 3")
  mainForm\setMainForm(#True)
  Define flag.PB_FORM::FormFlag = mainForm\getFlag()
  flag\setScreenCentered(#True)
  Define menu.PB_FORM::Menu = mainForm\setMenu(PB_FORM::newTextMenu())
  Define mFile.PB_FORM::MenuTitle = menu\addMenuTitle(PB_FORM::newMenuTitle("File"))
  
  Define op.PB_FORM::MenuTextItem = mFile\addItem(PB_FORM::newMenuTextItem("Open",PB_FORM::newListener(@eventMenuOpen())))
  op\setShortCut(PB_FORM::newShortCut(#PB_Shortcut_Control|#PB_Shortcut_O,"Ctrl + O"))
  
  Define op.PB_FORM::MenuTextItem = mFile\addItem(PB_FORM::newMenuTextItem("New",PB_FORM::newListener(@eventMenuNew())))
  op\setShortCut(PB_FORM::newShortCut(#PB_Shortcut_Control|#PB_Shortcut_N,"Ctrl + N"))
  
  mFile\addItem(PB_FORM::newMenuItemBar())
  
  Define op.PB_FORM::MenuTextItem = mFile\addItem(PB_FORM::newMenuTextItem("Save",PB_FORM::newListener(@eventMenuSave())))
  op\setShortCut(PB_FORM::newShortCut(#PB_Shortcut_Control|#PB_Shortcut_S,"Ctrl + S"))
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 20
; Folding = -
; EnableXP