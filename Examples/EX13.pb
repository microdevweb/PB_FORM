;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.10
; LICENCE  : MIT
; EXAMPLE  : gadgetFont
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"

Enumeration 
  #BT_FONT
  #STR_FONT
EndEnumeration

Global mainForm.PB_FORM::Form 
Global.PB_FORM::GadgetString field1,field2,field3,field4

LoadFont(#BT_FONT,"arial",12,#PB_Font_Bold)
LoadFont(#STR_FONT,"arial",11)

Procedure evButton(*button.PB_FORM::GadgetButton)
  Debug "You're clicked on the button "+*button\getTitle()
EndProcedure

Procedure evChange(*string.PB_FORM::GadgetString)
  Debug *string\getValue()
EndProcedure

Procedure openMainForm()
  UseModule PB_FORM
  ; open window
  mainForm = newForm(0,0,800,0,"Example 13 gadget color ")
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
  leftLayout\setFont(#STR_FONT)
  leftLayout\setExpand(#LAYOUT_EXPAND_YES)
  leftLayout\setSpace(15)
  ; we add string gadget
  Define   lb.GadgetText = leftLayout\addContent(newGadgetText("Field 1"))
  lb\setFrontColor($0000EE)
  field1 = leftLayout\addContent(newGadgetString("i'm the field 1"))
  field1\setBackgroundColor($0066CD)
  ;field1\setFrontColor($FFFFFF)
  
  Define   lb.GadgetText = leftLayout\addContent(newGadgetText("Field 2"))
  field2 = leftLayout\addContent(newGadgetString())
  
  Define   lb.GadgetText = leftLayout\addContent(newGadgetText("Field 3"))
  field3 = leftLayout\addContent(newGadgetString())
  
  Define   lb.GadgetText = leftLayout\addContent(newGadgetText("Field 4"))
  field4 = leftLayout\addContent(newGadgetString())
  
  ; we create the right layout
  Define rightLayout.VLayout = mainLayout\addContent(newVLayout())
  rightLayout\setFont(#BT_FONT)
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
; CursorPosition = 18
; FirstLine = 8
; Folding = -
; EnableXP