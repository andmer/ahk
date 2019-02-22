#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
HotKey, LButton, Off
HotKey, RButton, Off
;$LButton::Click
;$LButton::SpamKey("1|1|1|2|3|4|5|6|7", false)
$LButton::SpamKey("1|2|3|4|5", false)
$RButton::SpamKey("f", true)

global breakout:=false
global breakout2:=false
global mouseLook:=false
global suspended:=false

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
suspended:=false
SplashTextOn, , , ACTIVE
SetTimer, RemoveToolTip, -500
Return

!Pause::
Suspend, On
suspended:=true
SplashTextOn, , , PAUSED
;SetTimer, RemoveToolTip, -500
Return

RemoveToolTip:
SplashTextOff
return


Loop(list,hotkey)
{
    WinGet, wowid, List, World of Warcraft 
    Hotkey:=RegExReplace(hotkey,"^(\w* & |\W*)")
    IfWinActive, ahk_class GxWindowClass
    {
        stringsplit, list, list,`|
        Counter:=0
        breakout:=false
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
                Sleep 50
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
        breakout2:=false
        While, GetKeyState(Hotkey, "p") {
            If (breakout2)
            {
                break
            }
            Counter:=(Counter=list0) ? (1) : (Counter+1)
            key:=% list%counter%
            ;ControlSend,, {Blind}%key%, ahk_id %wowid1%
            Send,{Blind}%key%
            Sleep 100              
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
    
    ~/::
    Suspend On
    SplashTextOn, , , PAUSED    
    Return

    ~Return::
    Suspend
    if (!A_IsSuspended) 
    {
        suspended:=false
        SetTimer, RemoveToolTip, -500
    }
    else 
    {
        suspended:=true
        SplashTextOn, , , PAUSED    
    }
    Return

    *1::SpamKey("1",true)
    *2::SpamKey("2",true)
    *3::SpamKey("3",true)
    *4::SpamKey("4",true)
    *5::SpamKey("5",true)
    *a::SpamKey("a",true)
    *s::SpamKey("s",true)
    *d::SpamKey("d",true)
    *f::SpamKey("f",true)
    *z::SpamKey("z",true)
    *x::SpamKey("x",true)
    ;*c::SpamKey("c",true)
    *r::SpamKey("r",true)
    *v::SpamKey("v",true)

    $1 up::
    breakout2:=true    
    Return
    $2 up::
    breakout2:=true    
    Return
    $3 up::
    breakout2:=true    
    Return
    $4 up::
    breakout2:=true    
    Return
    $5 up::
    breakout2:=true    
    Return
    $f up::
    breakout2:=true    
    Return
    $x up::
    breakout2:=true    
    Return

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
        Suspend Off
        SetTimer, RemoveToolTip, -500
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
		;Loop("!1|!2|6|5|3|2", "LButton") ; prot
        Loop("5|2|3|4|6", "LButton") ; arms
		;Loop("a|1|2|3|4|5|6", "LButton") ; fury
        ;Loop("-", "LButton")
	Return

    ;flag return spam
     ;~!RButton::
     ;    While GetKeyState("RButton","P"){
     ;        Click
     ;        Sleep 50
     ;    }
     ;return
 
 #IfWinActive
