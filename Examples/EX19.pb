;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.15
; LICENCE  : MIT
; EXAMPLE  : option gadget
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"

Enumeration 
  #BT_FONT
  #STR_FONT
EndEnumeration

Global mainForm.FORM::Form 

Structure customer
  fName.s
  sName.s
EndStructure

LoadFont(#BT_FONT,"arial",12,#PB_Font_Bold)
LoadFont(#STR_FONT,"arial",11)

Procedure evButton(*button.FORM::Button_gadget)
  Debug "You're clicked on the button "+*button\getTitle()
  If *button\getTitle() = "Exit"
    mainForm\close()
    End
  EndIf
EndProcedure

Procedure evCb(*cb.FORM::ComboBox_gadget)
  Protected *cont.FORM::Combo_Content = *cb\getCurrentContent()
  Protected *cus.customer = *cont\getData()
  Debug *cus\fName
EndProcedure


Procedure openMainForm()
  UseModule FORM
  ; open window
  mainForm = newForm(0,0,800,0,"Example 19 ")
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
  Define cb.ComboBox_gadget = leftLayout\addContent(newComboBoxGadget())
  cb\setListener(newListener(@evCb()))
  
  Define *cu.customer = AllocateStructure(customer)
  *cu\sName = "Dupont"
  *cu\fName = "André"
  Define cont.Combo_Content = cb\addContent(newComboContent(*cu\sName))
  cont\setData(*cu)
  
  Define *cu.customer = AllocateStructure(customer)
  *cu\sName = "Brio"
  *cu\fName = "Alain"
  Define cont.Combo_Content = cb\addContent(newComboContent(*cu\sName,#True))
  cont\setData(*cu)
  
  Define *cu.customer = AllocateStructure(customer)
  *cu\sName = "Godelaine"
  *cu\fName = "Paul"
  Define cont.Combo_Content = cb\addContent(newComboContent(*cu\sName))
  cont\setData(*cu)
  
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
; CursorPosition = 73
; FirstLine = 38
; Folding = --
; EnableXP