#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
HotKey, LButton, Off
HotKey, RButton, Off
;$LButton::Click
$LButton::SpamKey("6|1|2|3|4|5", false)
$RButton::SpamKey("6|r", true)

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
            ;ControlSend,, {Blind}%key%, ahk_id %wowid1%
	        Send,{Blind}%key%
            if (counter = list0)
            {
                Sleep 1200
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
SpamKey(list,spam)
{
    WinGet, wowid, List, World of Warcraft 
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
            ;ControlSend,, {Blind}%key%, ahk_id %wowid1%
            Send,{Blind}%key%
            if (spam)
            {
                Sleep 60                
            }
            else 
            {
                if (counter = list0)
                {
                    Sleep 1200
                } 
                else 
                {
                    Sleep 0
                }
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
    *1::SpamKey("1",true)
    *2::SpamKey("2",true)
    *3::SpamKey("3",true)
    *4::SpamKey("4",true)
    *5::SpamKey("5",false)
    *f::SpamKey("3|f",true)
    *!r::SpamKey("r",true)

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
		SpamKeyLoop("1|1|1|2|3|4|5|6|7", "LButton")
        ;SpamKeyLoop("-", "LButton")
	Return

    ;flag return spam
    ~!LButton::
        While GetKeyState("LButton","P"){
            Click
            Sleep 50
        }
    return
 
 #IfWinActive
