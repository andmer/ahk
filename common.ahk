^!r::
    breakout:=true
    breakout2:=true
    suspended:=true
    Reload
Return

#IfWinActive, ahk_class GxWindowClass

global breakout:=false
global breakout2:=false
global suspended:=false

~/::
    Suspend On
    SplashTextOn, , , PAUSED
Return

~Return::
    Suspend
    if (!A_IsSuspended) {
        suspended:=false
        SetTimer, RemoveToolTip, -500
    } else {
        suspended:=true
        SplashTextOn, , , PAUSED
    }
Return

$Esc::
    Suspend Off
    SetTimer, RemoveToolTip, -500
    if (breakout = true) {
        Send {Escape}
        ;Send {F12}
    Return
}
breakout:=true
breakout2:=true
Return

*mbutton::
    breakout=true
    breakout2=true
    
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
    
    SpamKey(list, spam)
    {
        SpamKey2(list, spam, "")
        Return
    }
    
    SpamKey2(list, spam, hotkey)
    {
        WinGet, wowid, List, World of Warcraft
        if (!hotkey) {
            ;SplashTextOn, , , hotkey
            hotkey:=RegExReplace(A_ThisHotkey, "^(\w* & |\W*)")
        }
        IfWinActive, ahk_class GxWindowClass
        {
            stringsplit, list, list, `|
            Counter:=0
            breakout2:=false
            while , GetKeyState(hotkey, "p") {
                if (suspended) {
                    Continue
                }
                if (breakout2) {
                    break
                }
                Counter:=(Counter=list0) ? (1) : (Counter+1)
                key:=% list%counter%
                ;ControlSend, , {Blind}%key%, ahk_id %wowid1%
                Send, %key%
                if (counter = list0) {
                    Sleep 50
                }
            }
            Return
        }else {
            Send {Blind}{%Hotkey%}
            Return
        }
    }
    
    Loop(list, hotkey)
    {
        WinGet, wowid, List, World of Warcraft
        Hotkey:=RegExReplace(hotkey, "^(\w* & |\W*)")
        IfWinActive, ahk_class GxWindowClass
        {
            stringsplit, list, list, `|
            Counter:=0
            breakout:=false
            while , true {
                if (suspended) {
                    Continue
                }
                if (breakout) {
                    break
                }
                Counter:=(Counter=list0) ? (1) : (Counter+1)
                key:=% list%counter%
                ControlSend, , {Blind}%key%, ahk_id %wowid1%
                ;Send, %key%
                if (counter = list0) {
                    Sleep 50
                }
            }
            Return
        }else {
            Send {Blind}{%Hotkey%}
            Return
        }
    }
    
    #IfWinActive
    