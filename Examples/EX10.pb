;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.6
; LICENCE  : MIT
; EXAMPLE  : add gadget frame
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 
Global.PB_FORM::GadgetString field1,field2,field3,field4
Procedure evButton(*button.PB_FORM::GadgetButton)
  Debug "You're clicked on the button "+*button\getTitle()
EndProcedure

Procedure evChange(*string.PB_FORM::GadgetString)
  Debug *string\getValue()
EndProcedure

Procedure openMainForm()
  UseModule PB_FORM
  ; open window
  mainForm = newForm(0,0,800,0,"Example 10 ")
  ; for close application
  mainForm\setMainForm(#True)
  mainForm\setFlags(#PB_Window_ScreenCentered|#PB_Window_SizeGadget)
  ; set min value for main windows
  Define sizes.sizes = mainForm\getSize() : sizes\setMinHeight(300) : sizes\setMinWidth(400)
  ; use HLayout as main layout
  mainLayout.HLayout = mainForm\setMainLayout(newHLayout())
  ; we will expand the left layout
  mainLayout\setExpand(1)
  ; we create the left layout into the main layout
  Define leftLayout.VLayout = mainLayout\addContent(newVLayout())
  leftLayout\setExpand(#LAYOUT_EXPAND_YES)
  leftLayout\setSpace(15)
  ; we add string gadget
  Define   frame.GadgetFrame = leftLayout\addContent(newGadgetFrame("Field 1"))
  field1 = frame\setContent(newGadgetString())
  
  
  Define   frame.GadgetFrame = leftLayout\addContent(newGadgetFrame("Field 2"))
  field2 = frame\setContent(newGadgetString())
  
  
  Define   frame.GadgetFrame = leftLayout\addContent(newGadgetFrame("Field 3"))
  field3 = frame\setContent(newGadgetString())
  
  
  Define   frame.GadgetFrame = leftLayout\addContent(newGadgetFrame("Field 4"))
  field4 = frame\setContent(newGadgetString())

  
  ; we create the right layout
  Define rightLayout.VLayout = mainLayout\addContent(newVLayout())
  ; we add button into the right layout
  Define bt.GadgetButton = rightLayout\addContent(newGadgetButton("New",newListener(@evButton())))
  bt\setSizes(100,0)
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
; CursorPosition = 26
; FirstLine = 14
; Folding = -
; EnableXP