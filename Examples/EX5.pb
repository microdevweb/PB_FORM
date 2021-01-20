;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.4
; LICENCE  : MIT
; EXAMPLE  : use Layout
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 

Procedure evButton(*button.PB_FORM::GadgetButton)
  Debug "You're clicked on the button "+*button\getTitle()
EndProcedure

Procedure openMainForm()
  UseModule PB_FORM
  mainForm = newForm(0,0,800,600,"Example 5 use Layout")
  mainForm\setMainForm(#True)
  Define flag.FormFlags = mainForm\getFlag()
  flag\setScreenCentered(#True)
  flag\setSizeGadget(#True)
  ; Layout
  ; add vertical layout
  VLayout.VLayout = mainForm\setMainLayout(newVLayout())
  VLayout\addContent(newGadgetButton("Button 1",newListener(@evButton())))
  Define bt.GadgetButton = VLayout\addContent(newGadgetButton("Button 2",newListener(@evButton())))
  Define btSize.Sizes = bt\getSizes()
  btSize\setHeighth(80)
  Define btFlag.ButtonFlags = bt\getFlags()
  btFlag\setToogle(#True)
  VLayout\addContent(newGadgetButton("Button 3",newListener(@evButton())))
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 29
; FirstLine = 1
; Folding = -
; EnableXP