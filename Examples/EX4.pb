;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; EXMAPLE  : use Layout
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 


Procedure openMainForm()
  mainForm = PB_FORM::newForm(0,0,800,600,"Example 4 (layouts)")
  mainForm\setMainForm(#True)
  Define flag.PB_FORM::FormFlag = mainForm\getFlag()
  flag\setScreenCentered(#True)
  flag\setSizeGadget(#True)
  mainForm\setMainLayout(PB_FORM::newVLayout())
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 16
; Folding = -
; EnableXP