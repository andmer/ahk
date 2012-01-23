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