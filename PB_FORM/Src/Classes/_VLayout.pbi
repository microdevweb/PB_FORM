;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS VLayout  SOURCE CODE extends Layout
;***************************************************************
;{ PRIVATE METHODS

;}
;{ PROTECTED ABSTRACT METHODS
Procedure.s VLAYOUT_build(*This._VLayout)
  With *This
    Protected xml.s = "<vbox "
    If \expand > 0
      xml + " expand = 'item:"+Str(\expand)+"' "
    ElseIf \expand = PB_FORM::#LAYOUT_EXPAND_NO
      xml + " expand = 'no'"
    ElseIf \expand = PB_FORM::#LAYOUT_EXPAND_YES
      xml + " expand = 'yes'"
    ElseIf \expand = PB_FORM::#LAYOUT_EXPAND_EQUAL
      xml + " expand = 'equal'"
    EndIf
    If \space
      xml + " spacing = '"+Str(\space)+"'"
    EndIf
    If \align
      If \align = PB_FORM::#ALIGN_CENTER
        xml + " align = 'center'"
      ElseIf \align = PB_FORM::#ALIGN_TOP
        xml + " align = 'top'"
      ElseIf \align = PB_FORM::#ALIGN_BOTTOM
        xml + " align = 'bottom'"
      EndIf
    EndIf
    xml + ">"+Chr(10)
    ForEach \myContents()
      xml + \myContents()\build(\myContents())
    Next
    xml + "</vbox>"+Chr(10)
    ProcedureReturn xml
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
; CursorPosition = 43
; Folding = -
; EnableXP