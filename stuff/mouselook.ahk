;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         A.N.Other <myemail@nowhere.com>
;
; Script Function:
;	Template script (you can customize this template by editing "ShellNew\Template.ahk" in your Windows folder)
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

mouseLook=0
;MsgBox %mouseLook%

$F1::
If (mouseLook = 0){
	Send {RButton Down}	
	mouseLook:=1
	;MsgBox %mouseLook% turn it on
	Return
}
Else {
	Send {RButton up}
	mouseLook:=0
	;MsgBox %mouseLook% turn it off
	Return
}
Return

~RButton & LButton::
Send {-}
Return


; ~RButton::
; If (mouseLook = true) {
	; Send {4}
	; Send {5}
	; Send {6}
; } else {
	; Send {RButton} 
; }
; return


; ~RButton::
; If (mouseLook = true) {
	; Send {4}
	; Send {5}
	; Send {6}
; } else {
	; Send {RButton} 
; }
; return


; Simple key spam script by Winsane @ ownedcore.
; Toggle on and off with numlock.

~NumLock::Suspend, Toggle

*1::
Loop
{
GetKeyState, state, 1, p
if state = U
break
; Otherwise:
Send, {1}
Sleep, 25
Send, {2}
Sleep, 25
Send, {3}
Sleep, 25
}

*2::
Loop
{
GetKeyState, state, 2, p
if state = U
break
; Otherwise:
Send, {2}
Sleep, 25
}

*3::
Loop
{
GetKeyState, state, 3, p
if state = U
break
; Otherwise:
Send, {3}
Sleep, 25
}

*4::
Loop
{
GetKeyState, state, 4, p
if state = U
break
; Otherwise:
Send, {4}
Sleep, 25
}

*5::
Loop
{
GetKeyState, state, 5, p
if state = U
break
; Otherwise:
Send, {5}
Sleep, 25
}

*6::
Loop
{
GetKeyState, state, 6, p
if state = U
break
; Otherwise:
Send, {6}
Sleep, 25
}

*7::
Loop
{
GetKeyState, state, 7, p
if state = U
break
; Otherwise:
Send, {7}
Sleep, 25
}

*8::
Loop
{
GetKeyState, state, 8, p
if state = U
break
; Otherwise:
Send, {8}
Sleep, 25
}

*9::
Loop
{
GetKeyState, state, 9, p
if state = U
break
; Otherwise:
Send, {9}
Sleep, 25
}