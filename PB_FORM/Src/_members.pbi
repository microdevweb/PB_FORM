﻿;*********************************************************************************************************************************************
; AUTHOR   : microdevWeb
; MODULE   : PB_FORM
; VERSION  : BETA 1.0
; LICENCE  : MIT
; MEMBERS SOURCE CODE
;*********************************************************************************************************************************************
;- Prototypes
  Prototype.s p_flag_get(*this)
  Prototype p_listener_callback(*parent)
  Prototype p_menu_build(*this,*parent)
  Prototype.s p_content_build(*this)
  Prototype p_content_makeID(*this,*form)
  Prototype p_custom_build(*this)
  Structure _colors
    bgColor.i
    fgColor.i
  EndStructure
  ;- Listener Class
  Structure _listener
    *methods
    *callback.p_listener_callback
  EndStructure
  ;- Flag Class ABSTRACT
  Structure _flag
    *methods
    get.p_flag_get
  EndStructure
  ;- FormFlag Class extends of Flag
  Structure _FormFlag Extends _flag
    sytemMenu.b
    minizeGadget.b
    maximizeGadget.b
    sizeGadget.b
    invisible.b
    titleBar.b
    borderLess.b
    screenCentered.b
    windowCentered.b
    maximize.b
    minimize.b
    noGadget.b
    noActivate.b
  EndStructure
  ;- GadgetButton Flag
  Structure _gadgetbuttonFlags Extends _flag
    right.b
    left.b
    def.b
    mutliligne.b
    toggle.b
  EndStructure
  ;- GadgetString Flag
  Structure _gadetstringFlags Extends _flag
    numeric.b
    password.b
    readOnly.b
    lowerCase.b
    upperCase.b
    borderLess.b
  EndStructure
  ;- GadgetFrame Flags
  Structure _gadgetframeFlags Extends _flag
    single.b
    double.b
    flat.b
  EndStructure
  ;- GadgetCanvas Flags
  Structure _gadgetCanvasFlags Extends _flag
    border.b
    Keyboard.b
    drawFocus.b
    container.b
  EndStructure
  ;- GadgetText Flags
  Structure _gadgetTextFlags Extends _flag
    center.b
    right.b
    border.b
  EndStructure
  ;- GadgetSpin Flags
  Structure _gadgetSpinFlags Extends _flag
    readOnly.b
    numeric.b
  EndStructure
  ;- GadgetDate flags
  Structure _gadgetDateFlags Extends _flag
    upDown.b
    ckeckBox.b
  EndStructure
  Structure _trackBarFlags Extends _flag
    ticks.b
    vertical.b
  EndStructure
  Structure _checkboxFlags Extends _flag
    right.b
    center.b
    threeState.b
  EndStructure
  
  Structure _comboboxFlags Extends _flag
    editable.b
    lowercase.b
    uppercase.b
  EndStructure
  
  ;- Size Class 
  Structure _size
    *methods
    widht.i
    height.i
    maxWidht.i
    maxHeight.i
    minWidht.i
    minHeight.i
  EndStructure
  ;- Position Class
  Structure _position
    *methods
    posX.i
    posY.i
  EndStructure
  ;- Form Class
  Structure _form 
    *methods
    id.i
    *size._size
    *position._position
    *flag._FormFlag
    mainForm.b
    title.s
    List *closeListener._listener()
    List *sizeListener._listener()
    *menu._menu
    *mainLayout._layout
    xml.i
    dialog.i
  EndStructure
   ;- Shortcut Class
  Structure _shortCut
    *methods
    keys.i
    helpText.s
    lastID.i
  EndStructure
  ;- MenuItem ABSTRACT Class
  Structure _menuItem
    *methods
    *listener._listener
    id.i
    *shortCut._shortCut
    build.p_menu_build
  EndStructure
  ;- MenuBar extens menuItem
  Structure _menuBar Extends _menuItem
    
  EndStructure
  ;- MenuText extends menuItem
  Structure _menuText Extends _menuItem
    title.s
  EndStructure
  ;- MenuImage extends  menuText
  Structure _menuImage Extends _menuText
    imageId.i
  EndStructure
  ;- MenuTitle Class
  Structure _menuTitle
    *methods
    title.s
    build.p_menu_build
    List *items._menuItem()
  EndStructure
  ;- Menu ABSTRACT Class
  Structure _menu
    *methods
    id.i
    windowId.i
    build.p_menu_build
    List *titles._menuTitle()
  EndStructure
  ;- Margins Class
  Structure _margins
    *methods
    right.i
    left.i
    top.i
    botom.i
  EndStructure
  ;- Paddings Class
  Structure _paddings
    *methods
    right.i
    left.i
    top.i
    botom.i
  EndStructure
  ;- Content ABSTRACT Class
  Structure _content
    *methods
    id.i
    build.p_content_build
    makeId.p_content_makeID
    buildCustom.p_content_build
    isGadget.b
    isCustom.b
    isLayout.b
    isFrame.b
    font.i
    colors._colors
  EndStructure
  ;- Layout ABSTRACT Class extends of Content
  Structure _layout Extends _content
    space.i
    expand.i
    align.i
    *sizes._size
    List *myContents._content()
  EndStructure
  ;- Gadget ABSTRACT Class extends of Content
  Structure _gadget Extends _content
    *flag._flag
    *sizes._size
    *data
  EndStructure
  ;- VLayout Class extends of Layout
  Structure _VLayout Extends _layout
    
  EndStructure
  ;- HLayout Class extends of Layout
  Structure _HLayout Extends _layout
    
  EndStructure
  ;- GadgetButton Class extends of Gadget
  Structure _gadgetButton Extends _gadget
    *clickListener._listener
    *shotCut._shortCut
    title.s
  EndStructure
  ;- GadgetString Class extends of Gadget
  Structure _gadgetString Extends _gadget
    value.s
    *eventChangeListener._listener
  EndStructure
  ;- GadgetFrame extends of Gadget
  Structure _gadgetFrame Extends _gadget
    title.s
    *content._content
  EndStructure
  Structure _customeGadget Extends _gadget
    userbuild.p_custom_build
    userevent.p_custom_build
  EndStructure
  ;- gadget text
  Structure _gadgetText Extends _gadget
    title.s
  EndStructure
  ;- gadget spin
  Structure _gadgetSpin Extends _gadget
    min.i
    max.i
    value.i
    *listener._listener
  EndStructure
  ;- gadget tab
  Structure _gadgetTab Extends _gadget
    title.s
    *content._content
    *listener._listener
  EndStructure
  ;- gadget panel
  Structure _gadgetPanel Extends _gadget
    List *myTabs._gadgetTab()
  EndStructure
  ;- gadget date
  Structure _gadgetDate Extends _gadget
    mask.s
    value.i
    *listener._listener
  EndStructure
  ;- gadget trackBar
  Structure _gadgetTrackBar Extends _gadget
    minimum.i
    maximum.i
    value.i
    *listener._listener
  EndStructure
  ;- checkbox gadget
  Structure _checkboxGadget Extends _gadget
    title.s
    state.i
    *listener._listener
  EndStructure
  ;- option gadget
  Structure _optionGadget Extends _gadget
    title.s
    state.b
    group.i
    *listener._listener
  EndStructure
  ;- combo content
  Structure _comboContent 
    *methods
    *data
    text.s
    actif.b
  EndStructure
  ;- ComboBox gadget
  Structure _comboBoxGadget Extends _gadget
    List *myContent._comboContent()
    *listener._listener
    *current
  EndStructure
  ;- Empty Class extends of Gadget
  Structure _empty Extends _gadget
    
  EndStructure
  
  
  
; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; CursorPosition = 310
; FirstLine = 83
; Folding = AACAAAA4
; EnableXP