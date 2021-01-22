;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.7
; LICENCE  : MIT
; EXAMPLE  : add custom gadget
;*********************************************************************************************************************************************
XIncludeFile "../PB_FORM/Include/PB_FORM.pbi"
Global mainForm.PB_FORM::Form 
Global.PB_FORM::GadgetCustom cus1,cus2,cus3

LoadFont(0,"arial",12,#PB_Font_HighQuality|#PB_Font_Bold)

Procedure evButton(*button.PB_FORM::GadgetButton)
  Debug "You're clicked on the button "+*button\getTitle()
EndProcedure

Procedure evCustom(*cus.PB_FORM::GadgetCustom)
  Select EventType()
    Case #PB_EventType_MouseMove
      Debug GetGadgetAttribute(*cus\getId(),#PB_Canvas_MouseX)
  EndSelect
EndProcedure

Procedure buildCustom(*cus.PB_FORM::GadgetCustom)
  StartVectorDrawing(CanvasVectorOutput(*cus\getId()))
  VectorFont(FontID(0))
  Protected w = GadgetWidth(*cus\getId()),
            h = GadgetHeight(*cus\getId()),
            text.s,wt,ht,xc,yc
  AddPathBox(0,0,w,h)
  Select *cus
    Case cus1
      VectorSourceColor($FF08C208)
      text = "Field 1"
    Case cus2
      VectorSourceColor($FF0000FF)
      text = "Field 2"
    Case cus3
      VectorSourceColor($FFCD00CD)
      text = "Field 3"
  EndSelect
  FillPath()
  wt = VectorTextWidth(text)
  ht = VectorTextHeight(text)
  xc = (w / 2) - (wt / 2)
  yt = (h / 2) - (ht / 2)
  MovePathCursor(xc,yt)
  VectorSourceColor($FF000000)
  DrawVectorText(text)
  StopVectorDrawing()
EndProcedure





Procedure openMainForm()
  UseModule PB_FORM
  ; open window
  mainForm = newForm(0,0,800,0,"Example 11 custom gadget ")
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
  ; we add custom gadget
  cus1 = leftLayout\addContent(newGadgetCustom(@buildCustom(),@evCustom()))
  cus2 = leftLayout\addContent(newGadgetCustom(@buildCustom(),@evCustom()))
  cus3 = leftLayout\addContent(newGadgetCustom(@buildCustom(),@evCustom()))
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
; CursorPosition = 20
; FirstLine = 4
; Folding = -
; EnableXP