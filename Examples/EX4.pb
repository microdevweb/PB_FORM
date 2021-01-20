;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; EXMAPLE  : use Layout
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 

Procedure eventButton(*button.PB_FORM::GadgetButton)
  
EndProcedure

Procedure openMainForm()
  mainForm = PB_FORM::newForm(0,0,800,600,"Example 4 (layouts)")
  mainForm\setMainForm(#True)
  Define flag.PB_FORM::FormFlag = mainForm\getFlag()
  flag\setScreenCentered(#True)
  flag\setSizeGadget(#True)
  Define VLayout.PB_FORM::VLayout = mainForm\setMainLayout(PB_FORM::newVLayout())
  Define margins.PB_FORM::Margins = VLayout\getMargins()
  margins\setLeft(10)
  margins\setRight(10)
  margins\setTop(10)
  margins\setBotom(10)
  Define bt.PB_FORM::GadgetButton = VLayout\addContent(PB_FORM::newGadgetButton("Button 1",PB_FORM::newListener(@eventButton())))
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 26
; Folding = -
; EnableXP