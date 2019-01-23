#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
;#MaxThreads 2
;SetKeyDelay, 5, 5
;ToolTip, Multiline`nTooltip,(A_ScreenWidth // 2), (A_ScreenHeight // 2)
HotKey, LButton, Off
HotKey, RButton, Off
;$LButton::Click
$LButton::SpamKey("-")
$RButton::SpamKey("f|2|3")

breakout:=false
mouseLook:=false

*mbutton::
breakout=true
breakout2=true
if(mouseLook)
{
    Send {RButton up}
    mouseLook:=false
    HotKey, LButton, Off
    HotKey, RButton, Off
}
Return

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
            if (counter = 6)
            {
                Sleep 1200
            } 
            else 
            {
                Sleep 60
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
            if (counter = 6)
            {
                Sleep 1200
            } 
            else 
            {
                Sleep 60
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

#IfWinActive, ahk_class GxWindowClass
    *1::SpamKey("f|1")
    *2::SpamKey("f|2")
    *3::SpamKey("f|3")
    *4::SpamKey("f|4")
    *5::SpamKey("f|2|3|4|5")
    *f::SpamKey("f|1|2|3|4|5")
    *r::SpamKey("f|r")

    $`::
    If (mouseLook)
    {
		Send {RButton up}
        mouseLook:=false
        HotKey, LButton, Off
        HotKey, RButton, Off
        Return
    }
    Else
    {
	    Send {RButton Down}
	    mouseLook:=true
        HotKey, LButton, On
        HotKey, RButton, On
        Return
    }
    Return

    $Esc::
        if (breakout = true)
        {
            Send {Escape}
            Return
        }
        breakout:=true   
        breakout2:=true    
        if(mouseLook)
        {
    		Send {RButton up}
            mouseLook:=false
            HotKey, LButton, Off
            HotKey, RButton, Off
        }
    Return

  	~RButton & LButton::
		SpamKey2("f|1|2|3|4|5", "LButton")
	Return

    ;flag return spam
    ~!LButton::
        While GetKeyState("LButton","P"){
            Click
            Sleep 50  ;  milliseconds
        }
    return
 
 #IfWinActive
