#include <imagesearch.au3>
HotKeySet("{PAUSE}", "PauseScript")
HotKeySet("^{PAUSE}", "Stop")

$Paused = ""
$ImgX = ""
$ImgY = ""
$DragX = ""
$DragY = ""

$RestX = ""
$RestY = ""

$ImgExt = ".png"
$ImgLoc = @scriptdir & "\"

WinActivate("Raid: Shadow Legends")
sleep(Random(500, 1000, 1))

;Find Mouse Resting Spot
$search = _imagesearch($ImgLoc & "MouseRest" & $ImgExt, 1, $RestX, $RestY, 40)

Func SleepRnd($mSecFrom, $mSecTo)
	Sleep(Random($mSecFrom, $mSecTo, 1))
EndFunc

Func RestMouse()
	SleepRnd(100, 300)
	FindItem("MouseRest")
	MouseMove($ImgX, $ImgY)
	SleepRnd(125, 225)
EndFunc

Func FindItem($ImgToFind)
	$search = _imagesearch($ImgLoc & $ImgToFind & $ImgExt,1,$ImgX,$ImgY,40)
	if $search = 1 Then
		return True
	Else
		return False
	EndIf
EndFunc

Func FindItemVM($ImgToFind)
	If WinActivate("Untitled - Notepad") = 0 Then
		If WinActivate("*Untitled - Notepad") = 0 Then
			Run("notepad.exe")
		EndIf
	EndIf
	$search = _imagesearch($ImgLoc & $ImgToFind & $ImgExt,1,$ImgX,$ImgY,40)
	if $search = 1 Then
		return True
	Else
		return False
	EndIf
EndFunc

Func FindItemGetLeftVM($ImgToFind)
	If WinActivate("Untitled - Notepad") = 0 Then
		If WinActivate("*Untitled - Notepad") = 0 Then
			Run("notepad.exe")
		EndIf
	EndIf
	$search = _ImageSearchGetLeft($ImgLoc & $ImgToFind & $ImgExt,1,$ImgX,$ImgY,40)
	if $search = 1 Then
		return True
	Else
		return False
	EndIf
EndFunc

Func FindItemByAreaVM($ImgToFind, $Left, $Top, $Right, $Bottom)
	If WinActivate("Untitled - Notepad") = 0 Then
		If WinActivate("*Untitled - Notepad") = 0 Then
			Run("notepad.exe")
		EndIf
	EndIf
	$search = _ImageSearchByArea($ImgLoc & $ImgToFind & $ImgExt,1,$Left,$Top,$Right,$Bottom,$ImgX,$ImgY,40)
	if $search = 1 Then
		return True
	Else
		return False
	EndIf
EndFunc

Func FindItemByArea($ImgToFind, $Left, $Top, $Right, $Bottom)
	$search = _ImageSearchByArea($ImgLoc & $ImgToFind & $ImgExt,1,$Left,$Top,$Right,$Bottom,$ImgX,$ImgY,40)
	if $search = 1 Then
		return True
	Else
		return False
	EndIf
EndFunc


Func FindOverviewItem($ImgToFind)
	$search = _ImageSearchOverview($ImgLoc & $ImgToFind & $ImgExt,1,$ImgX,$ImgY,40)
	if $search = 1 Then
		return True
	Else
		return False
	EndIf
EndFunc

Func FindItemDragTo($ImgToFind)
	$search = _imagesearch($ImgLoc & $ImgToFind & $ImgExt,1,$DragX,$DragY,40)
	Return $search
EndFunc

Func WaitFor($ImgToFind, $WaitTimeSec)
	If $WaitTimeSec = 0 Then
		$WaitTimeSec = 9999
	EndIf
	$timer = TimerInit()
	While 1 = 1
		Sleep(100)
		If FindItem($ImgToFind) Then
			Return True
		ElseIf TimerDiff($timer) >= ($WaitTimeSec * 1000) Then
			Return False
		EndIf
	WEnd
EndFunc

Func MoveMouseVM($ImgToFind)
	FindItemVM($ImgToFind)
	MouseMove($ImgX, $ImgY, Random(5,8))
EndFunc

Func LeftClickVM()
	MouseMove($ImgX, $ImgY, Random(0,0))
	MouseDown("Left") ; Set the left mouse button state as down.
	Sleep(Random(50,120))
	MouseUp("Left")
EndFunc

Func RightClickVM()
	MouseMove($ImgX, $ImgY, Random(0,0))
	MouseDown("Right") ; Set the left mouse button state as down.
	Sleep(Random(50,120))
	MouseUp("Right")
EndFunc

func FindLeftClickVM($ImgToFind)
	FindItemVM($ImgToFind)
	MouseMove($ImgX, $ImgY, Random(0,0))
	MouseDown("Left") ; Set the left mouse button state as down.
	Sleep(Random(100,120))
	MouseUp("Left")
EndFunc

func FindRightClickVM($ImgToFind)
	FindItemVM($ImgToFind)
	MouseMove($ImgX, $ImgY, Random(0,0))
	MouseDown("Right") ; Set the left mouse button state as down.
	Sleep(Random(100,120))
	MouseUp("Right")
EndFunc

func FindClick($ImgToFind)
	SleepRnd(120, 200)
	If FindItem($ImgToFind) Then
		LeftClick()
		return True
	EndIf
	return False
EndFunc

func FindOverviewClick($ImgToFind)
	SleepRnd(120, 200)
	If FindOverviewItem($ImgToFind) Then
		LeftClick()
		return True
	EndIf
	return False
EndFunc

func FindLeftClick($ImgToFind)
	SleepRnd(120, 200)
	If FindItem($ImgToFind) Then
		MouseDown("Left") ; Set the left mouse button state as down.
		Sleep(Random(50,90))
		MouseUp("Left")
		return True
	EndIf
	return False
EndFunc

func FindRightClick($ImgToFind)
	SleepRnd(120, 200)
	If FindItem($ImgToFind) Then
		RightClick()
		return True
	EndIf
	return False
EndFunc

 func DoubleLeftClick()
	MouseClick("left", $ImgX, $ImgY)
	Sleep(100)
	MouseClick("left", $ImgX, $ImgY)
	RestMouse()
EndFunc

Func LeftClickLoc($LocX, $LocY)
	MouseClick("left", $LocX, $LocY)
	SleepRnd(120, 200)
	RestMouse()
EndFunc

func LeftClick()
	MouseMove($ImgX, $ImgY, Random(5,8))
	MouseDown("Left") ; Set the left mouse button state as down.
	Sleep(Random(100,120))
	MouseUp("Left")
	SleepRnd(120, 200)
	;RestMouse()
EndFunc

Func RightClick()
	MouseMove($ImgX, $ImgY, Random(5,8))
	MouseDown("Right") ; Set the left mouse button state as down.
	Sleep(Random(100,120))
	MouseUp("Right")
	SleepRnd(120, 200)
	;RestMouse()
EndFunc

Func RightClickLoc($LocX, $LocY)
	MouseClick("right", $LocX, $LocY)
	SleepRnd(120, 200)
	MouseMove($LocX - 100, $LocY - 100)
EndFunc

Func LeftClickDrag()
	MouseClickDrag("left", $ImgX, $ImgY, $DragX, $DragY)
	SleepRnd(120, 200)
EndFunc

func OpenWindow($CheckFor, $BtnToCkick)
	;ConsoleWrite('OpenWindow' & @crlf) ;### Debug Console
	If FindItem($CheckFor) = 0 Then
		Do
			SleepRnd(100, 300)
		Until FindItem($BtnToCkick)
		LeftClick()
		SleepRnd(400, 500)
	EndIf
	Sleep(1000)
	If FindItem($CheckFor) Then
		Return True
	Else
		Return False
	EndIf
EndFunc

func CloseWindow($CheckFor, $BtnToCkick)
	;ConsoleWrite('CloseWindow' & @crlf) ;### Debug Console
	If FindItem($CheckFor) = 1 Then
		Do
			SleepRnd(100, 300)
		Until FindItem($BtnToCkick) = 1
		LeftClick()
		SleepRnd(400, 500)
	EndIf
	If FindItem($CheckFor) = 0 Then
		Return True
	Else
		Return False
	EndIf
EndFunc

Func Stop()
	ToolTip("Stopped", 0, 0)
	Sleep(2000)
	Exit 0
EndFunc

Func PauseScript()
	$Paused = Not $Paused
	While $Paused
		ToolTip("Script is Paused", 0, 0)
		Sleep(100)
	WEnd
	ToolTip("")
EndFunc