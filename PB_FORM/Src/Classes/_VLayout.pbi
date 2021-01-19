;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS VLayout  SOURCE CODE extends Layout
;***************************************************************
;{ PROTECTED ABSTRACT METHODS
Procedure VLAYOUT_build(*This._VLayout,parentWidht,parentHeight)
  With *This
    If Not IsGadget(\id)
      \id = CanvasGadget(#PB_Any,
                         \margins\right,\margins\top,
                         parentWidht - (\margins\right + \margins\left),
                         parentHeight - (\margins\top + \margins\botom),
                         #PB_Canvas_Container|#PB_Canvas_Keyboard)
    Else
      ResizeGadget(\id,\margins\right,\margins\top,
                   parentWidht - (\margins\right + \margins\left),
                   parentHeight - (\margins\top + \margins\botom))
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
; CursorPosition = 19
; Folding = -
; EnableXP