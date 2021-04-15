#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
#Include %A_ScriptDir%\common.ahk

#IfWinActive, ahk_class GxWindowClass
    ~1::SpamKey("1",true)
    ~4::SpamKey("4",true)
    ~5::SpamKey("5",true)

    ~2::SpamKey("5|5|5|1|2|3|z|4",true) ; ret
    ~3::SpamKey("d|d|d|d|1|2|3|4|z",true) ; ret
    ~8::SpamKey("5|5|5|1|2|3|z|4",true) ; ret
    ~9::SpamKey("d|d|d|d|1|2|3|4|z",true) ; ret

    ;~2::SpamKey("5|5|5|1|2|z|3|4",true) ; prot
    ;~8::SpamKey("5|5|5|1|2|z|3|4",true) ; prot
    ;~3::SpamKey("x|x|x|d|d|1|2|z|3|4",true) ; prot
    ;~9::SpamKey("x|x|x|d|d|1|2|z|3|4",true) ; prot
     

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
