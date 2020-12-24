#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetControlDelay -1
SetKeyDelay, 20 

^!r::Reload

~NumpadAdd::SpamKeyLoop("0|-|0|0")

RandSleep(x,y) {
    Random, rand, %x%, %y%
    Sleep %rand%
}

SpamKeyLoop(list)
{
    WinGet, wowid, List, World of Warcraft 
    IfWinActive, ahk_class GxWindowClass
    {
        stringsplit, list, list,`|
        Counter:=0
        While, true {
            Counter:=(Counter=list0) ? (1) : (Counter+1)
            key:=% list%counter%           
            ControlSend,, {Blind}%key%, ahk_id %wowid1%
            ;ControlSend,, {Blind}%key%, ahk_id %wowid2%
            if (counter = list0)
            {
                RandSleep(1 * 60 * 1000, 1 * 70 * 1000) ;sleep a random length of time
            }
            else 
            {
			    Sleep 500
            }
        }
        Return
    }
}