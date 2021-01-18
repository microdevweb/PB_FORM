;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; EXMAPLE  : use Menu
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 

Procedure openMainForm()
  mainForm = PB_FORM::newForm(0,0,800,600,"Example 2")
  mainForm\setMainForm(#True)
  Define flag.PB_FORM::FormFlag = mainForm\getFlag()
  flag\setScreenCentered(#True)
  Define menu.PB_FORM::Menu = mainForm\setMenu(PB_FORM::newTextMenu())
  Define mFile.PB_FORM::MenuTitle = menu\addMenuTitle(PB_FORM::newMenuTitle("File"))
  
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 14
; Folding = -
; EnableXP