;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.11
; LICENCE  : MIT
; EXAMPLE  : gadgetFont
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"

Enumeration 
  #BT_FONT
  #STR_FONT
EndEnumeration

Global mainForm.PB_FORM::Form 



LoadFont(#BT_FONT,"arial",12,#PB_Font_Bold)
LoadFont(#STR_FONT,"arial",11)

Procedure evButton(*button.PB_FORM::GadgetButton)
  Debug "You're clicked on the button "+*button\getTitle()
  If *button\getTitle() = "Exit"
    mainForm\close()
    End
  EndIf
EndProcedure

Procedure evChange(*string.PB_FORM::GadgetString)
  Debug *string\getValue()
EndProcedure

Procedure spinChange(*spin.PB_FORM::GadgetSpin)
  With *spin
    SetGadgetText(*spin\getId(),Str(*spin\getValue()) + "%")
  EndWith
EndProcedure

Procedure openMainForm()
  UseModule PB_FORM
  ; open window
  mainForm = newForm(0,0,800,0,"Example 16 panel gadget ")
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
  ; we create an panel gadget
  Define panel.GadgetPanel = leftLayout\addContent(newGadgetPanel())
  Define tab1.GadgetTab = panel\addTab(newGadgetTab("TAB 1"))
  Define t1Layout.VLayout = tab1\setContent(newVLayout())
  t1Layout\addContent(newGadgetText("Field 1"))
  t1Layout\addContent(newGadgetString())
  t1Layout\addContent(newGadgetText("Field 2"))
  t1Layout\addContent(newGadgetString())
  t1Layout\addContent(newGadgetText("Field 3"))
  t1Layout\addContent(newGadgetString())
  Define tab2.GadgetTab = panel\addTab(newGadgetTab("TAB 2"))
  Define t2Layout.VLayout = tab2\setContent(newVLayout())
  t2Layout\addContent(newGadgetText("Field 4"))
  t2Layout\addContent(newGadgetString())
  t2Layout\addContent(newGadgetText("Field 5"))
  t2Layout\addContent(newGadgetString())
  t2Layout\addContent(newGadgetText("Field 6"))
  t2Layout\addContent(newGadgetString())
  t2Layout\addContent(newGadgetText("Field 7"))
  t2Layout\addContent(newGadgetString())
  Define tab3.GadgetTab = panel\addTab(newGadgetTab("TAB 3"))
  Define t3Layout.VLayout = tab3\setContent(newVLayout())
  t3Layout\addContent(newGadgetText("Field 8"))
  t3Layout\addContent(newGadgetString())
  t3Layout\addContent(newGadgetText("Field 9"))
  t3Layout\addContent(newGadgetString())
  ; we create the right layout
  Define rightLayout.VLayout = mainLayout\addContent(newVLayout())
  rightLayout\setFont(#BT_FONT)
  ; we add button into the right layout
  Define bt.GadgetButton = rightLayout\addContent(newGadgetButton("New",newListener(@evButton())))
  bt\setSizes(100,0)
  bt\setShortcut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_N,"New CTRL + N"))
  Define bt.GadgetButton = rightLayout\addContent(newGadgetButton("Edit",newListener(@evButton())))
  bt\setShortcut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_E,"Edit CTRL + E"))
  Define bt.GadgetButton = rightLayout\addContent(newGadgetButton("Delete",newListener(@evButton())))
  bt\setShortcut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_Delete,"Delete CTRL + Delete"))
  
  Define e.Empty = rightLayout\addContent(newEmpty())
  Define s.Sizes = e\getSizes() : s\setHeight(40)
  Define bt.GadgetButton = rightLayout\addContent(newGadgetButton("Exit",newListener(@evButton())))
  bt\setShortcut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_Q,"Exit CTRL + Q"))
  
  ; open window
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 80
; FirstLine = 62
; Folding = -
; EnableXP