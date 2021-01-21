;***************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.3
; LICENCE  : MIT
; CLASS HLayout  SOURCE CODE extends Layout
;***************************************************************
;{ PRIVATE METHODS

;}
;{ PROTECTED ABSTRACT METHODS
Procedure.s HLAYOUT_build(*This._VLayout)
  With *This
    Protected xml.s = "<hbox "
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
      ElseIf \align = PB_FORM::#ALIGN_LEFT
        xml + " align = 'left'"
      ElseIf \align = PB_FORM::#ALIGN_RIGHT
        xml + " align = 'right'"
      EndIf
    EndIf
    xml + ">"+Chr(10)
    ForEach \myContents()
      xml + \myContents()\build(\myContents())
    Next
    xml + "</hbox>"+Chr(10)
    ProcedureReturn xml
  EndWith
EndProcedure

;}
; PUBLIC CONSTRUCTOR
Procedure newHLayout()
  Protected *This._HLayout = AllocateStructure(_HLayout)
  With *This
    \methods = ?S_layout
    LAYOUT_super(*This)
    \build = @HLAYOUT_build()
    ProcedureReturn *This
  EndWith
EndProcedure
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 39
; FirstLine = 8
; Folding = -
; EnableXP