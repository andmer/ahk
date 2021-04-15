#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
#Include %A_ScriptDir%\common.ahk

#IfWinActive, ahk_class GxWindowClass

/*
    ;~RButton & LButton::SpamKey2("a|1|2|3|4|5", true, "RButton") ;fury
    ;~RButton & LButton::SpamKey2("a|1|2|3|4|5", true, "RButton") ;fury
    ;~RButton & LButton::SpamKey2("!1|d|1|2|3|4", true, "RButton") ;ret
	;~RButton & LButton::SpamKey2("d|t|5|6|d|1|2|3|4", true, "RButton") ;ret
*/
    ~RButton & mbutton::SpamKey2("1|1|1|1|3|2|2|2|4|5", true, "RButton")
    ~1::SpamKey("1",true)
    ~2::SpamKey("2",true)
	;~3::SpamKey("3",true)
    ~8::SpamKey("1|4",true)
    
    ;~3::SpamKey("1|1|1|2|2|2|3|4|5",true) ; fury
    ;~9::SpamKey("1|1|1|2|2|2|3|4|5",true) ; fury
    ;~9::SpamKey("2|2|2|3|1|4|5",true) ; fury
    
    ~3::SpamKey("1|1|1|1|3|2|2|2|4|5",true) ; arms
    ;~8::SpamKey("2|2|2|2|1|1|1|3|4|5",true) ; arms
    ~9::SpamKey("1|1|1|1|2|2|2|3|4|5",true) ; arms

    ;~3::SpamKey("6|6|6|5|2|z|3|3|3|1|4",true) ; prot  
    ;~9::SpamKey("6|6|6|5|2|z|3|3|3|1|4",true) ; prot  
    ;~9::SpamKey("4|1|2|3|5",true) ; prot  

    
    ; ~2::SpamKey("!3|d|5|6|d|1|2|3|4",true);
    ; ~4::SpamKey("!3|d|5|6|d|1|2|3|4",true)
      
    ~4::SpamKey("4",true)
    ~5::SpamKey("5",true)
    ~a::SpamKey("a",true)
    ~z::SpamKey("z",true)
    ~x::SpamKey("x",true)
    ~r::SpamKey("r",true)
    ~v::SpamKey("v",true)
    ~f::SpamKey("f|!f",true)
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
    ;$9 up::
    $a up::
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
