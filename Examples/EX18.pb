;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.14
; LICENCE  : MIT
; EXAMPLE  : option gadget
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"

Enumeration 
  #BT_FONT
  #STR_FONT
EndEnumeration

Global mainForm.FORM::Form 



LoadFont(#BT_FONT,"arial",12,#PB_Font_Bold)
LoadFont(#STR_FONT,"arial",11)

Procedure evButton(*button.FORM::Button_gadget)
  Debug "You're clicked on the button "+*button\getTitle()
  If *button\getTitle() = "Exit"
    mainForm\close()
    End
  EndIf
EndProcedure

Procedure evChangeDate(*dt.FORM::Date_gadget)
  Debug FormatDate("%yyyy-%mm-%dd",*dt\getValue())
EndProcedure

Procedure evChangeTrackBar(*tb.FORM::TrackBar_gadget)
  Debug *tb\getValue()
EndProcedure

Procedure evCheckboxChange(*c.FORM::CheckBox_gadget)
  Select *c\getState()
    Case #PB_Checkbox_Checked
      Debug "CheckBox is checked"
    Case #PB_Checkbox_Inbetween
      Debug "CheckBox is checked between"
    Case #PB_Checkbox_Unchecked
      Debug "CheckBox is unchecked"
  EndSelect
EndProcedure

Procedure evOption(*o.FORM::Option_gadget)
  If *o\getState()
    Debug "This option "+*o\getTitle()+" is checked"
  Else
    Debug "This option "+*o\getTitle()+" is unchecked"
  EndIf
EndProcedure

Procedure openMainForm()
  UseModule FORM
  ; open window
  mainForm = newForm(0,0,800,0,"Example 18 ")
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
  ;leftLayout\setExpand(#LAYOUT_EXPAND_YES)
  Define myDate.Date_gadget = leftLayout\addContent(newDateGadget("%dd-%mm-%yyyy",Date()))
  myDate\setListener(newListener(@evChangeDate()))
  leftLayout\addContent(newTextGadget("Track bar"))
  Define trb.TrackBar_gadget = leftLayout\addContent(newTrackBarGadget(0,100,10))
  trb\setSizes(0,30)
  trb\setListener(newListener(@evChangeTrackBar()))
  Define tbflags.TrackBarFlags = trb\getFlags()
  tbflags\setTicks(#True)
  Define check.CheckBox_gadget = leftLayout\addContent(newCheckBoxGadget("Check Box",#PB_Checkbox_Inbetween))
  Define f.CheckBoxFlags = check\getFlags()
  f\setThreeState(#True)
  check\setListener(newListener(@evCheckboxChange()))
  Define option.Option_gadget = leftLayout\addContent(newOptionGadget("Option 1",1))
  option\setListener(newListener(@evOption()))
  Define option.Option_gadget = leftLayout\addContent(newOptionGadget("Option 2",1,#True))
  option\setListener(newListener(@evOption()))
  Define e.Empty = leftLayout\addContent(newEmpty())
  e\setSizes(0,10)
  Define option.Option_gadget = leftLayout\addContent(newOptionGadget("Option 3",2))
  option\setListener(newListener(@evOption()))
  Define option.Option_gadget = leftLayout\addContent(newOptionGadget("Option 4",2))
  option\setListener(newListener(@evOption()))
  Define option.Option_gadget = leftLayout\addContent(newOptionGadget("Option 5",2))
  option\setListener(newListener(@evOption()))
  ;} ------------------------------------------------------------------------------------------------------------
  ;{------------------------------ we create the right layout ---------------------------------------------------
  Define rightLayout.VLayout = mainLayout\addContent(newVLayout())
  rightLayout\setFont(#BT_FONT)
  ; we add button into the right layout
  Define bt.Button_gadget = rightLayout\addContent(newButtonGadget("New",newListener(@evButton())))
  bt\setSizes(100,0)
  bt\setShortcut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_N,"New CTRL + N"))
  Define bt.Button_gadget = rightLayout\addContent(newButtonGadget("Edit",newListener(@evButton())))
  bt\setShortcut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_E,"Edit CTRL + E"))
  Define bt.Button_gadget = rightLayout\addContent(newButtonGadget("Delete",newListener(@evButton())))
  bt\setShortcut(newShortCut(#PB_Shortcut_Control|#PB_Shortcut_Delete,"Delete CTRL + Delete"))
  
  Define e.Empty = rightLayout\addContent(newEmpty())
  Define s.Sizes = e\getSizes() : s\setHeight(40)
  Define bt.Button_gadget = rightLayout\addContent(newButtonGadget("Exit",newListener(@evButton())))
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
; CursorPosition = 89
; FirstLine = 66
; Folding = --
; EnableXP