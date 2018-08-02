;WinGet, wowid, List, ahk_class GxWindowClassD3d
;Hotkey, IfWinActive, ahk_class GxWindowClassD3d
;HotKey, LButton, Toggle
;HotKey, RButton, Toggle

;#IfWinActive, ahk_class GxWindowClassD3d
;$XButton1::
;HotKey, LButton, Toggle
;HotKey, RButton, Toggle
;send {0}
;Return
;#IfWinActive

#IfWinActive, ahk_class GxWindowClassD3d
;~MButton::
;HotKey, LButton, Toggle
;HotKey, RButton, Toggle
;Send {0}
;Return
;#IfWinActive

#IfWinActive, ahk_class GxWindowClassD3d
~RButton & LButton::
Loop  
   {
    if not GetKeyState("LButton", "P")
      break
     Send {Blind}{F8}
      sleep 10
     Send {Blind}{F9}
      sleep 10
     Send {Blind}{3}
      sleep 900
    }
return
#IfWinActive

#IfWinActive, ahk_class GxWindowClassD3d
~LButton & RButton::
Loop  
   {
    if not GetKeyState("RButton", "P")
      break
     Send {Blind}{4} 
       sleep 100
    }
return
#IfWinActive

;#IfWinActive, ahk_class GxWindowClassD3d
;$LButton::
;Send {3}
;return
;#IfWinActive

;#IfWinActive, ahk_class GxWindowClassD3d
;$RButton::
;Send {4}
;return
;#IfWinActive

$1::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("1", "P")
     break
    Send {Blind}{1}
    sleep 100
   }
return
}
Else
{
Send {1}
return
}


$3::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("3", "P")
     break
     Send {Blind}{F8}
      sleep 10
     Send {Blind}{F9}
      sleep 10
     Send {Blind}{3}
      sleep 900
   }
return
}
Else
{
Send {3}
return
}

$4::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("4", "P")
     break
    Send {Blind}{4}
      sleep 100
   }
return
}
Else
{
Send {4}
return
}

$5::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("5", "P")
     break
    Send {Blind}{5}
    sleep 100
   }
return
}
Else
{
Send {5}
return
}

$6::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("6", "P")
     break
    Send {Blind}{6}
    sleep 100
   }
return
}
Else
{
Send {6}
return
}


$F1::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("F1", "P")
     break
    Send {F1}
    sleep 100
   }
return
}
Else
{
Send {F1}
return
}

$F2::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("F2", "P")
     break
    Send {F2}
    sleep 100
   }
return
}
Else
{
Send {F2}
return
}

$F3::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("F3", "P")
     break
    Send {F3}
    sleep 100
   }
return
}
Else
{
Send {F2}
return
}

$F4::
IfWinActive, ahk_class GxWindowClassD3d
{
  Loop
  {
   if not GetKeyState("F4", "P")
     break
    Send {F4}
    sleep 100
   }
return
}
Else
{
Send {F4}
return
}

#IfWinActive, ahk_class Star Wars Galaxies
~*$LButton::
Send {F12}
Send {LButton down}
return
#IfWinActive