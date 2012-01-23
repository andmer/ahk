#NoEnv
#SingleInstance force
#MaxThreadsBuffer On
#MaxHotkeysPerInterval 1000000
#HotkeyInterval 60000

CoordMode, Mouse, Screen
SendMode, Input
SetKeyDelay, -1
SetMouseDelay, -1

;--------------------------------------------------
; Settings
;--------------------------------------------------

; Space Combat Bot
spaceEnabled = 1 ; use space combat bot?
missionId = 1 ; space combat mission
runCount = 1 ; how many times to run the mission

; Tradeskill Bot
tradeskillEnabled = 0 ; use tradeskill bot?
tradeskillBind = n ; key binding to open companion window
; tradeskill (0 = disabled, 1 = enabled)
; tradeskill tier (0 = default, 1 = 10-16, ... , 6 = 49-50)
tradeskill = 1:0,0:0,0:0
companion = 1,1,0 ; 0 = disabled, 1 = enabled (top to bottom)
style = 1 ; 0 = pick tradeskill randomly, 1 = loop single tradeskill, 2 = do tradeskills in order (requires more than 1)
diplomacyFaction = 0 ; only picks diplomacy missions based on faction (0 = disabled/any, 1 = republic, 2 = empire)

; Record Bot
auto_save = 1 ; automatically save recordings
record_path = scripts ; the script save/load location
inPlay = 0 ; internal script variable to determine if bot is currently playing a script
inRecord = 0 ; internal script variable to determine if bot is currently recording a script
recording = ; internal script variable to store the recorded script

;--------------------------------------------------
; Bot Functions
;--------------------------------------------------

; Some code from:
; http://www.autohotkey.com/forum/viewtopic.php?t=53196

; Records the next space combat mission
recordBot() {
	global
	; Double check the bot is not active
	if(inPlay) {
		return
	}
	if(inRecord=2) {
		ttHandler("Space mission is now being recorded", 3000)
		RecordCount := 0
		Sleep, 100
		; Timers 
		TimeMouseMove := A_TickCount
		SetTimer, RecordMouseKey, 1
		return
	}
}

; Gets mouse movement for recording
GetMouseMove(ByRef TimeMouseMove) {
	LButton:=GetKeyState("LButton", "P")
	RButton:=GetKeyState("RButton", "P")
	MButton:=GetKeyState("MButton", "P")
	MouseGetPos, x1, y1
	TimeMouseMove:= A_TickCount
	return, % x1 "|" y1 "|" LButton "|" RButton "|" MButton
}

; Saves the current recording memory to a .torbot script
saveRecording() {
	global
	; set recording status to off
	SetTimer,RecordMouseKey,Off
	InRecord := 0
	Loop, % RecordCount
	{
		DataMouseKey .= MouseData_%A_Index%
		DataMouseKey .= "`n"
	}
	if(!DataMouseKey) {
		ttHandler("Error, there is no recording to save", 5000)
		return
	}
	; todo: generate random name based on mission id
	script = %record_path%/mission%missionId%.torbot
	; save to .torbot file
	FileDelete, %script%
	FileAppend, %DataMouseKey%, %script%
	ttHandler("Saved recording: (%script%)", 5000)
	; clear the recording
	DataMouseKey =
	return
}

; Handles loading, parsing, and running .torbot recordings

runBot(script) {
	; Check if bot is currently active
	if(inPlay=1 || inRecord>0) {
		return
	}
	; Start the bot script
	inPlay = 1
	; Set the default file position to 0
	static Position = 0
	; Read the bot file
	file = scripts/%script%.torbot
	FileRead, BotScript, %file%
	; Loop the bot file
	loop, Parse, BotScript, `n
	{
		Data_%A_index%:= A_LoopField
		Count := A_Index
	}
	loop, % Count
	{
		MoveNow := A_TickCount
		CCount := A_index
		; Mouse click down
		StringSplit, MouseKeyInfo, Data_%CCount% , |
		Mousemove, MouseKeyInfo1, MouseKeyInfo2, 0
		; Left mouse
		if (MouseKeyInfo3 && Not WaitLMouseUp) {
			MouseClick, Left, MouseKeyInfo1, MouseKeyInfo2, , 0, D
			WaitLMouseUp=1
			SetTimer, Left, 1
		}
		; Right mouse
		else if (MouseKeyInfo4 && Not WaitRMouseUp) {
			MouseClick, right, MouseKeyInfo1, MouseKeyInfo2, , 0, D
			WaitRMouseUp=1
			SetTimer, Right, 1
		}
		; Middle mouse
	    else if (MouseKeyInfo5 && Not WaitMMouseUp) {
			MouseClick, Middle, MouseKeyInfo1, MouseKeyInfo2, , 0, D
			WaitMMouseUp=1
			SetTimer, Mid, 1
		}
		While ( A_TickCount - MoveNow  < MouseKeyInfo6) {
			continue
		}
	}
	; Timer for left mouse
	Left:
		if (MouseKeyInfo3) {
			Return
		}
		WaitLMouseUp:=0
		MouseClick, Left, MouseKeyInfo1, MouseKeyInfo2, , 0, U
		SetTimer, Left, Off
	return
	; Timer for right mouse
	Right:
		if (MouseKeyInfo4) {
			Return
		}
		WaitRMouseUp:=0
		MouseClick, right, MouseKeyInfo1, MouseKeyInfo2, , 0, U
		SetTimer, Right, Off
	return
	; Timer for middle mouse
	Mid:
		if (MouseKeyInfo5) {
			Return
		}
		WaitMMouseUp:=0
		MouseClick, m, MouseKeyInfo1, MouseKeyInfo2, , 0, U
		SetTimer, Mid, Off
	return
}

;--------------------------------------------------
; Tradeskill Functions
;--------------------------------------------------

; Handles the entire tradeskill process

tradeskillHandler() {
	global
	; Turn config variables into arrays
	StringSplit, arrCompanion, companion, `,
	StringSplit, arrTradeskill, tradeskill, `,
	; Make sure there are no pending rewards
	hasMissionComplete()
	; Loop companions
	Loop, %arrCompanion0% {
		tempCID=%a_index%
		tempC:=arrCompanion%a_index%
		; If companion is enabled
		if(tempC=1 AND hasActiveMission(tempCID)=false) {
			Loop, %arrTradeskill0% {
				tempTSID=%a_index%
				tempTS:=arrTradeskill%a_index%
				StringReplace, tempTS, tempTS, :, `,, All
				StringSplit, currTradeskill, tempTS, `,
				if((currTradeskill1=1 AND style=0) || (currTradeskill1=1 AND style=1) || (currTradeskill1=1 AND style=2 AND tempTSID != last_tradeskill)) {
					; Open the appropriate tradeskill based on array index
					openTradeskill(a_index, tempCID)
					; Select a mission tier if above 0
					if(%currTradeskill2%<0) {
						selectMissionTier(currTradeskill2)
					}
					; Run the mission
					startMission(1)
					; Check if it matches correct diplomacy faction if enabled
					if(diplomacyFaction<0 AND diplomacyCheck()!=diplomacyFaction) {
						; We don't want this, drop it and send it through the loop again
						dropMission(tempCID) ; send the companion id
						continue
					}
					break
				}
			}
			; set the last tradeskill
			if(style = 2) {
				last_tradeskill = %tempTSID%
			}
		}
		; Make sure there are no pending rewards
		hasMissionComplete()
	}
}

; Checks the faction for diplomacy mission 

diplomacyCheck() {
	global
	; Check the faction icon of the first quest mission
	PixelGetColor, color, 693, 263
	; empire
	if(color = "0x020182" AND diplomacyFaction = 2) {
		return 2
	; republic
	}else if(color = "0xF8CD97" AND diplomacyFaction = 1) {
		return 1
	; non-diplomacy error
	}else{
		return 0
	}
}

; Opens or closes the crew management window based on whether
; it is currently open or not.

crewManageToggle(toggle) {
	global
	PixelGetColor, color, 325, 374 ; crew management scroll bar
	if(toggle = "on" AND color != "0xD8B455") {
		SendInput, {%tradeskillBind%}
		Sleep, 1000
	}else if(toggle = "off" AND color = "0xD8B455") {
		SendInput, {%tradeskillBind%}
		Sleep, 1000
	}
}

; Open the tradeskill window based specified tradeskill id
; and companion id

openTradeskill(id, companion) {
	; Open crew management window
	crewManageToggle("on")
	; Determine x based on tradeskill id
	if (id = 1) {
		xPos = 117
	}else if(id = 2) {
		xPos = 154
	}else if(id = 3) {
		xPos = 196
	}
	; Determine y based on companion id
	if (companion = 1) {
		yPos = 360
	}else if (companion = 2) {
		yPos = 422
	}else if (companion = 3) {
		yPos = 491
	}
	; Open tradeskill window
	MouseClick, left,  xPos,  yPos
	Sleep, 1000
}

; Selects a mission level tier based on the
; specified mission tier id. See data.txt for
; more information.

selectMissionTier(id) {
	; Open Drop Down
	MouseClick, left,  882, 241
	Sleep, 1000
	; set the x position
	xPos = 882
	if (id = 1) {
		yPos = 259
	}else if (id = 2) {
		yPos = 270
	}else if (id = 3) {
		yPos = 283
	}else if (id = 4) {
		yPos = 295
	}else if (id = 5) {
		yPos = 309
	}else if (id = 6) {
		yPos = 322
	}
	; Select mission tier
	MouseClick, left,  xPos,  yPos
	Sleep, 1000
}

; Drops the current mission based on companion
; id

dropMission(id) {
	; set mouse xPos
	xPos = 279
	; get yPos by companion id
	if (id = 1) {
		yPos = 350
	}else if (id = 2) {
		yPos = 414
	}else if (id = 3) {
		yPos = 478
	}
	; drop the mission
	MouseClick, left,  xPos,  yPos
	Sleep, 1000
}

; Starts the companions mission based on
; specified mission id

startMission(id) {
	; Select mission
	xPos = 808
	if(id == 1) {
		yPos = 289
	}else if (id == 2) {
		yPos = 303
	}else if (id == 3) {
		yPos = 471
	}else if(id = 4) {
		yPos = 535
	}
	; Select mission
	MouseClick, left,  xPos,  yPos
	Sleep, 1000
	; Send companion
	MouseClick, left,  923,  621
	Sleep, 1000
	; Close window
	crewManageToggle("off")
}

; Checks if there is less than a minute left on tradeskills. The
; bot uses this to determine if it should wait before going on the
; next space combat mission.

getMissionTimer() {
	; todo
}

; Checks if the specified companion id is currently on a tradeskill
; mission or not

hasActiveMission(id) {
	; set mouse xPos
	xPos = 279
	; get yPos by companion id
	if (id = 1) {
		yPos = 350
	}else if (id = 2) {
		yPos = 414
	}else if (id = 3) {
		yPos = 478
	}
	; Make sure Crew Management window is open
	crewManageToggle("on")
	; check companion
	PixelGetColor, color, xPos, yPos ; crew management companion [X] ("cancel current task")
	; Make sure Crew Management window is closed
	crewManageToggle("off")
	; check if mission is active
	if (id = 1 AND color="0xC0A669") {
		return true
	}else if (id = 2 AND color="0xD5BD83") {
		return true
	}else if (id = 3 AND color="0xDDC184") {
		return true
	}else{
		return false
	}
}

; Checks for pending reward windows (quest, end of space combat mission, 
; tradeskill completion, tradeskill failure, etc). If it detects one on the
; left or right side of the screen it will close them.

hasMissionComplete() {
	Loop {
		; Attempt to open pending data in case it's closed
		MouseClick, left, 964, 37 ; Pending Rewards
		Sleep, 1000
		; Grab pixel color magic
		PixelGetColor, color_left, 207, 401
		PixelGetColor, color_right, 819, 400
		; Check if there is a pending reward on the left
		if (color_right="0x000000") {
			; Click the accept button for rewards
			MouseClick, left, 933, 573 ; Accept reward
			Sleep, 1000
			; Click the accept button for failures (just in case)
			MouseClick, left, 933, 536 ; Accept reward
			Sleep, 1000
			continue
		}
		; Check if there is a pending reward on the right
		if (color_left="0x000000") {
			; Click the accept button for rewards
			MouseClick, left, 227, 580 ; Accept reward
			Sleep, 1000
			; Click the accept button for failures (just in case)
			MouseClick, left, 227, 543 ; Accept reward
			Sleep, 1000
			continue
		}
		break
	}
}

;--------------------------------------------------
; Spacebot Functions
;--------------------------------------------------

; Handles the process for the space combat bot

spaceHandler() {
	global
	; set the play status
	inPlay:=1
	; start the combat mission
	startMissionBot(1)
	; leave the mission
	hasMissionComplete()
	; fix the camera after you get out
	fixCamera()
}

; Moves you out of your command chair in order
; to enable bot to loop space missions

fixCamera() {
	; Send "W" key to move out of chair
	SendInput, {w}
	Sleep, 1000
	; Right click the chair
	; MouseClick, left,  519,  528
	; Sleep, 1000
}

; Right clicks the galaxy map or chair
; to open the galaxy map. See data.txt for
; more information.

openGalaxyMap() {
	; MouseClick, right,  502,  444
	; Sleep, 2000
	MouseClick, right,  519,  528
	Sleep, 2000
}

; Opens the appropriate galaxy from the
; galaxy map based on specificed mission or
; galaxy id. See data.txt for more information.

openGalaxy(id) {
	; Hutt Space
	if (id = 1) {
		MouseClick, left,  701,  352
		Sleep, 2000
		MouseClick, left,  466,  336
		Sleep, 2000
	}
}

; Starts the mission from the galaxy map
; if in the correct galaxy. Make sure it is
; called after openGalaxy(). See data.txt for
; more information.

openMission(id) {
	; Saluecami Fleet Action
	if (id = 1) {
		; open the missions galaxy
		openGalaxy(1)
		; open the mission
		MouseClick, left,  863,  669
		Sleep, 2000
		MouseClick, left,  480,  441
		Sleep, 2000
	}
}

; Start running the .torbot script for the
; specified mission id 

startMissionBot(id) {
	; start the bot
	; script = spacecombat%id%
	script = mission%id%
	ttHandler("Started %script%.torbot", 1000)
	runBot(script)
}

; begin the main bot that handles space combat
; and tradeskills

startBot() {
	global
	; Make SWTOR the active window
	WinWait, Star Wars: The Old Republic, 
	IfWinNotActive, Star Wars: The Old Republic, , WinActivate, Star Wars: The Old Republic, 
	WinWaitActive, Star Wars: The Old Republic, 
	; loop space missions
	; tradeskills inbetween missions if enabled
	if(spaceEnabled) {
		Loop %runCount% {
			openGalaxyMap() ; open the galaxy map
			openMission(missionId) ; open the mission's galaxy and mission
			; loop until we detect mission start
			Loop {
				PixelGetColor, color, 1004, 757
				if(color = "0x084584") {
					; are we going to record?
					if(inRecord = 1) {
						inRecord:=2 ; set the status to recording
						recordBot() ; start the recording
					; start the space combat mission handler
					}else if(inRecord=0 AND inPlay=0) {
						spaceHandler()
					}
				}
			}
			; run tradeskills after the mission
			if(tradeskillEnabled) {
				tradeskillHandler()
			}
		}
	}
	; space disabled and tradeskills enabled
	; loop tradeskills checking every 30 seconds
	if(spaceEnabled = false AND tradeskillEnabled = true) {
		Loop {
			tradeskillHandler()
			Sleep 30000
		}
	}
}

ttHandler(msg, timer=2000) {
	ToolTip, %msg%
	SetTimer, RemoveToolTip, %timer%
}

;--------------------------------------------------
; Timers
;--------------------------------------------------

; timer for removing tooltips
RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip
return

; timer for mouse movement recording
RecordMouseKey:
	TimeMouseMove_Old := TimeMouseMove
	MouseData := GetMouseMove(TimeMouseMove_Old)
	if (MouseData_old = MouseData) {
		return
	}
	MouseData_old := MouseData
	RecordCount++
	MouseData_%RecordCount% := MouseData "|" TimeMouseMove_Old - TimeMouseMove 
	TimeMouseMove := A_TickCount
return

;--------------------------------------------------
; Key Binds
;--------------------------------------------------

; Kill the bot

Numpad0::
	ExitApp
return

; Start the bot

Numpad1::
	startBot()
return

; Start new recording. Press this before
; you enter the space mission using Numpad1.
; It will begin recording as soon as the mission starts.

Numpad4::
	; Make sure it is not running a torbot script already
	if(inPlay = 1) {
		ttHandler("Recording disabled during torbot scripts", 1000)
		return
	}
	; Make sure it is not currently recording
	if(inRecord = 0) {
		ttHandler("Recording has been started `nWaiting for space mission to load", 5000)
		inRecord:=1 ; set state to recording
	}
return

; Saves the bot manually. Normally it saves the
; bot recording automatically.

Numpad6::
	saveRecording() ; 
return

; Get x/y and color at mouse position

Numpad7::
	MouseGetPos, xPos, yPos
	PixelGetColor, color, xPos, yPos
	MsgBox %color% at %xPos%, %yPos%
return

; Get color at specific x,y pos

Numpad8::
	PixelGetColor, color, 693, 263
	MsgBox %color%
return