;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS GadgetCustom   SOURCE CODE extends of Gadget
;***************************************************************
;{ PRIVATE METHODS
Procedure GADGETCUSTOM_event()
  Protected *this._customeGadget = GetGadgetData(EventGadget())
  With *this
    If \userevent
      \userevent(*this)
    EndIf
  EndWith
EndProcedure
Procedure GADGETCUSTOM_eventSize()
  Protected *this._customeGadget = GetGadgetData(EventGadget())
  With *this
    If \userbuild
      \userbuild(*this)
    EndIf
  EndWith
EndProcedure
;}
Procedure GADGETCUSTOM_setFlags(*this._customeGadget,flags)
  With *this
    Protected *f._gadgetCanvasFlags = \flag
    *f\border = #False
    *f\container = #False
    *f\drawFocus = #False
    *f\Keyboard =  #False
    If flags & #PB_Canvas_Border = #PB_Canvas_Border
      *f\border = #True
    EndIf
    If flags & #PB_Canvas_Keyboard = #PB_Canvas_Keyboard
      *f\Keyboard = #True
    EndIf
    If flags & #PB_Canvas_DrawFocus = #PB_Canvas_DrawFocus
      *f\drawFocus = #True
    EndIf
    If flags & #PB_Canvas_Container = #PB_Canvas_Container
      *f\container = #True
    EndIf
  EndWith
EndProcedure
;{ PROTECTED ABSTRACT METHODS
Procedure.s GADGETCUSTOM_build(*this._customeGadget)
  With *this
    Protected xml.s = "<canvas id='#PB_Any' name='"+*this+"'"
    Protected flags.s = \flag\get(\flag)
    If Len(flags)
      xml + " flags='"+flags+"' "
    EndIf
    If \sizes\widht
      xml + " width='"+Str(\sizes\widht)+"' "
    EndIf
    If \sizes\height
      xml + " height='"+Str(\sizes\height)+"' "
    EndIf
    If \sizes\minWidht
      xml + " minwidht='"+Str(\sizes\minWidht)+"'"
    EndIf 
    If \sizes\minHeight
      xml + " minheight='"+Str(\sizes\minHeight)+"'"
    EndIf
    If \sizes\maxWidht
      xml + " maxwidht='"+Str(\sizes\maxWidht)+"'"
    EndIf 
    If \sizes\maxHeight
      xml + " maxheight='"+Str(\sizes\maxHeight)+"'"
    EndIf
    xml + "/>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

Procedure GADGETCUSTOM_makeId(*this._customeGadget,*form._form)
  With *this
    \id = DialogGadget(*form\dialog,Str(*this))
    SetGadgetData(\id,*this)
    If \userbuild
      \userbuild(*this)
    EndIf
    BindGadgetEvent(\id,@GADGETCUSTOM_event())
    BindGadgetEvent(\id,@GADGETCUSTOM_eventSize(),#PB_EventType_Resize)
  EndWith
EndProcedure
;}
;{ GETTERS

;}
;{ SETTERS

;}
; PUBLIC CONSTRUCTOR
Procedure newGadgetCustom(*build,*event)
  Protected *this._customeGadget = AllocateStructure(_customeGadget)
  With *this
    Protected mothenL,ClassL,*method
    mothenL = GADGET_super(*this)
    ClassL = ?E_gadgetCustom - ?S_gadgetCustom
    *method = \methods
    ; empilate method addresses
    \methods = AllocateMemory(mothenL + ClassL)
    MoveMemory(*method,\methods,mothenL)
    MoveMemory(?S_gadgetCustom,\methods + mothenL,ClassL)
    \flag = newGadgetCanvasFlags()
    
    \isCustom = #True
    \build = @GADGETCUSTOM_build()
    \makeId = @GADGETCUSTOM_makeId()
    \userbuild = *build
    \userevent = *event
    ProcedureReturn *this
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 31
; FirstLine = 24
; Folding = --
; EnableXP