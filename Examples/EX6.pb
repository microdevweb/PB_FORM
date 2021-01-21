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
  mainForm = newForm(0,0,800,600,"Example 6 use HLayout")
  mainForm\setMainForm(#True)
  Define flag.FormFlags = mainForm\getFlag()
  flag\setScreenCentered(#True)
  flag\setSizeGadget(#True)
  ; Layout
  ; add horizontal layout
  HLayout.HLayout = mainForm\setMainLayout(newHLayout())
  HLayout\setExpand(#LAYOUT_EXPAND_YES)
  HLayout\addContent(newGadgetButton("Button 1",newListener(@evButton())))
  HLayout\addContent(newGadgetButton("Button 2",newListener(@evButton())))
  HLayout\addContent(newGadgetButton("Button 3",newListener(@evButton())))
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