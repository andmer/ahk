#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxThreadsPerHotkey 1
SetKeyDelay, 0, 50
WinGet, wowid, List, World of Warcraft 

^!r::Reload

~F1::
{
ControlSend,, 0, ahk_id %wowid2%
ControlSend,, 0, ahk_id %wowid1%
Sleep 50
ControlSend,, -, ahk_id %wowid2%
ControlSend,, -, ahk_id %wowid1%
}

~F2::SpamKey()
~F3::SpamKey()
~F4::SpamKey()
~a::SpamKey()
~r::SpamKey()
~f::SpamKey()
~v::SpamKey()
~1::SpamKey()
~2::SpamKey()
~3::SpamKey()
~4::SpamKey()
~5::SpamKey()
~`::
{
    ControlSend,,0, ahk_id %wowid2%
}

~d::
{
ControlSend,, =, ahk_id %wowid2%
Sleep 50
ControlSend,, -, ahk_id %wowid2%
}


WinGet, wowid, List, World of Warcraft 
SpamKey() 
{
    hotkey:=RegExReplace(A_ThisHotkey,"^(\w* & |\W*)")
    WinGet, wowid, List, World of Warcraft 
    IfWinActive, ahk_class GxWindowClass
    {
        ;MsgBox You pressed %hotkey%
        ControlSend,,0, ahk_id %wowid2%
        ControlSend,, {Blind}{%hotkey%}, ahk_id %wowid2%
    }
    Return
}

 