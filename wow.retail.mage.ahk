#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1

^!r::
breakout:=true
breakout2:=true
suspended:=true
Reload
Return

#IfWinActive, ahk_class GxWindowClass

    ~/::
    Suspend On
    SplashTextOn, , , PAUSED
    Return

    ~Return::
    Suspend
    if (!A_IsSuspended)
    {
        suspended:=false
        SetTimer, RemoveToolTip, -500
    }
    else
    {
        suspended:=true
        SplashTextOn, , , PAUSED
    }
    Return

    ~F1::SpamKey("{F1}",true)
    ~F2::SpamKey("{F2}",true)
    ~F3::SpamKey("{F3}",true)

    ~8::SpamKey("8",true) ; fire
    ~9::SpamKey("3|4",true) ; fire

    ~0::SpamKey("0",true)
    ~1::SpamKey("1",true)
    ~2::SpamKey("2",true)
    ~3::SpamKey("3",true)
    ~4::SpamKey("4",true)
    ~5::SpamKey("5",true)
    ~a::SpamKey("a",true)
    ~d::SpamKey("d",true)
    ~z::SpamKey("z",true)
    ~x::SpamKey("x",true)
    ~f::SpamKey("f",true)
    ~s::SpamKey("s",true)
    ~!q::SpamKey("!q",true)
    ~!1::SpamKey("!1",true)
    ~!2::SpamKey("!2",true)
    ~!3::SpamKey("!3",true)
    ~+1::SpamKey("+1",true)
    ~+2::SpamKey("+2",true)
    ~+3::SpamKey("+3",true)

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
    $s up::
    $f up::
    breakout:=true
    breakout2:=true
    suspended:=false
    Return

    $Esc::
        Suspend Off
        SetTimer, RemoveToolTip, -500
        if (breakout = true)
        {
            Send {Escape}
            ;Send {F12}
            Return
        }
        breakout:=true
        breakout2:=true
    Return

global breakout:=false
global breakout2:=false
global suspended:=false

*mbutton::
breakout=true
breakout2=true

^!r::
breakout:=true
breakout2:=true
suspended:=true
Reload
Return

$Pause::
Suspend, Off
suspended:=false
SplashTextOn, , , ACTIVE
SetTimer, RemoveToolTip, -1000
Return

!Pause::
Suspend, On
suspended:=true
SplashTextOn, , , PAUSED
SetTimer, RemoveToolTip, -1000
Return

RemoveToolTip:
SplashTextOff
return

    /*
    ~!RButton::
        ;flag return spam
        While GetKeyState("RButton","P"){
            Click
            Sleep 50
        }
    return
    */

Loop(list,hotkey)
{
    WinGet, wowid, List, World of Warcraft
    Hotkey:=RegExReplace(hotkey,"^(\w* & |\W*)")
    IfWinActive, ahk_class GxWindowClass
    {
        stringsplit, list, list,`|
        Counter:=0
        breakout:=false
        While, true {
            If (suspended)
            {
                Continue
            }
            If (breakout)
            {
                break
            }
            Counter:=(Counter=list0) ? (1) : (Counter+1)
            key:=% list%counter%
            ControlSend,, {Blind}%key%, ahk_id %wowid1%
	        ;Send,%key%
            if (counter = list0)
            {
                Sleep 50
            }
        }
        Return
    }
    Else
    {
        Send {Blind}{%Hotkey%}
        Return
    }
}

SpamKey(list,spam)
{
    SpamKey2(list,spam,"")
    Return
}

SpamKey2(list,spam,hotkey)
{
    WinGet, wowid, List, World of Warcraft
    if (!hotkey)
    {
        ;SplashTextOn, , , hotkey
        hotkey:=RegExReplace(A_ThisHotkey,"^(\w* & |\W*)")
    }
    IfWinActive, ahk_class GxWindowClass
    {
        stringsplit, list, list,`|
        Counter:=0
        breakout2:=false
        While, GetKeyState(hotkey, "p") {
            If (suspended)
            {
                Continue
            }
            If (breakout2)
            {
                break
            }
            Counter:=(Counter=list0) ? (1) : (Counter+1)
            key:=% list%counter%
            ;ControlSend,, {Blind}%key%, ahk_id %wowid1%
            Send,%key%
            if (counter = list0)
            {
                Sleep 50
            }
        }
        Return
    }
    Else
    {
        Send {Blind}{%Hotkey%}
        Return
    }
}

#IfWinActive
