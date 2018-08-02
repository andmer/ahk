#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreads 1
;SetKeyDelay, 5, 5

; HotKey, LButton, Toggle
; HotKey, RButton, Toggle
; mouseLook:=false
numlock:=false

$PgDn::Suspend, Toggle 
;~break::Suspend, Toggle
;~insert::Suspend, Toggle 
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
*0::SpamKey("0")
;*f::SpamKey("f")

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

#IfWinActive, ahk_class GxWindowClass
    Capslock::Shift

    $RButton::
        If (mouseLook)
        {
            Return
        }
        Else
        {
            Send {RButton Down}
        }
    Return

     $RButton Up::
        If (mouseLook)
        {
            Return
        }
        Else
        {
            Send {RButton Up}
        }
    Return

    ~$LButton Up::
        If (GetKeyState("RButton", "p"))
        {
            If (mouseLook)
            {
                mouseLook:=false
                Send {RButton up}
                Return
            }
            Else
            {
                mouseLook:=true
                Send {RButton Down}
                Return
            }
        }
    Return

    $Capslock::
    If (mouseLook)
    {
        Send {RButton up}
        mouseLook:=false
        ; HotKey, LButton, Toggle
        ; HotKey, RButton, Toggle
        Return
    }
    Else
    {
        Send {RButton Down}
        mouseLook:=true
        ; HotKey, LButton, Toggle
        ; HotKey, RButton, Toggle
        Return
    }
    Return

  	~RButton & LButton::
		;SpamKey2("3|-|+-|^-|3|0|5|A|=", "LButton")
		Send,{Blind} w
	Return

	$MButton::
        if (breakout)
        {
            Send {MButton}
        }
        if (!breakout)
        {
            breakout:=true
        }
		/*
		if (mouseLook)
        {
            mouseLook:=false
            ; HotKey, LButton, Toggle
            ; HotKey, RButton, Toggle
            Send {RButton up}
        }
		*/		
     Return

	 $Esc::
        if (breakout)
        {
            Send {Escape}
        }
        if (!breakout)
        {
            breakout:=true
        }
		/*
		if (mouseLook)
        {
            mouseLook:=false
            ; HotKey, LButton, Toggle
            ; HotKey, RButton, Toggle
            Send {RButton up}
        }
		*/		
     Return

    /*
    ~$LButton::
        While GetKeyState("LButton","P"){
            Click
            Sleep 50  ;  milliseconds
        }
    Return
    */
#IfWinActive
