#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1

global suspended:=false
global breakout2:=false

^!r::
breakout2:=true    
suspended:=true
Reload
Return

#IfWinActive, ahk_class GxWindowClass
     ~Return::
     Suspend
     if (!A_IsSuspended) 
     {
         suspended:=false
     }
     else 
     {
         suspended:=true
     }
     Return
   $Esc::
        Suspend Off
        if (breakout2 = true)
        {
            Send {Escape}
            ;Send {F12}
            Return
        }
        breakout2:=true    
        suspended:=false
    Return

~RButton & LButton::SpamKey2("f|2|3", "RButton")

; charge,intercept,execute,overpower,mortal strike,whirlwind
$1::SpamKey("1")
$2::SpamKey("f|2")
$3::SpamKey("f|2|3")
$F::SpamKey("f|2|3")

SpamKey(list) 
{
    SpamKey2(list,"")
    Return
}

SpamKey2(list, hotkey)
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
                break
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
 