#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetControlDelay -1
breakout:=false

^!r::Reload

$Pause::
Suspend, Off
SplashTextOn, , , ACTIVE
SetTimer, RemoveToolTip, -500
Return

!Pause::
Suspend, On
SplashTextOn, , , PAUSED
SetTimer, RemoveToolTip, -500
Return

RemoveToolTip:
SplashTextOff
return

;$ScrollLock::SpamKeyLoop("{Space}", "LButton")
$ScrollLock::SpamKeyLoop("w|{Space}", "LButton")


SpamKeyLoop(list,hotkey)
{
    WinGet, wowid, List, World of Warcraft 
    Hotkey:=RegExReplace(hotkey,"^(\w* & |\W*)")
    IfWinActive, ahk_class GxWindowClass
    {
        stringsplit, list, list,`|
        Counter:=0
        global breakout:=false
        While, true {
            If (breakout)
            {
                break
            }
            Counter:=(Counter=list0) ? (1) : (Counter+1)
            key:=% list%counter%
            ;Click 926,983
            ;Sleep 1000

            ; Click 986,755
            ; Sleep 1000
            ; Click 973,292, right
            ; Sleep 2000
            ; Click 195,328
            ; Sleep 2000
            ; Click 251,667
            ; Sleep 5000
            ; Click 872,245
            ControlSend,, {Blind}%key%, ahk_id %wowid1%
	        ;Send,{Blind}%key%
            if (counter = list0)
            {
                Sleep 30000
            } 
            else 
            {
                Sleep 0
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