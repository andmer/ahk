#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

HotKey, LButton, Toggle
HotKey, RButton, Toggle
mouseLook=0

$LButton::
	Send {1}
Return

$RButton::
	Send {2}
Return

$F1::
IfWinActive, Star Wars: The Old Republic
{
	If (mouseLook=0)
	{
		Send {RButton Down}
		mouseLook:=1
		HotKey, LButton, Toggle
		HotKey, RButton, Toggle
		Return
	}
	Else
	{
		Send {RButton up}
		mouseLook:=0
		HotKey, LButton, Toggle
		HotKey, RButton, Toggle
		Return
	}
	Return
}
Else
{
	Send {F1}
	return
}

~RButton & LButton::
IfWinActive, Star Wars: The Old Republic
{
	If (mouseLook=0)
	{
		Send {RButton Down}
		mouseLook:=1
		HotKey, LButton, Toggle
		HotKey, RButton, Toggle
		Return
	}
	Else
	{
		Send {RButton up}
		mouseLook:=0
		HotKey, LButton, Toggle
		HotKey, RButton, Toggle
		Return
	}
	Return
}

$0::
IfWinActive, Star Wars: The Old Republic
{
  Loop
  {
   if not GetKeyState("0", "P")
     break
    Send {Blind}{0}
    Send {Blind}{1}
    sleep 100
   }
return
}
Else
{
	Send {0}
	return
}

$1::
IfWinActive, Star Wars: The Old Republic
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


$2::
IfWinActive, Star Wars: The Old Republic
{
  Loop
  {
   if not GetKeyState("2", "P")
     break
    Send {Blind}{2}
    sleep 100
   }
return
}
Else
{
	Send {2}
	return
}

$3::
IfWinActive, Star Wars: The Old Republic
{
  Loop
  {
   if not GetKeyState("3", "P")
     break
    Send {Blind}{3}
    sleep 100
   }
return
}
Else
{
	Send {3}
	return
}

$4::
IfWinActive, Star Wars: The Old Republic
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
IfWinActive, Star Wars: The Old Republic
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
IfWinActive, Star Wars: The Old Republic
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

$7::
IfWinActive, Star Wars: The Old Republic
{
  Loop
  {
   if not GetKeyState("7", "P")
     break
    Send {Blind}{7}
    sleep 100
   }
return
}
Else
{
	Send {7}
	return
}

$8::
IfWinActive, Star Wars: The Old Republic
{
  Loop
  {
   if not GetKeyState("8", "P")
     break
    Send {Blind}{8}
    sleep 100
   }
return
}
Else
{
	Send {8}
	return
}

$9::
IfWinActive, Star Wars: The Old Republic
{
  Loop
  {
   if not GetKeyState("9", "P")
     break
    Send {Blind}{9}
    sleep 100
   }
return
}
Else
{
	Send {9}
	return
}
