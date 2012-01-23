WinGet, wowid, List, World of Warcraft
HotKey, LButton, Toggle
HotKey, RButton, Toggle

;$Capslock::
;IfWinActive, World of Warcraft
;{
;HotKey, LButton, Toggle
;HotKey, RButton, Toggle
;Send {0}
;Return
;}

~MButton::
IfWinActive, World of Warcraft
{
HotKey, LButton, Toggle
HotKey, RButton, Toggle
Send {0}
Return
}

~RButton & LButton::
IfWinActive, World of Warcraft
{
Send {-}
Return
}

~LButton::
IfWinActive, World of Warcraft
{
Send {F11}
Send {F12}
Send {3}
return
}

~RButton::
IfWinActive, World of Warcraft
{
Send {F11}
Send {F12}
Send {4}
return
}


;~3::
;IfWinActive, World of Warcraft
;{
;Send {F11}
;Send {F12}
;Send {3}
;return
;}

;~4::
;IfWinActive, World of Warcraft
;{
;Send {F11}
;Send {F12}
;Send {4}
;return
;}

~XButton1::
IfWinActive, World of Warcraft
{
Send {F3}
return
}