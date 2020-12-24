#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetControlDelay -1

^!r::Reload

$NumLock::SpamKeyLoop("{Space}")

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
            ControlSend,, {Blind}%key%, ahk_id %wowid2%

            ;queue up
            ;Click 398,532
            
            PixelGetColor, color, 398,532

            PixelGetColor, color, 961, 292
            if color = 0x00006F
            {
                Click 885,201
            } 
            ; Else
            ; {
            ;     MsgBox got %color%.
            ; }                
            ;ControlSend,, {Blind}0, ahk_id %wowid1%
            ;ControlClick,,%wowid1%,,R,1,NA x450 y1000
            ;Click 900,190
            ;ControlClick, x900 y190, World Of Warcraft,,,, Pos
            ;ControlClick,,%wowid1%,,R,1,NA x900 y190
            ;ControlSend, ,{Click 900, 190},ahk_id %wowid1%
            RandSleep(50 * 1000, 60 * 1000) ;sleep a random length of time			
            ;Sleep, 5000
        }
        Return
    }
}