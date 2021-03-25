#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
#Include %A_ScriptDir%\common.ahk

#IfWinActive, ahk_class GxWindowClass
    ~F1::SpamKey("{F1}", true)
    ~F2::SpamKey("{F2}", true)
    ~F3::SpamKey("{F3}", true)

    ~8::SpamKey("8", true)
    ~9::SpamKey("3|4", true)

    ~0::SpamKey("0", true)
    ~1::SpamKey("1", true)
    ~2::SpamKey("2", true)
    ~3::SpamKey("3", true)
    ~4::SpamKey("4", true)
    ~5::SpamKey("5", true)
    ~a::SpamKey("a", true)
    ~d::SpamKey("d", true)
    ~z::SpamKey("z", true)
    ~x::SpamKey("x", true)
    ~f::SpamKey("f", true)
    ~s::SpamKey("s", true)
    ~!q::SpamKey("!q", true)
    ~!1::SpamKey("!1", true)
    ~!2::SpamKey("!2", true)
    ~!3::SpamKey("!3", true)
    ~+1::SpamKey("+1", true)
    ~+2::SpamKey("+2", true)
    ~+3::SpamKey("+3", true)

    $0 up::
    $1 up::
    $2 up::
    $3 up::
    $4 up::
    $5 up::
    $8 up::
    $9 up::
    $a up::
    $d up::
    $z up::
    $x up::
    $f up::
    $s up::
    breakout:=true
    breakout2:=true
    suspended:=false
    Return

#IfWinActive
