;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; SOURCE CODE
;*********************************************************************************************************************************************
Module PB_FORM
  EnableExplicit
  ;- PRIVATE prototypes 
  Declare newSize(w,h)
  Declare newPosition(x,y)
  Declare FORM_eventClose()
  Declare FORM_eventSize()
  Declare MENU_TITLE_free(*this)
  Declare MENU_free(*this)
  Declare ITEM_TEXT_free(*this)
  Declare LAYOUT_super(*this)
  Declare GADGET_super(*this)
  Declare newGadgetButtonFlags()
  Declare newGadgetStringFlags()
  Declare newGadgetFrameFlags()
  Declare newGadgetTextFlags()
  Declare newGadgetSpinFlags()
  Declare newGadgetDateFlags()
  
  XIncludeFile "_members.pbi"
  
  XIncludeFile "Classes/_FormFlag.pbi"
  XIncludeFile "Classes/_Size.pbi"
  XIncludeFile "Classes/_Position.pbi"
  XIncludeFile "Classes/_Form.pbi"
  XIncludeFile "Classes/_Listener.pbi"
  XIncludeFile "Classes/_Menu.pbi"
  XIncludeFile "Classes/_MenuTitle.pbi"
  XIncludeFile "Classes/_MenuItemText.pbi"
  XIncludeFile "Classes/_MenuItemBar.pbi"
  XIncludeFile "Classes/_ShortCut.pbi"
  XIncludeFile "Classes/_Layout.pbi"
  XIncludeFile "Classes/_VLayout.pbi"
  XIncludeFile "Classes/_HLayout.pbi"
  XIncludeFile "Classes/_GadgetButtonFlags.pbi"
  XIncludeFile "Classes/_GadgetStringFlags.pbi"
  XIncludeFile "Classes/_GadgetFrameFlags.pbi"
  XIncludeFile "Classes/_GadgetCanvasFlags.pbi"
  XIncludeFile "Classes/_GadgetTextFlags.pbi"
  XIncludeFile "Classes/_GadgetSpinFlags.pbi"
  XIncludeFile "Classes/_GadgetDateFlags.pbi"
  XIncludeFile "Classes/_Gadget.pbi"
  XIncludeFile "Classes/_GadgetButton.pbi"
  XIncludeFile "Classes/_GadgetString.pbi"
  XIncludeFile "Classes/_GadgetFrame.pbi"
  XIncludeFile "Classes/_GadgetCustom.pbi"
  XIncludeFile "Classes/_GadgetText.pbi"
  XIncludeFile "Classes/_GadgetSpin.pbi"
  XIncludeFile "Classes/_GadgetPanel.pbi"
  XIncludeFile "Classes/_GadgetTab.pbi"
  XIncludeFile "Classes/_GadgetDate.pbi"
  XIncludeFile "Classes/_Empty.pbi"
  
  
  XIncludeFile "_datasection.pbi"
  
  
EndModule
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 57
; FirstLine = 26
; Folding = -
; EnableXP