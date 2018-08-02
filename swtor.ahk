#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetKeyDelay, 5, 5

HotKey, LButton, Toggle
HotKey, RButton, Toggle
mouseLook:=0
breakout:=false

k4:="'|4|,|+4|^4|."
k5:="5|+5"
$LButton::SpamKey(k4)
$RButton::SpamKey(k5)
$0::SpamKey("0")
$1::SpamKey("1|+1|^1")
$2::SpamKey("2")
$3::SpamKey("3|+3")
$4::SpamKey(k4)
$5::SpamKey(k5)
$6::SpamKey("6|+6")
$7::SpamKey("7")
$8::SpamKey("8|+8")
$9::SpamKey("9|+9|^9")

SpamKey(list)
{
    Hotkey := RegExReplace(A_ThisHotkey,"^(\w* & |\W*)")
    IfWinActive, ahk_class PlayerClient
    {
        stringsplit, list, list,`|
        Counter:=0
        global breakout := false
        While, GetKeyState(Hotkey, "p") {
            If(breakout)
            {
                break
            }
            Counter := (Counter=list0) ? (1) : (Counter+1)
            Send % list%counter%
            Sleep 50
        }
        Return
    }
    Else
    {
        Send {%Hotkey%}
        Return
    }
}

#IfWinActive, ahk_class PlayerClient
    $`::
    If (mouseLook=0)
    {
	    Send {RButton Down}
	    mouseLook:=1
        HotKey, LButton, Toggle
        HotKey, RButton, Toggle
        Return
    }
    Else
    {
		Send {RButton up}
        mouseLook:=0
        HotKey, LButton, Toggle
        HotKey, RButton, Toggle
        Return
    }
    Return

    $Esc::
    if(breakout)
    {
        Send {Escape}
    }
    if(!breakout)
    {
        breakout := true
    }
    if(mouseLook)
    {
        mouseLook:=0
        HotKey, LButton, Toggle
        HotKey, RButton, Toggle
    }
    Return
#IfWinActive

;~$LButton::
;    While GetKeyState("LButton","P"){
;        Click
;        Sleep 50  ;  milliseconds
;    }
;return
