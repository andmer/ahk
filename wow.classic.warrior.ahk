^!r::Reload
NumpadAdd::Suspend, Toggle
#SingleInstance, force
#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
]::
Loop
{
    CoordMode, Pixel, Window
    ;revenge
    PixelSearch, FoundX, FoundY, 0, 0, 1920, 1080, 0xEFE5DA, 0, Fast RGB
    If ErrorLevel = 0
    {
        Send, 3
        Sleep, 1000
    }
    
    ;shield slam
    PixelSearch, FoundX, FoundY, 0, 0, 1920, 1080, 0xA68756, 0, Fast RGB
    ;MsgBox got %ErrorLevel%.
    If ErrorLevel = 0
    {
        Send, 4
        Sleep, 1000
    }
}
