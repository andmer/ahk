#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreads 1
;SetKeyDelay, 5, 5

global breakout:=false
numlock:=false

$PgDn::Suspend, Toggle 
;~break::Suspend, Toggle
~insert::Suspend, Toggle 
;$LButton::SpamKey("^r|0|3")
;$RButton::SpamKey("^r|0|4")
;*MButton::SpamKey("f|r|+r|^r")
;*XButton1::SpamKey("r|+r|^r|0|3")
;*XButton2::SpamKey("r|+r|^r|0|3")
*1::SpamKey("1")
*2::SpamKey("2")
*3::SpamKey("3")
*4::SpamKey("4")
*5::SpamKey("5")
*6::SpamKey("6")
*7::SpamKey("7")
*8::SpamKey("8")
*9::SpamKey("9")

$Esc::
    if (breakout)
    {
        Send {Escape}
    }
    if (!breakout)
    {
        breakout:=true
    }
Return

~RButton & LButton::
    SpamKey2("1|2|3|4", "LButton")
Return

SpamKey(list)
{
    Hotkey:=RegExReplace(A_ThisHotkey,"^(\w* & |\W*)")
    IfWinActive, ahk_class GxWindowClass
    {
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
			Send,{Blind}%key%
            ;Send % list%counter% 
            Sleep 50
        }
        Return
    }
    Else
    {
        Send {Blind}{%Hotkey%}
        Return
    }
}

SpamKey2(list,hotkey)
{
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
			Send,{Blind}%key%
            ;Send % list%counter% 
            Sleep 50
        }
        Return
    }
    Else
    {
        Send {Blind}{%Hotkey%}
        Return
    }
}
