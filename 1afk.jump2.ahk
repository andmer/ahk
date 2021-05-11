#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetControlDelay -1

^!r::Reload

$NumLock::SpamKeyLoop("0|9|0|0")

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
            
            PixelGetColor, color, 838, 204
            if color = 0x000080
                Click 838,204
            ;else
                ;MsgBox The color at the current cursor position is %color%.
            ; EC1D00


            PixelGetColor, color2, 1786, 144
            if color2 = 0x0E2449
            {                
                ;MsgBox skip queue
                ControlSend,, {Blind}0, ahk_id %wowid1%
                RandSleep(1 * 20 * 1000, 1 * 50 * 1000) ;sleep a random length of time
            }
            else
            {
                ;MsgBox The color2 at the current cursor position is %color2%.
                ControlSend,, {Blind}%key%, ahk_id %wowid1%
                ;ControlSend,, {Blind}%key%, ahk_id %wowid2%
                if (counter = list0)
                {
                    ;Sleep 1 * 1 * 1000
                    RandSleep(1 * 20 * 1000, 1 * 50 * 1000) ;sleep a random length of time

                }
                Sleep 500
            }
        }
        Return
    }
}