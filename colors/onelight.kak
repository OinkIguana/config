evaluate-commands %sh{
    background='rgb:FAFAFA'
    background_hl='rgb:D4D4D4'
    gutter='rgb:E5E5E5'
    comment='rgb:A0A1A7'
    text='rgb:383A42'
    field='rgb:E45649'
    constant='rgb:E08026'
    type='rgb:C18401'
    string='rgb:50A14F'
    builtin='rgb:099783'
    function='rgb:248BE0'
    keyword='rgb:C678DD'
    menu='rgb:FDF6E3'

    ## code
    echo "
        face global value ${constant}
        face global type ${type}
        face global variable ${field}
        face global identifier ${field}
        face global field ${field}
        face global string ${string}
        face global keyword ${keyword}
        face global operator ${keyword}
        face global attribute ${keyword}
        face global comment ${comment}+i
        face global doc_comment ${comment}+b
        face global meta ${builtin}
        face global builtin ${builtin}
        face global function ${function}
        face global module ${field}+i
    "

    ## markup
    echo "
        face global title ${field}+b
        face global header ${field}+b
        face global bold ${type}+b
        face global italic ${keyword}+i
        face global mono ${string}
        face global block ${builtin}
        face global link ${constant}
        face global bullet ${field}
        face global list ${field}
    "

    ## custom
    echo "
        face global NormalCursor default,${background_hl}
        face global InsertCursor ${background},${text}
    "

    ## builtin
    echo "
        face global Default ${text},${background}
        face global PrimarySelection default,${gutter}
        face global SecondarySelection default,${gutter}+i
        face global PrimaryCursor NormalCursor
        face global PrimaryCursorEol ${background}+f@PrimaryCursor
        face global SecondaryCursor default,${background_hl}+i
        face global SecondaryCursorEol ${background}+f@SecondaryCursor
        face global LineNumbers ${background_hl},${background}
        face global LineNumberCursor ${type},${background}
        face global MenuForeground ${text},${menu}+b
        face global MenuBackground ${text},${menu}
        face global MenuInfo ${background_hl}
        face global Information ${text},${menu}
        face global Error ${text},${field}
        face global StatusLine ${text},${background_hl}
        face global StatusLineMode ${text}
        face global StatusLineInfo ${text}
        face global StatusLineValue ${text}
        face global StatusCursor ${background},${text}
        face global Prompt ${function}
        face global MatchingChar default,${background_hl}
        face global Reference default+u
        face global BufferPadding ${background_hl},${background}
        face global Whitespace ${background_hl}+f
    "

    echo "hook global ModeChange '.*:insert' %{ face global PrimaryCursor @InsertCursor }"
    echo "hook global ModeChange '.*:normal' %{ face global PrimaryCursor @NormalCursor }"

    ## LSP
    echo "
        face global DiagnosticError default+u
        face global DiagnosticWarning default+u
    "

    ## powerline
    echo "
    define-command -hidden powerline-theme-custom %{
        set-option global powerline_color00 '$text'          # fg: bufname
        set-option global powerline_color03 '$menu'          # bg: bufname
        set-option global powerline_color02 '$background'    # fg: git
        set-option global powerline_color04 '$string'        # bg: git
        set-option global powerline_color05 '$background'    # fg: position
        set-option global powerline_color01 '$field'         # bg: position
        set-option global powerline_color06 '$background'    # fg: line-column
        set-option global powerline_color09 '$type'          # bg: line-column
        set-option global powerline_color07 '$text'          # fg: mode-info
        set-option global powerline_color08 '$background_hl' # bg: mode-info
        set-option global powerline_color10 '$background'    # fg: filetype
        set-option global powerline_color11 '$function'      # bg: filetype
        set-option global powerline_color13 '$background'    # fg: client
        set-option global powerline_color12 '$keyword'       # bg: client
        set-option global powerline_color15 '$background'    # fg: session
        set-option global powerline_color14 '$keyword'       # bg: session
        set-option global powerline_color19 '$background'    # fg: unicode
        set-option global powerline_color18 '$field'         # bg: unicode

        declare-option -hidden str powerline_next_bg ${menu}
        declare-option -hidden str powerline_base_bg ${background_hl}
    }
    "
}
