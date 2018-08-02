#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

mouseLook:=false
breakout:=false

~PgDn::Suspend, Toggle
;~break::Suspend, Toggle

*1::SpamKey("f|1")
*2::SpamKey("f|2")
*3::SpamKey("f|3")
*4::SpamKey("f|4")
*5::SpamKey("f|5")
*r::SpamKey("f|r")


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
            Sleep 50
        }
        Return
    }
    Else
    {
        Send {%Hotkey%}
        Return
    }
}

#IfWinActive, ahk_class GxWindowClass
  	~RButton & LButton::
		SpamKey2("f|3|1|2|4", "LButton")		
	Return
	;$LButton Up::
	;	Send, {q up}}
	;Return

/*
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
 */
    $Esc::
        if (breakout)
        {
            Send {Escape}
        }
        if (!breakout)
        {
            breakout:=true
        }
        if (mouseLook)
        {
            mouseLook:=false
            Send {RButton up}
        }
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
