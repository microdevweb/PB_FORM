;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.12
; LICENCE  : MIT
; EXAMPLE  : gadgetDate
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

Procedure evChangeDate(*dt.PB_FORM::GadgetDate)
  Debug FormatDate("%yyyy-%mm-%dd",*dt\getValue())
EndProcedure


Procedure openMainForm()
  UseModule PB_FORM
  ; open window
  mainForm = newForm(0,0,800,0,"Example 16 ")
  ; for close application
  mainForm\setMainForm(#True)
  mainForm\setFlags(#PB_Window_ScreenCentered|#PB_Window_SizeGadget|#PB_Window_SystemMenu)
  ; set min value for main windows
  Define sizes.sizes = mainForm\getSize() : sizes\setMinHeight(300) : sizes\setMinWidth(400)
  ; use HLayout as main layout
  mainLayout.HLayout = mainForm\setMainLayout(newHLayout())
  ; we will expand the left layout
  mainLayout\setExpand(1)
  ;{----------------------------- we create the left layout into the main layout --------------------------------
  Define leftLayout.VLayout = mainLayout\addContent(newVLayout())
  Define myDate.GadgetDate = leftLayout\addContent(newGadgetDate("%dd-%mm-%yyyy",Date()))
  myDate\setListener(newListener(@evChangeDate()))
  ;} ------------------------------------------------------------------------------------------------------------
  ;{------------------------------ we create the right layout ---------------------------------------------------
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
  ;} ------------------------------------------------------------------------------------------------------------
  ; open window
  mainForm\open()
EndProcedure

openMainForm()

Repeat 
  WaitWindowEvent()
ForEver
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 50
; FirstLine = 23
; Folding = v
; EnableXP