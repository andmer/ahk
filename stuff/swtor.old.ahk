#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #IfWinActive, World of Warcraft
; $1::SpamKey()
; $2::SpamKey()
; $3::SpamKey()
; $4::SpamKey()
; $5::SpamKey()
; #IfWinActive

; SpamKey() {
   ; Hotkey := RegExReplace(A_ThisHotkey,"^(\w* & |\W*)")
   ; While, GetKeyState(Hotkey, "p") {
      ; Send, %Hotkey%
      ; Random, rand, 20, 35
      ; Sleep, %rand%
   ; }
; }

HotKey, LButton, Toggle
HotKey, RButton, Toggle
mouseLook=0

$LButton::
	Loop
	{
		GetKeyState, state, LButton, p
		if state = U
		break
		; Otherwise:
		Send, {4}
		sleep, 100
		Send, +{4}
		sleep, 100
		Send, ^{4}
		sleep, 100
		Send, {.}
		sleep, 500
	}
Return

$RButton::
	Loop
	{
		GetKeyState, state, RButton, p
		if state = U
		break
		; Otherwise:
		Send, {5}
		sleep, 100
		Send, +{5}
		sleep, 500
	}
Return

$MButton::
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
	Send {`}
	return
}

$0::
IfWinActive, Star Wars: The Old Republic
{
	; Loop
	; {
	; GetKeyState, state, 0, p
	; if state = U
	; break
	; Otherwise:
	Send, {0}
	; Sleep, 100
	; }
	; return
}
Else
{
	Send {0}
	return
}

$1::
IfWinActive, Star Wars: The Old Republic
{
	; Loop
	; {
	; GetKeyState, state, 1, p
	; if state = U
	; break
	; Otherwise:
	Send, {1}
	; Sleep, 100
	Send, +{1}
	; Sleep, 100
	Send, ^{1}
	; Sleep, 100
	; }
	; return
}
Else
{
	Send {1}
	return
}

$2::
IfWinActive, Star Wars: The Old Republic
{
	; Loop
	; {
	; GetKeyState, state, 2, p
	; if state = U
	; break
	; Otherwise:
	Send, {2}
	; Sleep, 100
	; }
	; return
}
Else
{
	Send {2}
	return
}

$3::
IfWinActive, Star Wars: The Old Republic
{
	; Loop
	; {
	; GetKeyState, state, 3, p
	; if state = U
	; break
	; Otherwise:
	Send, {3}
	; Sleep, 100
	Send, +{3}
	; Sleep, 100
	; }
	; return
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
	GetKeyState, state, 4, p
	if state = U
	break
	; Otherwise:
	Send, {4}
	Sleep, 100
	Send, +{4}
	Sleep, 100
	Send, ^{4}
	Sleep, 100
	Send, {.}
	Sleep, 500
	}
	Return
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
	GetKeyState, state, 5, p
	if state = U
	break
	; Otherwise:
	Send, {5}
	Sleep, 100
	Send, +{5}
	Sleep, 500
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
	; Loop
	; {
	; GetKeyState, state, 6, p
	; if state = U
	; break
	; Otherwise:
	Send, {6}
	; Sleep, 100
	; }
	; return
}
Else
{
	Send {6}
	return
}

$7::
IfWinActive, Star Wars: The Old Republic
{
	; Loop
	; {
	; GetKeyState, state, 7, p
	; if state = U
	; break
	; Otherwise:
	Send, {7}
	; Sleep, 100
	; }
	; return
}
Else
{
	Send {7}
	return
}

$8::
IfWinActive, Star Wars: The Old Republic
{
	; Loop
	; {
	; GetKeyState, state, 8, p
	; if state = U
	; break
	; Otherwise:
	Send, {8}
	; Sleep, 100
	Send, +{8}
	; Sleep, 100
	; }
	; return
}
Else
{
	Send {8}
	return
}

$9::
IfWinActive, Star Wars: The Old Republic
{
	; Loop
	; {
		; GetKeyState, state, 9, p
		; if state = U
		; break
		; Otherwise:
		Send, {9}
		; Sleep, 100
		Send, +{9}
		; Sleep, 100
	; }
}
Else
{
	Send {9}
	return
}