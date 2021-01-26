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
    ElseIf \expand = FORM::#LAYOUT_EXPAND_NO
      xml + " expand = 'no'"
    ElseIf \expand = FORM::#LAYOUT_EXPAND_YES
      xml + " expand = 'yes'"
    ElseIf \expand = FORM::#LAYOUT_EXPAND_EQUAL
      xml + " expand = 'equal'"
    EndIf
    If \space
      xml + " spacing = '"+Str(\space)+"'"
    EndIf
    If \align
      If \align = FORM::#ALIGN_CENTER
        xml + " align = 'center'"
      ElseIf \align = FORM::#ALIGN_TOP
        xml + " align = 'top'"
      ElseIf \align = FORM::#ALIGN_BOTTOM
        xml + " align = 'bottom'"
      EndIf
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
    If \sizes\widht
      xml + " widht='"+Str(\sizes\widht)+"'"
    EndIf
    If \sizes\height
      xml + " height='"+Str(\sizes\height)+"'"
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
; CursorPosition = 31
; FirstLine = 6
; Folding = -
; EnableXP