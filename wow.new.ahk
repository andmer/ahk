#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;#MaxThreadsPerHotkey 1
HotKey, LButton, Off
HotKey, RButton, Off
;$LButton::Click
;$LButton::SpamKey("1|1|1|2|3|4|5|6|7", false)
$LButton::SpamKey("1|2|3|4|5", false)
$RButton::SpamKey("f", true)
; $LButton::
; IfWinActive, ahk_class GxWindowClass
; {
;     Send {q Down}
; }
; Return

; $RButton::
; IfWinActive, ahk_class GxWindowClass
; {
;     Send {e Down}
; }
; Return

Input, SingleKey, L1
MsgBox You pressed %SingleKey%.

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
            If (suspended) 
            {
                Continue
            }
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
                Sleep 200
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
            Send,{Blind}%key%
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
    *z::SpamKey("z",true)
    *x::SpamKey("x",true)
    *r::SpamKey("r",true)
    *v::SpamKey("v",true)
    *F1::SpamKey("{f1}",true)

    ; $LButton up::
    ; Send {q Up}
    ; Return

    ; $RButton up::
    ; Send {e Up}
    ; Return

    ~1::
    ~2::
    ~3::
    ~4::
    ~5::
    ~a::
    ~d::
    ~z::
    ~r::
    ~v::
    ~x::
    breakout2:=true    
    suspended:=true
    Return

    $1 up::
    $2 up::
    $3 up::
    $4 up::
    $5 up::
    $a up::
    $d up::
    $z up::
    $r up::
    $v up::
    $x up::
    breakout2:=true    
    suspended:=false
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
            Send {F12}
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
		;Loop("!1|!2|6|5|3|!4", "LButton") ; prot
        ;Loop("!1|5|2|3|4|6", "LButton") ; arms
	    Loop("a|1|2|3|4|5", "LButton") ; fury
        ;Loop("a|1|2|3|4", "LButton") ; pally prot
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
 