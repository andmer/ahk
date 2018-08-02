#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

mouseLook:=false
breakout:=false

~Pause::Suspend, Toggle

*1::SpamKey("1")
*2::SpamKey("2")
*3::SpamKey("3")
*4::SpamKey("4")
*5::SpamKey("5")
*6::SpamKey("6")
*7::SpamKey("7")
*8::SpamKey("8")
*9::SpamKey("9")
*0::SpamKey("0")
;*-::SpamKey("-")
;*=::SpamKey("=")

SpamKey(list)
{
    Hotkey:=RegExReplace(A_ThisHotkey,"^(\w* & |\W*)")
        stringsplit, list, list,`|
        Counter:=0
        global breakout:=false
        While, GetKeyState(Hotkey, "p") {
            If (breakout)
            {
                break
            }
            Counter:=(Counter=list0) ? (1) : (Counter+1)
            key:=% list%counter%
            Send,{Blind}{%key%}
            Sleep 50
        }
        Return
}

    Capslock::Shift

    $RButton::
        If (mouseLook)
        {
            Return
        }
        Else
        {
            Send {RButton Down}
        }
    Return

    $RButton Up::
        If (mouseLook)
        {
            Return
        }
        Else
        {
            Send {RButton Up}
        }
    Return

    ~$LButton Up::
        If (GetKeyState("RButton", "p"))
        {
            If (mouseLook)
            {
                mouseLook:=false
                Send {RButton up}
                Return
            }
            Else
            {
                mouseLook:=true
                Send {RButton Down}
                Return
            }
        }
    Return

    $Esc::
        if (breakout)
        {
            Send {Escape}
        }
        if (!breakout)
        {
            breakout:=true
        }
        if (mouseLook)
        {
            mouseLook:=false
            Send {RButton up}
        }
    Return

    /*
    ~$LButton::
        While GetKeyState("LButton","P"){
            Click
            Sleep 50  ;  milliseconds
        }
    Return
    */
