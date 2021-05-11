#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
#Include %A_ScriptDir%\common.ahk

#IfWinActive, ahk_class GxWindowClass
    ~RButton & mbutton::SpamKey2("1|2|3|4", true, "RButton")
    ~F1::SpamKey("{F1}",true)
    ~F2::SpamKey("{F2}",true)
    ~F3::SpamKey("{F3}",true)

    ~1::SpamKey("1",true)
    ~2::SpamKey("2",true)
    ~3::SpamKey("3",true)

    ~9::SpamKey("1|2|3|4",true)
     
    ~4::SpamKey("4",true)
    ~5::SpamKey("5",true)
    ~a::SpamKey("a",true)
    ~d::SpamKey("d",true)
    ~z::SpamKey("z",true)
    ~x::SpamKey("x",true)
    ~r::SpamKey("r",true)
    ~v::SpamKey("v",true)
    ~f::SpamKey("f",true)
    ~!q::SpamKey("!q",true)
    ~!r::SpamKey("!r",true)
    ~!1::SpamKey("!1",true)
    ~!2::SpamKey("!2",true)
    ~!3::SpamKey("!3",true)

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
    $r up::
    $v up::
    $x up::
    $f up::
    breakout:=true
    breakout2:=true
    suspended:=false
    Return

#IfWinActive
