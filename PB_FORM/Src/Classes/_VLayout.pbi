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
; CursorPosition = 15
; Folding = -
; EnableXP