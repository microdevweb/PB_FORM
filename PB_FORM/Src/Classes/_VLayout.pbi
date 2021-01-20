;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS VLayout  SOURCE CODE extends Layout
;***************************************************************
;{ PRIVATE METHODS
Procedure VLAYOUT_buildContent(*this._VLayout)
  With *this
    ; set height of each content
    Protected nContent = ListSize(\myContents()),
              hContent = (GadgetHeight(\id) / nContent) - (\paddings\botom + \paddings\top) 
    
    
    
    
  EndWith
EndProcedure
;}
;{ PROTECTED ABSTRACT METHODS
Procedure VLAYOUT_build(*This._VLayout,x,y,w,h,*parent)
  With *This
    If Not IsGadget(\id)
      \id = CanvasGadget(#PB_Any,
                         \margins\right,\margins\top,
                         w - (\margins\right + \margins\left),
                         h - (\margins\top + \margins\botom),
                         #PB_Canvas_Container|#PB_Canvas_Keyboard)
      CloseGadgetList()
    Else
      ResizeGadget(\id,\margins\right,\margins\top,
                   w - (\margins\right + \margins\left),
                   h - (\margins\top + \margins\botom))
    EndIf
    ; for debug
    StartVectorDrawing(CanvasVectorOutput(\id))
    VectorSourceColor($FF08C208)
    FillVectorOutput()
    StopVectorDrawing()
  EndWith
EndProcedure
;}
; PUBLIC CONSTRUCTOR
Procedure newVLayout()
  Protected *This._VLayout = AllocateStructure(_VLayout)
  With *This
    \methods = ?S_layout
    LAYOUT_super(*This)
    \build = @VLAYOUT_build()
    ProcedureReturn *This
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 14
; FirstLine = 3
; Folding = -
; EnableXP