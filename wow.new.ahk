#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#MaxThreads 2
;SetKeyDelay, 5, 5

breakout:=false

$Pause:: Suspend, Off
!Pause:: Suspend, On
*mbutton::breakout=true

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
            Sleep 60
        }
        Return
    }
    Else
    {
        Send {Blind}{%Hotkey%}
        Return
    }
}
SpamKey(list)
{
    Hotkey:=RegExReplace(A_ThisHotkey,"^(\w* & |\W*)")
    IfWinActive, ahk_class GxWindowClass
    {
        stringsplit, list, list,`|
        Counter:=0
        global breakout2:=false
        While, GetKeyState(Hotkey, "p") {
            If (breakout2)
            {
                break
            }
            Counter:=(Counter=list0) ? (1) : (Counter+1)
            key:=% list%counter%
            Send,{Blind}%key%
            Sleep 60
        }
        Return
    }
    Else
    {
        Send {Blind}{%Hotkey%}
        Return
    }
}

#IfWinActive, ahk_class GxWindowClass
    *1::SpamKey("1")
    *2::SpamKey("2")
    *3::SpamKey("3")
    *4::SpamKey("4")
    *f::SpamKey("f|4")
    *r::SpamKey("r")

    $Esc::
        if (breakout)
        {
            Send {Escape}
        }
        breakout:=true        
    Return

  	~RButton & LButton::
		SpamKey2("-", "LButton")
	Return
 
 #IfWinActive
