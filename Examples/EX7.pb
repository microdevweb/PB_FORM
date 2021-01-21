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
  ; open window
  mainForm = newForm(0,0,800,0,"Example 7 use HLayout and VLayout")
  mainForm\setMainForm(#True)
  Define flag.FormFlags = mainForm\getFlag()
  flag\setScreenCentered(#True)
  flag\setSizeGadget(#True)
  ; use HLayout as main layout
  mainLayout.HLayout = mainForm\setMainLayout(newHLayout())
  ; we will expand the left layout
  mainLayout\setExpand(1)
  ; we create the left layout into the main layout
  Define leftLayout.VLayout = mainLayout\addContent(newVLayout())
  leftLayout\setAlignement(#ALIGN_CENTER)
  ; we add button like field
  leftLayout\addContent(newGadgetButton("Field 1",newListener(@evButton())))
  leftLayout\addContent(newGadgetButton("Field 2",newListener(@evButton())))
  leftLayout\addContent(newGadgetButton("Field 3",newListener(@evButton())))
  leftLayout\addContent(newGadgetButton("Field 4",newListener(@evButton())))
  ; we create the right layout
  Define rightLayout.VLayout = mainLayout\addContent(newVLayout())
  ; we add button into the right layout
  Define bt.GadgetButton = rightLayout\addContent(newGadgetButton("New",newListener(@evButton())))
  Define btSize.Sizes = bt\getSizes() : btSize\setWidth(100)
  rightLayout\addContent(newGadgetButton("Edit",newListener(@evButton())))
  rightLayout\addContent(newGadgetButton("Delete",newListener(@evButton())))
  Define e.Empty = rightLayout\addContent(newEmpty())
  Define s.Sizes = e\getSizes() : s\setHeight(40)
  rightLayout\addContent(newGadgetButton("Exit",newListener(@evButton())))
  
  ; open window
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 28
; FirstLine = 9
; Folding = -
; EnableXP