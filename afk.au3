HotKeySet("^!z","Movment");^!z is Ctrl+Alt+'z' to run the Movment
HotKeySet("^!x","End");^!x is Ctrl+Alt+'x' to close the Movment
While 1
    Sleep(100)
WEnd
Func Movment()
    While 1
        Sleep(20000)
        Send("{W}")
        Sleep(40000)
        Send("{S}")

    WEnd
EndFunc
Func End()
    Exit
EndFunc 