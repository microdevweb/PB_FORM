;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 

Procedure openMainForm()
  mainForm = PB_FORM::newForm(0,0,800,600,"EXAMPLE 1")
  mainForm\setMainForm(#True)
  Define flag.PB_FORM::FormFlag = mainForm\getFlag()
  flag\setScreenCentered(#True)
  flag\setSizeGadget(#True)
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